<?php
class view
{
	protected $items=array();
    protected $loaded=false;
	public function render($name,$layout=false)
	{	
		if(!isset($this->items['title']))$this->items['title']=$name;
		foreach ($this->items as $key=>$value)$$key=$value;
        $template=strtolower($this->header->layout);
        if(strtolower(OPT)=='client'&&!$this->loaded){
            if(empty($template)||$template=='default'){
                if($layout){
                    echo $this->notify();
                    require CLI_VIEW.$name.'.php';
                } else {    
                    require CLI_VIEW.'header.php';
                    $this->items=array();
    				echo $this->notify();
    				require CLI_VIEW.$name.'.php';
    				require CLI_VIEW.'footer.php';
    			}
            } else{
                if($layout){
                    echo $this->notify();
                    require TEMP.$template.S.'client'.S.$name.'.php';
                } else {    
                    require TEMP.$template.S.'client'.S.'header.php';
                    $this->items=array();
                    echo $this->notify();
                    require TEMP.$template.S.'client'.S.$name.'.php';
                    require TEMP.$template.S.'client'.S.'footer.php';
                }
            } 
		}elseif(strtolower(OPT)=='admin'&&!$this->loaded){
            if(empty($template)||$template=='default'){
    			if($layout){
    				echo $this->notify();
    				require ADM_VIEW.$name.'.php';
    			} else {	
    				require ADM_VIEW.'header.php';
                    $this->items=array();
    				echo $this->notify();
    				require ADM_VIEW.$name.'.php';
    				require ADM_VIEW.'footer.php';
    			}
            }else{
                if($layout){
                    echo $this->notify();
                    require TEMP.$template.S.'admin'.S.$name.'.php';
                } else {    
                    require TEMP.$template.S.'admin'.S.'header.php';
                    $this->items=array();
                    echo $this->notify();
                    require TEMP.$template.S.'admin'.S.$name.'.php';
                    require TEMP.$template.S.'admin'.S.'footer.php';
                }
            }
		}	
		$this->loaded=true;exit;	
	}	
	public function loaded()
	{
		$this->loaded=false;
	}
	public function __set($key,$value)
	{
		$this->set($key,$value);
	}
	public function __get($value)
	{
		return $this->get($value);
	}
	public function set($key,$value)
	{
		$this->items[$key]=$value;
	}
	public function get($value)
	{
		return $this->items[$value];
	}
	public function notify()
	{
		if(isset($_COOKIE['notify'])&&!empty($_COOKIE['notify'])){
            if(strtolower(OPT)=='admin')
                $notify='<section class="notify container"><div class="alert alert-danger notify" role="alert" style="display:block">'.$_COOKIE['notify'].'</div></section>';
            else
                $notify='<section class="notify container"><div class="alert alert-danger notify" role="alert" style="display:block">'.$_COOKIE['notify'].'</div></section>';
                setcookie("notify","",NOW-3600,'/',$_SERVER['SERVER_NAME'], false);
                return $notify;
        }else $notify='';
        return $notify;
	}
	public function __call($option=false,$method=false)
    {
        if($option){
                if($option!='modun'&&strtolower(OPT)=='client'){
                    if(class_exists($option)){
                        $call=new $option;
                        define('CTL'.N.'call',$option); 
                        $call->header();
                        $act=current($method);
                        $params=$method;
                        array_shift($params);   
                        array_values($params);
                        if(method_exists($call,$act)){
                            define('ACT'.N.'call',$act);
                            return call_user_func_array(array($call,$act),$params);
                        }else{
                            var_dump('Not found action');exit();
                        }
                    }else{
                        var_dump('Not found controller');exit();
                    }
                }elseif($option!='modun'&&strtolower(OPT)=='admin'){
                    $call_ctl=ADM_PREFIX.N.$option;
                    if(class_exists($call_ctl)){
                        $call=new $call_ctl;
                        define('CTL'.N.'call',$call_ctl); 
                        $call->header();
                        $act=current($method);
                        $params=$method;
                        array_shift($params);   
                        array_values($params);
                        if(method_exists($call_ctl,$act)){
                            define('ACT'.N.'call',$act);
                            return call_user_func_array(array($call,$act),$params);
                        }else{
                            var_dump('Not found action');exit();
                        }
                    }else{
                        var_dump('Not found controller');exit();
                    }
                }elseif($option!='modun'&&strtolower(OPT)=='api'){
                    $call_ctl=API_PREFIX.N.$option;
                    if(class_exists($call_ctl)){
                        $call=new $call_ctl;
                        define('CTL'.N.'call',$call_ctl); 
                        $call->header();
                        $act=current($method);
                        $params=$method;
                        array_shift($params);   
                        array_values($params);
                        if(method_exists($call_ctl,$act)){
                            define('ACT'.N.'call',$act);
                            return call_user_func_array(array($call,$act),$params);
                        }else{
                            var_dump('Not found action');exit();
                        }
                    }else{
                        var_dump('Not found controller');exit();
                    }
                }else{
                    $ctl=current($method);
                    $call_ctl=MOD_PREFIX.N.$ctl;
                    if(class_exists($call_ctl)){
                        $modun=new $call_ctl;
                        if(isset($this->items['logged']))$modun->logged=$this->items['logged'];
                        if(isset($this->items['manager']))$modun->manager=$this->items['manager'];
                        if(isset($this->items['guide']))$modun->guide=$this->items['guide'];
                        return $modun;
                    }
                }
        }else{
            var_dump('Not found controller');exit();
        }
    }
}