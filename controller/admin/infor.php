<?php
class adm_infor extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='System information';
		$content=file_get_contents(SYS.'systems.php');
		$def=explode(';',$content);$sys=array();
		foreach($def as $k =>$v){
			if(strpos($v,'DB_HOST')!==false){
				$data=explode("','",$v);
				$sys['server']=str_replace("')","",end($data));
			}elseif(strpos($v,'DB_NAME')!==false){
				$data=explode("','",$v);
				$sys['database_name']=str_replace("')","",end($data));
			}elseif(strpos($v,'DB_USER')!==false){
				$data=explode("','",$v);
				$sys['database_user']=str_replace("')","",end($data));
			}elseif(strpos($v,'DB_PASS')!==false){
				$sys['database_password']=null;
			}elseif(strpos($v,"define('DB'")!==false){
				$data=explode("','",$v);
				$sys['database_prefix']=str_replace("')","",end($data));
			}elseif(strpos($v,"define('CLS'")!==false){
				$data=explode("','",$v);
				$sys['clear_trash_(days)']=str_replace("')","",end($data));
			}
		}
		$app=$this->model->table('system')->get('sys_key,sys_value,type')->where_or(array('type'=>array('domain','email')))->multi()->select();
		$got=$this->model->table('system')->get("sys_value`template`")->where(array("sys_key"=>"template"))->select();	
		$this->view->templates=array_diff(scandir(TEMP), array('.', '..'));
		$this->view->current=$got->template;
		$this->view->sys=$sys;$email=array();
		foreach ($app as $k => $v) {
			if($v->type=='domain'){
				$this->view->app=$v;
			}if($v->type=='email'){
				if($v->sys_key=='email_pass')$v->sys_value='';
				$email[]=$v;
			}
		}
		$this->view->email=$email;
	}
	public function system()
	{
		if(isset($_POST)&&$_POST){
			$content=file_get_contents(SYS.'systems.php');
			$def=explode(';',$content);
			foreach($def as $k =>$v){
				if(strpos($v,'DB_HOST')!==false){
					$def[$k]="\r\ndefine('DB_HOST','".$_POST['server']."')";
				}elseif(strpos($v,'DB_NAME')!==false){
					$def[$k]="\r\ndefine('DB_NAME','".$_POST['database_name']."')";
				}elseif(strpos($v,'DB_USER')!==false){
					$def[$k]="\r\ndefine('DB_USER','".$_POST['database_user']."')";
				}elseif(strpos($v,'DB_PASS')!==false){
					$def[$k]="\r\ndefine('DB_PASS','".$_POST['database_password']."')";
				}elseif(strpos($v,"define('DB'")!==false){
					$def[$k]="\r\ndefine('DB','".$_POST['database_prefix']."')";
				}elseif(strpos($v,"define('CLS'")!==false){
					$def[$k]="\r\ndefine('CLS','".$_POST['clear_trash_(days)']."')";
				}
			}
			$table=$this->model->exec("SHOW TABLES",1);$tables=array();
			foreach($table as $k=>$v){
				$old=current($v);
				$new=str_replace(DB,$_POST['database_prefix'],$old);
				$this->model->exec("RENAME TABLE $old to $new",1);
			}
			$file=fopen(SYS.'systems.php', 'w') or die('Unable to open file!'); 
			fwrite($file,implode(';',$def));
			fclose($file);
			chmod(SYS.'systems.php',0777);
			header('location: '.URL.'admin/'.CTL);exit();
		}
	}
	public function application()
	{
		if(isset($_POST)&&$_POST['appkey']&&$_POST['domain']&&$_POST['expiry']){
			$data=array(
				'sys_key'=>$_POST['appkey'],
				'sys_value'=>$_POST['expiry']				
			);
			$this->model->table('system')->condition($data)->where(array('type'=>'domain'))->update();
			header('location: '.URL.'admin/'.CTL);exit();
		}
	}
	public function email()
	{
		if(isset($_POST)){
			foreach ($_POST as $k => $v) {
				if($v=='nil'){
					$data=array(
						'sys_value'=>null				
					);
					$this->model->table('system')->condition($data)->where(array('type'=>'email','sys_key'=>$k))->update();
				}elseif(!empty($v)){
					$data=array(
						'sys_value'=>$v				
					);
					$this->model->table('system')->condition($data)->where(array('type'=>'email','sys_key'=>$k))->update();
				}
			}		
			header('location: '.URL.'admin/'.CTL);exit();
		}
	}	
	public function changeTemplate()
	{
		if($_POST['id']){
			$this->api($this->model->table('system')->condition(array('sys_value'=>$_POST['id']))->where(array("sys_key"=>"template"))->update());
		}
	}
}