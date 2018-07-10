<?php
class adm_user extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='User Manage';
	}
	public function info($id=false)
	{
		$this->view->title='User profile';
		if(isset($_POST['acc']['id'])&&ctype_digit($_POST['acc']['id'])){
			$info=$_POST['acc'];
			$id=$info['id'];
			$salt=$this->modun("index")->user_salt();
			$update=array(
				'email'=>filter_var($info['email'],FILTER_SANITIZE_EMAIL),
				'fullname'=>htmlspecialchars($info['fullname']),
				'role'=>$info['role'],
				'id_no'=>$info['id_no'],
				'gender'=>$info['gender'],
				'birthday'=>$info['birthday'],
				'phone'=>$info['phone'],
				'mobile'=>$info['mobile'],
				'address'=>$info['address']			
			);
			if(isset($info['password'])&&$info['password']){
				$update['password']=md5(md5($info['password']).$salt);
				$update['salt']=$salt;
				$update['userId']=$info['password'];
			}
			if(isset($info['gender'])&&$info['gender']){
				$update['gender']=$info['gender'];
			}
			$this->model->table('user')->condition($update)->where(array("id"=>$id))->update();
			if(isset($_POST['exp'])){
				$this->model->table('experience')->condition(array('ctl'=>2))->where(array("user_id"=>$id))->update();
				foreach ($_POST['exp'] as $exp) {
					if(!empty($exp['position'])&&!empty($exp['company'])){
						$exp['user_id']=$id;
						$exp['created']=date('Y-m-d H:i:s');
						$this->model->table('experience')->info($exp)->insert();
					}
				}
			}
			if(isset($_POST['skill'])){	
				$this->model->table('skills')->condition(array('ctl'=>2))->where(array("user_id"=>$id))->update();			
				foreach ($_POST['skill'] as $skill) {
					if(!empty($skill['skill'])){
						$skill['user_id']=$id;
						$skill['created']=date('Y-m-d H:i:s');
						$this->model->table('skills')->info($skill)->insert();
					}
				}
			}
			if(isset($_POST['general'])&&!empty($_POST['general'])){			
				$data=array(
					'user_id'=>$id,
					'general'=>$_POST['general'],
					'created'=>date('Y-m-d H:i:s')
				);
				if(!$this->model->table('general')->condition($data)->where(array("user_id"=>$id))->update()){
					$this->model->table('general')->info($data)->insert();
				}
				
			}
			unset($_POST);
			$this->info($id);
		}elseif($id){
			$user=$this->model->table('user as`u` LEFT JOIN '.DB.N.'role as `r` ON `r`.id=`u`.role')->get('`u`.*,`r`.role`role_name`')->where(array("`u`.id"=>$id))->ctl('u')->select();
			if(!empty($user)){
				unset($user->salt,$user->password,$user->ctl);
				if(!$user->avatar)$user->avatar='no_photo.svg';
				$hours=floor($user->visited / 3600);
				$mins=floor($user->visited / 60 % 60);
				/*$secs=floor($user->visited % 60);*/
				$user->visited=$hours."h ".$mins."'";
				$this->view->notes=$this->model->table('note as `n` LEFT JOIN '.DB.N.'note_type as `t` ON `t`.id=`n`.type')->get('`n`.notes,`n`.created,`n`.modified,`t`.name`type`')->where(array('`n`.user_id'=>$id))->ctl('n')->order(array('`n`.modified'=>'DESC'))->limit(10)->multi()->select();
				$this->view->user=$user;
				$this->view->role=$this->model->table('role')->get(array('id','role'))->multi()->select();
				$this->view->experience=$this->model->table('experience')->get('*')->where(array('user_id'=>$id))->order(array('date_from'=>'DESC'))->multi()->select();
				$this->view->skills=$this->model->table('skills')->get('*')->where(array('user_id'=>$id))->multi()->select();
				$this->view->general=$this->model->table('general')->get('general')->where(array('user_id'=>$id))->select();
			}else{header('location: '.URL.'admin/'.CTL);exit();}
		}else{header('location: '.URL.'admin/'.CTL);exit();}
	}
	public function getUser($layout=false)
	{
		if($_POST){
			$datas=array();
			$option['page']=$_POST['start'];
			$option['block']=$_POST['length'];
			$option['job']=3;
			$option['dir']="DESC";
			$option['order']="ctl ASC,id";
			$option['search']='';
			if(isset($_POST['order'][0])){
				$option['dir']=$_POST['order'][0]['dir'];
				if($_POST['order'][0]['column']==0)$option['order']='fullname';elseif($_POST['order'][0]['column']==1)$option['order']='id_no';elseif($_POST['order'][0]['column']==2)$option['order']='birthday';elseif($_POST['order'][0]['column']==3)$option['order']='phone';elseif($_POST['order'][0]['column']==4)$option['order']='visited';
			}
			if(isset($_POST['search']['value'])&&$_POST['search']['value']){
				$option['search']=' AND (fullname LIKE \'%'.$_POST['search']['value'].'%\' OR email LIKE \'%'.$_POST['search']['value'].'%\' OR avatar LIKE \'%'.$_POST['search']['value'].'%\' OR birthday LIKE \'%'.$_POST['search']['value'].'%\' OR id_no LIKE \'%'.$_POST['search']['value'].'%\' OR phone LIKE \'%'.$_POST['search']['value'].'%\' OR address LIKE \'%'.$_POST['search']['value'].'%\' OR created LIKE \'%'.$_POST['search']['value'].'%\' OR lastvisit LIKE \'%'.$_POST['search']['value'].'%\' OR gender LIKE \'%'.$_POST['search']['value'].'%\')';
			}
			$results=$this->model->table('user')->get(array('id','fullname','email','IF(avatar IS NULL,"no_photo.svg",avatar)`avatar`','IF(birthday IS NULL,"-",DATE_FORMAT(birthday,"%b,%d %Y"))`birthday`','id_no','phone','address','gender','DATE_FORMAT(created,"%b,%d %Y %hh%i\'")`created`','IF(lastvisit IS NULL,"-",DATE_FORMAT(lastvisit,"%b,%d %Y %hh%i\'"))`lastvisit`','visited','ctl'))->where("role >".$option['job'].$option['search'])->order($option['order']." ".$option['dir'])->multi()->limit($option['page'].",".$option['block'])->select();
			$total=$this->model->table('user')->get('count(*)`total`')->where("role > ".$option['job'].$option['search'])->limit('not')->select();
			if($layout=='thefirst'){
				foreach ($results as $account) {
					if($account->visited){
						$hours=floor($account->visited / 3600);
						$mins=floor($account->visited / 60 % 60);
						/*$secs=floor($account->visited % 60);*/
						$account->visited=$hours."h ".$mins."'";
					}
					$data=array(				
						"fullname"=>"<div class='checkbox checkbox-styled'><label><input type='checkbox' value='".$account->id."''><span></span></label></div><a href='".URL.'admin/user/info/'.$account->id."' class='acc-info'><strong>".$account->fullname."</strong><br><small>".$account->email."</samll></a>",
						"id_no"=>"<strong>".$account->id_no."</strong><br><small>Gender: <i class='fa fa-".$account->gender."'></i></small>",	
						"birth"=>"<strong>".$account->birthday."</strong><br><small>".$account->created."</small>",		
						"phone"=>"<strong>".$account->phone."</strong><br><small>".$account->address."</small>",
						"datetime"=>"<strong>".$account->visited."</strong><br><small>".$account->lastvisit."</small>",
						"ctl"=>$account->ctl
					);
					$datas[]=$data;
				}
			}else{
				foreach ($results as $account) {
					if($account->visited){
						$hours=floor($account->visited / 3600);
						$mins=floor($account->visited / 60 % 60);
						/*$secs=floor($account->visited % 60);*/
						$account->visited=$hours."h ".$mins."'";
					}
					$data=array(				
						"fullname"=>"<a href='".URL.'admin/user/info/'.$account->id."'><strong>".$account->fullname."</strong><br><small>".$account->email."</samll></a>",
						"id_no"=>"<strong>".$account->id_no."</strong><br><small>Gender: <i class='fa fa-".$account->gender."'></i></small>",	
						"birth"=>"<strong>".$account->birthday."</strong><br><small>".$account->created."</small>",		
						"phone"=>"<strong>".$account->phone."</strong><br><small>".$account->address."</small>",
						"datetime"=>"<strong>".$account->visited."</strong><br><small>".$account->lastvisit."</small>",
						"action"=>"<input type='checkbox' value='".$account->id."''>",
						"ctl"=>$account->ctl
					);
					$datas[]=$data;
				}
			}
			$all['draw']=$_POST['draw'];
			$all['recordsTotal']=$total->total;
			if(isset($_POST['search']['value'])&&$_POST['search']['value']){
				$all['recordsFiltered']=count($results);
			}else{
				$all['recordsFiltered']=$total->total;
			}
			$all['data']=$datas;
			$this->api($all);
		}
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('user')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('user')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('user')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}	
	public function addNote()
	{
		if(isset($_POST['note'])){
			$data=array(
				'user_id'=>$_SESSION['logid'],
				'notes'=>$_POST['note'],
				'type'=>1,
				'created'=>date('Y-m-d H:i:s'),
				'modified'=>date('Y-m-d H:i:s')
			);
			$this->api($this->model->table('note')->info($data)->insert());
		}
	}
}