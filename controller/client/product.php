<?php
class product extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index($item=false)
	{
		if(ctype_digit($item)){
			$added=$interest=FALSE;
			$got=$this->model->table('product as `p` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`p`.brand LEFT JOIN '.DB.N.'category as `c` ON `c`.id=`p`.cate LEFT JOIN '.DB.N.'type as `t` ON `t`.id=`p`.type')->get('`p`.id,`p`.name,`p`.desc,`p`.brand,`p`.cate,`p`.price,`p`.image,`p`.type,`p`.status,`b`.name as `brand_name`,`c`.name as `cate_name`,`t`.name as `type_name`')->where(array('`p`.ctl'=>'0','`p`.id'=>$item))->where('`p`.status<>"h"')->ctl('p')->select();
			$this->view->related=$this->model->table('product as `p` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`p`.brand')->get('`p`.id,`p`.name,`p`.desc,`p`.price,`p`.image,`b`.name as `brand`')->where(array('`p`.ctl'=>'0','`p`.type'=>$got->type))->where('`p`.status<>"h"')->ctl('p')->multi()->order('RAND()')->limit(4)->select();//->where('`p`.image IS NOT NULL AND `p`.id NOT IN ('.$item.')')
			$imgs=$this->model->table('image')->get('image')->where(array('ctl'=>'0','product_id'=>$item))->multi()->limit('not')->order('RAND()')->select();
			if(empty($imgs))$this->view->images=array((object)array('image'=>$got->image)); else $this->view->images=$imgs;
			if(isset($_SESSION['logid'])&&$_SESSION['logid']){
				$like=$this->model->table('interest')->get('id')->where(array('user_id'=>$_SESSION['logid'],'product_id'=>$item))->select();
				if($like)$interest=TRUE;
				$cart=$this->model->table('cart')->get('id')->where(array('user_id'=>$_SESSION['logid'],'product_id'=>$item))->where('order_id IS NULL')->select();
				if($cart)$added=TRUE;
			}
			$this->view->interest=$interest;
			$this->view->added=$added;
			$this->view->item=$got;
		}else{
			header('location: '.URL);exit();
		}
	}
	public function interest()
	{
		if(ctype_digit($_POST['item'])&&isset($_SESSION['logid'])){
			if(isset($_SESSION['logid'])&&$_SESSION['logid']){
				$liked=$this->model->table('interest')->get('id')->where(array('user_id'=>$_SESSION['logid'],'product_id'=>$_POST['item']))->select();
				$interested=$this->model->table('product')->get('interested')->where(array('id'=>$_POST['item']))->select();
				if(!$liked){
					$data=array(
						'user_id'=>$_SESSION['logid'],
						'product_id'=>$_POST['item'],
						'created'=>date('Y-m-d H:i:s')
					);
					$result=$this->model->table('interest')->info($data)->insert();
					if($result){
						$add=array(
							'interested'=>$interested->interested+1
						);
						$added=$this->api($this->model->table('product')->condition($add)->where(array('id'=>$_POST['item']))->update());
						if($added){
							$this->api($this->model->lastInsertId());
						}else{
							$this->api(false);
						}
					}else{
						$this->api(false);
					}
				}else $this->api(false);
			}else $this->api(false);
		}else{
			header('location: '.URL);exit();
		}
	}
	public function addCart()
	{
		if(ctype_digit($_POST['item'])&&isset($_SESSION['logid'])){
			$added=$this->model->table('cart')->get('id')->where(array('user_id'=>$_SESSION['logid'],'product_id'=>$_POST['item']))->where('order_id IS NULL')->select();
			if(!$added){
				$data=array(
					'user_id'=>$_SESSION['logid'],
					'product_id'=>$_POST['item'],
					'qty'=>1,
					'created'=>date('Y-m-d H:i:s')
				);
				$result=$this->model->table('cart')->info($data)->insert();
				if($result){
					$get=$this->model->table('cart')->get('count(*)`total`')->where(array('user_id'=>$_SESSION['logid']))->where('order_id IS NULL')->select();
					$this->cookie('cart',$get->total);
					$this->api($get->total);
				}
			}
		}
	}
}