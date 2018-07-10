$(document).ready(function () {		
  	var LG=$("body").attr("lg"),CTL=$("body").attr("ctl"),ACT=$("body").attr("act");	
  	$(document).on("click",function(e){
		if(!$(e.target).closest('.alert.alert-danger').length){
			$('.alert.notify[role="alert"]').slideUp("slow",function () {
				$(this).parent().remove();
			});
        }
	});
});