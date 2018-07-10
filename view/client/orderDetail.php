  <script src="https://js.stripe.com/v3/"></script>
  <!-- BEGIN LOGIN SECTION -->
  <section class="section-account">
    <div class="img-backdrop" style="background-image: url('<?= $this->modun('image')->getImg('bg.jpeg','root')?>');height: 200px;"></div>
    <div class="spacer" style="height: 200px;"></div>
    <div class="card contain-md style-transparent">
      <div class="card-body">
        <div class="row">
          <div class="col-sm-12">
            <br>
            <br><br>
            <form class="form" id="order-form" action="" method="post">
              <span class="text-lg text-bold text-primary">SHOPPING CART</span>
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
                    <tr><td><div class="img-circle size-1" style="background:url(<?=$this->modun('image')->getImg($item->image,'product',1);?>)" alt=""></div></td><td><h5><?=$item->name?></h5><small><?=$item->item_desc?></small></td>
                    <td class="text-right">
                    <?php if($order->status!='i'):?>
                      <input type="hidden" name="item[<?=$item->id?>][price]" value="<?=round($item->price,2)?>">
                      <input class="qty-input" data-id="<?=$item->id?>" type="number" name="item[<?=$item->id?>][qty]" value="<?=$item->qty?>">
                    <?php else:?>
                      <?=$item->qty?>
                    <?php endif;?>  
                    </td>
                    <td class="text-right"><?=$item->price?></td><td class="text-right"><?php $total+=round($item->qty*$item->price,2); echo'S$: '.round($item->qty*$item->price,2)?></td></tr>
                  <?php endforeach;?>
                  <tr><td></td><td></td><td></td><td>Sub total</td><td class="text-right"><b><?='S$: '.round($total,2)?></b></td></tr>
                  <tr><td></td><td></td><td></td><td>Tax</td><td class="text-right"><b><?php $tax=round(($total*7)/100,2);echo'S$: '.round(($total*7)/100,2)?></b></td></tr>
                  <tr><td></td><td></td><td></td><td>Order's amount</td><td class="text-right text-danger"><h4><?php $amount=round(($total+$tax),2);echo'S$: '.round(($total+$tax),2);?></h4></td></tr>
                </tbody>
              </table>
              <span class="text-lg text-bold text-primary">CONTACT INFORMATION</span>
              <div class="row">
                <div class="col-xs-6">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" id="contact_name" name="order[contact_name]" value="<?=isset($order->name)?$order->name:null;?>">
                    <label for="contact_name">Contact name</label>
                  </div>
                </div>
                <div class="col-xs-6">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" id="contact_mail" name="order[contact_email]" value="<?=isset($order->email)?$order->email:null;?>">
                    <label for="contact_email">Contact Email</label>
                  </div>
                </div>
                <div class="col-xs-12">
                  <div class="form-group floating-label">
                    <textarea class="form-control order-note" id="description" name="order[description]" rows="3"><?=isset($order->description)?$order->description:null;?></textarea>
                    <label for="contact_email">Description this order</label>
                  </div>
                </div>
              </div>
              <span class="text-lg text-bold text-primary">SHIPPING INFORMATION</span>
              <div class="row">
                <div class="col-xs-6">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" id="ship_name" name="ship[name]" value="<?=isset($ship->name)?$ship->name:null;?>">
                    <label for="contact_name">Name</label>
                  </div>
                </div>
                <div class="col-xs-6">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[company]" value="<?=isset($ship->company)?$ship->company:null;?>">
                    <label for="ship_company">Company (optional)</label>
                  </div>
                </div>
                <div class="col-xs-7">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" id="ship_address" name="ship[address]" value="<?=isset($ship->address)?$ship->address:null;?>">
                    <label for="ship_address">Address</label>
                  </div>
                </div>
                <div class="col-xs-5">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[suite]" value="<?=isset($ship->suite)?$ship->suite:null;?>">
                    <label for="ship_suite">Apt, suite, etc. (optional)</label>
                  </div>
                </div>
                <div class="col-xs-8">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" id="ship_city" name="ship[city]" value="<?=isset($ship->city)?$ship->city:null;?>">
                    <label for="ship_city">City</label>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" id="ship_phone" name="ship[phone]" value="<?=isset($ship->phone)?$ship->phone:null;?>">
                    <label for="ship_phone">Phone</label>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" id="ship_country" name="ship[country]" value="<?=isset($ship->country)?$ship->country:null;?>">
                    <label for="ship_country">Country</label>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[state]" value="<?=isset($ship->state)?$ship->state:null;?>">
                    <label for="ship_state">State (optional)</label>
                  </div>
                </div>
                <div class="col-xs-4">
                  <div class="form-group floating-label">
                    <input type="text" class="form-control" name="ship[code]" value="<?=isset($ship->zipcode)?$ship->zipcode:null;?>">
                    <label for="ship_code">Zip code (optional)</label>
                  </div>
                </div>
              </div>
              <?php if($order->status!='i'):?>
                <div class="row">                
                  <div class="col-xs-12 text-right">
                    <button class="btn btn-primary btn-raised update-order" type="button">Update</button>
                  </div>
                </div>
              <?php endif;?>
            </form>
            <form class="form" id="delivery-form" action="" method="post">
              <div class="row">
                <?php if($order->status=='i'):?>
                  <div class="col-xs-6"> 
                    <div class="form-group floating-label">
                      <input type="text" class="form-control" id="payment" name="payment" value="<?=($order->payment)?ucfirst($order->payment):null;?>">
                      <label for="payment">Payment</label>
                    </div>
                  </div>
                  <div class="col-xs-6"> 
                    <div class="form-group floating-label">
                      <input type="text" class="form-control <?php if($order->status!='i'):?>delivery-time<?php endif;?>" id="delivery-time" name="delivery" value="<?=($order->delivery)?$order->delivery:null;?>">
                      <label for="delivery-time">Delivery time</label>
                    </div>
                  </div>
                <?php endif;?>
                <?php if($order->status=='o'):?>
                  <div class="col-xs-12"> 
                    <div class="form-group floating-label">
                      <input type="hidden" name="id" value="<?=isset($order->id)?$order->id:null;?>">
                      <input type="hidden" id="delivery" name="delivery">
                      <input type="text" class="form-control <?php if($order->status!='i'):?>delivery-time<?php endif;?>" id="delivery-time" readonly>
                      <label for="delivery-time">Choose the timing of delivery</label>
                    </div>
                    <div id="card-element" class="form-group">
                      <!-- a Stripe Element will be inserted here. -->
                    </div>
                    <!-- Used to display form errors -->
                    <div id="card-errors" role="alert"></div>
                  </div>
                  <div class="col-xs-4">
                    <div id="paypal-button-container" style="width:100%" ></div>
                  </div>
                  <div class="col-xs-4">
                    <button class="btn btn-accent btn-raised credit-card" style="width:100%" type="button">Credit card</button>
                  </div>
                  <div class="col-xs-4">
                    <button class="btn btn-warning btn-raised cash-delivery" style="width:100%" type="button">Cash on delivery</button>
                  </div>
                <?php endif;?>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
