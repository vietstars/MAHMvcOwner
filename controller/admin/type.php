<?php
class adm_type extends controller
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
		$result=$this->model->table('type')->get("id,name,sorted,ctl")->order("ctl ASC,name ASC")->multi()->limit('not')->select();
		foreach ($result as $k=>$v) {
			$result[$k]->name=htmlspecialchars_decode($v->name);
		}
		$this->api($result);
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('type')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('type')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('type')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function editItem()
	{
		if($_POST['id']){
			if(isset($_POST['name']))$_POST['name']=htmlspecialchars($_POST['name']);
			$id=$_POST['id'];unset($_POST['id']);
			$this->api($this->model->table('type')->condition($_POST)->where(array("id"=>$id))->update());
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
					$updating=$this->model->table('type')->condition($data)->where(array("id"=>$id))->update();
					if(!$updating)$updated=false;
				}
			}
			$this->api($updated);
		}
	}
	public function newItem()
	{
		if($_POST['name']){
			$_POST['name']=htmlspecialchars($_POST['name']);
			$_POST['created']=date('Y-m-d H:i:s');
			$result=$this->model->table('type')->info($_POST)->insert();
			if($result)$this->api($this->model->lastInsertId());else $this->api(false);
		}
	}
}