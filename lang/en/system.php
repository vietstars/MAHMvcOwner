<?php
$lang = array(
	'Login'=>'Login',
	'Logout'=>'Logout',
	'Dashboard'=>'Dashboard',
	'Error title' => 'Page Not Found',
	'Error description' => 'Your page not found or your url is not access by system.<br>If the error continue please contact us<br><button onclick="location.href=\''.URL.'\'"> Home page </button>',
	'copyright'=>'Company © '.date('Y').' | Developed by: ',
	'Error dbtitle' => 'Connection problems',
	'Error dbdescription' => '<center>Our System can\'t connected database! <br>Please waiting 5\' then refresh or contact our admin email for this error<br><small style="color:blue">Email: vietstar.nt@gmail.com</small><br>Or you want to reinstall app?</center><button onclick="location.href=\''.URL.'reinstall\'"> Reinstall </button>',
	'Error Extitle' => 'End of Expiry',
	'Error Exdescription' => '<form action="'.URL.'reinstall" method="post"><center>Your Key is expiry<br>Please contact our admin email for get new key<br><small style="color:blue">Email: vietstar.nt@gmail.com</small><br>Or you want to reinstall app?<br></center><div class="input-field"><input type="text" id="key" name="key" placeholder="Enter Key"><label for="key">Key</label></div><div class="input-field"><input type="text" id="domain" name="domain" placeholder="Domain"><label for="domain">Domain (key: '.$_SERVER['SERVER_NAME'].')</label></div><div class="input-field"><input type="text" id="expiry" name="expiry" placeholder="Enter Expiry"><label for="expiry">Expiry</label></div><button type="submit">Reinstall</button></form>'
);