<?php
class mod_index extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function admin_menu()
	{
		$get=$this->model->table('menu as `o`')->get('`o`.id,`o`.menu,`o`.controller,`o`.action,`o`.icon,`o`.parents,(SELECT count(*) FROM '.DB.N.'menu WHERE ctl=0 AND parents=`o`.id)`child`')->where('`o`.ctl=0 AND `o`.type=0')->order(array('`o`.sorted'=>'ASC'))->ctl("o")->multi()->select();
		$this->menu_left($get);
	}
	public function home_menu()
	{
		return $this->model->table('menu as `o`')->get('`o`.menu,`o`.controller,`o`.action,`o`.icon')->where('`o`.ctl=0 AND `o`.type=1')->order(array('`o`.sorted'=>'ASC'))->multi()->select();
	}
	public function brand_list()
	{
		return $this->model->table('brands')->get('`id`, `name`, `icon`')->where('ctl=0')->order(array('sorted'=>'ASC'))->multi()->limit('not')->select();
	}
	public function type_list()
	{
		return $this->model->table('type')->get('`id`, `name`')->where('ctl=0')->order(array('sorted'=>'ASC'))->multi()->limit('not')->select();
	}
	public function category_list()
	{
		if(isset($_COOKIE['brand_id'])&&$_COOKIE['brand_id']){

			return $this->model->table('follow as `f` INNER JOIN '.DB.N.'category as `c` ON `c`.id=`f`.cat_id AND `c`.main_cat=0')->get('`f`.cat_id`id`,`c`.name,`c`.icon,(select count(*) FROM '.DB.N.'category WHERE main_cat=`f`.cat_id)`subCat`')->where('`f`.ctl=0')->where(array('`f`.brand_id'=>$_COOKIE['brand_id']))->order(array('`c`.sorted'=>'ASC'))->ctl('f')->multi()->limit('not')->select();//,
		}else{

			return $this->model->table('category as `c`')->get('`c`.`id`, `c`.`name`, `c`.`icon`,(select count(*) FROM '.DB.N.'category WHERE main_cat=`c`.id)`subCat`')->where('`c`.ctl=0 AND `c`.main_cat=0')->order(array('`c`.sorted'=>'ASC'))->multi()->limit('not')->ctl('c')->select();
		}
	}
	public function sub_category($id=false,$main=false,$p="dropdown-menu-left")
	{
		$category=$this->model->table('category')->get('`id`,`name`,`icon`')->where(array('main_cat'=>$id))->order(array('sorted'=>'ASC'))->multi()->limit('not')->select();
		$dropdown='';
		foreach ($category as $cate) {
			$dropdown.='<li><a href="'.URL.'category/'.$cate->id.'"><i class="'.$cate->icon.'"></i> '.htmlspecialchars_decode($cate->name).'</a></li>';
		}
		return "<div class='dropdown-menu animation-dock ".$p." sub-item'><ul><h5 class='dropdown-header'><a href=".URL.'category/'.$id.">Main category: ".$main."</a></h5>".$dropdown."</ul></div>";
	}
	public function menu_left($categories,$parent=0,$child=0)
	{		
		$menu_child = array();
	    foreach ($categories as $key=>$item)
	    {	    	
	        if ($item->parents==$parent)
	        {
	            $menu_child[]=$item;
	            unset($categories[$key]);
	        }
	    }
	    if($menu_child)
	    {
	    	if($child){$ul="";}else{$ul=" id='main-menu' class='gui-controls'";}
	        echo '<ul'.$ul.'>';
	    	++$child;
	        foreach ($menu_child as $key=>$item)
	        {
        		if($child==1)$icon="<div class='gui-icon'><i class='".$item->icon."'></i></div>";else$icon="";
	        	if($item->controller)$link=$item->controller.S.$item->action;else$link='';
	        	if($item->child){$class=" class='gui-folder'";$href="";}else{$class="";$href="href='".URL.OPT.S.$link."'";}
	            echo '<li'.$class.'><a '.$href.'>'.$icon.'<span class="title">'.$item->menu."</span></a>";
	            $this->menu_left($categories,$item->id,$child);
	            echo '</li>';
	        }
	        echo '</ul>';
	    }		
	}
	public function accInfo()
	{
		if($this->logged&&$this->manager){
			$get=array("`u`.fullname","`u`.avatar","DATE_FORMAT(`u`.created,'%b, %d %Y')`created`","`r`.role");
			$user=$this->model->table("user as `u` LEFT JOIN ".DB.N."role as `r` ON `r`.id=`u`.role")->get($get)->where(array("`u`.id"=>$_SESSION['logid']))->ctl('u')->select();
			/*if($this->guide)$guide="checked='checked'";else$guide="";*/
			return '<ul class="header-nav header-nav-profile">
      			<li class="dropdown">
        			<a href="#" class="dropdown-toggle ink-reaction" data-toggle="dropdown">
	          			<img src="'.$this->modun('image')->getImg($user->avatar,'avatar').'" alt="not found">
	          			<span class="profile-info">'.$user->fullname.'
	            			<small>'.$user->role.'</small>
	          			</span>
        			</a>
        			<ul class="dropdown-menu animation-dock">
	          			<li class="dropdown-header">Config</li>
	          			<li><a href="'.URL.'admin/user/info/'.$_SESSION['logid'].'">My profile</a></li>		          			
	          			<li class="divider"></li>
	          			<li><a href="'.URL.'logout"><i class="fa fa-fw fa-power-off text-danger"></i> Logout</a></li>
        			</ul>
      			</li>
			</ul>';
		}else return false;
	}
	public function norand($min=0,$max=0)
	{
		mt_srand(crc32(microtime()));
		if ($max AND $max <= mt_getrandmax()){
			$number = mt_rand($min, $max);
		}else{
			$number = mt_rand();
		}
		mt_srand();
		return $number;
	}
	public function user_salt($length=30)
	{
		$salt='';
		for ($i = 0; $i < $length; $i++){
			$salt .= chr(self::norand(33, 126));
		}
		return $salt;
	}
	public function extract($path=false,$password=false)
	//$this->modun('index')->extract(MODUN.'/install.zip','B810488b');
	{
		if($path){
			$zip= new ZipArchive;
			if($zip->open($path)===true){
				if($password)$zip->setPassword($password);
				$zip->extractTo(MODUN);
            	$zip->close();
			}
		}
	}
	public function zipfile($folder=false,$name=false,$password=false)
	// $this->modun('index')->zipfile(MODUN.'install/',MODUN.'installs.zip','B810488b');
	{
		if($folder){
			$zip= new ZipArchive;
			$files=scandir($folder);
            if($zip->open($name, ZIPARCHIVE::CREATE | ZIPARCHIVE::OVERWRITE)===true){
            	if($password)$zip->setPassword($password);
	            foreach ($files as $file) {
	                if($file!='.'&&$file!='..'){
				  		$zip->addFile($folder.$file,$file);
					}
	            }
	            $zip->close();
	        }
			/*header('Content-Type: application/zip');
			header('Content-disposition: attachment; filename='.$zipname);
			header('Content-Length: ' . filesize($zipname));
			readfile($zipname);*/
		}
	}
	public function getShop($id=false,$limit=6)
	{
		if($id){
			return $this->model->table('product as `p` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`p`.brand')->get('`p`.id,`p`.name,`p`.desc,`p`.price,`p`.image,`b`.name as `brand`')->where(array('`p`.cate'=>$id))->ctl('p')->multi()->limit($limit)->order('`p`.modified DESC')->select();
		}else return false;
	}
	public function getType($id=false,$limit=6)
	{
		if($id){
			return $this->model->table('product as `p` LEFT JOIN '.DB.N.'brands as `b` ON `b`.id=`p`.brand')->get('`p`.id,`p`.name,`p`.desc,`p`.price,`p`.image,`b`.name as `brand`')->where(array('`p`.type'=>$id))->ctl('p')->multi()->limit($limit)->order('`p`.modified DESC')->select();
		}else return false;
	}
	public function checkCart()
	{
		if(isset($_SESSION['logid'])){
			$get=$this->model->table('cart')->get('count(*)`total`')->where(array('user_id'=>$_SESSION['logid']))->where('order_id IS NULL')->select();
			if($get->total){
				$this->cookie('cart',$get->total);
			}else{
				$this->cookie('cart','del');
			}
			return (isset($_COOKIE['cart']))?'<sup class="badge style-danger cart-counter" style="top:-15px;">'.$_COOKIE["cart"].'</sup>':null;
		}
	}
}