<?php
class adm_update extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='Update record Logs';
	}
	public function getLogs()
	{
		if($_POST['date']){
			$post_date=$date=date('d-m-Y');
			if(isset($_POST['date']))$post_date=date('d-m-Y',strtotime($_POST['date']));
			$log=APP.'log/'.$post_date.'/edt.csv';
			if(file_exists($log)){
				$logs=$this->modun("logs")->getLogs($log);
				array_shift($logs);
				$logs=array_reverse($logs);
				foreach ($logs as $key=>$item) {	
					if($date==$post_date)
						$datetime="Today ".date('H:i',strtotime($item[0]));
					else
						$datetime=date('M,d Y H:i',strtotime($item[0]));
					if(empty($item[1]))$item[1]='Unknown';
					if(empty($item[2]))$item[2]='Unknown';else{
						if(preg_match('/[^.]+\.[^.]+\.[^.]+\.[^.]+$/',$item[2])){
	                		list($hash,$time,$hid,$userid)=explode(".",$item[2]);
	                		$visitor='<a href="'.URL.'admin/user/info/'.$userid.'" data-toggle="tooltip" data-placement="top" title="Click to view profile" data-original-title="Click to view profile">Visitor</a>';
	                	}else{
							$visitor='Viewer';
	                	}
					}
					if(empty($item[3]))$item[3]='Unknown';
					if(empty($item[4]))$item[4]='Unknown';
					if(empty($item[5]))$item[5]='Unknown';
					if(empty($item[6]))$item[6]='Unknown';
					if(empty($item[7]))$item[7]='Unknown';
					$data=array(				
						"ip"=>$item[1]."<br><small>".$item[6]."</small>",
						"visitor"=>$visitor,
						"browser"=>$item[5]."<br><small>".$item[3]."</small>",			
						"url"=>"<small>".$this->modun('logs')->getRecord($item[7])."</small>",
						"datetime"=>"<small>".$datetime."</small>"
					);
					$datas[]=$data;
				}
				$all['data']=$datas;
				$this->api($all);
			}else{
				$all['data']=array();
				$this->api($all);
			}
		}
	}
	public function delLogs()
	{
		if($_POST['folder']){
			$folder=APP.'log/'.$_POST['folder'];
			$log=APP.'log/'.$_POST['folder'].'/edt.csv';
			if(file_exists($log)){
				unlink($log);
				$files=array_diff(scandir($folder), array('.', '..'));
				if(empty($files))rmdir($folder);
				$this->api(true);
			}else $this->api(false);
		}else $this->api(false);
	}
}