<?php
/******************
--select:  $result=$this->db->table('session')
			->get('idhash')
			->where('useragent',$check['useragent'])
			->where($where) //$where=array('useragent'=>$check['useragent']);
			->where('id IN (1,2,3)')
			->order('lastime DESC')
			->order($order) //$order=array("lastime"=>"DESC");
			->ctl()
			->multi() 
			->limit(3) // Limit 30 (d)
			->select(); //array //dict //obj(d)
--delete: $this->db->table('session')
			->where() // ctl=2
			->limit(10)
			->delete(); //null //false(d)
--increment: $this->db->table('session')
			->increment()
******************/
class database extends PDO
{	
	private $get='*';
	private $info;
	private $condition;
	private $where;
	private $bind=array();
	private $order;
	private $limit=' LIMIT 30';
	private $multi=false;
	private $ctl='ctl<>2';
	private $document;
	private $used;
	private $os;
	private $ver;
	public function __construct($DB_HOST, $DB_NAME, $DB_USER, $DB_PASS)
	{
		parent::__construct('mysql:host='.$DB_HOST.';dbname='.$DB_NAME.';charset=utf8', $DB_USER, $DB_PASS);
	}
	public function table($table)
	{
		if(!file_exists(SYSTEM)||(filemtime(SYSTEM)<=DBL)||empty(file_get_contents(SYSTEM))){			
			try {
			    $conn = new PDO('mysql:host='.DB_HOST.';dbname='.DB_NAME, DB_USER, DB_PASS);
		    	sleep(DBT);
			    $sys=$conn->prepare('select sys_key,SHA2(concat("'.$_SERVER['SERVER_NAME'].'","_",IF(sys_value="forever","forever",UNIX_TIMESTAMP(sys_value))),512)`sha`,sys_value,"'.$_SERVER['SERVER_NAME'].'"`type` from '.DB.N.'system where type="domain"');
			    $sys->execute();$key=$sys->fetch(PDO::FETCH_OBJ);
			    if(substr($key->sha,pow(SHA,1/3)*6+1,log10(0.1)*round(pow(SHA,1/3)*6))==$key->sys_key){
			    	if(strtotime($key->sys_value)>=NOW||$key->sys_value=='forever'){
			    		if($key->sys_value!='forever'){
					    	$json=(object)array("key"=>$key->sys_key,"name"=>$key->type,'expiry'=>strtotime($key->sys_value));
			    		}else{
			    			$json=(object)array("key"=>$key->sys_key,"name"=>$key->type,'expiry'=>$key->sys_value);
			    		}
					    $this->log(SYSTEM, json_encode($json), "w");
					    $conn = null;
					    $this->document=DB.N.trim($table); 
						return $this;
			    	}else{
			    		if(file_exists(SYSTEM))unlink(SYSTEM);
			    		$this->redirect('end');
			    		exit;
			    	}
			    }else{
			    	if(file_exists(SYSTEM))unlink(SYSTEM);
			    	$this->redirect('end');
			    	exit;
			    }				
			} catch (PDOException $e) {
			    $this->redirect('false');
			}
		}else{
			$sys=json_decode(file_get_contents(SYSTEM),true);
			if($sys['expiry']=='forever'){
				$loghash=hash('SHA'.SHA,$sys['name'].N.$sys['expiry']);
			}else{
				$loghash=hash('SHA'.SHA,$sys['name'].N.date('Y-m-d',$sys['expiry']));
			}
			if(substr($loghash,pow(SHA,1/3)*6+1,log10(0.1)*round(pow(SHA,1/3)*6))==$sys['key']){
		    	if($sys['expiry']>=NOW||$sys['expiry']=='forever'){
				    $this->document=DB.N.trim($table); 
					return $this;
		    	}else{
		    		if(file_exists(SYSTEM))unlink(SYSTEM);
		    		$this->redirect('end');
		    		exit;
		    	}
		    }else{
		    	if(file_exists(SYSTEM))unlink(SYSTEM);
		    	$this->redirect('end');
		    	exit;
		    }			
		}
	}
	public function ctl($data=false)
	{
		if(is_string($data)){
			$this->ctl='`'.trim($data).'`.ctl<>2';
			if(trim($this->get)=='*')$this->get=' `'.trim($data).'`.* ';
		}
		return $this;
	}
	public function get($data=false)
	{
		if(is_array($data))
			$this->get=implode(',',$data);
		elseif(is_string($data))
			$this->get=trim($data);
		return $this;
	}
	public function info($data=false)// using insert
	{
		if(is_string($data))
			$this->info=trim($data);
		elseif(is_array($data)){
			if(is_string(current($data))){
				$key=implode('`,`',array_keys($data));
				$value=':'.implode(',:',array_keys($data));
				$this->info='(`'.$key.'`) VALUES ('.$value.')';
				$this->bind=array_combine(explode(',',$value),array_values($data));
			}elseif(is_array(current($data))){
				foreach ($data as $k=>$v) {
					$key=implode('`,`',array_keys($v));
					$value=':'.$k.N.implode(',:'.$k.N,array_keys($v));
					if($this->info){
						list($info,$null)=explode(' VALUES ',$this->info);
						if($info=='(`'.$key.'`)'){
							$this->info.=',('.$value.')';
							foreach(array_combine(explode(',',$value),array_values($v)) as $kb=>$vb)
								$this->bind[$kb]=$vb;
						}
					}else{
						$this->info='(`'.$key.'`) VALUES ('.$value.')';
						foreach(array_combine(explode(',',$value),array_values($v)) as $kb=>$vb)
							$this->bind[$kb]=$vb;
					}
				}
			}				
		}
		return $this;
	}
	public function condition($data=false) //using update
	{
		if(is_array($data)){
			$condition='';
			foreach ($data as $k => $v) {
				$bk=':'.preg_replace("/[^A-Za-z]/","",$k);
				if($condition)
					$condition.=','.$k.'='.$bk;
				else
					$condition.=$k.'='.$bk;
				$this->bind[$bk]=$v;
			}
			if($this->condition)
				$this->condition.=','.$condition;
			else
				$this->condition=$condition;
		}elseif(is_string($data)){
			if($value){
				$bk=':'.preg_replace("/[^A-Za-z]/","",$data);
				if($this->condition)
					$this->condition.=','.trim($data).'='.$bk;
				else
					$this->condition=trim($data).'='.$bk;			
				$this->bind[$bk]=$value;
			}else{
				if($this->condition)
					$this->condition.=','.trim($data);
				else
					$this->condition=trim($data);
			}
		}
		return $this;
	}
	public function where($data=false,$value=false)
	{	
		if(is_array($data)){
			$where='';$count=0;
			foreach ($data as $k => $v) {
				if(is_array($v)){
					foreach ($v as $value) {
						$bk=':'.preg_replace("/[^A-Za-z]/","",$k).N.$count;
						if($where)
							$where.=' AND '.$k.'='.$bk;
						else
							$where.=$k.'='.$bk;
						$this->bind[$bk]=$value;
						$count++;
					}
				}else{
					$bk=':'.preg_replace("/[^A-Za-z]/","",$k).N.$count;
					if($where)
						$where.=' AND '.$k.'='.$bk;
					else
						$where.=$k.'='.$bk;
					$this->bind[$bk]=$v;
					$count++;
				}
			}
			if($this->where)
				$this->where.=' AND '.$where;
			else
				$this->where='WHERE '.$where;
		}elseif(is_string($data)){
			if($value){
				$bk=':'.preg_replace("/[^A-Za-z]/","",$data);
				if($this->where)
					$this->where.=' AND '.trim($data).'='.$bk;
				else
					$this->where='WHERE '.trim($data).'='.$bk;			
				$this->bind[$bk]=$value;
			}else{
				if($this->where)
					$this->where.=' AND '.trim($data);
				else
					$this->where='WHERE '.trim($data);
			}
		}
		return $this;
	}
	public function where_or($data=false,$value=false)
	{	
		if(is_array($data)){
			$where='';$count=0;
			foreach ($data as $k => $v) {
				if(is_array($v)){
					foreach ($v as $value) {
						$bk=':'.preg_replace("/[^A-Za-z]/","",$k).N.$count;
						if($where)
							$where.=' OR '.$k.'='.$bk;
						else
							$where.=$k.'='.$bk;
						$this->bind[$bk]=$value;
						$count++;
					}
				}else{
					$bk=':'.preg_replace("/[^A-Za-z]/","",$k).N.$count;				
					if($where)
						$where.=' OR '.$k.'='.$bk;
					else
						$where.=$k.'='.$bk;
					$this->bind[$bk]=$v;
					$count++;
				}
			}
			if($this->where)
				$this->where.=' OR '.$where;
			else
				$this->where='WHERE ('.$where.')';
		}elseif(is_string($data)){
			if($value){
				$bk=':'.preg_replace("/[^A-Za-z]/","",$data);
				if($this->where)
					$this->where.=' OR '.trim($data).'='.$bk;
				else
					$this->where='WHERE '.trim($data).'='.$bk;			
				$this->bind[$bk]=$value;
			}else{
				if($this->where)
					$this->where.=' OR '.trim($data);
				else
					$this->where='WHERE ('.trim($data).')';
			}
		}
		return $this;
	}
	public function order($data=false)
	{
		if(is_array($data)){
			$order='';
			foreach ($data as $k => $v) {
				if($order)$order.=', '.$k.' '.$v;else$order=$k.' '.$v;
			}
			if($this->order)
				$this->order.=', '.$order;
			else
				$this->order=' ORDER BY '.$order;
		}elseif(is_string($data)){
			if($this->order)
				$this->order.=', '.trim($data);
			else
				$this->order=' ORDER BY '.trim($data);
		}
		return $this;
	}
	public function limit($row=false,$to=false)
	{
		if($row!='not'){
			if($to){
				if($row)
					$this->limit=' LIMIT '.$row.','.$to;
				else
					$this->limit=' LIMIT 0,'.$to ;
			}else{
				if($row)$this->limit=' LIMIT '.$row ;
			}
		}else $this->limit='';
		return $this;
	}
	public function multi()
	{
		$this->multi=true;
		return $this;
	}
	public function clean()
	{
		foreach ($this as $key => $value){
			if($key!='used'&&$key!='os'&&$key!='ver')
			$this->$key='';
		}
		$this->get='*';
		$this->bind=array();
		$this->limit=' LIMIT 30';
		$this->multi=false;
		$this->ctl='ctl<>2';
		return $this;
	}
	private function mode($mode)
	{
		switch($mode){
			case "dict":{    
				return $mode=PDO::FETCH_ASSOC;    
				break;    
			}
			case "array":{    
				return $mode=PDO::FETCH_NUM;    
				break;    
			}
			default:{    
				return $mode=PDO::FETCH_OBJ;    
				break;    
			}
		}
	}
	public function select($mode=PDO::FETCH_OBJ)
	{
		if($this->document&&!preg_match("/\./",$_SERVER['REQUEST_URI'])){
			$trash=$this->prepare("DELETE FROM $this->document WHERE ctl=2 AND DATE(modified)<DATE(NOW() - INTERVAL ".CLS." DAY)");
			$trash->execute();
			if($this->where)$this->where.=' AND '.$this->ctl;else$this->where='WHERE '.$this->ctl;
			$sql=$this->prepare("SELECT $this->get FROM $this->document $this->where".$this->order.$this->limit);
			$log=$sql->queryString;			
			ksort($this->bind);				
			foreach ($this->bind as $k => $v) {
				$sql->bindValue("$k",$v);
				$log=str_replace("$k",$v,$log);
				$log=str_replace(",",";",$log);
			}
			$sql->execute();
			if(isset($_COOKIE['loghash']))$logs=$_COOKIE['loghash'];else$logs='Not get';
			if($this->multi=='true'){
				$log=str_replace("SELECT","SELECTS",str_replace(",",";",$log));				
				$this->log(GET,PHP_EOL.date('Y-m-d H:i:s').",".$_SERVER['REMOTE_ADDR'].','.$logs.','.$this->used.','.$this->ver.','.$this->os.','.$_SERVER['REQUEST_URI'].','.str_replace(DB.N,'',$log));
				$this->clean();
				return $sql->fetchAll($this->mode($mode));
			}else{
				$this->log(GET,PHP_EOL.date('Y-m-d H:i:s').",".$_SERVER['REMOTE_ADDR'].','.$logs.','.$this->used.','.$this->ver.','.$this->os.','.$_SERVER['REQUEST_URI'].','.str_replace(DB.N,'',$log));		
				$this->clean();
				return $sql->fetch($this->mode($mode));
			}					
		}else return false;
	}
	public function insert($return=false)
	{
		if($this->document&&!preg_match("/\./",$_SERVER['REQUEST_URI'])){
			$sql=$this->prepare("INSERT INTO $this->document $this->info");
			$log=$sql->queryString;
			foreach ($this->bind as $k=>$v){
				$sql->bindValue("$k",$v);
				$log=str_replace("$k",$v,$log);
				$log=str_replace(",",";",$log);
			}			
			if(isset($_COOKIE['loghash']))$logs=$_COOKIE['loghash'];else$logs='Not get';
			$this->log(ADD,PHP_EOL.date('Y-m-d H:i:s').",".$_SERVER['REMOTE_ADDR'].','.$logs.','.$this->used.','.$this->ver.','.$this->os.','.$_SERVER['REQUEST_URI'].','.str_replace(DB.N,'',$log));		
			$this->clean();
			$sql->execute();
			return $sql->rowCount() ? true : $return;
		}else return $return;		
	}	
	public function update($return=false)
	{
		if($this->document&&!preg_match("/\./",$_SERVER['REQUEST_URI'])){
			$sql=$this->prepare("UPDATE $this->document SET $this->condition $this->where");
			$log=$sql->queryString;
			foreach ($this->bind as $k=>$v){
				$sql->bindValue("$k",$v);
				$log=str_replace("$k",$v,$log);
				$log=str_replace(",",";",$log);
			}
			if(isset($_COOKIE['loghash']))$logs=$_COOKIE['loghash'];else$logs='Not get';
			$this->log(EDT,PHP_EOL.date('Y-m-d H:i:s').",".$_SERVER['REMOTE_ADDR'].','.$logs.','.$this->used.','.$this->ver.','.$this->os.','.$_SERVER['REQUEST_URI'].','.str_replace(DB.N,'',$log));	
			$this->clean();
			$sql->execute();
			return $sql->rowCount() ? true : $return;
		}else return $return;
	}
	public function increment($return=false)
	{
		if($this->document&&!preg_match("/\./",$_SERVER['REQUEST_URI'])){
			$sql=$this->prepare("SELECT `AUTO_INCREMENT` FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='".DB_NAME."' AND TABLE_NAME=:table");
			$sql->bindValue(":table",trim($this->document));
			$sql->execute();
			$auto_increment=$sql->fetch(PDO::FETCH_NUM);
			if(current($auto_increment))
				return current($auto_increment);
			else
				return $return;
		}else return $return; 
	}
	public function delete($return=false)
	{
		if($this->document&&!preg_match("/\./",$_SERVER['REQUEST_URI'])){
			if(empty($this->where))$this->where="WHERE ctl=2";
			$sql=$this->prepare("DELETE FROM $this->document $this->where".$this->limit);
			$log=$sql->queryString;
			ksort($this->bind);				
			foreach ($this->bind as $k => $v) {
				$sql->bindValue("$k",$v);
				$log=str_replace("$k",$v,$log);
				$log=str_replace(",",";",$log);
			}
			if(isset($_COOKIE['loghash']))$logs=$_COOKIE['loghash'];else$logs='Not get';
			$this->log(DEL,PHP_EOL.date('Y-m-d H:i:s').",".$_SERVER['REMOTE_ADDR'].','.$logs.','.$this->used.','.$this->ver.','.$this->os.','.$_SERVER['REQUEST_URI'].','.str_replace(DB.N,'',$log));
			$this->clean();
			$sql->execute();
			return $sql->rowCount() ? true : $return;
		}else return $return;
	}
	public function exec($sql=false,$select=false,$type=PDO::FETCH_NUM)
	{
		if($sql){
			if($select){
				$exec=$this->prepare($sql);
				$exec->execute();
				$this->clean();
				return $exec->fetchAll($type);
			}else{
				//more
			}			
		}
	}
	public function browser($br='used',$os='os',$ver='ver')
	{
		$this->used=$br;
		$this->os=$os;
		$this->ver=$ver;
		return $this;
	}
	public function log($log=LOG,$data=false,$type="a+")
	{
		if($log&&$data){
			if(file_exists($log)){
				$file=fopen($log,$type) or die("Unable to open file!"); 
				fwrite($file,$data);
				fclose($file);
				chmod($log,0777);
			}else{
				if(!is_dir(APP.'log/'.date('d-m-Y'))){
					mkdir(APP.'log/'.date('d-m-Y'), 0777);
					chmod(APP.'log/'.date('d-m-Y'), 0777);
				}
				$file=fopen($log,$type) or die("Unable to open file!"); 
				fwrite($file,$data);
				fclose($file);
				chmod($log,0777);
			}
			return $this;
		}
	}
	public function clear($file=SEO)
	{
		if(file_exists($file)){
			unlink($file);
			return $this;
		}
	}
	private function redirect($db=false)
	{
		$controller=new error();
		if(empty($db)){
			$controller->index();
		}else{
			$this->get_act($controller,$db);
			die();
		}
		exit(); 
	}
	private function get_act($control=false,$act=false,$params=false)
	{
		if($control&&$act){
			if(is_array($params))
				return call_user_func_array(array($control,$act),$params);
			else
				return call_user_func_array(array($control,$act),array($params));
		}else{
			$this->redirect();
		}
	}
}