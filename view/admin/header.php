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
<body class="menubar-hoverable header-fixed menubar-first full-content" lg="<?=isset($_COOKIE['lg'])?$_COOKIE['lg']:'en'?>" url="<?=URL?>" ctl="<?=CTL?>" act="<?=ACT?>">
  	<header id="header">
		<div class="headerbar">
		  	<div class="headerbar-left">
			    <ul class="header-nav header-nav-options">
			      	<li class="header-nav-brand">
			        	<div class="brand-holder">
			          	<a href="<?=URL?>">
			            	<span class="text-lg text-bold text-primary"><?=isset($header->title)?$header->title:'VIETSTART'?></span>
			          	</a>
			        	</div>
			      	</li>
			      	<li>
			        <a class="btn btn-icon-toggle menubar-toggle" data-toggle="menubar" href="#">
			          	<i class="fa fa-bars"></i>
			        	</a>
			      	</li>
			    </ul>
		  	</div>
  			<div class="headerbar-right">
    			<ul class="header-nav header-nav-options">
      			<li>
        			<form class="navbar-search" role="search">
          			<div class="form-group">
            			<input type="text" class="form-control" name="headerSearch" placeholder="Enter your keyword">
          			</div>
          			<button type="submit" class="btn btn-icon-toggle ink-reaction"><i class="fa fa-search"></i></button>
        			</form>
      			</li>
      			<li class="dropdown hidden-xs">
        			<a href="#" class="btn btn-icon-toggle btn-default" data-toggle="dropdown">
          			<i class="fa fa-bell"></i><sup class="badge style-danger">4</sup>
        			</a>
        			<ul class="dropdown-menu animation-expand">
          			<li class="dropdown-header">Today's messages</li>
          			<li>
            			<a class="alert alert-callout alert-warning" href="#">
              			<img class="pull-right img-circle dropdown-avatar" src="<?=$this->modun('image')->getImg('1502769675_user2_160x160.jpg','avatar')?>" alt="">
              			<strong>Alex Anistor</strong><br>
              			<small>Testing functionality...</small>
            			</a>
          			</li>
          			<li>
            			<a class="alert alert-callout alert-info" href="#">
              			<img class="pull-right img-circle dropdown-avatar" src="<?=$this->modun('image')->getImg('1502769675_user2_160x160.jpg','avatar')?>" alt="">
              			<strong>Alicia Adell</strong><br>
              			<small>Reviewing last changes...</small>
            			</a>
          			</li>
          			<li class="dropdown-header">Options</li>
          			<li><a href="<?=URL?>">View all messages <span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
          			<li><a href="<?=URL?>">Mark as read <span class="pull-right"><i class="fa fa-arrow-right"></i></span></a></li>
        			</ul>
      			</li>
      			<li class="dropdown hidden-xs">
        			<a href="#" class="btn btn-icon-toggle btn-default" data-toggle="dropdown">
          			<i class="fa fa-area-chart"></i>
        			</a>
        			<ul class="dropdown-menu animation-expand">
          			<li class="dropdown-header">Server load</li>
          			<li class="dropdown-progress">
            			<a href="#">
              			<div class="dropdown-label">
                			<span class="text-light">Server load <strong>Today</strong></span>
                			<strong class="pull-right">93%</strong>
              			</div>
              			<div class="progress"><div class="progress-bar progress-bar-danger" style="width: 93%"></div></div>
            			</a>
          			</li>
          			<li class="dropdown-progress">
            			<a href="#">
              			<div class="dropdown-label">
                			<span class="text-light">Server load <strong>Yesterday</strong></span>
                			<strong class="pull-right">30%</strong>
              			</div>
              			<div class="progress"><div class="progress-bar progress-bar-success" style="width: 30%"></div></div>
            			</a>
          			</li>
          			<li class="dropdown-progress">
            			<a href="#">
              			<div class="dropdown-label">
                			<span class="text-light">Server load <strong>Lastweek</strong></span>
                			<strong class="pull-right">74%</strong>
              			</div>
              			<div class="progress"><div class="progress-bar progress-bar-warning" style="width: 74%"></div></div>
            			</a>
          			</li>
        			</ul>
      			</li>
    			</ul>
    			<?=$this->modun('index')->accInfo()?>
    			<!-- <ul class="header-nav header-nav-toggle">
            <li>
              <a class="btn btn-icon-toggle btn-default" href="#offcanvas-search" data-toggle="offcanvas" data-backdrop="false">
                  <i class="fa fa-ellipsis-v"></i>
              </a>
            </li>
          </ul> -->
  			</div>
		</div>
	</header>