;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");		
	  	$(document).on('change',"#template",function () {
	  		var question=confirm("Do you want to change system template?");
	  		if(question){
		  		$.post(URL+CTL+'/changeTemplate',{id:$(this).val()},function (o) {
		  			location.reload();
		  		},'json');
	  		}
	  	})
    });
})(jQuery, window);
