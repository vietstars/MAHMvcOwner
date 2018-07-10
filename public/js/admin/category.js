;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");		
	  	$(".show-menu").ShowApi({
	  		url:URL+CTL+'/allMenu',
	  		layout:'<div class="menu-form col-xs-12">'+
	  			'<div class="col-xs-4">'+
			  		'<div class="form-group floating-label">'+
			          	'<input type="text" data-input="name" class="form-control first-item" name="name" id="name">'+
			          	'<label for="name">Name</label>'+
			        '</div>'+
	  			'</div>'+
	  			'<div class="col-xs-4">'+
			  		'<div class="form-group floating-label">'+
			          	'<input type="text" data-input="icon" class="form-control fourth-item" data-modal="show" data-target="#getIcons" name="icon" id="icon">'+
			          	'<label for="icon">icon</label>'+
			        '</div>'+
	  			'</div>'+
	  			'<div class="col-xs-1">'+
			  		'<div class="form-group floating-label">'+
			          	'<input type="text" data-input="sorted" class="form-control sixth-item" name="sorted" id="sorted">'+
			          	'<label for="sorted">sorted</label>'+
			        '</div>'+
	  			'</div>'+
		  		'<div class="col-xs-3 text-right" data-id="">'+
					'<label class="checkbox checkbox-styled">'+
        				'<input type="checkbox" data-input="item">'+
						'<span></span>'+
					'</label>'+
					'<button type="button" class="btn btn-success btn-sub" data-toggle="tooltip" data-placement="left" title="sub category" data-modal="show" data-target="#sub-cate"><i class="fa fa-list-ol"></i></button>'+
					'<button type="button" class="btn btn-primary btn-brand" data-toggle="tooltip" data-placement="left" title="Brand list" data-modal="show" data-target="#brand-list"><i class="fa fa-list-ol"></i></button>'+
		          	'<button type="button" class="btn btn-warning btn-lock" data-toggle="tooltip" data-placement="left" title="Lock this menu"><i class="fa fa-lock"></i></button>'+
	              	'<button type="button" class="btn btn-info btn-submit" data-toggle="tooltip" data-placement="left" title="Update for this menu"><i class="fa fa-send-o"></i></button>'+
		        '</div>'+	  		
            '</div>',
	  		id:'id',
	  		editor:{
	  			name:"name",
	  			item:"id",
	  			image:"image",
	  			icon:"icon",
	  			sorted:"sorted",
	  			'data-id':"id",	  			
	  		}
	  	});
	  	$(".icon-list").slimScroll({
            height: 400,
            railVisible: false,
            alwaysVisible: false,
            color:'#26a69a',
            disableFadeOut: true
        });
        $("#new-menuItem").on("click",function () {
        	var _modal=$(this).data("target");
        	var _parent=$(_modal).find("#new-menuParent");
        	$.post(URL+CTL+'/allMenu',{},function(got){
    		 	$.each(got,function () {
                    _parent.append($('<option/>',{value:this.id}).html(this.menu));
                })
        	},'json')
        });
	  	$(".multi-edit-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to edit all selected items? ");
	  			if(question){
	  				var items=[];
	  				$.each(checked,function () {
	  					var _id=$(this).val(),
	  					_edit=$(this).parent().parent(),
	  					_input=_edit.find("input").not("[type='checkbox']"),
	  					_select=_edit.find("select");
	  					$(this).prop('checked',false);
	  					var item={}
	  					item['id']=_id;
	  					$.each(_input,function(){
	  						_name=$(this).attr("name")
	  						_val=$(this).val()
	  						item[_name]=_val	  					
	  					})
	  					$.each(_select,function(){
	  						_name=$(this).attr("name")
	  						_val=$(this).val()
	  						item[_name]=_val	  					
	  					})
	  					items.push(item)
	  				});
	  				$.post(URL+CTL+'/multiEditor',{items:items},function (o) {
	  					if(!o)location.reload();else{
			  				alert("Multiple edit menu finish");
			  			}
	  				});
	  			}
	  		}
	  	})
	  	$(".multi-delete-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to delete all selected items? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					$(this).parent().parent().parent().slideUp({complete:function() {
	  						this.remove()
	  					}});
	  				});
	  				$.post(URL+CTL+'/multiDelete',{items:items},function (o) {
	  					if(!o)location.reload();else{
			  				alert("Multiple delete menu finish");
			  			}
	  				});
	  			}
	  		}
	  	})
	  	$(".multi-lock-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to lock all selected items? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
						$(this).prop('checked',false);
	  					var _origin=$(this).parent().parent().parent();
	  					_origin.addClass('bg-warning').find("input").not('[type="checkbox"]').attr("disabled","disabled");
	  					_origin.find("select").attr("disabled","disabled");
		                _origin.find(".btn-warning.btn-lock").addClass("btn-success btn-unlock").removeClass("btn-warning btn-lock").attr("title","Unlock this menu").children("i.fa.fa-lock").addClass("fa-unlock").removeClass("fa-lock");
		                _origin.find('[data-toggle="tooltip"]').tooltip()
	  				});
	  				$.post(URL+CTL+'/multiLock',{items:items},function (o) {
	  					if(!o)location.reload();else{
			  				alert("Multiple lock menu finish");
			  			}
	  				});
	  			}
	  		}
	  	})
	  	$(".multi-unlock-btn").click(function(){
	  		var origin=$($(this).parent().parent().data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to unlock all selected items? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					$(this).prop('checked',false);
	  					var _origin=$(this).parent().parent().parent();
	  					_origin.removeClass('bg-warning').find("input").removeAttr("disabled");
	  					_origin.find("select").removeAttr("disabled");
		                _origin.find(".btn-success.btn-unlock").addClass("btn-warning btn-lock").removeClass("btn-success btn-unlock").attr("title","Lock this menu").children("i.fa.fa-unlock").addClass("fa-lock").removeClass("fa-unlock");
		                _origin.find('[data-toggle="tooltip"]').tooltip()
	  				});
	  				$.post(URL+CTL+'/multiUnlock',{items:items},function (o) {
	  					if(!o)location.reload();else{
			  				alert("Multiple unlock menu finish");
			  			} 
	  				});
	  			}
	  		}
	  	})
	  	$(document).on("click",".btn-lock",function(){
	  		var _this=$(this)
	  		var origin=_this.parent().parent();
	  		var _id=_this.parent().data('id')
	  		var question=confirm("Do you want to lock this menu?")
	  		if(question){
		  		$.post(URL+CTL+'/multiLock',{items:_id},function(o){
		  			if(!o)location.reload();else{
		  				alert("Lock menu finish");
		  			} 
		  		},'json')
		  		origin.addClass('bg-warning').find("input").attr("readonly","readonly");
                origin.find(".btn-warning.btn-lock").addClass("btn-success btn-unlock").removeClass("btn-warning btn-lock").attr("title","Unlock this menu").children("i.fa.fa-lock").addClass("fa-unlock").removeClass("fa-lock");
                origin.find('[data-toggle="tooltip"]').tooltip()
	  		}
	  	})
	  	$(document).on("click",".btn-unlock",function(){
	  		var _this=$(this)
	  		var origin=_this.parent().parent();
	  		var _id=_this.parent().data('id')
	  		var question=confirm("Do you want to unlock this menu?")
	  		if(question){
		  		$.post(URL+CTL+'/multiUnlock',{items:_id},function(o){
		  			if(!o)location.reload();else{
		  				alert("Unlock menu finish");
		  			} 
		  		},'json')
		  		origin.removeClass('bg-warning').find("input").removeAttr("readonly");
                origin.find(".btn-success.btn-unlock").addClass("btn-warning btn-lock").removeClass("btn-success btn-unlock").attr("title","Lock this menu").children("i.fa.fa-unlock").addClass("fa-lock").removeClass("fa-unlock");
                origin.find('[data-toggle="tooltip"]').tooltip()
	  		}
	  	})
	  	$(document).on("click",".btn-submit",function () {
	  		var _this=$(this);
	  		var origin=_this.parent().parent();
	  		var _input=origin.find("input[type=text]");
	  		var _select=origin.find("select");
	  		var _push={}
	  		origin.find("input[type=checkbox]").prop('checked',false);
	  		var question=confirm("Do you want to edit this menu?");
	  		$.each(_input,function(){
	  			var _name=$(this).attr("name")
	  			if(_name!==undefined){
	  				_push[_name]=$(this).val();
	  			}
	  		});
	  		$.each(_select,function(){
	  			var _name=$(this).attr("name")
	  			if(_name!==undefined){
	  				_push[_name]=$(this).val();
	  			}
	  		});
	  		_push['id']=_this.parent().data('id');
	  		if(question){
		  		$.post(URL+CTL+'/editItem',_push,function (o) {
		  			if(!o)location.reload();else{
		  				alert("Update finish");
		  			} 
		  		},'json');
	  		}
	  	})
	  	$(document).on('click','#menu-btn',function () {
	  		var _modal=$(this).parent().siblings('.modal-body');
	  		var _input=_modal.find("input[type=text]");
	  		var _select=_modal.find("select");
  			var _push={};
  			$.each(_input,function () {
  				if($.isEmptyObject($(this).val())){
  					alert("Please input value for "+$(this).attr("name")+"!");
  					return false;
  				}else{
  					var _name=$(this).attr("name")
		  			if(_name!==undefined){
		  				_push[_name]=$(this).val();
		  			}
  				}
  			})
  			$.each(_select,function () {
				var _name=$(this).attr("name")
	  			if(_name!==undefined){
	  				_push[_name]=$(this).val();
	  			}
  			})
  			var upgrade= function(id){
	  			var _item=$(".show-menu").children().first().clone();
	  			_item.find(".first-item").attr({"id":"name_"+id}).val(_push.name)
	  			_item.find(".fourth-item").attr({"id":"name_"+id}).val(_push.icon)
	  			_item.find(".sixth-item").attr({"id":"name_"+id}).val(_push.sorted)
	  			_item.find(".input-group-btn").attr({"data-id":id})
	  			$(".show-menu").prepend(_item);
	  		}
  			if(Object.keys(_push).length===3){
	  			$.post(URL+CTL+'/newItem',_push,function (o) {
	  				if(!o)location.reload();else{
  						upgrade(o);
		  				alert("Insert new category finish!");
		  				_modal.parent().parent().parent().modal('hide');
		  			} 
	  			},'json');
  			}else return false;
	  	})
	  	$(document).on('click','[data-target="#getIcons"]',function () {
	  		var _id=$(this).attr('id');
	  		var _modal=$(this).data('target');
	  		$(_modal).attr("data-input","#"+_id);
	  	})
	  	$(document).on('click',".icon-item",function () {
	  		var _icon=$(this).text()
	  		var _modal=$("#getIcons")
	  		var _input=_modal.data("input")
	  		$(_input).val(_icon).addClass('dirty');
	  		_modal.modal('hide')
	  	})
	  	$(".show-menu").on("change","input[type='text'],select",function () {
	  		$(this).parent().parent().siblings(".text-right").find("input[type='checkbox']").prop('checked',true);
	  	})
	  	/*$(document).on("click",".btn-remove",function(){
	  		var _this=$(this)
	  		var origin=_this.parent().parent().parent();
	  		var _id=_this.parent().data('id')
	  		var question=confirm("Do you want to remove this menu?")
	  		if(question){
		  		$.post(URL+CTL+'/multiDelete',{items:_id},function(o){
		  			if(!o)location.reload();else{
		  				alert("removed finish");
		  			} 
		  		},'json')
		  		origin.slideUp("slow",function(){
		  			this.remove();
		  		})
	  		}
	  	})*/
	  	$(document).on('click','[data-target="#brand-list"]',function(){
	  		var _id=$(this).parent().data('id');
	  		$(".brand-list-show").ShowApi({
		  		url:URL+CTL+'/getBrand',
		  		layout:'<div class="row">'+
		  			'<div class="col-xs-10">'+
				  		'<div class="form-group floating-label">'+
				          	'<input type="text" data-input="name" class="form-control" name="name" id="name">'+
				          	'<label for="name">Name</label>'+
				        '</div>'+
		  			'</div>'+
			  		'<div class="col-xs-2 text-right" data-id="">'+
		              	'<button type="button" class="btn btn-danger btn-del-brand" data-toggle="tooltip" data-placement="left" title="Update for this menu"><i class="fa fa-trash"></i></button>'+
			        '</div>'+	  		
	            '</div>',
		  		id:'id',
		  		data:{id:_id},
		  		editor:{
		  			name:"name",
		  			'data-id':"id",	  			
		  		}
		  	});
		  	$('.brand-list-show').parent().slimScroll({
	            height: 400,
	            railVisible: false,
	            alwaysVisible: false,
	            color:'#26a69a',
	            disableFadeOut: true
	        });
	  	})
	  	$(document).on('click','[data-target="#sub-cate"]',function(){
	  		var _id=$(this).parent().data('id');
	  		$(".sub-cat-list-show").ShowApi({
		  		url:URL+CTL+'/getSubcat',
		  		layout:'<div class="row">'+
		  			'<div class="col-xs-10">'+
				  		'<div class="form-group floating-label">'+
				          	'<input type="text" data-input="name" class="form-control" name="name" id="name">'+
				          	'<label for="name">Name</label>'+
				        '</div>'+
		  			'</div>'+
			  		'<div class="col-xs-2 text-right" data-id="">'+
		              	'<button type="button" class="btn btn-danger btn-del-subcat" data-toggle="tooltip" data-placement="left" title="Update for this menu"><i class="fa fa-trash"></i></button>'+
			        '</div>'+	  		
	            '</div>',
		  		id:'id',
		  		data:{id:_id},
		  		editor:{
		  			name:"name",
		  			'data-id':"id",	  			
		  		}
		  	});
		  	$('.sub-cat-list-show').parent().slimScroll({
	            height: 400,
	            railVisible: false,
	            alwaysVisible: false,
	            color:'#26a69a',
	            disableFadeOut: true
	        });
	  	})
	  	$(document).on('click','.btn-del-subcat',function (e) {
	  		var origin=$(this);
	  		var _id=origin.parent().data('id');
	  		var question=confirm("Do you want to remove this category?")
	  		if(question){
		  		$.post(URL+CTL+'/multiDelete',{items:_id},function(o){
		  			if(!o)location.reload();else{
		  				alert("removed finish");
		  			} 
		  		},'json')
		  		origin.parent().parent().slideUp("slow",function(){
		  			this.remove();
		  		})
	  		}
	  	})
	  	$(document).on('click','.btn-del-brand',function (e) {
	  		var origin=$(this);
	  		var _id=origin.parent().data('id');
	  		var question=confirm("Do you want to remove this brand?")
	  		if(question){
		  		$.post(URL+CTL+'/delBrand',{items:_id},function(o){
		  			if(!o)location.reload();else{
		  				alert("removed finish");
		  			} 
		  		},'json')
		  		origin.parent().parent().slideUp("slow",function(){
		  			this.remove();
		  		})
	  		}
	  	})
    });
})(jQuery, window);
