<?php
class history extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$history=$this->model->table('invoice')->get('id,code,subtotal,tax,amount,contact_name,contact_email,description,DATE_FORMAT(delivery,"%b,%d %Y %hh%i\'")`delivery`,payment,status,action')->where(array('user_id'=>$_SESSION['logid'],'ctl'=>0))->multi()->order('modified ASC')->select();	
		if($history)$this->view->history=$history;else{
			$this->notify("There are no purchase history records available!");
			header('location: '.URL);exit();
		}
	}
	public function order($item=false)
	{
		if($_POST){		
			if(isset($_POST['item'])&&isset($_POST['order'])&&isset($_POST['ship'])){
				$subtotal=0;
				foreach ($_POST['item'] as $id => $update) {
					if(ctype_digit($update['qty'])&&ctype_digit($update['price'])){
						$this->model->table('cart')->condition($update)->where(array('id'=>$id))->update();
						$subtotal+=$update['qty']*$update['price'];
					}
				}
				$order=$_POST['order'];$ship=$_POST['ship'];
				if(filter_var($order['contact_email'],FILTER_SANITIZE_EMAIL)){
					$upOrder=array(
						'subtotal'=>round($subtotal,2),
						'tax'=>round(($subtotal*7)/100,2),
						'amount'=>round($subtotal+($subtotal*7)/100,2),
						'contact_name'=>$order['contact_name'],
						'contact_email'=>filter_var($order['contact_email'],FILTER_SANITIZE_EMAIL),
						'description'=>$order['description']
					);
					$this->model->table('invoice')->condition($upOrder)->where(array('user_id'=>$_SESSION['logid'],'id'=>$item))->update();	
					$upShip=array(
						'name'=>$ship['name'],
						'company'=>$ship['company'],
						'address'=>$ship['address'],
						'suite'=>$ship['suite'],
						'city'=>$ship['city'],
						'phone'=>$ship['phone'],
						'country'=>$ship['country'],
						'state'=>$ship['state'],
						'zipcode'=>$ship['code']
					);
					if(!$this->model->table('ship')->condition($upShip)->where(array('user_id'=>$_SESSION['logid'],'order_id'=>$item))->update()){
							$upShip['order_id']=$item;
							$upShip['user_id']=$_SESSION['logid'];
							$upShip['created']=date('Y-m-d H:i:s');
							$this->model->table('ship')->info($upShip)->insert();
					}	
					$this->notify("Update order information finish!");
					header('location: '.URL.'history/order/'.$item);exit();
				}
			}			
			if(isset($_POST['delivery'])&&preg_match("/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/",$_POST['delivery'],$matches)){
				$complete=array(
					'delivery'=>$_POST['delivery'],
					'payment'=>'Cash on delivery',
					'status'=>'i'
				);
				$this->model->table('invoice')->condition($complete)->where(array('user_id'=>$_SESSION['logid'],'id'=>$item))->update();
				$this->notify("Thank you! You have just been complete your order.");
			}
			header('location: '.URL.'history/order/'.$item);exit();
		}
		if(isset($_SESSION['logid'])){
			if($item){
				$order=$this->model->table('invoice')->get('id,subtotal,tax,amount,contact_name`name`,contact_email`email`,description,DATE_FORMAT(delivery,"%b,%d %Y %hh%i\'")`delivery`,payment,status')->where(array('user_id'=>$_SESSION['logid'],'id'=>$item,'ctl'=>0))->select();
				if($order->status=='i'){
					header('location: '.URL.'history/invoice/'.$item);exit();
				}
				$cart=$this->model->table('cart as `c` LEFT JOIN '.DB.N.'product as `p` ON `p`.id=`c`.product_id')->get('`c`.id,`c`.qty,`p`.name,`p`.`desc` as `item_desc`,`p`.image,`p`.price')->where(array('`c`.user_id'=>$_SESSION['logid'],'`c`.order_id'=>$item,'`c`.ctl'=>0))->ctl('c')->multi()->order('`c`.created ASC')->select();  
				if($cart)$this->view->cart=$cart;else{
					$this->notify("Your current cart empty!");
					header('location: '.URL);exit();
				}
				$this->view->order=$order;
				$ship=$this->model->table('ship')->get('name,address,suite,phone,company,city,country,state,zipcode')->where(array('user_id'=>$_SESSION['logid'],'order_id'=>$item,'ctl'=>0))->select();
				if($ship){
					$this->view->ship=$ship;
				}else{
					$this->view->ship=$this->model->table('user')->get('fullname`name`,mobile`phone`,address')->where(array('id'=>$_SESSION['logid']))->select();;
				}
				
				$this->render('orderDetail');
			}else{
				$this->index();
			}
		}else{
			header('location: '.URL.'login');exit();
		}		
	}
	public function invoice($item=false)	{
		
		if(isset($_SESSION['logid'])){
			if($item){
				$order=$this->model->table('invoice')->get('subtotal,tax,amount,contact_name`name`,contact_email`email`,description,DATE_FORMAT(delivery,"%b,%d %Y %hh%i\'")`delivery`,payment,status')->where(array('user_id'=>$_SESSION['logid'],'id'=>$item,'ctl'=>0))->select();
				if($order->status=='o'){
					header('location: '.URL.'history/order/'.$item);exit();
				}
				$cart=$this->model->table('cart as `c` LEFT JOIN '.DB.N.'product as `p` ON `p`.id=`c`.product_id')->get('`c`.id,`c`.qty,`p`.name,`p`.`desc` as `item_desc`,`p`.image,`p`.price')->where(array('`c`.user_id'=>$_SESSION['logid'],'`c`.order_id'=>$item,'`c`.ctl'=>0))->ctl('c')->multi()->order('`c`.created ASC')->select();  
				if($cart)$this->view->cart=$cart;else{
					$this->notify("Your current cart empty!");
					header('location: '.URL);exit();
				}
				$this->view->order=$order;
				$this->view->ship=$this->model->table('ship')->get('name,address,suite,phone,company,city,country,state,zipcode')->where(array('user_id'=>$_SESSION['logid'],'order_id'=>$item,'ctl'=>0))->select();
				$this->render('orderDetail');
			}else{
				$this->index();
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
	public function payCreditCard()
	{
		if(isset($_POST['delivery'])&&preg_match("/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/",$_POST['delivery'],$matches)){
			$complete=array(
				'delivery'=>$_POST['delivery'],
				'payment'=>'Credit card',
				'status'=>'i'
			);
			$this->model->table('invoice')->condition($complete)->where(array('user_id'=>$_SESSION['logid'],'id'=>$_POST['id']))->update();
			$order=$this->model->table('invoice')->get('subtotal,tax,amount,contact_name,contact_email,description')->where(array('user_id'=>$_SESSION['logid'],'id'=>$_POST['id']))->select();
			$description='Contact name: '.$order->contact_email.'- description: '.$order->description;
			$this->payCard($order->contact_email,$_POST['stripeToken'],$order->amount,$description);
			$this->notify("Thank you! You have just been complete your order.");
			header('location: '.URL.'history/invoice/'.$_POST['id']);exit();
		}else header('location: '.URL);exit();
	}
	public function paypalPayment()
	{
		if(isset($_POST['delivery'])&&preg_match("/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/",$_POST['delivery'],$matches)){
			$id=$_POST['id'];$delivery=$_POST['delivery'];unset($_POST['id'],$_POST['delivery']);
			$complete=array(
				'delivery'=>$delivery,
				'payment'=>'Paypal',
				'payment_info'=>json_encode($_POST),
				'status'=>'i'
			);
			$this->model->table('invoice')->condition($complete)->where(array('user_id'=>$_SESSION['logid'],'id'=>$id))->update();
			$this->notify("Thank you! You have just been complete your order.");
			header('location: '.URL.'history/invoice/'.$id);exit();
		}else header('location: '.URL);exit();
	}

}