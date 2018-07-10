<?php
class adm_style extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='Style manage';
	}
	public function allCss()
	{
		$this->api($this->model->table('system')->get("id,IF(sys_key='ad_css','Admin',IF(sys_key='cl_css','Client','All'))`key`,sys_value`file`,IF(`type` IS NULL,'All',`type`)`ctrol`,sorted,ctl")->where_or(array('sys_key'=>array('css','ad_css','cl_css')))->order("ctl ASC,sorted ASC")->multi()->select());exit;
	}
	public function allJs()
	{
		$this->api($this->model->table('system')->get("id,IF(sys_key='ad_js','Admin',IF(sys_key='cl_js','Client','All'))`key`,sys_value`file`,IF(`type` IS NULL,'All',`type`)`ctrol`,sorted,ctl")->where_or(array('sys_key'=>array('js','ad_js','cl_js')))->order("ctl ASC,sys_key DESC,sorted ASC")->multi()->select());exit;
	}
	public function multiDelete()
	{
		if($_POST['items']){
			$result=$this->model->table('system')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update();
			if($result){
				$this->plugin(1);
			}else{
				$this->api(false);
			}
		}
	}	
}