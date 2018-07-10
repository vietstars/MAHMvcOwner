<?php
class mod_text extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function getSbTitle()
	{
		$get=$this->model->table('text')->get('df_content,content')->where('ctl=0 AND id=1')->select();
		if(empty($get->content))return $get->df_content;else return $get->content;
	}
	public function getSbContent()
	{
		$get=$this->model->table('text')->get('df_content,content')->where('ctl=0 AND id=2')->select();
		if(empty($get->content))return $get->df_content;else return $get->content;
	}
	public function cut($text,$lenght)
	{ 
		if($text){
			mb_internal_encoding('UTF-8'); 
			mb_strlen($text,'UTF-8')>$lenght?($text=mb_substr($text,0,$lenght,'UTF-8')and$text=mb_substr($text,0, mb_strrpos($text," ",'UTF-8'),'UTF-8').'...'):null;
		}else $text='&nbsp;';
		return $text;
	}
	public function getSvTitle()
	{
		$get=$this->model->table('text')->get('df_content,content')->where('ctl=0 AND id=3')->select();
		if(empty($get->content))return $get->df_content;else return $get->content;
	}
	public function getSvContent()
	{
		$get=$this->model->table('text')->get('df_content,content')->where('ctl=0 AND id=4')->select();
		if(empty($get->content))return $get->df_content;else return $get->content;
	}
	public function getGbTitle()
	{
		$get=$this->model->table('text')->get('df_content,content')->where('ctl=0 AND id=5')->select();
		if(empty($get->content))return $get->df_content;else return $get->content;
	}
	public function getGbContent()
	{
		$get=$this->model->table('text')->get('df_content,content')->where('ctl=0 AND id=6')->select();
		if(empty($get->content))return $get->df_content;else return $get->content;
	}
}