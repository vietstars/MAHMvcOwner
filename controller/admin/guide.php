<?php
class adm_guide extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='Guide manage';
	}
	public function allGuides()
	{
		$this->api($this->model->table('guide')->get("id,helper,tooltip,modified,ctl")->order("modified DESC")->multi()->limit('not')->select());exit;
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('guide')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('guide')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('guide')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function editItem()
	{
		if($_POST){
			$this->api($this->model->table('guide')->condition(array('id'=>$_POST['id'],'helper'=>$_POST['helper'],'tooltip'=>$_POST['tooltip']))->where(array("id"=>$_POST['id']))->update());
		}
	}
	public function newItem()
	{
		if($_POST['id']&&$_POST['tooltip']&&$_POST['helper']){
			$data=array(
				'id'=>$_POST['id'],				
				'tooltip'=>$_POST['tooltip'],
				'helper'=>$_POST['helper'],
				'created'=>date('Y-m-d H:i:s')
			);
			$result=$this->model->table('guide')->info($data)->insert();
			if($result)$this->api($this->model->lastInsertId());else $this->api(false);
		}
	}
}