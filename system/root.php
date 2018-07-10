<?php
class root
{	
	private $browser;
	private $version;
	private $platform;
	function __construct()
	{
		$url=isset($_GET['url'])?$_GET['url']:LOAD;
		if(!preg_match("/\./",$_SERVER['REQUEST_URI'])){
			$this->getBrowser();
			if(isset($_COOKIE['loghash']))$log=$_COOKIE['loghash'];else$log='Not get';
			if(file_exists(LOG)){
				$file=fopen(LOG, "a+") or die("Unable to open file!"); 
				fwrite($file,PHP_EOL.date('Y-m-d H:i:s').",".$_SERVER['REMOTE_ADDR'].','.$log.','.$this->browser.','.$this->version.','.$this->platform.','.$url);
				fclose($file);
				chmod(LOG,0777);
			}else{
				if(!is_dir(APP.'log/'.date('d-m-Y'))){
					mkdir(APP.'log/'.date('d-m-Y'), 0777);
					chmod(APP.'log/'.date('d-m-Y'), 0777);
				}
				$file=fopen(LOG, "a+") or die("Unable to open file!"); 
				fwrite($file,PHP_EOL.date('Y-m-d H:i:s').",".$_SERVER['REMOTE_ADDR'].','.$log.','.$this->browser.','.$this->version.','.$this->platform.','.$url);
				fclose($file);
				chmod(LOG,0777);
			}
		}
		if(!file_exists(SYSTEM)||(filemtime(SYSTEM)<=DBL)||empty(file_get_contents(SYSTEM))){			
			try {
				$conn=new database(DB_HOST,DB_NAME,DB_USER,DB_PASS);
				sleep(DBT);
				$key=$conn->table('system')->get(array('sys_key','SHA2(concat("'.$_SERVER['SERVER_NAME'].'","_",IF(sys_value="forever","forever",UNIX_TIMESTAMP(sys_value))),512)`sha`','sys_value,"'.$_SERVER['SERVER_NAME'].'"`type`'))->where(array("type"=>"domain"))->select();
				if(substr($key->sha,pow(SHA,1/3)*6+1,log10(0.1)*round(pow(SHA,1/3)*6))==$key->sys_key){
			    	if(strtotime($key->sys_value)>=NOW||$key->sys_value=='forever'){
			    		if($key->sys_value!='forever'){
					    	$json=(object)array("key"=>$key->sys_key,"name"=>$key->type,'expiry'=>strtotime($key->sys_value));
					    }else{
					    	$json=(object)array("key"=>$key->sys_key,"name"=>$key->type,'expiry'=>$key->sys_value);
					    }
				    	$file=fopen(SYSTEM, "w") or die("Unable to open file!"); 
						fwrite($file,json_encode($json));
						fclose($file);
						chmod(SYSTEM,0777);
					    $conn = null;
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
			} catch(PDOException $e) {
	    		if(file_exists(SYSTEM))unlink(SYSTEM);
			    $this->redirect('false');
			    exit;
			}
		}
		$url=rtrim($url,S);
		$url=filter_var($url, FILTER_SANITIZE_URL);
		$url=explode(S,$url);
		$firstUrl=current($url);
		$sysFolder=array_diff(scandir(APP), array('.', '..'));
		if(in_array($firstUrl,$sysFolder)){
			$this->redirect();
		}
		if(strtolower(current($url))=='admin'&&isset($_SESSION['role'])&&isset($_SESSION['manager'])&&isset($_SESSION['managerlevel'])&&$_SESSION['manager']==1&&intval($_SESSION['managerlevel'])===1){
			define('OPT',current($url));
			array_shift($url);	
			array_values($url);
			if(empty($url))array_unshift($url,'index');
			if($url){
				$ctl=current($url);
				if(strtolower($ctl)!='error'){
					if(file_exists(ADM.$ctl.EXT)){
						define('CTL',$ctl);	
						/*$controller->view->ctl=$controller->ctl=$ctl;*/	
						$ctl=ADM_PREFIX.N.$ctl;
						if(class_exists($ctl)){
							$controller=new $ctl;
							$controller->model->browser($this->browser,$this->platform,$this->version);
							$controller->header();
							$act=next($url);
							if($act&&method_exists($controller,$act)){
								define('ACT',$act);
								/*$controller->view->act=$controller->act=$act;*/
								array_shift($url);
								array_shift($url);	
								array_values($url);
								$this->get_act($controller,$act,$url);
								$view=explode(ADM_PREFIX.N, $ctl);
								$viewCtl=end($view);
								if(file_exists(ADM_VIEW.$viewCtl.N.$act.EXT)){
									$controller->view->render($viewCtl.N.$act);
									$controller->view->loaded();
									exit;
								}elseif(file_exists(ADM_VIEW.$viewCtl.EXT)){
									$controller->view->render($viewCtl);
									$controller->view->loaded();
									exit;
								}elseif(file_exists(ADM_VIEW.LOAD.EXT)){
									$controller->view->render(LOAD);
									$controller->view->loaded();
									exit;
								}else $this->redirect();
							}elseif(method_exists($controller,LOAD)){
								define('ACT',LOAD);
								/*$controller->view->act=$controller->act=LOAD;*/
								array_shift($url);	
								array_values($url);
								$this->get_act($controller,LOAD,$url);
								$view=explode(ADM_PREFIX.N, $ctl);
								$viewCtl=end($view);
								if(file_exists(ADM_VIEW.$viewCtl.EXT)){
									$controller->view->render($viewCtl);
									$controller->view->loaded();
									exit;
								}elseif(file_exists(ADM_VIEW.LOAD.EXT)){
									$controller->view->render(LOAD);
									$controller->view->loaded();
									exit;
								}else $this->redirect();
							}else{
								$this->redirect();
							}
						}else{
							$this->redirect();
						}
					}else{				
						if(file_exists(ADM.LOAD.EXT)){
							define('CTL',LOAD);	
							$act=ADM_PREFIX.N.LOAD;
							if(class_exists($act)){
								$controller=new $act;
								$controller->model->browser($this->browser,$this->platform,$this->version);
								$controller->header();							
								if(method_exists($controller,$ctl)){
									define('ACT',$ctl);
									array_shift($url);	
									array_values($url);
									$this->get_act($controller,$ctl,$url);
									if(file_exists(ADM_VIEW.$ctl.EXT)){
										$controller->view->render($ctl);
										$controller->view->loaded();
										exit;
									}if(file_exists(ADM_VIEW.LOAD.EXT)){
										$controller->view->render(LOAD);
										$controller->view->loaded();
										exit;
									}else $this->redirect();							
								}elseif(method_exists($controller,$act)){
									define('ACT',$act);
									$this->get_act($controller,$act,$url);
									if(file_exists(ADM_VIEW.$act.EXT)){
										$controller->view->render($act);
										$controller->view->loaded();
										exit;
									}if(file_exists(ADM_VIEW.LOAD.EXT)){
										$controller->view->render(LOAD);
										$controller->view->loaded();
										exit;
									}else $this->redirect();
								}else{
									$this->redirect();
								}
							}else{
								$this->redirect();
							}
						}else{
							$this->redirect();
						}	
					}
				}else $this->redirect();	
			}else{
				$this->redirect(); 
			}
		}elseif(strtolower(current($url))=='api'){
			header("Content-type: application/json;charset=utf-8");
			define('OPT',current($url));
			array_shift($url);	
			array_values($url);
			if(empty($url))array_unshift($url,'index');
			if($url){
				$ctl=current($url);
				if(strtolower($ctl)!='error'){
					if(file_exists(API.$ctl.EXT)){
						$clt=API_PREFIX.N.$ctl;
						if(class_exists($ctl)){
							$controller=new $clt;
							$controller->model->browser($this->browser,$this->platform,$this->version);
							define('CTL',$ctl);	
							$controller->header();
							$act=next($url);
							if($act&&method_exists($controller,$act)){
								define('ACT',$act);
								array_shift($url);
								array_shift($url);	
								array_values($url);
								$this->get_act($controller,$act,$url);
							}elseif(method_exists($controller,LOAD)){
								define('ACT',LOAD);
								array_shift($url);	
								array_values($url);
								$this->get_act($controller,LOAD,$url);
							}else{
								$this->redirect();
							}
						}else{
							$this->redirect();
						}
					}else{				
						if(file_exists(API.LOAD.EXT)){
							$act=API_PREFIX.N.LOAD;
							if(class_exists($act)){
								$controller=new $act;
								$controller->model->browser($this->browser,$this->platform,$this->version);
								define('CTL',$act);	
								$controller->header();							
								if(method_exists($controller,$ctl)){
									define('ACT',$ctl);
									array_shift($url);	
									array_values($url);
									$this->get_act($controller,$ctl,$url);							
								}elseif(method_exists($controller,$act)){
									define('ACT',$act);
									$this->get_act($controller,$act,$url);
								}else{
									$this->redirect();
								}
							}else{
								$this->redirect();
							}
						}else{
							$this->redirect();
						}	
					}
				}else $this->redirect();	
			}else{
				$this->redirect(); 
			}
		}else{
			define('OPT','client');
			if(strtolower($url[0])=='modun')$url[0]=LOAD;
			if($url){
				$ctl=current($url);
				if(strtolower($ctl)!='error'){
					if(file_exists(CLI.$ctl.EXT)){
						if(class_exists($ctl)){
							$controller=new $ctl;
							$controller->model->browser($this->browser,$this->platform,$this->version);
							define('CTL',$ctl);	
							$controller->header();
							$act=next($url);
							if($act&&method_exists($controller,$act)){
								define('ACT',$act);
								array_shift($url);
								array_shift($url);	
								array_values($url);
								$this->get_act($controller,$act,$url);
								if(file_exists(CLI_VIEW.$ctl.N.$act.EXT)){
									$controller->view->render($ctl.N.$act);
									$controller->view->loaded();
									exit;
								}elseif(file_exists(CLI_VIEW.LOAD.EXT)){
									$controller->view->render(LOAD);
									$controller->view->loaded();
									exit;
								}else $this->redirect();
							}elseif(method_exists($controller,LOAD)){
								define('ACT',LOAD);
								array_shift($url);	
								array_values($url);
								$this->get_act($controller,LOAD,$url);
								if(file_exists(CLI_VIEW.$ctl.EXT)){
									$controller->view->render($ctl);
									$controller->view->loaded();
									exit;
								}elseif(file_exists(CLI_VIEW.LOAD.EXT)){
									$controller->view->render(LOAD);
									$controller->view->loaded();
									exit;
								}else $this->redirect();
							}else{
								$this->redirect();
							}
						}else{
							$this->redirect();
						}
					}else{				
						if(file_exists(CLI.LOAD.EXT)){
							$act=LOAD;
							if(class_exists($act)){
								$controller=new $act;
								$controller->model->browser($this->browser,$this->platform,$this->version);							
								define('CTL',$act);	
								$controller->header();								
								if(method_exists($controller,$ctl)){
									define('ACT',$ctl);
									array_shift($url);	
									array_values($url);
									$this->get_act($controller,$ctl,$url);
									if(file_exists(CLI_VIEW.$ctl.EXT)){
										$controller->view->render($ctl);
										$controller->view->loaded();
										exit;
									}if(file_exists(CLI_VIEW.LOAD.EXT)){
										$controller->view->render(LOAD);
										$controller->view->loaded();
										exit;
									}else $this->redirect();							
								}elseif(method_exists($controller,$act)){
									define('ACT',$act);
									$this->get_act($controller,$act,$url);
									if(file_exists(CLI_VIEW.$act.EXT)){
										$controller->view->render($act);
										$controller->view->loaded();
										exit;
									}if(file_exists(CLI_VIEW.LOAD.EXT)){
										$controller->view->render(LOAD);
										$controller->view->loaded();
										exit;
									}else $this->redirect();
								}else{
									$this->redirect();
								}
							}else{
								$this->redirect();
							}
						}else{
							$this->redirect();
						}	
					}
				}else $this->redirect();	
			}else{
				$this->redirect();
			}
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
	private function getBrowser() 
	{ 
	    $u_agent = $_SERVER['HTTP_USER_AGENT']; 
	    $bname = 'Unknown';
	    $platform = 'Unknown';
	    $version= "";
	    if(preg_match('/linux/i', $u_agent)){
	        $platform = 'linux';
	    }
	    elseif (preg_match('/macintosh|mac os x/i', $u_agent)) {
	        $platform = 'mac';
	    }
	    elseif (preg_match('/windows|win32/i', $u_agent)) {
	        $platform = 'windows';
	    }
	    if(preg_match('/MSIE/i',$u_agent) && !preg_match('/Opera/i',$u_agent)) 
	    { 
	        $bname = 'Internet Explorer'; 
	        $ub = "MSIE"; 
	    } 
	    elseif(preg_match('/Firefox/i',$u_agent)) 
	    { 
	        $bname = 'Mozilla Firefox'; 
	        $ub = "Firefox"; 
	    }
	    elseif(preg_match('/OPR/i',$u_agent)) 
	    { 
	        $bname = 'Opera'; 
	        $ub = "Opera"; 
	    } 
	    elseif(preg_match('/Chrome/i',$u_agent)) 
	    { 
	        $bname = 'Google Chrome'; 
	        $ub = "Chrome"; 
	    } 
	    elseif(preg_match('/Safari/i',$u_agent)) 
	    { 
	        $bname = 'Apple Safari'; 
	        $ub = "Safari"; 
	    } 
	    elseif(preg_match('/Netscape/i',$u_agent)) 
	    { 
	        $bname = 'Netscape'; 
	        $ub = "Netscape"; 
	    } 
	    $known = array('Version', $ub, 'other');
	    $pattern = '#(?<browser>' . join('|', $known) .
	    ')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
	    if (!preg_match_all($pattern, $u_agent, $matches)) {
	        // we have no matching number just continue
	    }
	    $i = count($matches['browser']);
	    if ($i != 1) {
	        if (strripos($u_agent,"Version") < strripos($u_agent,$ub)){
	            $version= $matches['version'][0];
	        }
	        else {
	            $version= $matches['version'][1];
	        }
	    }
	    else {
	        $version= $matches['version'][0];
	    }
	    if ($version==null || $version=="") {$version="?";}
		$this->browser=$ub;
		$this->version=$version;
		$this->platform=$platform;
		return $this;
/*	    return array(
	        'name'      => $bname,
	        'version'   => $version,
	        'platform'  => $platform,
	        'userAgent' => $u_agent,
	        'pattern'    => $pattern
	    );*/
	} 
}