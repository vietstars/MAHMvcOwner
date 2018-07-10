<?php
class adm_headMenu extends controller
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
		$this->api($this->model->table('menu as `m` LEFT JOIN '.DB.N.'menu as `p` ON `m`.parents=`p`.id')->get("`m`.id,`m`.menu,`p`.menu`parent`,`m`.controller,`m`.action,`m`.icon,`m`.icon_ctl,`m`.sorted,`m`.ctl")->where("`m`.type=1")->order("`m`.ctl ASC,`m`.parents ASC,`m`.sorted ASC")->ctl('m')->multi()->select());exit;
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('menu')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('menu')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('menu')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function editItem()
	{
		if($_POST['id']){
			$id=$_POST['id'];unset($_POST['id']);
			$this->api($this->model->table('menu')->condition($_POST)->where(array("id"=>$id))->update());
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
					$updating=$this->model->table('menu')->condition($data)->where(array("id"=>$id))->update();
					if(!$updating)$updated=false;
				}
			}
			$this->api($updated);
		}
	}
	public function newItem()
	{
		if($_POST['menu']&&$_POST['controller']){
			$_POST['created']=date('Y-m-d H:i:s');
			$_POST['type']=1;
			$result=$this->model->table('menu')->info($_POST)->insert();
			if($result)$this->api($this->model->lastInsertId());else $this->api(false);
		}
	}
}