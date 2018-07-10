;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
	  	$("#inputNote").summernote({	  		
	      	upload:$("body").attr("url")+'api/imgCode',
	      	disableDragAndDrop: true,
	      	folder:'note',
	      	height: 230,
	  	});
	  	$("#inpuGeneral").summernote({	  		
	      	upload:$("body").attr("url")+'api/imgCode',
	      	disableDragAndDrop: true,
	      	folder:'note',
	      	height: 230,
	  	});
	  	$('#manager-list').DataTable({
	  		"iDisplayLength": 10,           
            "order": [],
            "paging": true,     
            "bAutoWidth": false,  
            "bSort": true,
            "processing": true,
            "serverSide": true, 
            "aoColumnDefs": [
                { "aTargets": [ 0 ], "bSortable": true },
                { "aTargets": [ 1 ], "bSortable": true },
                { "aTargets": [ 2 ], "bSortable": true },
                { "aTargets": [ 3 ], "bSortable": true },
                { "aTargets": [ 4 ], "bSortable": true },
                { "aTargets": [ -1 ], className: "text-right"},
                { "aTargets": [ '_all' ], "bSortable": false }                
            ],  
            "columns": [
                { "data": "fullname" },
                { "data": "id_no" },
                { "data": "birth" },
                { "data": "phone" },
                { "data": "datetime" }
            ],
            "ajax": {                   
                "url": URL+CTL+"/getUser/thefirst",
                "type": "POST"
            },
            "fnCreatedRow": function( nRow, aData, iDataIndex ) {                
                if(aData.ctl==1){
                	$(nRow).addClass('bg-danger');
                }                    
            },
	  	})
		$(".multi-delete-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to delete all selected managers? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					$(this).parent().parent().parent().parent().slideUp({complete:function() {
	  						this.remove()
	  					}});
	  				});
	  				$.post(URL+CTL+'/multiDelete',{items:items},function (o) {
	  					if(!o)location.reload();else{
			  				alert("Multiple delete user finish");
			  			}
	  				});
	  			}
	  		}
	  	})
	  	$(".multi-lock-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to lock all selected managers? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					var _origin=$(this).parent().parent().parent().parent();
	  					_origin.addClass('bg-danger')
						$(this).trigger('click');
	  				});
	  				$.post(URL+CTL+'/multiLock',{items:items},function (o) {
	  					if(!o)location.reload();else{
			  				alert("Multiple lock user finish");
			  			}
	  				});
	  			}
	  		}
	  	})
	  	$(".multi-unlock-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to unlock all selected managers? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					var _origin=$(this).parent().parent().parent().parent();
	  					_origin.removeClass('bg-danger')
	  					$(this).trigger('click');
	  				});
	  				$.post(URL+CTL+'/multiUnlock',{items:items},function (o) {
	  					if(!o)location.reload();else{
			  				alert("Multiple unlock user finish");
			  			} 
	  				});
	  			}
	  		}
	  	})
    });
})(jQuery, window);
