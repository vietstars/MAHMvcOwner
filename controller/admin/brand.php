<?php
class adm_brand extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='Menu manage';
        $this->view->icon=$this->modun('icon')->allIcons();
	}
	public function allMenu()
	{
		$result=$this->model->table('brands as `m`')->get("`m`.id,`m`.name,`m`.icon,`m`.image,`m`.sorted,`m`.ctl")->order("`m`.ctl ASC,`m`.name ASC")->multi()->limit('not')->select();
		foreach ($result as $k=>$v) {
			$result[$k]->name=htmlspecialchars_decode($v->name);
		}
		$this->api($result);
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('brands')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('brands')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('brands')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function editItem()
	{
		if($_POST['id']){
			if(isset($_POST['name']))$_POST['name']=htmlspecialchars($_POST['name']);
			$id=$_POST['id'];unset($_POST['id']);
			$this->api($this->model->table('brands')->condition($_POST)->where(array("id"=>$id))->update());
		}
	}
	public function multiEditor()
	{
		if($_POST){
			$updated=true;
			foreach($_POST as $items){
				foreach($items as $item){
					foreach ($item as $k => $v) {
						if($k=='id'){
							$id=$v;
						}else{
							$data[$k]=$v;
						}
					}
					$data['modified']=date('Y-m-d H:i:s');
					$updating=$this->model->table('brands')->condition($data)->where(array("id"=>$id))->update();
					if(!$updating)$updated=false;
				}
			}
			$this->api($updated);
		}
	}
	public function newItem()
	{
		if($_POST['name']&&$_POST['icon']){
			$_POST['name']=htmlspecialchars($_POST['name']);
			if($_FILES['file']){
				$upload=$this->modun('image')->imgFiles($_FILES['file'],'logo',false,60);
			}
			if($upload['result']&&!empty($upload['fileName'])){
				$_POST['image']=$upload['fileName'];
				$_POST['created']=date('Y-m-d H:i:s');
				$result=$this->model->table('brands')->info($_POST)->insert();
				if($result){
					$this->notify("Your new brand created");
					header('location: '.URL.'admin/'.CTL);
					exit();
				}else{
					$this->notify("Some things fails!");
					header('location: '.URL.'admin/'.CTL);
					exit();
				}
			}
		}
	}
	public function changeImg()
	{
		if($_POST['id']&&$_FILES['file']){
			$got=$this->model->table('brands as `m`')->get("`m`.image")->where(array('id'=>$_POST['id']))->select();
			$this->modun('image')->rmImg($got->image,'logo');
			if($_FILES['file']){
				$upload=$this->modun('image')->imgFiles($_FILES['file'],'logo',false,60);
			}
			if($upload['result']&&!empty($upload['fileName'])){
				$data=array(
					'image'=>$upload['fileName'],
					'modified'=>date('Y-m-d H:i:s')
				);
				$result=$this->model->table('brands')->condition($data)->where(array("id"=>$_POST['id']))->update();
				if($result){
					$this->notify("Your brand's image updated");
					header('location: '.URL.'admin/'.CTL);
					exit();
				}else{
					$this->notify("Some things fails!");
					header('location: '.URL.'admin/'.CTL);
					exit();
				}
			}				
		}
	}
}