<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Installation Wizard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Goldin Shipping Pte Ltd - Singapore Goldin Shipping Pte Ltd Distributor">
<meta name="description" content="Goldin Shipping Pte Ltd - Singapore Goldin Shipping Pte Ltd Distributor">
<link rel="icon" type="image/png" href="<?=URL?>public/img/goldin.png">
<link rel="stylesheet" href="<?=URL?>public/css/client/010-error.css?ver=0.0.2">
</head>
<body>
	<div class="install-page">
		<h1>WEBEMPIRE <br><h2>Installation Wizard</h2></h1>
		<p>
			<fieldset class="description">
		        <legend>Welcome to the Webempire Installation Wizard</legend>
		        <div>
		        	<ul>
		             	<li class="error">Your application can't connect database.</li>
		             	<li class="error">Please key correct system information into fields.</li>
		            </ul>
		        </div>
		    </fieldset>
		    <fieldset class="info">
		        <legend>System Infomation</legend>
		        <form action="" method="post">
			        <div class="sys_info">
			        	<center>Connection infomation</center>
			        	<div class="input-group">
						  <label for="hostname">Host name</span>
						  <input type="text" class="form-control" placeholder="localhost" id="hostname" name="hostname">
						</div>
			        	<div class="input-group">
						  <label for="dbname">Database name</span>
						  <input type="text" class="form-control" placeholder="database name" id="dbname" name="dbname">
						</div>
			        	<div class="input-group">
						  <label for="prefix">Database prefix</span>
						  <input type="text" class="form-control" placeholder="database prefix" id="prefix" name="prefix">
						</div>
			        	<div class="input-group">
						  <label for="dbuser">Username</span>
						  <input type="text" class="form-control" placeholder="username" id="dbuser" name="dbuser">
						</div>
			        	<div class="input-group">
						  <label for="dbpass">Password</span>
						  <input type="password" class="form-control" placeholder="password" id="dbpass" name="dbpass" autocomplete="new-password">
						</div>
						<hr>
						<center>Application confirm</center>
			        	<div class="input-group">
						  <label for="appkey">Key</span>
						  <input type="text" class="form-control" placeholder="Application key" id="appkey" name="appkey" value="<?=substr(hash('SHA512',$_SERVER['SERVER_NAME'].'_forever'),pow(SHA,1/3)*6+1,log10(0.1)*round(pow(SHA,1/3)*6))?>">
						</div>
			        	<div class="input-group">
						  <label for="domain">Domain</span>
						  <input type="text" class="form-control" placeholder="Domain" id="domain" name="domain" value="<?=$_SERVER['SERVER_NAME']?>">
						</div>
			        	<div class="input-group">
						  <label for="expiry">Expiry date</span>
						  <input type="text" class="form-control" placeholder="Expiry date" id="expiry" name="expiry" value="forever">
						</div>
						<hr>
						<center>Management infomation</center>
			        	<div class="input-group">
						  <label for="user">Admin email</span>
						  <input type="text" class="form-control" placeholder="email" id="user" name="user">
						</div>
			        	<div class="input-group">
						  <label for="pass">Admin password</span>
						  <input type="text" class="form-control" placeholder="Password" id="pass" name="password" autocomplete="new-password">
						</div>
			        </div>
			        <button type="submit"> Install </button>
		        </form>
		    </fieldset>
	    </p>
	</div>
</body>
</html>