;(function ($, window, undefined) { 
    $(document).ready(function () {
        var LG=$("body").attr("lg"),URL=$("body").attr("url"),CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
        var stripe = Stripe('pk_test_ER93ADK1NVXcNaMr3012WWaK');
        var elements = stripe.elements();
        var style = {
          base: {
            color: '#32325d',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            '::placeholder': {
              color: '#aab7c4'
            }
          },
          invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
          }
        };
        var card = elements.create('card', { style: style });        
        card.addEventListener('change', function(event) {
            var displayError = document.getElementById('card-errors');
            if (event.error) {
                displayError.textContent = event.error.message;
            } else {
                displayError.textContent = '';
            }
        });
        $(document).on('click','.update-order',function () {
            if($("#contact_name").val()==''||$("#contact_mail").val()==''||$("#description").val()==''||$("#ship_name").val()==''||$("#ship_address").val()==''||$("#ship_city").val()==''||$("#ship_phone").val()==''||$("#ship_country").val()==''){
                toastr.clear();
                toastr.options.closeButton = true;
                toastr.options.positionClass='toast-top-right';
                toastr.error('Please key on order information form!', '');
            }else{
                $("#order-form").submit();
            }
        })
        $(document).on('change','.qty-input',function (){
            var _oringin=$(this);
            var _qty=_oringin.val();
            var _id=_oringin.attr('data-id');
            if(_qty<=0){
                _check=confirm("Do you want to remove this item?");
                if(_check){
                    $.post(URL+CTL+'/removeCart',{item:_id},function(data) {
                        _oringin.parent().parent().remove();
                    },'json');
                }else{
                    _oringin.val(1);
                }
            }
        })  
        $(document).on('click','.cash-delivery',function () {
            if($("#delivery").val()==''){
                toastr.clear();
                toastr.options.closeButton = true;
                toastr.options.positionClass='toast-top-right'; //toast-top-left//toast-top-full-width//toast-top-right//toast-bottom-center//toast-bottom-full-width
                toastr.error('Please choose delivery time!', '');//error//warning//success//info
            }else{
                $("#delivery-form").submit();
            }
        })
        $(document).on('click','.credit-card',function () {
            if($("#card-element").children().length < 1){
                toastr.clear();
                toastr.options.closeButton = true;
                toastr.options.positionClass='toast-top-right'; //toast-top-left//toast-top-full-width//toast-top-right//toast-bottom-center//toast-bottom-full-width
                toastr.warning('Please key card info and choose delivery time!', '');
                card.mount('#card-element');
            }else{
                stripe.createToken(card).then(function(result) {
                    if (result.error) {
                      // Inform the user if there was an error
                        var errorElement = document.getElementById('card-errors');
                        errorElement.textContent = result.error.message;
                    } else {
                      // Send the token to your server
                        $('#delivery-form').append($('<input/>',{type:'hidden',name:'stripeToken'}).val(result.token.id)).attr('action',URL+CTL+'/payCreditCard').submit();
                    }
                });
            }            
        })
        $('#delivery-time.delivery-time').bootstrapMaterialDatePicker({nowButton:true,time:true,format : 'YYYY-MM-DD hh:mm A'}).on('change', function(e,date){
            $("#delivery").val(moment(date).format("YYYY-MM-DD hh:mm:ss"))
        });
    });
})(jQuery, window);
