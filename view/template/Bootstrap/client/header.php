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
<body lg="<?=isset($_COOKIE['lg'])?$_COOKIE['lg']:'en'?>" url="<?=URL?>" ctl="<?=CTL?>" act="<?=ACT?>" <?php if(ACT=='login'){echo 'class="hold-transition login-page"';}else{echo 'class="hold-transition skin-blue layout-top-nav"';}?>>
<?php if(ACT!='login'):?>
<div class="wrapper">
<header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="<?=URL?>" class="navbar-brand"><b>Vietstar</b> Ptd Lte</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse"><i class="fa fa-bars"></i></button>
        </div>
        <div class="collapse navbar-collapse pull-left" id="navbar-collapse"></div>        
        <div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
	            <li class="active"><a href="<?=URL?>">Page <span class="sr-only">(current)</span></a></li>
	            <li class="dropdown">
	              	<a href="#" class="dropdown-toggle" data-toggle="dropdown">Menu <span class="caret"></span></a>
	              	<ul class="dropdown-menu" role="menu">
		                <?php if($logged):?>
		                	<li><a href="<?=URL?>admin"><?= $lg->Dashboard?></a></li>
		                	<li class="divider"></li>
		                	<li><a href="<?=URL?>logout"><?= $lg->Logout?></a></li>
		                <?php elseif(ACT!='login'):?>
		                	<li><a href="#">Something else here</a></li>
		                	<li class="divider"></li>
		                	<li><a href="<?=URL?>login"><?= $lg->Login?></a></li>
		                <?php endif;?>
	              	</ul>
	            </li>
          	</ul>
        </div>
      </div>
    </nav>
</header>
<?php endif;?>
