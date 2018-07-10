  <!-- BEGIN LOGIN SECTION -->
  <section class="section-account">
    <div class="img-backdrop" style="background-image: url('<?= $this->modun('image')->getImg('bg.jpeg','root')?>');height: 200px;"></div>
    <div class="spacer" style="height: 200px;"></div>
    <div class="card contain-lg style-transparent">
      <div class="card-body">
        <div class="row">
          <div class="col-sm-12">
            <br>
            <span class="text-lg text-bold text-primary">SHOPPING HISTORY</span>
            <br><br>
            <form class="form" action="" method="post">
              <table id="shopping-list" class="table table-bordered table-hover dataTable table-responsive">
                <thead>
                <tr>
                  <th width="15%">Type - <small>Status/ <br>Code</small></th>
                  <th class="text-right" width="8%">Sub total<small>/ <br>Tax</small></th>
                  <th class="text-right" width="8%">Amount</th>
                  <th class="text-right" width="10%">Contact</th>
                  <th class="text-right" width="44%">Description</th>
                  <th class="text-right" width="15%">Delivery<small>/ <br>Payment</small></th>
                </tr>
                </thead>
                <tbody>
                  <?php foreach($history as $shop):
                  $type=($shop->status=='i')?'Invoice':'Order';
                  if($shop->status=='i'&&$shop->action=='p')$type.='<small class="pull-right text-warning">Pending</small>';
                  if($shop->status=='i'&&$shop->action=='a')$type.='<small class="pull-right text-primary">Agreement</small>';
                  if($shop->status=='i'&&$shop->action=='r')$type.='<small class="pull-right text-danger">Refund</small>';
                  ?>                    
                    <tr>
                      <td width="15%"><a href="<?=URL?>history/<?=($shop->status=='i')?'invoice/':'order/';echo$shop->id;?>"><?=$type.'<br>'.$shop->code?></a></td>
                      <td class="text-right" width="8%"><?=$shop->subtotal.'<br><small>'.$shop->tax.'</small>'?></td>
                      <td class="text-right text-danger" width="8%"><b>S$: <?=$shop->amount?></b></td>
                      <td width="10%"><?=ucfirst($shop->contact_name).'<br>'.$shop->contact_email?></td>
                      <td width="44%"><?=$shop->description?></td>
                      <td class="text-right" width="15%"><?= $shop->delivery.'<br>'.$shop->payment?></td>
                    </tr>
                  <?php endforeach;?>
                </tbody>
              </table>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>