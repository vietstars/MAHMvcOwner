<?php
class mod_image extends controller
{
	private $error='no_photo.svg';
	private $image='no_photo.svg';
	private $width='350';
	private $height='350';
	private $size='350';
	private $thumbSize='350';
	private $imageType=IMAGETYPE_JPEG;
	function __construct()
	{
		parent::__construct();
	}
	public function imgLoad($file) {
	  	$imageInfo = getimagesize($file);
	  	$this->imageType = $imageInfo[2];
	  	if( $this->imageType == IMAGETYPE_JPEG ) {
			$this->image = imagecreatefromjpeg($file);
	  	}elseif( $this->imageType == IMAGETYPE_GIF ) {
			$this->image = imagecreatefromgif($file);
	  	}elseif( $this->imageType == IMAGETYPE_PNG ) {
			$this->image = imagecreatefrompng($file);
	  	}
	  	$this->getWidth();	
	  	$this->getHeight();	
	  	$this->getSize();	  	
	  	return $this;
	}	
   	public function imgSave($file,$comp=80) {    
		if( $this->imageType == IMAGETYPE_JPEG ) {
		 	imagejpeg($this->image,$file,$comp);
		} elseif( $this->imageType == IMAGETYPE_GIF ) {
		 	imagegif($this->image,$file);
		} elseif( $this->imageType == IMAGETYPE_PNG ) {		    
		 	imagepng($this->image,$file);
		}
	 	chmod($file,0777);
	 	return $this;
   	}
	public function getWidth($return=false) {
		$this->width=imagesx($this->image);
		if($return)
			return $this->width;
		else
			return $this;
	}
	public function getHeight($return=false) {
	  	$this->height=imagesy($this->image);
		if($return)
			return $this->height;
		else
			return $this;
	}
	public function getSize($return=false) {
		if($this->width>$this->height){
			$this->size=$this->width;
		}else{
			$this->size=$this->height;
		}
		$this->size+=10;
		if($return)
			return $this->size;
		else
			return $this;
	}
	public function resize($width,$height) {
	  	$newImage=imagecreatetruecolor($width, $height);
	  	if($this->imageType==IMAGETYPE_PNG){
	  		imagealphablending($newImage, false);
		    imagesavealpha($newImage, true);
		    $transparent = imagecolorallocatealpha($newImage, 255, 255, 255, 127);
		    imagefilledrectangle($newImage, 0, 0, $width, $height, $transparent);
	  	}
	  	imagecopyresampled($newImage,$this->image,0,0,0,0,$width,$height,$this->width,$this->height);
	  	$this->image=$newImage;
	  	return $this;
	}  	
	public function scaleToWidth($width) {
	  	$ratio=$width/$this->width;
	  	$height=$this->height*$ratio;
	  	$this->resize($width,$height);
	}
	public function scaleToHeight($height) {
	  	$ratio=$height/$this->height;
	  	$width=$this->width*$ratio;
	  	$this->resize($width,$height);
	}
	public function scale($percent=100) {
	  	$width=$this->width*$percent/100;
	  	$height=$this->height*$percent/100;
	  	$this->resize($width,$height);
	}
	public function cropcenter($width,$height) {
	   	$new_image = imagecreatetruecolor($width, $height);
		$heightold=$height;
		$widthold=$width;
		$ratio_orig= $this->getWidth()/$this->getHeight();
		$src_y=0;
		$src_x=0;
		if ($width/$height > $ratio_orig){
		    $ratio = $width / $this->getWidth();
	 		$height = $this->getheight() * $ratio;
			$src_y=-($height-$heightold)/2;
		}else
		{
		   $ratio = $height / $this->getHeight();
	 		$width = $this->getWidth() * $ratio;
			$src_x=-($width-$heightold)/2;
		}
		imagecopyresampled($new_image, $this->image,$src_x, $src_y, 0,0, $width, $height,  $this->getWidth(), $this->getHeight());
		$this->image = $new_image;
	}
	public function fillrec($width,$height,$notcen=false) {
		$newImage=imagecreatetruecolor($width, $height);
		$white=imagecolorallocate($newImage, 255, 255, 255);
		if($notcen){
			$x=($width-$this->width)/2;
			$y=1; //khác 0
		}else{
			$x=($width-$this->width)/2;
			$y=($height-$this->height)/2;
		}
		imagecopy($newImage,$this->image,$x,$y,0,0,$width,$height);
		imagefill($newImage,0,0,$white);
		$this->image=$newImage;
	}
	/*******not fix********/	
	public function watermark($file,$mark=false,$location='r-b',$wid_mark=0,$x=10,$y=10)
   	{
	   	$imgbg=$this;
	   	$imgwat=$this;
	   	if(empty($mark))$mark=PUB."img/logo.png";
		$imgwat->imgLoad($mark);
		if($wid_mark>0){
			$imgwat->resizeToWidth($wid_mark);
		}
		$stamp=$imgwat->image;
		if($file){
			$imgbg->imgLoad($file);
			$im = $imgbg->image;
		}
		else{exit;}
		$sx = imagesx($stamp);
		$sy = imagesy($stamp);
		switch($location){
			case 'r-b';
			case 'b-r';
				imagecopy($im, $stamp, imagesx($im) - $sx - $x, imagesy($im) - $sy - $y, 0, 0, imagesx($stamp), imagesy($stamp)); 
				break;
			case 'r-t';
			case 't-r'; 
				imagecopy($im, $stamp, imagesx($im) - $sx - $x, $y, 0, 0, imagesx($stamp), imagesy($stamp));
				break;
			case 'l-b';
			case 'b-l'; 
				imagecopy($im, $stamp,$x, imagesy($im) - $sy - $y, 0, 0, imagesx($stamp), imagesy($stamp)); 
				break;
			case 'l-t';
			case 't-l'; 
				imagecopy($im, $stamp,$x,$y, 0, 0, imagesx($stamp), imagesy($stamp)); 
				break;
			default : break;
		}
		$this->image=$im;
		$this->imgSave($file);
   	}
/****************************************************/   	
	public function createThumb($thumb=false,$size=false,$clear=false)
	{
		if($size){
			$this->scaleToWidth($size);
		}else{
			$this->scaleToWidth($this->thumbSize);
		}
		if($thumb){
			$this->imgSave($thumb);	
		}else{
			$this->imgSave($this->image);
		}
		if(!$clear){
			$this->clear();
		}	
	}
	public function cropImg($newfile=false,$clear=false)
	{
		$this->fillrec($this->size,$this->size);
		if($newfile){
			$this->imgSave($newfile);
			$this->image=$newfile;			
		}else{
			$this->imgSave($this->image);	
		}
		if(!$clear){
			$this->clear();
		}
	}
	public function clear()
	{
		$this->image='no_photo.svg';
		$this->width='350';
		$this->height='350';
		$this->size='350';
		$this->imageType=IMAGETYPE_JPEG;
		return $this;
	}
	public function getImg($file='no_photo.svg',$folder='root',$thumb=false)
	{
		if(empty($file)||$file=='no_photo.svg'){
			return IMG.'no_photo.svg';
		}else{
			if($folder=='root'){
				$path=PUB.'img'.S.$file;
				if(file_exists($path)){
					return IMG.$file;
				}else{
					return IMG.'no_photo.svg';
				}
			}else{
				$date=current(explode("_",$file));
				$sub=date('d-m-Y',$date);
				$path=PUB.'img'.S.$folder.S.$sub.S.$file;
				$thumbPath=PUB.'img/thumb'.S.$folder.S.$sub.S.$file;
				if($thumb){
					if(file_exists($thumbPath)){
						return IMG.'thumb'.S.$folder.S.$sub.S.$file;
					}else{
						return IMG.'no_photo.svg';
					}
				}else{
					if(file_exists($path)){
						return IMG.$folder.S.$sub.S.$file;
					}else{
						return IMG.'no_photo.svg';
					}
				}
			}
		}
	}
	public function imgFiles($data=false,$folders='underfind',$mark=true,$height=false)
	{
		$error=$data['error'];
		if(!$error){
			$type=$data['type'];
			$check='/^image\/(gif|bmp|jpeg|png|svg\+xml)$/';
			if(preg_match($check, $type, $return)){								
				$folder=$this->mkFolder($folders,date('d-m-Y'));
				$fileName=$this->fileName($data['name']);
				$real=$folder->dir.S.$fileName;
				$thumb=$folder->thumb.S.$fileName;
				$temp=$data['tmp_name'];
				move_uploaded_file($temp,$real);
				if($type=="image/svg+xml"){
					copy($real,$thumb);
				}else{
					if($height){
						$this->imgLoad($real)->scaleToHeight($height);	
						$this->imgSave($thumb);
					}else{
						$this->imgLoad($real)->cropImg($thumb,1);		
					}
					if($mark)$this->watermark($thumb);
					if($this->imgLoad($real)->getSize(1)<$this->thumbSize){
						copy($thumb,$real);
					}else{
						rename($thumb,$real);
						$this->imgLoad($real)->createThumb($thumb,0,1);
					}
				}
				$response=array(
					'img'=>IMG."thumb".S.$folders.S.date('d-m-Y/').$fileName,
					'result'=>true,
					'fileName'=>$fileName
				);
				return $response;
			}else{
				return 'Not image file!';
			}
		}else{
			return 'Image uploaded error!';
		}
	}
	public function productImg($data=false,$folders='product',$mark=true,$height=false)
	{
		$error=$data['error'];
		if(!$error){
			$type=$data['type'];
			$check='/^image\/(gif|bmp|jpeg|png|svg\+xml)$/';
			if(preg_match($check, $type, $return)){					
				list($id,$folders)=explode(";",$folders);						
				$folder=$this->mkFolder($folders,date('d-m-Y'));
				$fileName=$this->fileName($data['name']);
				$real=$folder->dir.S.$fileName;
				$thumb=$folder->thumb.S.$fileName;
				$temp=$data['tmp_name'];
				move_uploaded_file($temp,$real);
				if($type=="image/svg+xml"){
					copy($real,$thumb);
				}else{
					if($height){
						$this->imgLoad($real)->scaleToHeight($height);	
						$this->imgSave($thumb);
					}else{
						$this->imgLoad($real)->cropImg($thumb,1);		
					}
					if($mark)$this->watermark($thumb);
					if($this->imgLoad($real)->getSize(1)<$this->thumbSize){
						copy($thumb,$real);
					}else{
						rename($thumb,$real);
						$this->imgLoad($real)->createThumb($thumb,0,1);
					}
				}
				$response=array(
					'img'=>IMG."thumb".S.$folders.S.date('d-m-Y/').$fileName,
					'result'=>true,
					'fileName'=>$fileName
				);
				if($id&&$fileName){
					$updata=array(
						'product_id'=>$id,
						'image'=>$fileName,
						'created'=>date('Y-m-d H:i:s')
					);
					$this->model->table('image')->info($updata)->insert();
				}
				return $response;
			}else{
				return 'Not image file!';
			}
		}else{
			return 'Image uploaded error!';
		}
	}
	public function imgCode($data=false)
	{
		if($data){
			$ext='/^image\/(gif|bmp|jpe?g|png|svg\+xml)$/';
			if(preg_match($ext,strtolower($data['ext']), $return)){
				$sized=$this->model->table("system")->get(array("sys_key","sys_value"))->where_or(array("sys_key"=>array("img_maxSize","img_maxCount")))->multi()->select();
				foreach ($sized as $value) {
					$key=$value->sys_key;
					$$key=$value->sys_value;
				}
				if($data['size']<=$img_maxSize&&$data['img']){
					if($data['folder'])$folder=$data['folder'];else$folder='underfined';
					$folder=$this->mkFolder($folder,date('d-m-Y'));
					$fileName=$this->fileName($data['name']);
					$real=$folder->dir.S.$fileName;
					$thumb=$folder->thumb.S.$fileName;
					$up=fopen($real,"wb"); 
					fwrite($up,base64_decode($data['img']));
					fclose($up);
					if($data['ext']=="image/svg+xml"){
						copy($real,$thumb);
					}else{
						$this->imgLoad($real)->cropImg($thumb,1);					
						if($this->imgLoad($real)->getSize(1)<$this->thumbSize){
							copy($thumb,$real);
						}else{
							rename($thumb,$real);
							$this->imgLoad($real)->createThumb($thumb,0,1);
						}
					}
					$this->api(IMG."thumb".S.$data['folder'].S.date('d-m-Y/').$fileName);
				}else $this->api(IMG.'no_photo.svg');
			}else $this->api(IMG.'no_photo.svg');
		}else $this->api(IMG.'no_photo.svg'); 
	}
	public function mkFolder($folder='underfind',$sub=false)
	{
		$dir= PUB."img".S.$folder;
		if(!is_dir($dir)){
			mkdir($dir, 0777);
			chmod($dir, 0777);
		}
		if(!is_dir(PUB."img".S."thumb")){
			mkdir(PUB."img".S."thumb", 0777);
			chmod(PUB."img".S."thumb", 0777);
		}
		$thumb= PUB."img".S."thumb".S.$folder;
		if(!is_dir($thumb)){
			mkdir($thumb, 0777);
			chmod($thumb, 0777);
		}		
		$data=(object) array(
			'dir'=>PUB."img".S.$folder,
			'thumb'=>PUB."img".S."thumb".S.$folder
		);
		if($sub){
			$subfolder= PUB."img".S.$folder.S.$sub;
			if(!is_dir($subfolder)){
				mkdir($subfolder, 0777);
				chmod($subfolder, 0777);
			}
			$subthumb= PUB."img".S."thumb".S.$folder.S.$sub;
			if(!is_dir($subthumb)){
				mkdir($subthumb, 0777);
				chmod($subthumb, 0777);
			}
			$data=(object) array(
				'dir'=>PUB."img".S.$folder.S.$sub,
				'thumb'=>PUB."img".S."thumb".S.$folder.S.$sub
			);
		}
		return $data;
	}
	public function rmFolder($empty=false,$folder='underfind',$sub=false,$subonly=false)
	{
		if($empty){
			if(is_dir($folder)){
				$children=scandir($folder);
				if(count($children)<3)
					rmdir($folder);							
				foreach ($children as $item) {
					if($item!="."&&$item!=".."){
						if(is_dir($folder.S.$item))
							$this->rmFolder($empty,$folder.S.$item);
						else{
							unlink($folder.S.$item);
						}
					}
				}
				reset($children);
				rmdir($folder);
			}
		}else{
			if($sub){
				$subfolder= PUB."img".S.$folder.S.$sub;
				if(is_dir($subfolder)){
					$children=scandir($subfolder);
					if(count($children)<3)
						rmdir($subfolder);
				}
				$subthumb= PUB."img".S."thumb".S.$folder.S.$sub;
				if(is_dir($subthumb)){
					$childrens=scandir($subthumb);
					if(count($childrens)<3)
						rmdir($subthumb);
				}
				if($subonly){
					return true;
					exit;
				}
			}
			$dir= PUB."img".S.$folder;
			if(is_dir($dir)){
				$children=scandir($dir);
				if(count($children)<3)
					rmdir($dir);
			}
			$thumb= PUB."img".S."thumb".S.$folder;
			if(is_dir($thumb)){
				$childrens=scandir($thumb);
				if(count($childrens)<3)
					rmdir($thumb);
			}
		}
	}
	public function fileName($file='no_photo.svg',$cur=false)
	{
		$names=explode(".", $file);
		$ext=end($names);
		list($name,$null)=explode(".".$ext, $file);
		$name=preg_replace('/[^A-Za-z0-9]/',N,$name);
		$name=preg_replace('/'.N.'+/',N,$name);
		if($cur)
			return $name.'.'.$ext;
		else
			return NOW.N.$name.'.'.$ext;
	}
	public function rmImg($img=false,$folder='root')
	{
		if($img){
			$date=current(explode("_",$img));
			$sub=date('d-m-Y',$date);
			$path=PUB.'img'.S.$folder.S.$sub.S.$img;
			$thumbPath=PUB.'img/thumb'.S.$folder.S.$sub.S.$img;
			if(file_exists($thumbPath)){
				unlink($thumbPath);
				if(file_exists($path)){
					unlink($path);
					return true;
				}else return false;
			}else{
				if(file_exists($path)){
					unlink($path);
					return true;
				}else return false;
			} 
		}else return false;
	}
	function save_image($url=false,$name=false,$folders='underfined')
	{
		if($url&&$name){
		    $in=fopen($url, "rb");
		    $folder=$this->mkFolder($folders,date('d-m-Y'));
		    $fileName=$this->fileName($name);
			$real=$folder->dir.S.$fileName;
			$thumb=$folder->thumb.S.$fileName;
		    $real_out=fopen($real, "wb");
		    while ($chunk = fread($in,8192))
		    {
		        fwrite($real_out, $chunk, 8192);
		    }
		    copy($real,$thumb);
		    fclose($in);
		    fclose($real_out);
		    if(file_exists($thumb)){
		    	return $fileName;
		    }else return FALSE;
		}else return FALSE;
	}
	
}