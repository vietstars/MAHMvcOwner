<?php
header('Access-Control-Allow-Origin: http://vietstars.vn:3000');
class api_index extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		
	}	
	public function imgCode()
	{
		if($_POST['img']){
			$this->api($this->modun('image')->imgCode($_POST));
		}
	}
	public function checkLog()
	{
		if($_POST['folder']&&$_POST['file']&&$_POST['id']){
			if($_POST['file']!='image'){
				$folder=APP.'log/'.$_POST['folder'];
				$log=APP.'log/'.$_POST['folder'].S.$_POST['file'];
				if(file_exists($log)){
					$files=array_diff(scandir($folder), array('.', '..'));
					if(empty($files))rmdir($folder);
					$this->api($_POST['id']);
				}else{
					$this->api(false);
				}
			}else{
				$folder=PUB.'img/';
				$files=array_diff(scandir($folder), array('.', '..'));
				$images=array();
				foreach ($files as $file) {
					if(is_dir($folder.$file)&&$file!='thumb'){
						if(is_dir($folder.$file.S.$_POST['folder'])){
							$subfiles=array_diff(scandir($folder.$file.S.$_POST['folder']), array('.', '..'));
							if(empty($subfiles))rmdir($folder.$file.S.$_POST['folder']);else $images=array_merge($images,$subfiles);
						}
					}
				}
				if($images)$this->api($_POST['id']);else$this->api(false);
			}
		}
	}
	public function upload()
	{
		if($_FILES['file']){
			$file=explode("-",$_FILES['file']['name']);
			$folder=current($file);
			array_shift($file);
			$_FILES['file']['name']=implode("-",$file);
			$this->api($this->modun('image')->imgFiles($_FILES['file'],$folder));
		}
	}
	public function productImg()
	{
		if($_FILES['file']){
			$file=explode("-",$_FILES['file']['name']);
			$folder=current($file);
			array_shift($file);
			$_FILES['file']['name']=implode("-",$file);		
			$this->api($this->modun('image')->productImg($_FILES['file'],$folder));
		}
	}
	public function getImage($img='no_photo.svg')
	{
		if($_POST['img']){
			if(isset($_POST['folder']))$folder=$_POST['folder'];else $folder='logo';
			$this->api($this->modun('image')->getImg($_POST['img'],$folder));
		}else{
			$this->api($this->modun('image')->getImg('no_photo.svg'));
		}
	}
}