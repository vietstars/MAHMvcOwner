<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title><?= isset($header->title)?$header->title:null," | ",$title?></title>
	<?php 
		if(isset($header->meta)) 		
			foreach($header->meta as $meta){
				echo $meta;
			}
		if(isset($header->icon))echo $header->icon;	
		if(isset($header->css)) 		
			foreach($header->css as $css)
				echo $css;		
		if(isset($header->js)) 		
			foreach($header->js as $js)
				echo $js;
	?>				
</head>
<body class="menubar-hoverable header-fixed" lg="<?=isset($_COOKIE['lg'])?$_COOKIE['lg']:'en'?>" url="<?=URL?>" ctl="<?=CTL?>" act="<?=ACT?>">
<header id="header">
	<div class="headerbar">
		<div class="headerbar-left">
		    <ul class="header-nav header-nav-options">
		      	<li class="header-nav-brand">
		        	<div class="brand-holder">
			          	<a href="<?=URL?>">
			            	<img src="<?=IMG?>logo.png" alt="">
			          	</a>
		        	</div>
		      	</li>
	      	<div class="menu-small">
	      	<?php foreach($this->modun('index')->home_menu() as $menu): ?>
		      	<li class="header-nav-brand">
		        	<div class="brand-holder">
			          	<a href="<?=URL.$menu->controller?>" class='menu-link <?= strtolower(CTL)==strtolower($menu->controller)?'active':null;?>'>
			            	<?=htmlspecialchars_decode($menu->menu)?>
			          	</a>
		        	</div>
		      	</li>
	      	<?php endforeach;?>
		      	<li class="header-nav-brand dropdown">
		        	<div class="brand-holder">
			          	<a  href="#brandModal" class="menu-link" data-modal="show">
			            	All products
			          	</a>
			          	<!-- <a href="javascript:;" class="menu-link dropdown-toggle" data-toggle="dropdown">
			          				            	<?php if(isset($_COOKIE['brand_name'])&&$_COOKIE['brand_name']): echo$_COOKIE['brand_name']; else: ?>All Brands<?php endif;?> <i class="fa fa-chevron-down"></i>
			          	</a> -->
			          	<ul class="dropdown-menu animation-dock">
			          		<li>
		          				<a href="<?=URL?>brandChange/all"><i class="fa fa-dashboard"></i> All brands</a>
	          				</li>
		          		<?php foreach($this->modun('index')->brand_list() as $brand):?>
		          			<li class="divider"></li>
		          			<li>
		          				<a href="<?=URL?>brandChange/<?=$brand->id?>"><i class="<?= $brand->icon?>"></i> <?=htmlspecialchars_decode($brand->name)?></a>
	          				</li>
		          		<?php endforeach;?>
		          		</ul>
		        	</div>
		      	</li>
	      	</div>
		      	<!-- <li class="header-nav-brand dropdown">
		        	<div class="brand-holder">
			          	<a href="javascript:;" class="menu-link dropdown-toggle" data-toggle="dropdown">
			            	All Type <i class="fa fa-chevron-down"></i>
			          	</a>
			          	<div class="dropdown-menu animation-dock dropdown-menu-right">
				          	<ul class="type-filter">
			          		<?php foreach($this->modun('index')->type_list() as $type):?>
			          			<li>
			          				<a href="<?=URL?>type/<?=$type->id?>"><?=$this->modun('text')->cut(htmlspecialchars_decode($type->name),30)?></a>
		          				</li>
			          		<?php endforeach;?>
			          		</ul>
			          	</div>
		        	</div>
		      	</li> -->
		    </ul>
	  	</div>
		<div class="headerbar-right">			
			<ul class="header-nav header-nav-toggle">
      			<li class="top-menu">
        			<a href='#searchModal' class="top-btn" data-modal="show"><i class="fa fa-search"></i></a>
      			</li>
      			<li class="top-menu">
      			<?php if(!$logged):?>
        			<a href='<?=URL?>login' class="top-btn">
          				Login
        			</a>
        		<?php else:?>
					<a class="top-btn dropdown-toggle" data-toggle="dropdown">
          				<i class="fa fa-user"></i> <?=$_SESSION['auth']?>
        			</a>
        			<ul class="dropdown-menu animation-dock">
						<?php if($manager):?>
	          			<li><a href="<?=URL?>admin"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a></li>
	          			<li class="divider"></li>
	          			<li><a href="<?=URL?>logout"><i class="fa fa-fw fa-login text-danger"></i> Logout</a></li>
						<?php elseif($logged):?>
	          			<li><a href="<?=URL?>info">Account Infomation</a></li>
	          			<li class="divider"></li>
	          			<li><a href="<?=URL?>logout"><i class="fa fa-fw fa-logout text-info"></i>Logout</a></li>
	          			<?php endif;?>
	          		</ul>
				<?php endif;?>
      			</li>
      			<li class="dropdown">
        			<a class="btn btn-icon-toggle btn-default dropdown-toggle cart-menu" data-toggle="dropdown">
          				<i class="fa fa-shopping-cart"></i>
          				<?=$this->modun('index')->checkCart()?>
        			</a>        			
					<?php if($logged):?>
						<ul class="dropdown-menu animation-dock">
		          			<li><a href="<?=URL?>history">Shopping history</a></li>
		          			<li><a href="<?=URL?>myCart">My Cart</a></li>
		          		</ul>
	          		<?php endif;?>
      			</li>
			</ul>
		</div>
	</div>
