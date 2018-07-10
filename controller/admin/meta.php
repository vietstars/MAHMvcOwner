<?php
class adm_meta extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{		
		$this->view->title='Meta manage';
	}
	public function allMetas()
	{
		$this->api($this->model->table('system')->get("id,sys_key`name`,sys_value`content`,type,sorted")->where_or(array("type"=>"meta","sys_key"=>array("icon")))->order("sorted ASC")->multi()->select());exit;
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('system')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('system')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('system')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function editItem()
	{
		if($_POST){
			$this->api($this->model->table('system')->condition(array('type'=>$_POST['type'],'sys_value'=>$_POST['content']))->where(array("id"=>$_POST['id']))->update());
		}
	}
	public function newItem()
	{
		if($_POST['name']&&$_POST['content']&&$_POST['type']){
			$sorted=$this->model->table('system')->get('sorted')->where('type="meta"')->order("sorted DESC")->select();
			$data=array(
				'sys_key'=>$_POST['name'],				
				'sys_value'=>$_POST['content'],
				'type'=>$_POST['type'],
				'sorted'=>$sorted->sorted+1,
				'created'=>date('Y-m-d H:i:s')
			);
			$result=$this->model->table('system')->info($data)->insert();
			if($result)$this->api($this->model->lastInsertId());else $this->api(false);
		}
	}
}