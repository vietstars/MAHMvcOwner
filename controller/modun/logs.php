<?php
class mod_logs extends controller
{
	function __construct()
	{
		parent::__construct();
	}	
	public function getLogs($path=LOG)
	{
		$handle = fopen($path, "r");
        $data=array();
        while(! feof($handle))
        {
            $data[]=fgetcsv($handle);
        }
        fclose($handle);
        return $data;
	}
	public function getRecord($record=false)
	{
		if($record){
			$find=array(";"," FROM"," WHERE"," ORDER BY"," LIMIT"," VALUES"," SET");
			$replace=array(",","<br> FROM","<br> WHERE","<br> ORDER BY","<br> LIMIT","<br> VALUES","<br> SET");
			$record=str_replace($find,$replace,$record);
			return $record;
		}return false;
	}
}