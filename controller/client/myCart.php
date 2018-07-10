<?php
class myCart extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		if($_POST){		
			foreach ($_POST['item'] as $id => $update) {
				if(ctype_digit($update['qty'])&&ctype_digit($update['price'])){
					$this->model->table('cart')->condition($update)->where(array('id'=>$id))->update();
				}
			}
			$this->notify("Your cart has been updated successfully.");
			header('location: '.URL.'myCart');exit();
		}
		if(isset($_SESSION['logid'])){
			$cart=$this->model->table('cart as `c` LEFT JOIN '.DB.N.'product as `p` ON `p`.id=`c`.product_id')->get('`c`.id,`c`.qty,`p`.name,`p`.`desc` as `item_desc`,`p`.image,`p`.price')->where(array('`c`.user_id'=>$_SESSION['logid']))->where('`c`.order_id IS NULL')->ctl('c')->multi()->order('`c`.created ASC')->select();  
			if($cart)$this->view->cart=$cart;else{
				$this->notify("Your current cart empty!");
				header('location: '.URL);exit();
			}
		}else{
			header('location: '.URL.'login');exit();
		}		
	}
	public function removeCart()
	{
		if($_POST['item']){
			$update=array(
				'ctl'=>2
			);
			$this->api($this->model->table('cart')->condition($update)->where(array('id'=>$_POST['item']))->update());
		}
	}
	public function orderInfo()
	{
		if(isset($_SESSION['logid'])){
			if($_POST){	
				if(isset($_POST['order'])){
					$order=$_POST['order'];$ship=$_POST['ship'];
					if(filter_var($order['contact_email'],FILTER_SANITIZE_EMAIL)){
						$addOrder=array(
							'code'=>uniqid(),
							'user_id'=>$_SESSION['logid'],
							'subtotal'=>$order['subtotal'],
							'tax'=>$order['tax'],
							'amount'=>$order['amount'],
							'contact_name'=>$order['contact_name'],
							'contact_email'=>filter_var($order['contact_email'],FILTER_SANITIZE_EMAIL),
							'description'=>$order['description'],
							'status'=>'o',
							'created'=>date('Y-m-d H:i:s')
						);
						$this->model->table('invoice')->info($addOrder)->insert();
						$order_id=$this->model->lastInsertId();
						$updateCart=array(
							'order_id'=>$order_id
						);
						$this->model->table('cart')->condition($updateCart)->where(array('user_id'=>$_SESSION['logid']))->where('order_id IS NULL')->update();
						$this->cookie('cart','del');
						$addShip=array(
							'order_id'=>$order_id,
							'user_id'=>$_SESSION['logid'],
							'name'=>$ship['name'],
							'company'=>$ship['company'],
							'address'=>$ship['address'],
							'suite'=>$ship['suite'],
							'city'=>$ship['city'],
							'phone'=>$ship['phone'],
							'country'=>$ship['country'],
							'state'=>$ship['state'],
							'zipcode'=>$ship['code'],
							'created'=>date('Y-m-d H:i:s')
						);
						$this->model->table('ship')->info($addShip)->insert();					
						$this->notify("Order information has been updated successfully.");
						header('location: '.URL.'history/order/'.$order_id);exit();
					}
				}
			}
			$cart=$this->model->table('cart as `c` LEFT JOIN '.DB.N.'product as `p` ON `p`.id=`c`.product_id')->get('`c`.id,`c`.qty,`p`.name,`p`.`desc` as `item_desc`,`p`.image,`p`.price')->where(array('`c`.user_id'=>$_SESSION['logid']))->where('`c`.order_id IS NULL')->ctl('c')->multi()->order('`c`.created ASC')->select();  
			if($cart){
				$subtotal=0;
				foreach ($cart as $item) {
					if($item->price){
						$subtotal+=$item->qty*$item->price;
					}else{
						$this->notify("PLease check your cart again!");
						header('location: '.URL.'myCart');exit();
					}
				}
				$this->view->data=(object) array(
					'subtotal'=>round($subtotal,2),
					'tax'=>round(($subtotal*7)/100,2),
					'amount'=>round($subtotal+(($subtotal*7)/100),2)
				);
				$info=$this->model->table('ship')->get('name,address,suite,phone,company,city,country,state,zipcode`code`')->where(array('user_id'=>$_SESSION['logid']))->order('modified DESC')->select();
				$info1=$this->model->table('user')->get('fullname`name`,email,mobile`phone`,address')->where(array('id'=>$_SESSION['logid']))->select();
				if($info){
					$info->email=$info1->email;
					$this->view->user=$info;
				}else{
					$this->view->user=$info1;
				}
				$this->render('orderInfo');
			}else{
				$this->notify("Your current cart empty!");
				header('location: '.URL);exit();
			}
		}else{
			header('location: '.URL.'login');exit();
		}	
	}
}