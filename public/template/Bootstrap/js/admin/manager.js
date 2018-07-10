;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
	  	$(".box-profile").littleShow();
	  	$("#inputNote").summernote({	  		
	      	upload:$("body").attr("url")+'api/imgCode',
	      	disableDragAndDrop: true,
	      	folder:'note',
	      	height: 230,
	  	});
	  	$('[data-mask]').inputmask();
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
                { "data": "datetime" },
                { "data": "action" }
            ],
            "ajax": {                   
                "url": URL+CTL+"/getUser",
                /*"data": function(d){
                    console.log(d);                        
                },*/
                "type": "POST"
            },
            "fnCreatedRow": function( nRow, aData, iDataIndex ) {                
                if(aData.ctl==1){
                	$(nRow).addClass('bg-danger');
                }                    
            },
            /*"fnDrawCallback": function( oSettings ) {
                $(".tooltipped").tooltip({delay: 50});
                $('.materialboxed').materialbox();                   
                var chip=$('.chip img.materialboxed');
            }*/
	  	})
		$(".multi-delete-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to delete all selected users? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					$(this).parent().parent().slideUp({complete:function() {
	  						this.remove()
	  					}});
	  				});
	  				console.log(items);
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
	  			question=confirm("Do you want to lock all selected users? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
						$(this).prop('checked',false);
	  					var _origin=$(this).parent().parent();
	  					_origin.addClass('bg-danger')
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
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to unlock all selected users? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					$(this).prop('checked',false);
	  					var _origin=$(this).parent().parent();
	  					_origin.removeClass('bg-danger')
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