<script src="https://www.paypalobjects.com/api/checkout.js"></script>
<script>      
    paypal.Button.render({
      env: 'sandbox', // sandbox | production
      // PayPal Client IDs - replace with your own
      // Create a PayPal app: https://developer.paypal.com/developer/applications/create
      style: {
          label: 'paypal',
          size:  'medium',    // small | medium | large | responsive
          shape: 'rect',     // pill | rect
          color: 'blue',     // gold | blue | silver | black
          tagline: false    
      },
      client: {
          sandbox:    'AVt0pfVANd2eZadON0PLLjuQTQ9Wn6CQbTF32GvzjQVjY_kOV_y2GEM4EnBdgQ7V7N08oN0DXFPSMqOl',
          production: 'AVt0pfVANd2eZadON0PLLjuQTQ9Wn6CQbTF32GvzjQVjY_kOV_y2GEM4EnBdgQ7V7N08oN0DXFPSMqOl'
      },
      // Show the buyer a 'Pay Now' button in the checkout flow
      commit: true,
      // payment() is called when the button is clicked
      payment: function(data, actions) {
          // Make a call to the REST api to create the payment
          if($("#delivery").val()==''){
              toastr.options.closeButton = true;
              toastr.options.positionClass='toast-top-right'; //toast-top-left//toast-top-full-width//toast-top-right//toast-bottom-center//toast-bottom-full-width
              toastr.error('Please choose delivery time!', '');//error//warning//success//info
              return false;
          }else{
            return actions.payment.create({
                payment: {
                    transactions: [
                        {
                            amount: { total: '<?=$amount?>', currency: 'USD' }
                        }
                    ]
                }
            });
          }
      },
      // onAuthorize() is called when the buyer approves the payment
      onAuthorize: function(data, actions) {
          // Make a call to the REST api to execute the payment
          return actions.payment.execute().then(function() {
              $('#delivery-form').append($('<input/>',{type:'hidden',name:'orderID'}).val(data.orderID))
              .append($('<input/>',{type:'hidden',name:'payerID'}).val(data.payerID))
              .append($('<input/>',{type:'hidden',name:'paymentID'}).val(data.paymentID))
              .append($('<input/>',{type:'hidden',name:'returnUrl'}).val(data.returnUrl))
              .attr('action',URL+CTL+'/paypalPayment').submit();
          });
      }
    }, '#paypal-button-container');      
</script>