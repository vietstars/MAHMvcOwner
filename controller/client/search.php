<?php
class search extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		if($_POST['search']){
			$this->view->cate=$this->model->table('product as `p` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`p`.brand')->get('`p`.id,`p`.name,`p`.`desc`,`p`.image,`p`.price,`b`.name `brand`')->where(array('`p`.ctl'=>'0'))->where('`p`.name LIKE ("%'.$_POST['search'].'%") OR `p`.`desc` LIKE ("%'.$_POST['search'].'%")')->ctl('p')->multi()->select();
		}
	}	
}