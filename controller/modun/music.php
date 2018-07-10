<?php
class mod_music extends controller
{
	function __construct()
	{
		parent::__construct();
	}
	public function mkFolder($folder='music',$sub=false)
	{
		$dir= PUB.$folder;
		if(!is_dir($dir)){
			mkdir($dir, 0777);
			chmod($dir, 0777);
		}
		$sub_folder= PUB.$folder.S.$sub;
		if(!is_dir($sub_folder)){
			mkdir($sub_folder, 0777);
			chmod($sub_folder, 0777);
		}		
		if($sub)return $dir; else return $sub_folder;
	}
	public function rmFolder($empty=false,$folder='music',$sub=false,$subonly=false)
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
				$subfolder= PUB."music".S.$folder.S.$sub;
				if(is_dir($subfolder)){
					$children=scandir($subfolder);
					if(count($children)<3)
						rmdir($subfolder);
				}
				if($subonly){
					return true;
					exit;
				}
			}
			$dir= PUB."music".S.$folder;
			if(is_dir($dir)){
				$children=scandir($dir);
				if(count($children)<3)
					rmdir($dir);
			}
		}
	}
	public function fileName($file='music.mp3',$cur=false)
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
	public function addmusic($temp=false,$real=false)
	{
		if($temp&&$real){
			move_uploaded_file($temp,$real);
			if(file_exists($real))return true; else return false;
		}else  return false;
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
}