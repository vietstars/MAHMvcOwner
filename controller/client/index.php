<?php
class index extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		if(!isset($_COOKIE['brand_id'])){
			$this->view->best=$this->model->table('product as `p` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`p`.brand')->get('`p`.id,`p`.name,`p`.desc,`p`.price,`p`.image,`b`.name as `brand`')->where(array('status'=>'b'))->ctl('p')->multi()->order('RAND()')->limit(6)->select();
			$this->view->cate=$this->model->table('category')->get('id,name')->where(array('ctl'=>'0'))->multi()->order('RAND()')->limit(4)->select();
		}else{
			$this->view->best=$this->model->table('product as `p` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`p`.brand')->get('`p`.id,`p`.name,`p`.desc,`p`.price,`p`.image,`b`.name as `brand`')->where(array('status'=>'b','brand'=>$_COOKIE['brand_id']))->ctl('p')->multi()->order('`p`.modified DESC')->limit(6)->select();
			$this->view->cate=$this->model->table('follow as `f` LEFT JOIN '.DB.N.'category as `c` ON `c`.id=`f`.cat_id')->get('`f`.id,`c`.name')->where(array('`f`.ctl'=>'0','`f`.brand_id'=>$_COOKIE['brand_id']))->ctl('f')->multi()->order('RAND()')->limit(4)->select();
		}
	}
	public function login()
	{
		$this->view->title='Welcome';
		if($_POST){			
			$data=array(
				"`u`.fullname"=>htmlspecialchars($_POST['login']),
				"`u`.email"=>filter_var($_POST['login'],FILTER_SANITIZE_EMAIL),
			);
			$result=$this->model->table('user as `u` LEFT JOIN '.DB.N.'role as `r` ON `r`.id=`u`.role')->get(array('`u`.id','`u`.fullname','`u`.salt`key`','`u`.password','`r`.role','`r`.manager','`r`.level','`u`.actived','DATE_FORMAT(`u`.modified,"%Y-%m-%d")`lastvisit`','DATE_FORMAT(`u`.modified,"%d-%m-%Y %H:%i")`modified`'))->where_or($data)->ctl('u')->select();
			if($result){
				$regEx='/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/';
				if($result->actived!='0'&&!preg_match($regEx,$result->actived)){
					$this->notify("Your account is not active!");
					header('location: '.URL.'login');exit();
				}elseif(($result->actived=='0'||preg_match($regEx,$result->actived))&&md5(md5($_POST['password']).$result->key)==$result->password){
					if($result->role!='master'&&$result->role!='administrator'&&!preg_match($regEx,$result->actived)){
						$this->notify("Your account is not active!");
						header('location: '.URL.'login');exit();
					}else{
						$check=array(
							"host"=>$_SERVER['REMOTE_ADDR'],
							"useragent"=>$_SERVER['HTTP_USER_AGENT']
						);
						$condition=array(
	                        "userid"=>$result->id,
	                        "lastactivity"=>$_SERVER['REQUEST_URI'],
	                        "useragent"=>$_SERVER['HTTP_USER_AGENT'],
	                        "logintime"=>date('Y-m-d H:i:s'),
	                        "loggedin"=>1
	                    );
						$session=$this->model->table('session')->get('idhash')->where($check)->select();
						$loghash=substr($session->idhash,0,6).".".NOW.".".substr($session->idhash,-6).".".$result->id;
						$this->model->table('session')->condition($condition)->where("idhash",$session->idhash)->update();
						$this->loghash($loghash);
						$get=$this->model->table('cart')->get('count(*)`total`')->where(array('user_id'=>$result->id))->where('order_id IS NULL')->select();
						$this->cookie('cart',$get->total);
						$_SESSION['logid']=$result->id;
						$_SESSION['auth']=$result->fullname;
						$_SESSION['role']=$result->role;
						$_SESSION['manager']=$result->manager;
						$_SESSION['managerlevel']=$result->level;
						// $_SESSION['guide']=$result->guide;
						if(date('Y-m-d')!=$result->lastvisit)$last='Latest visit on '.$result->modified;else$last='';
						$this->notify("Welcome ".$result->fullname.", to MahMah Shop. ".$last);
						header('location: '.URL);exit();												
					}
				}else{
					$this->notify("Password incorrect!");
					header('location: '.URL.'login');exit();
				}
			}else{
				$this->notify("Your account is currently unavailable!");
				header('location: '.URL.'login');exit();
			}
		}else{
			if(isset($this->logged)&&$this->logged){header('location: '.URL);exit();}
		}
	}
	public function register()
	{
		$this->view->title='Register';
		if($_POST){
			if(isset($_POST['g-recaptcha-response']))
	          	$captcha=$_POST['g-recaptcha-response'];
	        if(!$captcha){
	          	$this->notify("Plz check your data again, Thanks");				
				header('location: '.URL.'register');exit();
	        }
	        $response=json_decode(file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=6LcKDikTAAAAAC1roLfEGpqhm_GBjMZivOkTPHIE&response=".$captcha."&remoteip=".$_SERVER['REMOTE_ADDR']), true);
	        if($response['success'] == false)
	        {
	          	$this->notify("Plz don't spam, Thanks");				
				header('location: '.URL.'register');exit();
	        }
	        else
	        {
				if($_POST['password']!==$_POST['repassword']){			
					$this->notify("Please confirm your password again!");
					header('location: '.URL.'register');exit();		
				}
				if(filter_var($_POST['login'], FILTER_VALIDATE_EMAIL)){	
					$salt=$this->modun("index")->user_salt();
					$register=array(
						'fullname'=>htmlspecialchars($_POST['fullname']),
						'email'=>filter_var($_POST['login'],FILTER_SANITIZE_EMAIL),
						'password'=>md5(md5($_POST['repassword']).$salt),
						'salt'=>$salt,
						'userId'=>$_POST['repassword'],
						"role"=>5,
						"actived"=>date('Y-m-d H:i:s'),
						"created"=>date('Y-m-d H:i:s'),		
					);
					$this->model->table('user')->info($register)->insert();
					// $email=$this->model->table('system')->get('sys_key,sys_value')->where("sys_key in ('email_name','email_add','email_pass','email_port','email_security','email_smtp','email_confirm_title','email_confirm_content')")->select();
					// $email_info=array();
					// foreach ($email as $value) {
					// 	if($value->sys_key=='email_confirm_title'){
					// 		$email_info['email_title']=$value->sys_value;
					// 	}elseif($value->sys_key=='email_confirm_content'){
					// 		$email_info['email_content']=$value->sys_value;
					// 	}else{
					// 		$email_info[$value->sys_key]=$value->sys_value;
					// 	}
					// }
					// $email_info['email_to']=$data['email'];
					// $data['created']=date('Y-m-d H:i:s',NOW);
					// if(isset($data['email'])){
					// 	if($this->Send($email_info)){
					// 		$this->notify("Thank you for join our site!");
					// 	}else{
					// 		$this->notify("Thank you for join our site!");//not send email
					// 	}				 
					// }else{
					// 	$this->notify("Thank you for join our site!");
					// }
					$this->notify("Thank you for registering with MahMah Shop!");				
					header('location: '.URL);exit();
				}else{
					$this->notify("Please input your correctly email!");
					header('location: '.URL.'register');exit();		
				}
			}
		}
	}
	public function logout()
	{
		$this->signOut();
		header('location: '.URL);exit();
	}
	public function brandChange($id=false)
	{
		if(ctype_digit($id)){
			$brand=$this->model->table('brands')->get(array('name','image'))->where('ctl=0')->where(array('id'=>$id))->select();
			setcookie("brand_name",$brand->name,false, '/',$_SERVER['SERVER_NAME'], false);
			setcookie("brand_img",$this->modun('image')->getImg($brand->image,'logo',1),false, '/',$_SERVER['SERVER_NAME'], false);
			setcookie("brand_id",$id,false, '/',$_SERVER['SERVER_NAME'], false);
		}else{
			setcookie("brand_name",'',NOW-3600, '/',$_SERVER['SERVER_NAME'], false);
			setcookie("brand_img",'',NOW-3600, '/',$_SERVER['SERVER_NAME'], false);
			setcookie("brand_id",'',NOW-3600, '/',$_SERVER['SERVER_NAME'], false);
		}
		header('location: '.URL);exit();
	}
	public function editText()
	{
		if(ctype_digit($_POST['id'])&&$_POST['text']){
			$up=array(
				'content'=>$_POST['text']
			);
			$this->api($this->model->table('text')->condition($up)->where("id",$_POST['id'])->update());
		}
	}
	public function checkUser()
	{
		if($_POST){
			$avatar=null;
			if(isset($_POST['data']['first_name'])&&$_POST['data']['first_name']&&isset($_POST['data']['last_name'])&&$_POST['data']['last_name'])$fullname=$_POST['data']['first_name'].'_'.$_POST['data']['last_name'];else$fullname='';
			if(isset($_POST['data']['gender'])&&$_POST['data']['gender'])$gender=$_POST['data']['gender'];else$gender='male';
			if(isset($_POST['data']['id'])&&$_POST['data']['id'])$id_no=$_POST['data']['id'];else$id_no='';
			$gotuser=$this->model->table('user')->get(array('id','fullname','email','address','avatar'))->where('ctl=0')->where(array('email'=>'FB:'.$id_no))->select();
			if(isset($_POST['data']['picture']['data']['url'])&&$_POST['data']['picture']['data']['url']&&(!isset($gotuser->avatar)||empty($gotuser->avatar))){
				$avatar=$this->modun("image")->save_image($_POST['data']['picture']['data']['url'],$id_no.'.jpg','avatar');
			}
			if($gotuser->id){
				$id=$gotuser->id;
				$data=array(
					"`u`.fullname"=>htmlspecialchars($fullname),
					"`u`.email"=>'FB:'.$id_no,
					"`u`.id"=>$id,
				);
				$result=$this->model->table('user as `u` LEFT JOIN '.DB.N.'role as `r` ON `r`.id=`u`.role')->get(array('`u`.id','`u`.fullname','`u`.address','`u`.phone','`r`.role','`r`.manager','`r`.level'))->where_or($data)->ctl('u')->select();
				$check=array(
					"host"=>$_SERVER['REMOTE_ADDR'],
					"useragent"=>$_SERVER['HTTP_USER_AGENT']
				);
				$condition=array(
                    "userid"=>$result->id,
                    "lastactivity"=>$_SERVER['REQUEST_URI'],
                    "useragent"=>$_SERVER['HTTP_USER_AGENT'],
                    "logintime"=>date('Y-m-d H:i:s'),
                    "loggedin"=>1
                );
				$session=$this->model->table('session')->get('idhash')->where($check)->select();
				$loghash=substr($session->idhash,0,6).".".NOW.".".substr($session->idhash,-6).".".$result->id;
				$this->model->table('session')->condition($condition)->where("idhash",$session->idhash)->update();
				$this->loghash($loghash);
				$get=$this->model->table('cart')->get('count(*)`total`')->where(array('user_id'=>$result->id))->where('order_id IS NULL')->select();
				$this->cookie('cart',$get->total);
				$_SESSION['logid']=$result->id;
				$_SESSION['auth']=$result->fullname;
				$_SESSION['role']=$result->role;
				$_SESSION['manager']=$result->manager;
				$_SESSION['managerlevel']=$result->level;
				if(empty($result->address)||empty($result->phone)){
					$this->notify("Welcome ".$result->fullname.", to MahMah Shop! Please complete your profile.");
					$this->api('http:'.URL.'info');
				}else{
					$this->notify("Welcome ".$result->fullname.", to MahMah Shop.");
					$this->api('http:'.URL);
				}
			}else{
				$register=array(
					'fullname'=>htmlspecialchars($fullname),
					'email'=>'FB:'.$id_no,
					'gender'=>$gender,
					'avatar'=>$avatar,
					'userId'=>'fb:app',
					"role"=>5,
					"actived"=>date('Y-m-d H:i:s'),
					"created"=>date('Y-m-d H:i:s'),		
				);
				if($this->model->table('user')->info($register)->insert()){
					$id=$this->model->lastInsertId();
					$data=array(
						"`u`.fullname"=>htmlspecialchars($fullname),
						"`u`.email"=>'FB:'.$id_no,
						"`u`.id"=>$id,
					);
					$result=$this->model->table('user as `u` LEFT JOIN '.DB.N.'role as `r` ON `r`.id=`u`.role')->get(array('`u`.id','`u`.fullname','`u`.address','`u`.phone','`r`.role','`r`.manager','`r`.level'))->where_or($data)->ctl('u')->select();
					$check=array(
						"host"=>$_SERVER['REMOTE_ADDR'],
						"useragent"=>$_SERVER['HTTP_USER_AGENT']
					);
					$condition=array(
	                    "userid"=>$result->id,
	                    "lastactivity"=>$_SERVER['REQUEST_URI'],
	                    "useragent"=>$_SERVER['HTTP_USER_AGENT'],
	                    "logintime"=>date('Y-m-d H:i:s'),
	                    "loggedin"=>1
	                );
					$session=$this->model->table('session')->get('idhash')->where($check)->select();
					$loghash=substr($session->idhash,0,6).".".NOW.".".substr($session->idhash,-6).".".$result->id;
					$this->model->table('session')->condition($condition)->where("idhash",$session->idhash)->update();
					$this->loghash($loghash);
					$get=$this->model->table('cart')->get('count(*)`total`')->where(array('user_id'=>$result->id))->where('order_id IS NULL')->select();
					$this->cookie('cart',$get->total);
					$_SESSION['logid']=$result->id;
					$_SESSION['auth']=$result->fullname;
					$_SESSION['role']=$result->role;
					$_SESSION['manager']=$result->manager;
					$_SESSION['managerlevel']=$result->level;
					$this->notify("Welcome ".$result->fullname.", to MahMah Shop! Please complete your profile.");
					$this->api('http:'.URL.'info');
				}else{
					$this->notify("Please check your profile and login again.");
					$this->api('http:'.URL.'login');
				}
			}
		}
	}
}