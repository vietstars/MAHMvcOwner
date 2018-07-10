<?php
class adm_index extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='Dashboard';
		// var_dump($this->model->table('user')->select());
		//var_dump($this->lg);
		// $this->login('checked','abcde','123456');
		//$this->render('index');
	}
}