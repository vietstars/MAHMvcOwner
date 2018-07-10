;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
	  	$(".css-data").ShowApi({
  		url:URL+CTL+'/allCss',
  		layout:'<div class="row css-row"><div class="input-field col s5"><input id="name" name="name" type="text" class="validate" readonly><label for="name">File name</label></div><div class="input-field col s3"><input id="controller" name="controller" type="text" class="validate" readonly><label for="controller">Controller</label></div><div class="input-field col s4"><input id="type" name="type" type="text" class="validate" readonly><label for="type">Type</label><span class="multiple-checkbox"><input type="checkbox" id="item" name="item" class="multiple-item"/><label for="item" class="helper" data-position="left" data-tooltip="multi-checkbox"></label><a class="waves-effect waves-red btn-flat edit-btn"><i class="material-icons icon-2x helper" data-position="left" data-tooltip="edit-btn">mode_edit</i></a></span></div></div>',
  		id:'cssid',
  		editor:{
  			name:"file",
  			controller:"ctrol",
  			type:"key",
  			item:"not",
  			lock:".edit-btn"
  			/*lock:{
  				items:[".edit-btn"],
  				color:"red lighten-5",
  			}*/
  		}});
	  	$(".js-data").ShowApi({
  		url:URL+CTL+'/allJs',
  		layout:'<div class="row js-row"><div class="input-field col s5"><input id="name" name="name" type="text" class="validate" readonly><label for="name">File name</label></div><div class="input-field col s3"><input id="controller" name="controller" type="text" class="validate" readonly><label for="controller">Controller</label></div><div class="input-field col s4"><input id="type" name="type" type="text" class="validate" readonly><label for="type">Type</label><span class="multiple-checkbox"><input type="checkbox" id="item" name="item" class="multiple-item"/><label for="item" class="helper" data-position="left" data-tooltip="multi-checkbox"></label><a class="waves-effect waves-red btn-flat edit-btn"><i class="material-icons icon-2x helper" data-position="left" data-tooltip="edit-btn">mode_edit</i></a></span></div></div>',
  		id:'jsid',
  		editor:{
  			name:"file",
  			controller:"ctrol",
  			type:"key",
  			item:"not",
  			lock:".edit-btn"
  			/*lock:{
  				items:[".edit-btn"],
  				color:"red lighten-5",
  			}*/
  		}});
  		/**********unique form check box**************/
  		$(document).on('click','input[type=checkbox]',function(){
  			var _root=$(this).parent().parent().parent().parent().parent();
  			_root.siblings().find('input[type=checkbox]:checked').trigger('click');
  		})
  		/*********************************************/
	  	$(".multi-delete-btn").click(function(){
	  		var checked=$(document).find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to delete all selected items? ");
	  			if(question){
	  				items='';
	  				type='';
	  				$.each(checked,function () {
	  					if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  					$(this).parent().parent().parent().slideUp({complete:function() {
	  						this.remove()
	  					}});
	  				});
	  				$.post(URL+CTL+'/multiDelete',{items:items},function (o) {
	  					if(!o)location.reload();
	  				});
	  			}
	  		}
	  	})
	  	// $(".multi-lock-btn").click(function(){
	  	// 	var origin=$($(this).data("activity"));
	  	// 	var checked=origin.find("input[type='checkbox']:checked");
	  	// 	if(checked.length){
	  	// 		question=confirm("Do you want to lock all selected items? ");
	  	// 		if(question){
	  	// 			items='';
	  	// 			$.each(checked,function () {
	  	// 				if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  	// 				$(this).trigger("click").siblings(".edit-btn").hide().parent().parent().addClass("red lighten-5").siblings().addClass("red lighten-5").parent().find("input").addClass("invalid");
	  	// 			});
	  	// 			$.post(URL+CTL+'/multiLock',{items:items},function (o) {
	  	// 				if(!o)location.reload();
	  	// 			});
	  	// 		}
	  	// 	}
	  	// })
	  	// $(".multi-unlock-btn").click(function(){
	  	// 	var origin=$($(this).data("activity"));
	  	// 	var checked=origin.find("input[type='checkbox']:checked");
	  	// 	if(checked.length){
	  	// 		question=confirm("Do you want to unlock all selected items? ");
	  	// 		if(question){
	  	// 			items='';
	  	// 			$.each(checked,function () {
	  	// 				if(items!='')items+=","+$(this).val();else items+=$(this).val();
	  	// 				$(this).trigger("click").siblings(".edit-btn").show().parent().parent().removeClass("red lighten-5").siblings().removeClass("red lighten-5").parent().find("input").removeClass("invalid");
	  	// 			});
	  	// 			$.post(URL+CTL+'/multiUnlock',{items:items},function (o) {
	  	// 				if(!o)location.reload();
	  	// 			});
	  	// 		}
	  	// 	}
	  	// })
	  	// $(document).on("click",".edit-btn",function(){
	  	// 	var _this=$(this)
	  	// 	var origin=_this.parent().parent().parent();
	  	// 	origin.find("input[type=text]").removeAttr("readonly").addClass("valid").first().select();
	  	// 	origin.find("input[type=text]").on({
	  	// 		focusout:function (){
		  // 			if($(this).val()===''){
	  	// 				$(this).val($(this).attr("placeholder"))
	  	// 			}
		  // 		},
		  // 		keyup:function (){
		  // 			if($(this).val()!==''&&$(this).val()!==$(this).attr("placeholder")){
		  // 				_this.removeClass("edit-btn").addClass("submit-btn blue white-text").children().html("send");
		  // 				_this.children().attr("data-tooltip","submit-btn").tooltip();
		  // 			}else{
		  // 				if($(this).val()===''){
		  // 					$(this).val($(this).attr("placeholder"))
		  // 				}
		  // 			}
		  // 		}
	  	// 	})
	  	// })
	  	// $(document).on("click",".submit-btn",function () {
	  	// 	var _this=$(this);
	  	// 	var origin=_this.parent().parent().parent();
	  	// 	var _input=origin.find("input[type=text]");
	  	// 	var _push={}
	  	// 	var question=confirm("Do you want to edit this field?");
	  	// 	$.each(_input,function(){
	  	// 		_push[$(this).attr("name")]=$(this).val();
	  	// 	});
	  	// 	_push['id']=origin.data("metaid");
	  	// 	var upgrade= function(){
	  	// 		_this.addClass("edit-btn").removeClass("submit-btn blue white-text").children().html("edit_mode").tooltip("remove");
  		// 		_this.children().attr("data-tooltip","edit-btn").tooltip();
  		// 		_input.removeClass("invalid valid").attr("readonly","");
	  	// 	}
	  	// 	if(question){
  		// 		upgrade();
		  // 		$.post(URL+CTL+'/editItem',_push,function (o) {
		  // 			if(!o)location.reload();else{
		  // 				Materialize.toast("Update finish",4000);
		  // 			} 
		  // 		},'json');
	  	// 	}

	  	// })
	  	// $('#new-items').modal();
	  	// $(document).on('click','#new-item-btn',function () {
	  	// 	var _modal=$(this).parent().parent();
	  	// 	var _input=_modal.find("input[type=text]");
  		// 	var _push={};
  		// 	$.each(_input,function () {
  		// 		if($.isEmptyObject($(this).val())){
  		// 			Materialize.toast("Please input value for "+$(this).attr("name")+"!",4000);
  		// 		}else{
  		// 			_push[$(this).attr("name")]=$(this).val();
  		// 		}
  		// 	})
  		// 	var upgrade= function(id){
	  	// 		var _item=$(".meta-data").children().first().clone();
	  	// 		_item.find("input[name=name]").attr({"id":"name_"+id,placeholder:_push.name}).val(_push.name).siblings('label').attr("for","name_"+id);
	  	// 		_item.find("input[name=content]").attr({"id":"name_"+id,placeholder:_push.content}).val(_push.content).siblings('label').attr("for","name_"+id);
	  	// 		_item.find("input[type=checkbox]").attr({"id":"item_"+id,placeholder:_push.content}).val(id).siblings('label').attr("for","item_"+id);
	  	// 		$(".meta-data").append(_item);
	  	// 	}
  		// 	if(Object.keys(_push).length===2){
  		// 		_input.val("").removeClass('valid').siblings('label').removeClass('active');
	  	// 		$.post(URL+CTL+'/newItem',_push,function (o) {
	  	// 			if(!o)location.reload();else{
		  // 				Materialize.toast("Insert new meta finish",4000);
  		// 				upgrade(o);
		  // 			} 
	  	// 		},'json');
  		// 	}else return false;
	  	// })
    });
})(jQuery, window);
