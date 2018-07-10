<?php
class category extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index($id=false)
	{
		if(ctype_digit($id)){
			$this->view->best=$this->model->table('product as `p` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`p`.brand')->get('`p`.id,`p`.name,`p`.desc,`p`.price,`p`.image,`b`.name as `brand`')->where(array('`p`.status'=>'b','`p`.cate'=>$id))->ctl('p')->multi()->limit(6)->select();
			$this->view->cate=$this->model->table('category')->get('id,name')->where(array('ctl'=>'0','id'=>$id))->multi()->select();
		}else{header('location: '.URL);exit();}
	}	
}