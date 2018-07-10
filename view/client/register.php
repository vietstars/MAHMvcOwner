  <!-- BEGIN LOGIN SECTION -->
  <script src='https://www.google.com/recaptcha/api.js'></script>
  <section class="section-account">
    <div class="img-backdrop" style="background-image: url('<?= $this->modun('image')->getImg('bg.jpeg','root')?>');height: 200px;"></div>
    <div class="spacer" style="height: 200px;"></div>
    <div class="card contain-sm style-transparent">
      <div class="card-body">
        <div class="row">
          <div class="col-sm-8 col-sm-offset-2">
            <br>
            <span class="text-lg text-bold text-primary">REGISTER</span>
            <br><br>
            <form class="form" action="" method="post">
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="fullname" name="fullname">
                <label for="fullname">Display Name</label>
              </div>
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="username" name="login">
                <label for="username">Email</label>
              </div>
              <div class="form-group floating-label">
                <input type="password" class="form-control" id="password" name="password" autocomplete="new-password">
                <label for="password">Password</label>
              </div>
              <div class="form-group floating-label">
                <input type="password" class="form-control" id="password" name="repassword" autocomplete="new-password">
                <label for="password">Re password</label>
              </div>
              <div class="form-group">
                <center>
                    <div class="g-recaptcha" data-sitekey="6LcKDikTAAAAAJ9pWYtadbDh5568p2dmA0LxpeFd"></div>
                </center>
              </div>
            </div>
              <br>
              <div class="row">
                <div class="col-xs-12 text-right">
                  <button class="btn btn-primary btn-raised" type="submit">Register</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>