<?php if(CTL!='about'):?>
<section class="subcribe-area" style="background: url('<?=IMG?>bg_newsletter.jpg')">
	<div class="row container subcribe-bar text-center">
        <form id="email_subcribe" action="" method="_POST">
		    <h1 class="section__title"><?php if($manager):?> <div class="edit-sbtitle"><input type="text" class="edit-form" value="<?=$this->modun('text')->getSbTitle()?>"><i class="fa fa-edit"  data-id="1" style="right:-20px;"></i></div><?php else: echo $this->modun('text')->getSbTitle(); endif;?></h1>
		    <p class="section__lede section__lede--large">
		    	<?php if($manager):?> <textarea class="edit-form"><?=$this->modun('text')->getSbContent()?></textarea><i class="fa fa-edit" data-id="2" style="right:-20px;"></i> <?php else: echo $this->modun('text')->getSbContent(); endif;?>
		    </p>
    		<div class="input_field">
        		<input type="email" name="email" placeholder="Enter your email">
        		<button type="submit" class="btn">Subscribe <i class="fa fa-long-arrow-right"></i></button>
    		</div>
    	</form>
	</div>
</section>
<?php endif;?>
<footer class="container">
	<div class="row footer-bar">
		<div class="col-md-5">
			<h3 class="customer-title">Customer Service</h3>
			<ul class="customer-list">
				<li class="customer-item"><a href="">Help / FAQ</a></li>
				<li class="customer-item"><a href="">Size Charts</a></li>
				<li class="customer-item"><a href="">Returns &amp; Exchanges</a></li>
				<li class="customer-item"><a href="">Contact Us</a></li>
			</ul>
		</div>
		<div class="col-md-2 text-center">
			<h3 class="about-title">About</h3>
			<ul class="about-list">
				<li class="about-item"><a href="">Our Story</a></li>
				<li class="about-item"><a href="">Giving Back</a></li>
				<li class="about-item"><a href="">Resources</a></li>
				<li class="about-item"><a href="">Shop</a></li>
			</ul>			
		</div>
		<div class="col-md-5 text-right">
			<img src="<?=IMG?>logo/bottom.png" alt="">
			<h5 class="right-footer">
				<p>© Mah Pte Ltd. 2017</p>
				<p>All images and content may not be</p>
				<p>used without permission.</p>
			</h5>
			<a href="" class="social-item"><i class="fa fa-twitter-square fa-2x"></i></a>
			<a href="" class="social-item"><i class="fa fa-instagram fa-2x"></i></a>
			<a href="" class="social-item"><i class="fa fa-facebook-square fa-2x"></i></a>
		</div>
	</div>
</footer>
<script>
var LG=$("body").attr("lg"),URL=$("body").attr("url"),CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
window.fbAsyncInit = function() {
    // FB JavaScript SDK configuration and setup
    FB.init({
      appId      : '149216815775476', // FB App ID
      cookie     : true,  // enable cookies to allow the server to access the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });
    
    // Check whether the user already logged in
    FB.getLoginStatus(function(response) {
        if (response.status === 'connected') {
            //display user data
            getFbUserData();
        }
    });
};

// Load the JavaScript SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.12&appId=149216815775476&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Facebook login with JavaScript SDK
function fbLogin() {
    FB.login(function (response) {
        if (response.authResponse) {
            // Get and display the user profile data
            getFbUserData();
        } else {
            document.getElementById('status').innerHTML = 'User cancelled login or did not fully authorize.';
        }
    }, {scope: 'email'});
}

// Fetch the user profile data from facebook
function getFbUserData(){
    FB.api('/me', {locale: 'en_US', fields: 'id,first_name,last_name,email,link,gender,locale,picture'},
    function (response) {
    	$.post(URL+'checkUser',{data:response},function (data) {
    		console.log(data);
    	},'json');
        // document.getElementById('fbLink').setAttribute("onclick","fbLogout()");
        // document.getElementById('fbLink').innerHTML = 'Logout from Facebook';
        // document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.first_name + '!';
        // document.getElementById('userData').innerHTML = '<p><b>FB ID:</b> '+response.id+'</p><p><b>Name:</b> '+response.first_name+' '+response.last_name+'</p><p><b>Email:</b> '+response.email+'</p><p><b>Gender:</b> '+response.gender+'</p><p><b>Locale:</b> '+response.locale+'</p><p><b>Picture:</b> <img src="'+response.picture.data.url+'"/></p><p><b>FB Profile:</b> <a target="_blank" href="'+response.link+'">click to view profile</a></p>';
    });
}

// Logout from facebook
// function fbLogout() {
//     FB.logout(function() {
//         document.getElementById('fbLink').setAttribute({"onclick":"fbLogin()","class":"btn btn-block btn-raised btn-info"});
//         document.getElementById('fbLink').innerHTML = '<i class="fa fa-facebook pull-left"></i> Continue with Facebook';
        // document.getElementById('userData').innerHTML = '';
        // document.getElementById('status').innerHTML = 'You have successfully logout from Facebook.';
    // });
// }
</script>
</body>
</html>