  <!-- BEGIN LOGIN SECTION -->
  <section class="section-account">
    <div class="img-backdrop" style="background-image: url('<?= $this->modun('image')->getImg('bg.jpeg','root')?>');height: 200px;"></div>
    <div class="spacer" style="height: 200px;"></div>
    <div class="card contain-md style-transparent">
      <div class="card-body">
        <div class="row">
          <div class="col-sm-12">
            <br>
            <span class="text-lg text-bold text-primary">ORDER INFORMATION</span>
            <br><br>
            <form class="form" action="" method="post">
              <table id="order-info" class="table table-bordered table-hover dataTable table-responsive">
                <thead>
                <tr>
                  <th>Sub total</th>
                  <th>Tax</th>
                  <th>Amount</th>
                </tr>
                </thead>
                <tbody>
                  <tr><td class="text-right"><h4><input type="hidden" name="order[subtotal]" value="<?=$data->subtotal;?>"><?='S$: '.$data->subtotal;?></h4></td><td class="text-right"><h4><input type="hidden" name="order[tax]" value="<?=$data->tax;?>"><?='S$: '.$data->tax;?></h4></td><td class="text-right text-danger"><h4><input type="hidden" name="order[amount]" value="<?=$data->amount;?>"><?='S$: '.$data->amount;?></h4></td></tr>
                </tbody>
              </table>
              <h4>CONTACT INFORMATION</h4>
              <div class="row">
                <div class="col-xs-6">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="order[contact_name]" value="<?=isset($user->name)?$user->name:null;?>">
                    <label for="contact_name">Contact name</label>
                  </div>
                </div>
                <div class="col-xs-6">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="order[contact_email]" value="<?=isset($user->email)?$user->email:null;?>">
                    <label for="contact_email">Contact Email</label>
                  </div>
                </div>
                <div class="col-xs-12">
                  <div class="form-group floating-label">
                    <textarea class="form-control order-note" name="order[description]" rows="3"></textarea>
                    <label for="contact_email">Description this order</label>
                  </div>
                </div>
              </div>
              <h4>SHIPPING INFORMATION</h4>
              <div class="row">
                <div class="col-xs-6">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[name]" value="<?=isset($user->name)?$user->name:null;?>">
                    <label for="contact_name">Name</label>
                  </div>
                </div>
                <div class="col-xs-6">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[company]" value="<?=isset($user->company)?$user->company:null;?>">
                    <label for="ship_company">Company (optional)</label>
                  </div>
                </div>
                <div class="col-xs-7">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[address]" value="<?=isset($user->address)?$user->address:null;?>">
                    <label for="ship_address">Address</label>
                  </div>
                </div>
                <div class="col-xs-5">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[suite]" value="<?=isset($user->suite)?$user->suite:null;?>">
                    <label for="ship_suite">Apt, suite, etc. (optional)</label>
                  </div>
                </div>
                <div class="col-xs-8">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[city]" value="<?=isset($user->city)?$user->city:null;?>">
                    <label for="ship_city">City</label>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[phone]" value="<?=isset($user->phone)?$user->phone:null;?>">
                    <label for="ship_phone">Phone</label>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[country]" value="<?=isset($user->country)?$user->country:null;?>">
                    <label for="ship_country">Country</label>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[state]" value="<?=isset($user->state)?$user->state:null;?>">
                    <label for="ship_state">State</label>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[code]" value="<?=isset($user->code)?$user->code:null;?>">
                    <label for="ship_code">Zip code</label>
                  </div>
                </div>
              </div>
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