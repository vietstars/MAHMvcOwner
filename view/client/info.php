  <!-- BEGIN LOGIN SECTION -->
  <section class="section-account">
    <div class="img-backdrop" style="background-image: url('<?= $this->modun('image')->getImg('bg.jpeg','root')?>');height: 200px;"></div>
    <div class="spacer" style="height: 200px;"></div>
    <div class="card contain-sm style-transparent">
      <div class="card-body">
        <div class="row">
          <div class="col-sm-8 col-sm-offset-2">
            <br>
            <span class="text-lg text-bold text-primary">Account Infomation</span>            
            <br><br>
            <form class="form" action="" method="post" enctype="multipart/form-data">
              <div class="form-group avatar-file">
                <input type="file" name="file" class="update-img" id="file" data-responsive=".current-image">
                <div class="img-circle size-2 current-image" style="background:url('<?=$this->modun('image')->getImg($info->avatar,'avatar');?>')" alt=""></div>
              </div>
              <h2>Email: <?=($info->email)?$info->email:null;?></h2>
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="fullname" name="fullname" value="<?=($info->fullname)?$info->fullname:null;?>">
                <label for="username">Display name</label>
              </div>
              <div class="form-group floating-label">
                <select class="form-control dirty static" name="gender">
                  <option value="male" <?=($info->gender=='male')?'selected':null;?>>Male</option>
                  <option value="female" <?=($info->gender=='female')?'selected':null;?>>Female</option>
                </select>
                <label for="phone">Gender</label>
              </div>
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="id_no" name="id_no" value="<?=($info->id_no)?$info->id_no:null;?>">
                <label for="id_no">Identity No</label>
              </div>
              <div class="form-group floating-label">
                <input type="password" class="form-control" id="password" name="password" autocomplete="new-password">
                <label for="password">Password</label>
              </div>
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="birthday" name="birthday" value="<?=($info->birthday)?$info->birthday:null;?>">
                <label for="birthday">Birthday</label>
              </div>
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="mobile" name="mobile" value="<?=($info->mobile)?$info->mobile:null;?>">
                <label for="mobile">Mobile</label>
              </div>
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="phone" name="phone" value="<?=($info->phone)?$info->phone:null;?>">
                <label for="phone">Phone</label>
              </div>
              <div class="form-group floating-label">
                <input type="text" class="form-control" id="address" name="address" value="<?=($info->address)?$info->address:null;?>">
                <label for="address">Address</label>
              </div>
              <br>
              <div class="row">
                <div class="col-xs-12 text-right">
                  <button class="btn btn-primary btn-raised" type="submit">Update</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>