<?php
class adm_category extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='Category manage';
        $this->view->icon=$this->modun('icon')->allIcons();
	}
	public function allMenu()
	{
		$result=$this->model->table('category as `m`')->get("`m`.id,`m`.name,`m`.icon,`m`.sorted,`m`.ctl")->where("`main_cat`=0")->order("`m`.ctl ASC,`m`.name ASC")->multi()->limit('not')->select();
		foreach ($result as $k=>$v) {
			$result[$k]->name=htmlspecialchars_decode($v->name);
		}
		$this->api($result);
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('category')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function delBrand()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('brands')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('category')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('category')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function editItem()
	{
		if($_POST['id']){
			if(isset($_POST['name']))$_POST['name']=htmlspecialchars($_POST['name']);
			$id=$_POST['id'];unset($_POST['id']);
			$this->api($this->model->table('category')->condition($_POST)->where(array("id"=>$id))->update());
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
					$updating=$this->model->table('category')->condition($data)->where(array("id"=>$id))->update();
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
			$_POST['created']=date('Y-m-d H:i:s');
			$result=$this->model->table('category')->info($_POST)->insert();
			if($result)$this->api($this->model->lastInsertId());else $this->api(false);
		}
	}
	public function getBrand()
	{
		if($_POST['id']){
			$this->api($this->model->table('follow as `c` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`c`.brand_id')->get("`b`.id,`b`.name")->where(array('cat_id'=>$_POST['id']))->multi('not')->ctl('c')->select());
		}
	}
	public function getSubcat()
	{
		if($_POST['id']){
			$this->api($this->model->table('category')->get("id,name")->where(array('main_cat'=>$_POST['id']))->multi('not')->select());
		}
	}
}