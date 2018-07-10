;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
	  	$('#editor').summernote({	  		
	      	upload:$("body").attr("url")+'api/imgCode',
	      	disableDragAndDrop: true,
	      	folder:'editor',
	      	height: 230,
	  	});
	  	$('#show-editor').summernote({	  		
	      	upload:$("body").attr("url")+'api/imgCode',
	      	disableDragAndDrop: true,
	      	folder:'editor',
	      	height: 300,
	  	});
    });
})(jQuery, window);
