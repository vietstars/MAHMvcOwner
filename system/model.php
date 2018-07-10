<?php
class model
{	
	function __construct()
	{		
		try {
			$this->model=new database(DB_HOST,DB_NAME,DB_USER,DB_PASS);
			sleep(DBT);
		} catch(PDOException $e) {
		    $connect=new error();
		    $connect->false();
		    exit;
		}
	}
}