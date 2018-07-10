<?php
ini_set('memory_limit', '-1');
ini_set('max_execution_time', 9999);

class adm_product extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function index()
	{
		$this->view->title='product Manage';
		$this->view->brands=$this->model->table('brands')->get('id,name')->limit('not')->order('sorted ASC')->multi()->select();
		$this->view->category=$this->model->table('category')->get('id,name')->limit('not')->order('sorted ASC')->multi()->select();
		$this->view->type=$this->model->table('type')->get('id,name')->limit('not')->order('sorted ASC')->multi()->select();
	}
	public function getProduct()
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
				if($_POST['order'][0]['column']==0)$option['order']='name';elseif($_POST['order'][0]['column']==2)$option['order']='interested';elseif($_POST['order'][0]['column']==3)$option['order']='price';elseif($_POST['order'][0]['column']==4)$option['order']='cate';elseif($_POST['order'][0]['column']==5)$option['order']='created';elseif($_POST['order'][0]['column']==6)$option['order']='status';
			}
			if(isset($_POST['search']['value'])&&$_POST['search']['value']){
				$option['search']='(name LIKE \'%'.$_POST['search']['value'].'%\' OR `desc` LIKE \'%'.$_POST['search']['value'].'%\')';
			}
			if(empty($option['search'])){
				$results=$this->model->table('product')->get(array('id','name','`desc`','IF(image IS NULL,"no_photo.svg",image)`image`','price','interested','brand','cate','type','DATE_FORMAT(created,"%b,%d %Y %hh%i\'")`created`','DATE_FORMAT(modified,"%b,%d %Y %hh%i\'")`modified`','status','ctl'))->order($option['order']." ".$option['dir'])->multi()->limit($option['page'].",".$option['block'])->select();
				$total=$this->model->table('product')->get('count(*)`total`')->limit('not')->select();
			}else{
				$results=$this->model->table('product')->get(array('id','name','`desc`','IF(image IS NULL,"no_photo.svg",image)`image`','price','interested','brand','cate','type','DATE_FORMAT(created,"%b,%d %Y %hh%i\'")`created`','DATE_FORMAT(modified,"%b,%d %Y %hh%i\'")`modified`','status','ctl'))->where($option['search'])->order($option['order']." ".$option['dir'])->multi()->limit($option['page'].",".$option['block'])->select();
				$total=$this->model->table('product')->get('count(*)`total`')->where($option['search'])->limit('not')->select();
			}						
			foreach ($results as $product) {
				if($product->status=='a')$status='<span class="text-primary">Active<span>';elseif($product->status=='o')$status='<span class="text-danger">Out of stock<span>';elseif($product->status=='b')$status='<span class="text-info">Best<span>';else$status='<span class="text-warning">Hidden<span>';
				if($product->brand)$brand=$this->getOptions($product->brand);else$brand='<span class="text-danger">Not availability</span>';
				if($product->cate)$cate=$this->getOptions($product->cate,'category');else$cate='<span class="text-danger">Not availability</span>';
				if($product->type)$type=$this->getOptions($product->type,'type');else$type='<span class="text-danger">Not availability</span>';
				if(empty($product->image)||$product->image=='no_photo.svg'){
					$image=$this->modun('image')->getImg($product->image);
				}else $image=$this->modun('image')->getImg($product->image,'product',1);
				$data=array(				
					"name"=>"<div class='checkbox checkbox-styled'><label><input type='checkbox' value='".$product->id."'><span></span></label></div><a data-modal='show' class='text-primary' data-target='#product-detail' data-id='".$product->id."'><strong>".htmlspecialchars_decode($product->name)."</strong><br><small>".htmlspecialchars_decode($product->desc)."</small></a>",
					"interest"=>$product->interested." <div class='pull-right' data-id='".$product->id."' data-modal='show' data-target='#like-list'><i class='fa fa-list like-list'></i></div>",
					"image"=>"<div data-id='".$product->id."' data-modal='show' data-target='#image-manager'><div class='img-circle size-1' style='background:url(".$image.");background-position:center center!important;background-size:cover!important;border:1px #CCC solid;'></div><div class='pull-right'><i class='fa fa-image image-list'></i></div></div>",
					"price"=>"<strong>$: ".$product->price."</strong><br><small>".$brand."</small>",		
					"category"=>"<strong>".$cate."</strong><br><small>".$type."</small>",
					"datetime"=>$product->created."<br><small>".$product->modified."</small>",
					"status"=>$status,
					"ctl"=>$product->ctl
				);
				$datas[]=$data;
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
	public function getOptions($id=false,$table='brands')
	{
		if($id){
			$result=$this->model->table($table)->get('name')->where(array("id"=>$id))->select();
			if($result)return htmlspecialchars_decode($result->name); else return '<span class="text-danger">Not availability</span>';
		}else return '<span class="text-danger">Not availability</span>';
	}
	public function multiDelete()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('product')->condition(array('ctl'=>2))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiLock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('product')->condition(array('ctl'=>1))->where("id IN (".$_POST['items'].")")->update());
		}
	}
	public function multiUnlock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('product')->condition(array('ctl'=>0))->where("id IN (".$_POST['items'].")")->update());
		}
	}	
	public function multiBest()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('product')->condition(array('status'=>'b'))->where("id IN (".$_POST['items'].")")->update());
		}
	}	
	public function multiActive()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('product')->condition(array('status'=>'a'))->where("id IN (".$_POST['items'].")")->update());
		}
	}	
	public function multiOutstock()
	{
		if(isset($_POST['items'])&&$_POST['items']){
			$this->api($this->model->table('product')->condition(array('status'=>'o'))->where("id IN (".$_POST['items'].")")->update());
		}
	}	
	public function import()
	{
		if(isset($_FILES)){
			list($name,$ext)=explode('.', $_FILES['file']['name']);
			$ext=strtolower($ext);
			$tmpName=$_FILES['file']['tmp_name'];
			if($ext === 'csv'){
		        if(($handle = fopen($tmpName, 'r')) !== FALSE) {
		            for($i=0;$row=fgetcsv($handle);++$i) {
					    if($i!=0){
					    	$data=array(
					    		'name'=>'',
					    		'desc'=>'',
					    		'price'=>'',
					    		'brand'=>'',
					    		'status'=>'',
					    		'image'=>'',
					    		'cate'=>'',
					    		'created'=>date('Y-m-d H:i:s')
					    	);
					    	if(!empty($row[0]))$data['name']=htmlspecialchars($row[0]);
					    	if(!empty($row[1]))$data['desc']=htmlspecialchars(trim($row[1],'/'));
					    	if(!empty($row[2]))$data['price']=preg_replace("/[^0-9.]/","",$row[2]);
					    	if(!empty($row[3]))$data['brand']=$this->checkOptions(htmlspecialchars($row[3]));
					    	if(!empty($row[4])){
					    		if(!empty($row[5])){
					    			$main_cat=$this->checkOptions(htmlspecialchars(trim($row[4],'/')),'category');
					    			$fix=array(
							    		'cat_id'=>$main_cat,
							    		'brand_id'=>$data['brand']
							    	);
							    	$up=$this->model->table('follow')->get('id')->where($fix)->select();
							    	if(empty($up)){
							    		$fix['created']=date('Y-m-d H:i:s');
					    				$this->model->table('follow')->info($fix)->insert();
							    	}
					    			$data['cate']=$this->checkOptions(htmlspecialchars(trim($row[5],'/')),'category',$main_cat);
					    		}else{
									$data['cate']=$this->checkOptions(htmlspecialchars($row[4]),'category');
					    		}
					    	}
					    	// if(!empty($row[6]))$data['type']=$this->checkOptions(htmlspecialchars($row[6]),'type');
					    	if(!empty($row[7]))$data['status']=$row[7];
					    	if(!empty($row[8]))$data['image']='1528086898_'.$row[8];
					    	$follow=array(
					    		'cat_id'=>$data['cate'],
					    		'brand_id'=>$data['brand']
					    	);
					    	$_checked=$this->model->table('follow')->get('id')->where($follow)->select();
					    	if(empty($_checked)){
					    		$follow['created']=date('Y-m-d H:i:s');
					    		$this->model->table('follow')->info($follow)->insert();
					    	}
					    	$this->model->table('product')->info($data)->insert();
					    }
					}
		            fclose($handle);
		            $this->notify("Import product finish!");
					header('location: '.URL.'admin/'.CTL);
					exit();
		        }
		    }exit;
		}
	}
	public function checkOptions($name=false,$table='brands',$sub=false)
	{
		if($name&&($table=='brands'||$table=='type'||$table=='category')){
			$result=$this->model->table($table)->get('id')->where(array("LOWER(name)"=>strtolower($name)))->select();
			if($result) return $result->id;else{
				$sorted=$this->model->table($table)->get('sorted')->order('sorted DESC')->select();
				if($sorted)$sort=$sorted->sorted+1;else$sort=0;
				$data=array(
					'name'=>$name,
					'created'=>date('Y-m-d H:i:s'),
					'sorted'=>$sort
				);
				if(ctype_digit($sub))$data['main_cat']=$sub;
				$result=$this->model->table($table)->info($data)->insert();
				return $this->model->lastInsertId();
			}
		}else return NULL;
	}
	public function getImage()
	{
		if($_POST['item']){
			$image=$this->model->table('image')->get('id,image')->where(array('product_id'=>$_POST['item']))->multi()->order('created ASC')->select();
			$respon=array();
			foreach ($image as $img) {
				$respon[]=array('id'=>$img->id,'image'=>$this->modun('image')->getImg($img->image,'product',1),'real'=>$img->image);
			}
			$this->api($respon);
		}
	}
	public function getLike()
	{
		if($_POST['item']){
			$liked=$this->model->table('interest as `i` LEFT JOIN '.DB.N.'user as `u` ON `u`.id=`i`.user_id')->get('`i`.id,`u`.fullname`name`,DATE_FORMAT(`i`.created,"%b,%d %Y %hh%i\'")`created`')->where(array('`i`.product_id'=>$_POST['item']))->ctl('i')->multi()->order('`i`.created ASC')->limit('not')->select();
			$this->api($liked);
		}
	}
	public function getDetail()
	{
		if($_POST['item']){
			$item=$this->model->table('product')->get('name,`desc`,price,brand,cate,type,status')->where(array('id'=>$_POST['item']))->select();
			$this->api($item);
		}
	}
	public function delImg()
	{
		if(ctype_digit($_POST['id'])){
			$result=$this->model->table('image')->get('image')->where(array('id'=>$_POST['id']))->select();
			if($result){
				$this->modun('image')->rmImg($result->image,'product');
			}
			$data=array(
				'ctl'=>2,
				'modified'=>date('Y-m-d H:i:s')
			);
			$this->api($this->model->table('image')->condition($data)->where(array('id'=>$_POST['id']))->update());
		}else $this->api(false);
	}
	public function defImg()
	{
		if(ctype_digit($_POST['id'])&&$_POST['img']){
			$data=array(
				'image'=>$_POST['img']
			);
			$this->api($this->model->table('product')->condition($data)->where(array('id'=>$_POST['id']))->update());
		}else $this->api(false);
	}
	public function editor()
	{
		if(isset($_POST['id'])&&ctype_digit($_POST['id'])){
			$id=$_POST['id'];$_POST['`desc`']=$_POST['desc'];
			unset($_POST['id'],$_POST['desc']);
			$this->model->table('product')->condition($_POST)->where(array('id'=>$id))->update();
			$this->notify("Update product finish!");
			header('location: '.URL.'admin/'.CTL);
		}
	}
}