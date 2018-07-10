<?php
class mod_icon extends controller
{
	function __construct()
	{
		parent::__construct();
	}	
	public function allIcons()
	{
		$handle = fopen(ICON, "r");
        $data=array();
        while(! feof($handle))
        {
            $data[]=fgetcsv($handle);
        }
        fclose($handle);
        $icon=array();
        foreach ($data as $key => $value) {
            $icon[]=rtrim("fa ".$value[0]);
        }
        return $icon;
	}
}