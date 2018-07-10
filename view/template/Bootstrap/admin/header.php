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
<body class="hold-transition skin-blue sidebar-mini" lg="<?=isset($_COOKIE['lg'])?$_COOKIE['lg']:'en'?>" url="<?=URL?>" ctl="<?=CTL?>" act="<?=ACT?>">
<div class="wrapper">
	<header class="main-header">
	    <a href="<?=URL?>" class="logo">
	      <span class="logo-mini"><b>V</b>st</span>
	      <span class="logo-lg"><b>V</b>iet<b>S</b>tar Ptd Lte</span>
	    </a>
	    <nav class="navbar navbar-static-top">
	      	<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
	        	<span class="sr-only">Toggle navigation</span>
	      	</a>
	      	<div class="navbar-custom-menu">
		        <ul class="nav navbar-nav">
		          	<li class="dropdown notifications-menu">
			            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
			              	<i class="fa fa-bell-o"></i>
			              	<span class="label label-danger">10</span>
			            </a>
			            <ul class="dropdown-menu">
			              	<li class="header">You have 10 notifications</li>
			              	<li>
				                <ul class="menu">
				                  <li>
				                    <a href="#">
				                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
				                    </a>
				                  </li>
				                  <li>
				                    <a href="#">
				                      <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
				                      page and may cause design problems
				                    </a>
				                  </li>
				                  <li>
				                    <a href="#">
				                      <i class="fa fa-users text-red"></i> 5 new members joined
				                    </a>
				                  </li>
				                  <li>
				                    <a href="#">
				                      <i class="fa fa-shopping-cart text-green"></i> 25 sales made
				                    </a>
				                  </li>
				                  <li>
				                    <a href="#">
				                      <i class="fa fa-user text-red"></i> You changed your username
				                    </a>
				                  </li>
				                </ul>
			              	</li>
			              	<li class="footer"><a href="#">View all</a></li>
			            </ul>
		          	</li>          
		          	<?= $this->modun('index')->accInfo()?>
		        </ul>
	      	</div>
	    </nav>
	</header>
	<aside class="main-sidebar">
	    <section class="sidebar">        
	      	<?= $this->modun('index')->admin_menu()?>
	    </section>
	</aside>