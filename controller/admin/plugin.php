<?php
class adm_plugin extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='Plugin manager';
		$files=array_diff(scandir(PLUGIN), array('.', '..'));$package=array();
		if($files){
			foreach ($files as $file) {
				if(!is_dir(PLUGIN.$file)){
					$package[]=array(
						"name"=>$file,
						'datetime'=>date('d-m-Y h:i a',filemtime(PLUGIN.$file))
					);
				}
			}
		}
		$install=array_diff(scandir(PLUGIN.'installed'), array('.', '..'));$items=array();
		if($install){
			foreach ($install as $file) {
				if(!is_dir(PLUGIN.'installed/'.$file)){
					$items[]=array(
						"name"=>$file,
						'datetime'=>date('d-m-Y h:i a',filemtime(PLUGIN.'installed/'.$file))
					);
				}
			}
		}
		$this->view->packages=$package;
		$this->view->installed=$items;
	}
	// public function getFolder()
	// {
	// 	$files=array_diff(scandir(PUB.'img'), array('.', '..'));
	// 	$folders[]=array('name'=>'root');
	// 	if($files){
	// 		foreach ($files as $folder) {
	// 			if(is_dir(PUB.'img'.S.$folder)&&$folder!='thumb'){
	// 				$folders[]=array("name"=>$folder);
	// 			}
	// 		}
	// 	}
	// 	$this->api($folders);
	// }
	// public function allImage()
	// {
	// 	if($_POST['folder']){
	// 		$folder=PUB.'img/thumb/';
	// 		$files=array_diff(scandir($folder), array('.', '..'));
	// 		$images=array();
	// 		foreach ($files as $file) {
	// 			if(is_dir($folder.$file)){
	// 				if(is_dir($folder.$file.S.$_POST['folder'])){
	// 					$subfiles=array_diff(scandir($folder.$file.S.$_POST['folder']), array('.', '..'));
	// 					if(empty($subfiles))rmdir($folder.$file.S.$_POST['folder']);else{
	// 						foreach ($subfiles as $k => $img) {
	// 							$images[]=array(
	// 								'img'=>"background:url(".$this->modun('image')->getImg($img,$file,1).")",
	// 								'url'=>$this->modun('image')->getImg($img,$file),
	// 								'folder'=>'<small>Folder</small><h2 class="text-danger">'.$file."</h2>"
	// 							);
	// 						}
	// 					} 
	// 				}
	// 			}
	// 		}
	// 		if($images)$this->api($images);else$this->api(false);
	// 	}else $this->api(false);
	// }
}