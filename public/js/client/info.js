;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url"),CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
	  	$(document).on('change','input[type=file].update-img',function () {
            var _orign=$(this);
            var _responsive=_orign.data('responsive');
            var reader = new FileReader();
            reader.onload = function (e) {
                _orign.siblings(_responsive).css('background','url('+e.target.result+')');
            }
            reader.readAsDataURL(this.files[0]);
        })
        $('#birthday').bootstrapMaterialDatePicker({nowButton:true,time:false,format : 'YYYY-MM-DD'}).on('change', function(e,date){});//YYYY-MM-DD hh:mm A
    });
})(jQuery, window);
