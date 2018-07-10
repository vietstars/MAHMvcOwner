;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
	  	$(".guide-list").ShowApi({
	  		url:URL+CTL+'/allGuides',
	  		layout:'<div class="row guide-row"><div class="input-field col s3"><input id="name" name="id" type="text" class="validate" readonly><label for="name">Key</label></div><div class="input-field col s3"><input id="tooltip" name="tooltip" type="text" class="validate" readonly><label for="tooltip">tooltip</label></div><div class="input-field col s6"><input id="helper" name="helper" type="text" class="validate" readonly><label for="helper">Guide</label><span class="multiple-checkbox"><input type="checkbox" id="item" name="item" class="multiple-item"/><label for="item" class="helper" data-position="left" data-tooltip="multi-checkbox"></label><a class="waves-effect waves-red btn-flat edit-btn"><i class="material-icons icon-2x helper" data-position="left" data-tooltip="edit-btn">mode_edit</i></a></span></div></div>',
	  		id:'id',
	  		editor:{
	  			id:"id",
	  			helper:"helper",
	  			tooltip:"tooltip",
	  			item:"not",
	  			lock:".edit-btn"
	  			/*lock:{
	  				items:[".edit-btn"],
	  				color:"red lighten-5",
	  			}*/
	  		}});
	  	$(".multi-delete-btn").click(function(){
	  		var origin=$($(this).data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to delete all selected items? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=",'"+$(this).val();else items+="'"+$(this).val()+"'";
	  					$(this).parent().parent().parent().slideUp({complete:function() {
	  						this.remove()
	  					}});
	  				});
					if(checked.length>1)items+="'";
	  				$.post(URL+CTL+'/multiDelete',{items:items},function (o) {
	  					if(!o)location.reload();
	  				});
	  			}
	  		}
	  	})
	  	$(".multi-lock-btn").click(function(){
	  		var origin=$($(this).data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to lock all selected items? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=",'"+$(this).val();else items+="'"+$(this).val()+"'";
	  					$(this).trigger("click").siblings(".edit-btn").hide().parent().parent().addClass("red lighten-5").siblings().addClass("red lighten-5").parent().find("input").addClass("invalid");
	  				});
					if(checked.length>1)items+="'";
	  				$.post(URL+CTL+'/multiLock',{items:items},function (o) {
	  					if(!o)location.reload();
	  				});
	  			}
	  		}
	  	})
	  	$(".multi-unlock-btn").click(function(){
	  		var origin=$($(this).data("activity"));
	  		var checked=origin.find("input[type='checkbox']:checked");
	  		if(checked.length){
	  			question=confirm("Do you want to unlock all selected items? ");
	  			if(question){
	  				items='';
	  				$.each(checked,function () {
	  					if(items!='')items+=",'"+$(this).val();else items+="'"+$(this).val()+"'";
	  					$(this).trigger("click").siblings(".edit-btn").show().parent().parent().removeClass("red lighten-5").siblings().removeClass("red lighten-5").parent().find("input").removeClass("invalid");
	  				});
					if(checked.length>1)items+="'";
	  				$.post(URL+CTL+'/multiUnlock',{items:items},function (o) {
	  					if(!o)location.reload();
	  				});
	  			}
	  		}
	  	})
	  	$(document).on("click",".edit-btn",function(){
	  		var _this=$(this)
	  		var origin=_this.parent().parent().parent();
	  		origin.find("input[type=text]").removeAttr("readonly").addClass("valid").first().select();
	  		origin.find("input[type=text]").on({
	  			focusout:function (){
		  			if($(this).val()===''){
	  					$(this).val($(this).attr("placeholder"))
	  				}
		  		},
		  		keyup:function (){
		  			if($(this).val()!==''&&$(this).val()!==$(this).attr("placeholder")){
		  				_this.removeClass("edit-btn").addClass("submit-btn blue white-text").children().html("send");
		  				_this.children().attr("data-tooltip","submit-btn").tooltip();
		  			}else{
		  				if($(this).val()===''){
		  					$(this).val($(this).attr("placeholder"))
		  				}
		  			}
		  		}
	  		})
	  	})
	  	$(document).on("click",".submit-btn",function () {
	  		var _this=$(this);
	  		var origin=_this.parent().parent().parent();
	  		var _input=origin.find("input[type=text]");
	  		var _push={}
	  		var question=confirm("Do you want to edit this field?");
	  		$.each(_input,function(){
	  			_push[$(this).attr("name")]=$(this).val();
	  		});
	  		_push['id']=origin.data("id");
	  		var upgrade= function(){
	  			_this.addClass("edit-btn").removeClass("submit-btn blue white-text").children().html("edit_mode").tooltip("remove");
  				_this.children().attr("data-tooltip","edit-btn").tooltip();
  				_input.removeClass("invalid valid").attr("readonly","");
	  		}
	  		if(question){
  				upgrade();
		  		$.post(URL+CTL+'/editItem',_push,function (o) {
		  			if(!o)location.reload();else{
		  				Materialize.toast("Update finish",4000);
		  			} 
		  		},'json');
	  		}

	  	})
	  	$('#new-items').modal();
	  	$(document).on('click','#new-item-btn',function () {
	  		var _modal=$(this).parent().parent();
	  		var _input=_modal.find("input[type=text]");
  			var _push={};
  			$.each(_input,function () {
  				if($.isEmptyObject($(this).val())){
  					Materialize.toast("Please input value for "+$(this).attr("name")+"!",4000);
  				}else{
  					_push[$(this).attr("name")]=$(this).val();
  				}
  			})
  			var upgrade= function(id){
	  			var _item=$(".guide-list").children().first().clone();
	  			_item.find("input[name=id]").attr({"id":"id_"+id,placeholder:_push.id}).val(_push.id).siblings('label').attr("for","id_"+id);
	  			_item.find("input[name=tooltip]").attr({"id":"tooltip_"+id,placeholder:_push.tooltip}).val(_push.tooltip).siblings('label').attr("for","tooltip_"+id);
	  			_item.find("input[name=helper]").attr({"id":"helper_"+id,placeholder:_push.helper}).val(_push.helper).siblings('label').attr("for","helper_"+id);
	  			_item.find("input[type=checkbox]").attr({"id":"item_"+id,placeholder:_push.id}).val(id).siblings('label').attr("for","item_"+id);
	  			$(".guide-list").prepend(_item);
	  		}
  			if(Object.keys(_push).length===3){
  				_input.val("").removeClass('valid').siblings('label').removeClass('active');
	  			$.post(URL+CTL+'/newItem',_push,function (o) {
	  				if(!o)location.reload();else{
		  				Materialize.toast("Insert new meta finish",4000);
  						upgrade(o);
		  			} 
	  			},'json');
  			}else return false;
	  	})
    });
})(jQuery, window);
