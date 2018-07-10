<?php
ob_start();
@session_start();
date_default_timezone_set("Asia/Singapore");
define('S','/');
define('N','_');
define('SHA',512);
define('APP',$root=dirname(dirname(__FILE__)).S.'mah'.S);//public_html đã bỏ// $root=dirname(dirname(__FILE__));
$install= APP."install/";
define('SYS', APP.'system/');
define('VIEW', APP.'view/');
require SYS.'systems.php';
$installing=isset($_GET['url'])?$_GET['url']:false;
if(is_dir($install)){	
	$files=scandir(VIEW);
	foreach ($files as $file) {
		if($file!="."&&$file!=".."){
			if(!is_dir(VIEW.$file))
				copy(VIEW.$file,$install.$file);
		}
	}
	$content="<?php 
	ini_set('max_execution_time', '600');
	class install
	{
		private \$conn;
		private \$sql;
		private \$prefix;
		function __construct()
		{			
		}
		public function getSystem(\$error=false)
		{					
			if(\$error){
				require 'pushsystem.php';
			}else{
				require 'getsystem.php';
			}	
		}
		public function pushSystem(\$data=false)
		{
			if(!empty(\$data['hostname'])&&!empty(\$data['dbname'])&&!empty(\$data['prefix'])&&!empty(\$data['dbuser'])){
				try {
					\$this->conn=new PDO('mysql:host='.\$data['hostname'].';charset=utf8', \$data['dbuser'], \$data['dbpass']);
					sleep(DBT);
					\$this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
					\$this->pushSql('DROP DATABASE IF EXISTS '.\$data['dbname'])
						->pushData()
						->pushSql('CREATE DATABASE IF NOT EXISTS '.\$data['dbname'].' COLLATE utf8_unicode_ci')
						->pushData()
						->pushSql('use '.\$data['dbname'])
						->pushData();
					\$this->prefix=\$data['prefix'];			
				}catch(PDOException \$e) {
				    \$this->getSystem(1);
				    exit;
				}
				\$salt=str_replace('\'','_',\$this->user_salt());
				\$sql=file_get_contents(APP.'install/data.sql');		
				\$sql=str_replace('\\r\\n','',\$sql);		
				\$sql=str_replace('prefix_',\$this->prefix.'_',\$sql);				
				\$sql=str_replace('sys_appkey',\$data['appkey'],\$sql);
				\$sql=str_replace('sys_expiry',\$data['expiry'],\$sql);
				\$sql=str_replace('sys_create',date('Y-m-d H:i:s'),\$sql);
				\$sql=str_replace('acc_email',\$data['user'],\$sql);
				\$sql=str_replace('acc_pass',md5(md5(\$data['password']).\$salt),\$sql);
				\$sql=str_replace('acc_userid',\$data['password'],\$sql);
				\$sql=str_replace('acc_salt',\$salt,\$sql);
				\$sql=explode('-- ', \$sql);
				array_shift(\$sql);
				foreach (\$sql as \$k => \$v) {
					\$this->pushSql(\$v)
						->pushData();
				}
				\$this->close();
				\$content=file_get_contents(SYS.'systems.php');
				\$def=explode(';',\$content);
				foreach(\$def as \$k =>\$v){
					if(strpos(\$v,'DB_HOST')!==false){
						\$def[\$k]=\"\\r\\ndefine('DB_HOST','\".\$data['hostname'].\"')\";
					}elseif(strpos(\$v,'DB_NAME')!==false){
						\$def[\$k]=\"\\r\\ndefine('DB_NAME','\".\$data['dbname'].\"')\";
					}elseif(strpos(\$v,'DB_USER')!==false){
						\$def[\$k]=\"\\r\\ndefine('DB_USER','\".\$data['dbuser'].\"')\";
					}elseif(strpos(\$v,'DB_PASS')!==false){
						\$def[\$k]=\"\\r\\ndefine('DB_PASS','\".\$data['dbpass'].\"')\";
					}elseif(strpos(\$v,\"define('DB'\")!==false){
						\$def[\$k]=\"\\r\\ndefine('DB','\".\$data['prefix'].\"')\";
					}
				}
				\$file=fopen(SYS.'systems.php', 'w') or die('Unable to open file!'); 
				fwrite(\$file,implode(';',\$def));
				fclose(\$file);
				chmod(SYS.'systems.php',0777);
				session_destroy();
				foreach (\$_COOKIE as \$k => \$v) {
					setcookie(\$k,'', NOW-3600,'/',\$_SERVER['SERVER_NAME'], false);
					unset(\$_COOKIE);
				}			
				require 'complete.php';
				\$file=scandir(APP.'install');
				foreach (\$file as \$k => \$v) {
					if(\$v!='.'&&\$v!='..'){
						unlink(APP.'install/'.\$v);
					}
				}
				rmdir(APP.'install');
				if(file_exists(SYSTEM))unlink(SYSTEM);
				//rename(APP.'install',APP.'installed');
				exit();
			}else{
				\$this->getSystem(1);
			}
		}
		public function pushSql(\$sql=false)
		{
			if(\$sql){
				\$this->sql=\$sql;
				return \$this;
			}
		}
		public function pushData()
		{
			if(\$this->conn&&\$this->sql){
				\$this->conn->exec(\$this->sql);
				sleep(1);
				return \$this;
			}
		}
		public function close()
		{
			\$this->conn=null;
			\$this->sql='';
			\$this->prefix='';
			return \$this;
		}
		public function norand(\$min=0,\$max=0)
		{
			mt_srand(crc32(microtime()));
			if (\$max AND \$max <= mt_getrandmax()){
				\$number = mt_rand(\$min, \$max);
			}else{
				\$number = mt_rand();
			}
			mt_srand();
			return \$number;
		}
		public function user_salt(\$length=30)
		{
			\$salt='';
			for (\$i = 0; \$i < \$length; \$i++){
				\$salt .= chr(self::norand(33, 126));
			}
			return \$salt;
		}
	}
?>";
	$file=fopen($install.'index.php', "w") or die("Unable to open file!"); 
	fwrite($file,$content);
	fclose($file);
	chmod($install.'index.php',0777);	
	require $install.'index.php';
	$installing=new install();
	if(!isset($_POST['hostname'])||!isset($_POST['dbname'])||!isset($_POST['prefix'])||!isset($_POST['dbuser'])||!isset($_POST['dbpass'])){
		$installing->getSystem(); 
	}else{
		$installing->pushSystem($_POST);
	}
	exit;
}
if($installing=='reinstall'&&!is_dir($install)){
	if(!isset($_POST['key'])||!isset($_POST['key'])||!isset($_POST['key'])){
		$error=new error();
		$error->end();
	}else{
		mkdir($install, 0777);
		chmod($install, 0777);
		header('location: '.URL);exit();
	}
}
if(!isset($_COOKIE['lg']))setcookie("lg","en",false, '/',$_SERVER['SERVER_NAME'], false);
function __autoload($class)
{
	$file=$class.'.php';
	$search=[SYS,CLI,ADM,API,MOD];
	foreach ($search as $key=>$value)
		if($key<2&&file_exists($value.$file))
			require $value.$file;
		elseif($key==2){
			$files=explode(ADM_PREFIX.N,$file);
			if(file_exists($value.end($files)))
				require $value.end($files);
		}elseif($key==3){
			$files=explode(API_PREFIX.N,$file);
			if(file_exists($value.end($files)))
				require $value.end($files);
		}elseif($key==4){
			$files=explode(MOD_PREFIX.N,$file);
			if(file_exists($value.end($files)))
				require $value.end($files);
		}
}
$app=new root();