</header>
<!-- <nav class="cat-nav">
    <div class="container">
    	<img src="<?=isset($_COOKIE['brand_img'])&&$_COOKIE['brand_img']?$_COOKIE['brand_img']:$this->modun('image')->getImg('brand_logo.png','root');?>" class="cat-logo" alt="logo">
    	<ul class="cat-nav__list pull-right">    	
    	<?php $cateList=$this->modun('index')->category_list();if(count($cateList)<5):foreach($cateList as $key=>$cat):if(empty($key))$p="dropdown-menu-left";else$p="dropdown-menu-right";?>
			<li class="cat-nav__item <?=($cat->subCat)?'dropdown':null;?>" ><a <?=($cat->subCat)?'href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"':'href="'.URL.'category/'.$cat->id;?>><i class="<?=$cat->icon?>"></i> <?=htmlspecialchars_decode($cat->name)?> <?=($cat->subCat)?'<i class="fa fa-chevron-down"></i>':null;?></a>
				<?= $cateList=$this->modun('index')->sub_category($cat->id,htmlspecialchars_decode($cat->name),$p);?>
			</li>
    	<?php endforeach;else:foreach($cateList as $key=>$cat):if($key<5):if(empty($key))$p="dropdown-menu-left";else$p="dropdown-menu-right";?>
			<li class="cat-nav__item <?=($cat->subCat)?'dropdown':null;?>" ><a class="" <?=($cat->subCat)?'href="javascript:;" class="dropdown-toggle" data-toggle="dropdown"':'href="'.URL.'category/'.$cat->id;?>"><i class="<?=$cat->icon?>"></i> <?=htmlspecialchars_decode($cat->name)?> <?=($cat->subCat)?'<i class="fa fa-chevron-down"></i>':null;?></a>
				<?= $cateList=$this->modun('index')->sub_category($cat->id,htmlspecialchars_decode($cat->name),$p);?>
			</li>
		<?php endif;endforeach;?>
			<li class="cat-nav__item dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;">More <i class="fa fa-chevron-down"></i></a>
				<div class='dropdown-menu animation-dock dropdown-menu-right more-items'>					
					<ul class="<?php if(count($cateList)>15)echo"too-big";?>">	
						<h5 class="dropdown-header">All categories</h5>	
						<?php foreach($cateList as $key=>$cat):if($key>=5):?>				
	          			<li><a href="<?=URL.'category/'.$cat->id?>"><i class="<?=$cat->icon?>"></i> <?=htmlspecialchars_decode($cat->name)?></a></li>
	          			<?php endif;endforeach;?>
	          		</ul>
				</div>
			</li>
    	<?php endif;?>
    	</ul>
    </div>    
</nav> -->
<div class="modal fade" id="brandModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body text-center row">
        <div class="col-md-6 brand-bar"><a href="<?=URL.'brands/10'?>" class="brand-hover"><img src="<?=IMG?>givi.svg" alt="GIVI"><!-- <h1>GIVI</h1> --></a></div>
        <div class="col-md-6 brand-bar"><a href="<?=URL.'brands/11'?>" class="brand-hover"><img src="<?=IMG?>motorex.svg" alt="MOTOREX"><!-- <h1>MOTOREX</h1> --></a></div>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="searchModal">
  <div class="modal-dialog">
    <div class="modal-content">
	  <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Search</h4>
      </div>
      <div class="modal-body text-center" style="padding:20px;">
      	<form action="<?=URL?>search" method="post">
		 	<div class="input-group">
		      <input type="text" class="form-control" name="search" placeholder="Key name or description.">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
	      	</span>
	    	</div>
      	</form>
      </div>
    </div>
  </div>
</div>