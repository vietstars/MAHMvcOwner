  <!-- BEGIN LOGIN SECTION -->
  <section class="section-account">
    <div class="img-backdrop" style="background-image: url('<?= $this->modun('image')->getImg('bg.jpeg','root')?>');height: 200px;"></div>
    <div class="spacer" style="height: 200px;"></div>
    <div class="card contain-md style-transparent">
      <div class="card-body">
        <div class="row">
          <div class="col-sm-12">
            <br>
            <span class="text-lg text-bold text-primary">SHOPPING CART</span>
            <br><br>
            <form class="form" action="" method="post">
              <table id="item-list" class="table table-bordered table-hover dataTable table-responsive">
                <thead>
                <tr>
                  <th width="8%">Image</th>
                  <th width="20%">Product name/ <small>Description</small></th>
                  <th class="text-right" width="5%">Quantity</th>
                  <th class="text-right" width="10%">Unit price</th>
                  <th class="text-right" width="10%">Total</th>
                </tr>
                </thead>
                <tbody>
                  <?php $total=0;foreach($cart as $item):?>                    
                    <tr><td><div class="img-circle size-1" style="background:url(<?=$this->modun('image')->getImg($item->image,'product',1);?>)" alt=""></div></td><td><h5><?=$item->name?></h5><small><?=$item->item_desc?></small></td><td class="text-right"><input type="hidden" name="item[<?=$item->id?>][price]" value="<?=round($item->price,2)?>"><input class="qty-input" data-id="<?=$item->id?>" type="number" name="item[<?=$item->id?>][qty]" value="<?=$item->qty?>"></td><td class="text-right"><?=$item->price?></td><td class="text-right"><?php $total+=round($item->qty*$item->price,2); echo'S$: '.round($item->qty*$item->price,2)?></td></tr>
                  <?php endforeach;?>
                  <tr><td></td><td></td><td></td><td>Sub total</td><td class="text-right"><b><?='S$: '.round($total,2)?></b></td></tr>
                  <tr><td></td><td></td><td></td><td>GST 7%</td><td class="text-right"><b><?php $tax=round(($total*7)/100,2);echo'S$: '.round(($total*7)/100,2)?></b></td></tr>
                  <tr><td></td><td></td><td></td><td>Order's amount</td><td class="text-right text-danger"><h4><?='S$: '.round(($total+$tax),2);?></h4></td></tr>
                </tbody>
              </table>
              <div class="row">
                <div class="col-xs-12 text-right">
                  <a class="btn btn-info btn-raised" href="<?=URL?>myCart/orderInfo">Continue to payment method</a>
                  <button class="btn btn-primary btn-raised" type="submit">Update</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>