<?php
class controller extends model
{
    private $ver='?ver=0.0.1';
    public $logged;
    public $manager;
    public $css=URL."public/css/";
    public $js=URL."public/js/";
	function __construct()
	{
        parent::__construct();      
        $this->view=new view();
    }
    public function header()
    {
        $this->getLang(CTL)->usercheck();
        $header=(object)$this->metaCache(RELOAD);
        $css=array();
        $js=array(); 
        $js_adm=$header->js['all']['admin'];
        $js_cli=$header->js['all']['client'];
        unset($header->js['all']['admin'],$header->js['all']['client']);
        foreach ($header->css['all'] as $all) {
            $css[]='<link rel="stylesheet" href="'.$this->css.$all.$this->ver.'">';
        } 
        foreach ($header->js['all'] as $all) {
            $js[]='<script type="text/javascript" src="'.$this->js.$all.$this->ver.'"></script>';
        }       
        if(strtolower(OPT)=='admin'){
            foreach ($header->css['admin'] as $admin) {
                $css[]='<link rel="stylesheet" href="'.$this->css.'admin'.S.$admin.$this->ver.'">';
            }
            array_unshift($css,'<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900">');
            $js[]='<script type="text/javascript" src="'.$this->js.$js_adm.$this->ver.'"></script>';
            foreach ($header->js['admin'] as $admin) {
                list($name,$ext)=explode(".",$admin);
                if(strtolower(CTL)==strtolower($name)){
                    $js[]='<script type="text/javascript" src="'.$this->js.'admin'.S.$admin.$this->ver.'"></script>';
                }
            }
        }elseif(strtolower(OPT)=='api'){
            //more to api
        }else{
            foreach ($header->css['client'] as $client) {
                $css[]='<link rel="stylesheet" href="'.$this->css.'client'.S.$client.$this->ver.'">';
            }
            $js[]='<script type="text/javascript" src="'.$this->js.$js_cli.$this->ver.'"></script>';
            foreach ($header->js['client'] as $client) {
                list($name,$ext)=explode(".",$client);
                if(strtolower(CTL)==strtolower($name)){
                    $js[]='<script type="text/javascript" src="'.$this->js.'client'.S.$client.$this->ver.'"></script>';
                }
            }
        } 
        $header->css=$css;
        $header->js=$js;
        $this->view->header=(object) $header; 
        return $this;
    }   
    public function metaCache($load=false)
     {
        if(!file_exists(SEO)||(filemtime(SEO)<=NOW-3600)||empty(file_get_contents(SEO))||$load){
            $data=(object) array();
            $data->css=(object) array();
            $data->js=(object) array();
            $header=$this->model->table('system')->get("sys_key,sys_value,type")->where_or(array('sys_key'=>array('title','icon','template'),'type'=>'meta'))->order('sorted ASC')->multi()->select();
            foreach ($header as $k=>$v) {
                if($v->sys_key=='title'){
                    $data->title=$v->sys_value;
                }elseif($v->sys_key=='icon'){
                    $data->icon='<link rel="'.$v->sys_key.'" type="'.$v->type.'" href="'.IMG.$v->sys_value.'" />';
                }elseif($v->sys_key=='template'){
                    $data->layout=$v->sys_value;
                    if(empty($v->sys_value)||strtolower($v->sys_value)=='default'){
                        $css_folder=PUB.'css'.S;
                        $this->css=URL."public/css/";
                        $js_folder=PUB.'js'.S;
                        $this->js=URL."public/js/";
                    }else{
                        $css_folder=PUB.'template'.S.$v->sys_value.S.'css'.S;
                        $this->css=URL."public/template/".$v->sys_value."/css/";
                        $js_folder=PUB.'template'.S.$v->sys_value.S.'js'.S;
                        $this->js=URL."public/template/".$v->sys_value."/js/";
                    }
                }elseif($v->type=='meta'&&$v->sys_key!='title'){
                    $data->meta[]="<meta name='".$v->sys_key."' content='".$v->sys_value."'>";
                }
            }
            $data->css->all= $this->getFiles($css_folder);
            $data->css->admin=$this->getFiles($css_folder."admin".S);
            $data->css->client=$this->getFiles($css_folder."client".S);
            $data->js->all= $this->getFiles($js_folder,'js');
            $data->js->admin=$this->getFiles($js_folder."admin".S,'js');
            $data->js->client=$this->getFiles($js_folder."client".S,'js');
            $this->model->log(SEO,json_encode($data),"w");
            return json_decode(file_get_contents(SEO),true);
        }
        else{
            return json_decode(file_get_contents(SEO),true);
        }
    }
    public function getFiles($folder=PUB.'css'.S,$type='css')
    {
        $data=array();
        $files=array_diff(scandir($folder), array('.', '..','010-error.css'));
        foreach ($files as $k => $v) {
            if(preg_match("/\.".$type."/",$v)){
                list($name,$ext)=explode(".".$type,$v);
                list($null,$ext)=explode($name.".",$v);
                $check=explode("-",$name);
                if($ext==$type){
                    if($type=='js'&&strtolower(end($check))=='admin'){
                        $data['admin']=$v;
                    }elseif($type=='js'&&strtolower(end($check))=='client'){
                        $data['client']=$v;
                    }else{
                        $data[]=$v;
                    }
                }
            }
        }
        return $data;
    } 
    public function lang($transFile,$error=false)
    { 
        if(isset($_COOKIE['lg']))$language=$_COOKIE['lg'];else$language='en';
        include LANG.$language.'/'.$transFile.'.php'; 
        if(!$error){
            $this->session();
        }
        return ($lang);       
    }
    public function getLang($name=false)
    {
        if(isset($_COOKIE['lg']))$language=$_COOKIE['lg'];else$language='en';
        $lg=$this->lang('system');        
        if(file_exists(LANG.$language.'/'.$name.'.php'))$lg=array_merge($lg,$this->lang($name));
        $this->lg=$this->view->lg=(object) $lg;
        return $this;
    }
    public function render($name=false,$layout=false)
    {
        return $this->view->render($name,$layout);
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
                        $modun->logged=$this->logged;
                        $modun->manager=$this->manager;
                        return $modun;
                    }
                }
        }else{
            var_dump('Not found controller');exit();
        }
    } 
    public function session($new=false)
    {
        if(!isset($_COOKIE['loghash'])||empty($_COOKIE['loghash'])||$new){
            $hashId=preg_replace('/[^a-zA-Z0-9]/','-', base64_encode(openssl_random_pseudo_bytes(9)));
            $loghash=substr($hashId,0,6).".".NOW.".".substr($hashId,-6);
            $check=array(
                "idhash"=>$hashId,
                "host"=>$_SERVER['REMOTE_ADDR'],
                "lastactivity"=>$_SERVER['REQUEST_URI'],
                "useragent"=>$_SERVER['HTTP_USER_AGENT'],
                "apiaccesstoken"=>preg_replace('/[^a-zA-Z0-9]/','', base64_encode(openssl_random_pseudo_bytes(24))),
                "visittime"=>date('Y-m-d H:i:s')
            );
            $this->model->table('session')->where(array("host"=>$_SERVER['REMOTE_ADDR'],"useragent"=>$_SERVER['HTTP_USER_AGENT']))->delete();
            $this->model->table('session')->info($check)->insert();            
            $this->loghash($loghash);   
        }else{
            if(preg_match('/[^.]+\.[^.]+\.[^.]+\.[^.]+$/',$_COOKIE['loghash'])){
                list($hash,$time,$hid,$userid)=explode(".",$_COOKIE['loghash']);
                $hashId=$hash.$hid;
                if(NOW-$time<=900){
                    if(NOW-$time<180){
                        if(method_exists('model','table')){
                            $lastactivity=$this->model->table('session')->get('lastactivity')->where(array("host"=>$_SERVER['REMOTE_ADDR'],"idhash"=>$hashId,"userid"=>$userid))->select();
                            if($lastactivity){                            
                                if($_SERVER['REQUEST_URI']!=$lastactivity->lastactivity){
                                    $check=array(
                                        "lastactivity"=>$_SERVER['REQUEST_URI'],
                                        "useragent"=>$_SERVER['HTTP_USER_AGENT'],
                                    );
                                    $loghash=$hash.".".NOW.".".$hid.".".$userid;
                                    $this->model->table('session')->condition($check)->where(array("host"=>$_SERVER['REMOTE_ADDR'],"idhash"=>$hashId,"userid"=>$userid))->update();
                                    $this->loghash($loghash);
                                }
                            }
                        }
                    }else{                        
                        $check=array(
                            "lastactivity"=>$_SERVER['REQUEST_URI'],
                            "useragent"=>$_SERVER['HTTP_USER_AGENT'],
                        );
                        $loghash=$hash.".".NOW.".".$hid.".".$userid;
                        $this->model->table('session')->condition($check)->where(array("host"=>$_SERVER['REMOTE_ADDR'],"idhash"=>$hashId,"userid"=>$userid))->update();
                        $this->loghash($loghash);
                    }
                }elseif(NOW-$time>900){
                    $this->signOut();
                }
            }elseif(preg_match('/[^.]+\.[^.]+\.[^.]+$/',$_COOKIE['loghash'])){
                list($hash,$time,$hid)=explode(".",$_COOKIE['loghash']);
                if(NOW-$time>=300){
                    $hashId=$hash.$hid;
                    $check=array(
                        "idhash"=>$hashId,
                        "lastactivity"=>$_SERVER['REQUEST_URI'],
                        "apiaccesstoken"=>preg_replace('/[^a-zA-Z0-9]/','', base64_encode(openssl_random_pseudo_bytes(24)))
                    );
                    $loghash=$hash.".".NOW.".".$hid;
                    $this->model->table('session')->condition($check)->where(array("host"=>$_SERVER['REMOTE_ADDR'],"useragent"=>$_SERVER['HTTP_USER_AGENT']))->update();
                    $this->loghash($loghash);
                }
                unset($_SESSION['logid'],$_SESSION['auth'],$_SESSION['role'],$_SESSION['manager'],$_SESSION['managerlevel']);
            }else{
                unset($_SESSION['logid'],$_SESSION['auth'],$_SESSION['role'],$_SESSION['manager'],$_SESSION['managerlevel']);
                $this->session(1);
            }
        }
    }
    public function loghash($loghash=false){
        if($loghash){
            setcookie("loghash",$loghash,NOW+7200, '/',$_SERVER['SERVER_NAME'], false);
        }
    }
    public function cookie($key=false,$val=false){
        if($val&&$val!='del'){
            setcookie($key,$val,NOW+7200, '/',$_SERVER['SERVER_NAME'], false);
        }else{
            if($val=='del'){
                setcookie($key,'',NOW-3600, '/',$_SERVER['SERVER_NAME'], false);
            }else return $_COOKIE[$key];
        }
    }
    public function signOut()
    {
        session_destroy();
        setcookie("loghash","", NOW-3600,'/',$_SERVER['SERVER_NAME'], false);
        $this->logged=$this->view->logged=false;
        $this->manager=$this->view->manager=false;
        $logout=$this->model->table('session')->get(array("userid","lastactivity","logintime"))->where(array("host"=>$_SERVER['REMOTE_ADDR'],"useragent"=>$_SERVER['HTTP_USER_AGENT']))->select();
        $usergot=$this->model->table('user')->get("visited")->where("id",$logout->userid)->select();
        $updata=array("lastactivity"=>$logout->lastactivity,"visited"=>$usergot->visited+(NOW-strtotime($logout->logintime)),"lastvisit"=>date('Y-m-d H:i:s'));
        $this->model->table('session')->where(array("host"=>$_SERVER['REMOTE_ADDR'],"useragent"=>$_SERVER['HTTP_USER_AGENT']))->delete();
        $this->model->table('user')->condition($updata)->where(array("id"=>$logout->userid))->update();
        header('location: '.URL);exit();
    }
    public function notify($note=false,$admin=false)
    {
        if($note){
            setcookie("notify",$note,false,'/',$_SERVER['SERVER_NAME'], false);
            return true;
        }
    }
    public function usercheck()
    {
        if(isset($_SESSION['logid'])&&!empty($_SESSION['logid'])){
            $this->logged=$this->view->logged=true;
        }else $this->logged=$this->view->logged=false;
        if(isset($_SESSION['manager'])&&intval($_SESSION['manager'])==1){
            $this->manager=$this->view->manager=true;
        }else $this->manager=$this->view->manager=false;
        /*if(isset($_SESSION['guide'])&&$_SESSION['guide']){
            $this->guide=$this->view->guide=true;
        }else $this->guide=$this->view->guide=false;*/
        return $this;
    }    
    public function api($json=false)
    {
        echo json_encode($json);exit;
    }
    public function send($to='vietstar.nt@hotmail.com',$toname='Dear To!',$subject='Email subject',$msg='messenger here',$from='vietstar.nt@gmail.com',$name='no-reply',$pass='P@ssw0rd1982',$smtp='smtp.gmail.com',$port='587',$secur='tls')
    {
        require_once 'swift_required.php';
        $transport = Swift_SmtpTransport::newInstance($smtp,$port,$secur)
                ->setUsername($from)
                ->setPassword($pass);
        $mailer=Swift_Mailer::newInstance($transport);
        $message=Swift_Message::newInstance()
            ->setSubject($subject)
            ->setFrom(array($from => $name))
            ->setTo(array($to => $toname))
            ->setBody(
                '<html>' . 
                ' <head></head>' . 
                ' <body>' . 
                ' <p>Reported Error: 123 </p>' . 
                '  <p>Time: on time </p>' . 
                '  <p>User: tester </p>' . 
                ' </body>' . 
                '</html>', 'text/html' )            
            ->setCharset('UTF-8');
        try { 
            return $mailer->send($message);
        } catch (Exception $e) {
            var_dump($e->getMessage(), $e->getTraceAsString()); 
        }
    }   
    public function payCard($email,$token,$amount,$description)
    {
        require_once 'stripe-php/init.php';
        \Stripe\Stripe::setApiKey('sk_test_MJfazu2B4GYHHtZGY1r94G3p');

        $customer = \Stripe\Customer::create(array(
          "email" => $email,
          "source" => $token
        ));
        // Charge Customer
        $charge = \Stripe\Charge::create(array(
          "amount" => $amount,
          "currency" => "usd",
          "description" => $description,
          "customer" => $customer->id
        ));
    } 
}