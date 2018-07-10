;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url"),CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
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
    });
})(jQuery, window);
