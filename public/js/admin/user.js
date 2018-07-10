;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
	  	$("#inpuGeneral").summernote({	  		
	      	upload:$("body").attr("url")+'api/imgCode',
	      	disableDragAndDrop: true,
	      	folder:'note',
	      	height: 230,
	  	});
	  	$('#btn-addnote').on('click',function(){
	  		var _target=$(this).data('target');
	  		var _note=$(_target).val();
	  		if(_note!=''){
	  			confirm('Do you want to add this note?');
	  			$.post(URL+CTL+'/addNote',{note:_note},function(){
	  				location.reload();
	  			});
	  		}
	  	})
	  	$(document).on('click','.btn-icon-toggle.btn-delete',function(){
	  		$(this).parent().parent().hide('slow', function() {
	  			$(this).remove();
	  		});
	  	})
	  	$(document).on('click','.btn-icon-toggle.btn-more',function(){
	  		var _origin=$(this).parent().parent();var _old=_origin.data('id'),_id=_old+1;
	  		var _input=_origin.parent().find('input');
	  		var _add=false;
	  		$.each(_input,function(){
	  			if($(this).val()==''){
          			toastr.options.closeButton = true;
          			toastr.options.positionClass='toast-top-center';
          			toastr.error('Please key all form first!');
          			return false;
	  			}else _add=true;
	  		})
			if(_add){
				_item=_origin.clone();
				_origin.find('.btn.btn-icon-toggle.btn-accent.btn-more').addClass('btn-delete').removeClass('btn-more').children('span').addClass('fa-trash').removeClass('fa-plus');
				_title=_item.find('.top-title').data('content');
				_item.attr('data-id',_id).find('.top-title').html(_title+_id);
				var _input=_item.find('input');
				$.each(_input,function () {
					$(this).val('').removeClass('static dirty');
					var _name=$(this).attr('name');
					_new=_name.split('\['+_old+'\]').join('\['+_id+'\]');
					$(this).attr('name',_new)
				})
				var _select=_item.find('select');
				$.each(_select,function () {
					$(this).val('').removeClass('static dirty');
					var _name=$(this).attr('name');
					_new=_name.split('\['+_old+'\]').join('\['+_id+'\]');
					$(this).attr('name',_new)
				})
				var _textarea=_item.find('textarea')
				$.each(_textarea,function () {
					$(this).html('').removeClass('static dirty');
					var _name=$(this).attr('name');
					_new=_name.split('\['+_old+'\]').join('\['+_id+'\]');
					$(this).attr('name',_new)
				});
				_origin.parent().append(_item);
			}
	  	})
	  	$('#user-list').DataTable({
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
	  	$('#birthday').bootstrapMaterialDatePicker({nowButton:true,time:true,format : 'YYYY-MM-DD'}).on('change', function(e,date){});//YYYY-MM-DD hh:mm A
		$(".multi-delete-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to delete all selected users? ");
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
	  			question=confirm("Do you want to lock all selected users? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					var _origin=$(this).parent().parent().parent().parent();
	  					_origin.addClass('bg-danger')
						$(this).trigger('click')
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
	  			question=confirm("Do you want to unlock all selected users? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					var _origin=$(this).parent().parent().parent().parent();
	  					_origin.removeClass('bg-danger')
	  					$(this).trigger('click')
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
