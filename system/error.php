<?php
class error extends controller
{
	function __construct() 
	{
	}
	public function index()
	{
		$lang=$this->lang('system',1);		
		require 'public/error.php';
	}
	public function false()
	{
		$lang=$this->lang('system',1);		
		require 'public/connect.php';
	}
	public function end()
	{
		$lang=$this->lang('system',1);		
		require 'public/expiry.php';
	}
}