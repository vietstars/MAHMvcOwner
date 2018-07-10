<?php
class info extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		if($_POST){			
			if(isset($_FILES['file'])){
				$upload=$this->modun('image')->imgFiles($_FILES['file'],'avatar',0);
				if(isset($upload['fileName']))$_POST['avatar']=$upload['fileName'];
			}
			if(isset($_POST['password'])&&$_POST['password']){
				$salt=$this->modun("index")->user_salt();
				$_POST['userId']=$_POST['password'];
				$_POST['password']=md5(md5($_POST['password']).$salt);
				$_POST['salt']=$salt;
			}
			$this->model->table('user')->condition($_POST)->where(array("id"=>$_SESSION['logid']))->update();
			$this->notify("Your account information has been updated successfully.");
			header('location: '.URL.'info');exit();
		}
		if(isset($_SESSION['logid'])){
			$this->view->info=$this->model->table('user as `u`')->where(array('id'=>$_SESSION['logid']))->ctl('u')->select();
		}else{
			header('location: '.URL.'login');exit();
		}		
	}
	
}