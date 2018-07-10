<?php
class adm_orderList extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='Order list';
	}
	public function getOrder()
	{
		if($_POST){
			$datas=array();
			$option['page']=$_POST['start'];
			$option['block']=$_POST['length'];
			$option['dir']="DESC";
			$option['order']="ctl ASC,id";
			$option['search']='status="o"';
			if(isset($_POST['order'][0])){
				$option['dir']=$_POST['order'][0]['dir'];
				if($_POST['order'][0]['column']==0)$option['order']='code';elseif($_POST['order'][0]['column']==2)$option['order']='subtotal';elseif($_POST['order'][0]['column']==3)$option['order']='amount';elseif($_POST['order'][0]['column']==5)$option['order']='description';elseif($_POST['order'][0]['column']==6)$option['order']='created';
			}
			if(isset($_POST['search']['value'])&&$_POST['search']['value']){
				$option['search'].=' AND (`code` LIKE \'%'.$_POST['search']['value'].'%\' OR `subtotal` LIKE \'%'.$_POST['search']['value'].'%\' OR `tax` LIKE \'%'.$_POST['search']['value'].'%\' OR `amount` LIKE \'%'.$_POST['search']['value'].'%\' OR `contact_name` LIKE \'%'.$_POST['search']['value'].'%\' OR `contact_email` LIKE \'%'.$_POST['search']['value'].'%\' OR `description` LIKE \'%'.$_POST['search']['value'].'%\')';
			}						
			$results=$this->model->table('invoice')->get(array('id','code','subtotal','tax','amount','contact_name','contact_email','description','DATE_FORMAT(created,"%b,%d %Y %hh%i\'")`created`','DATE_FORMAT(modified,"%b,%d %Y %hh%i\'")`modified`','status','action','ctl'))->where($option['search'])->order($option['order']." ".$option['dir'])->multi()->limit($option['page'].",".$option['block'])->select();
			$total=$this->model->table('invoice')->get('count(*)`total`')->where($option['search'])->limit('not')->select();
			foreach ($results as $order) {	
				$data=array(				
					"name"=>"<div class='checkbox checkbox-styled' style='margin-top: 7px;'><label><input type='checkbox' value='".$order->id."'><span></span></label></div><a data-modal='show' class='text-primary' data-target='#item-list' data-id='".$order->id."'><strong>".$order->code."</strong></a>",
					"detail"=>"<strong>$: ".$order->subtotal."</strong><br><small>$: ".$order->tax."</small>",
					"amount"=>"<strong class='text-danger'>$: ".$order->amount."</strong>",
					"contact"=>"<strong>".$order->contact_name."</strong><br><small>".$order->contact_email."</small>",		
					"description"=>$order->description,
					"datetime"=>$order->created."<br><small>".$order->modified."</small>",
					"ctl"=>$order->ctl
				);
				$datas[]=$data;
			}
			$all['draw']=$_POST['draw'];
			$all['recordsTotal']=$total->total;
			if(isset($_POST['search']['value'])&&$_POST['search']['value']){
				$all['recordsFiltered']=count($results);
			}else{
				$all['recordsFiltered']=$total->total;
			}
			$all['data']=$datas;
			$this->api($all);
		}
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('invoice')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('invoice')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('invoice')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function getDetail()
	{
		if($_POST['item']){
			$item=$this->model->table('cart as `c` LEFT JOIN '.DB.N.'product as `p` ON `p`.id=`c`.product_id')->get('`p`.name,`p`.`desc`,`p`.image,`c`.qty,`c`.price')->where(array('`c`.order_id'=>$_POST['item']))->ctl('c')->multi()->select();
			foreach ($item as $key => $value) {
				$item[$key]->image=$this->modun('image')->getImg($value->image,'product',1);
			}
			$this->api($item);
		}
	}
}