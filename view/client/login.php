  <!-- BEGIN LOGIN SECTION -->
  <section class="section-account">
    <div class="img-backdrop" style="background-image: url('<?= $this->modun('image')->getImg('bg.jpeg','root')?>');height: 200px;"></div>
    <div class="spacer" style="height: 200px;"></div>
    <div class="card contain-sm style-transparent">
      <div class="card-body">
        <div class="row">
          <div class="col-sm-6">
            <br>
            <span class="text-lg text-bold text-primary"><?=isset($header->title)?$header->title:'VIETSTART'?></span>
            <br><br>
            <form class="form" action="" method="post">
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="username" name="login">
                <label for="username">Email</label>
              </div>
              <div class="form-group floating-label">
                <input type="password" class="form-control" id="password" name="password" autocomplete="new-password">
                <label for="password">Password</label>
                <p class="help-block"><a href="#">Forgotten?</a></p>
              </div>
              <br>
              <div class="row">
                <div class="col-xs-6 text-left">
                  <div class="checkbox checkbox-inline checkbox-styled">
                    <label>
                      <input type="checkbox"> <span>Remember me</span>
                    </label>
                  </div>
                </div>
                <div class="col-xs-6 text-right">
                  <button class="btn btn-primary btn-raised" type="submit">Login</button>
                </div>
              </div>
            </form>
          </div>
          <div class="col-sm-5 col-sm-offset-1 text-center">
            <br><br>
            <h3 class="text-light">
              No account yet?
            </h3>
            <a class="btn btn-block btn-raised btn-primary" href="<?=URL.'register'?>">Sign up here</a> 
            <br>
            Or
            <br>
            <div id="status"></div>
            <!-- Facebook login or logout button -->
            <a href="javascript:void(0);" class="btn btn-block btn-raised btn-info" onclick="fbLogin()" id="fbLink"><i class="fa fa-facebook pull-left"></i> Continue with Facebook</a>
            <!-- Display user profile data -->
            <!-- <div id="userData"></div> -->
          </div>
        </div>
      </div>
    </div>
  </section>