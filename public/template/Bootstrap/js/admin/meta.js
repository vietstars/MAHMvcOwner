;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url")+'admin/',CTL=$("body").attr("ctl"),ACT=$("body").attr("act");		
	  	$(".show-meta").ShowApi({
	  		url:URL+CTL+'/allMetas',
	  		layout:'<div class="col-xs-12 meta-form">'+
	  		'<div class="input-group input-group-sm">'+
                '<span class="input-group-addon first-item" text="name"></span>'+
                '<input type="text" data-input="content" name="content" class="form-control second-item">'+
                '<input type="text" data-input="type" name="type" class="form-control third-item" data-toggle="tooltip" data-html="true" data-placement="top" title="If you change this type,<br>this meta will not show">'+
                '<span class="input-group-btn" data-id="">'+
                  '<button type="button" class="btn btn-danger btn-remove" data-toggle="tooltip" data-placement="left" title="Remove this meta"><i class="fa fa-trash"></i></button>'+
                  '<button type="button" class="btn btn-info btn-submit" data-toggle="tooltip" data-placement="left" title="Update for this meta"><i class="fa fa-send-o"></i></button>'+
                '</span>'+
              '</div>'+
            '</div>',
	  		id:'id',
	  		editor:{
	  			content:"content",
	  			'[text="name"]':"name",
	  			type:"type",
	  			/*item:"not",*/
	  			/*lock:".edit-btn"*/
	  			lock:{
	  				items:[".btn-remove"],
	  				key:["template","icon"]
	  			}
	  		}
	  	});
	  	$(document).on("click",".btn-remove",function(){
	  		var _this=$(this)
	  		var origin=_this.parent().parent().parent();
	  		var _id=_this.parent().data('id')
	  		var question=confirm("Do you want to remove this meta?")
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
	  	})
	  	$(document).on("click",".btn-submit",function () {
	  		var _this=$(this);
	  		var origin=_this.parent().parent();
	  		var _input=origin.find("input[type=text]");
	  		var _push={}
	  		var question=confirm("Do you want to edit this meta?");
	  		$.each(_input,function(){
	  			_push[$(this).attr("name")]=$(this).val();
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
	  	$(document).on('click','#meta-btn',function () {
	  		var _modal=$(this).parent().siblings('.modal-body');
	  		var _input=_modal.find("input[type=text]");
  			var _push={};
  			$.each(_input,function () {
  				if($.isEmptyObject($(this).val())){
  					alert("Please input value for "+$(this).attr("name")+"!");
  					return false;
  				}else{
  					_push[$(this).attr("name")]=$(this).val();
  				}
  			})
  			var upgrade= function(id){
	  			var _item=$(".show-meta").children().first().clone();
	  			_item.find(".first-item").html(_push.name)
	  			_item.find(".second-item").attr({"id":"name_"+id,placeholder:_push.content}).val(_push.content)
	  			_item.find(".third-item").attr({"id":"name_"+id,placeholder:_push.type}).val(_push.type)
	  			_item.find(".input-group-btn").attr({"data-id":id})
	  			$(".show-meta").prepend(_item);
	  		}
  			if(Object.keys(_push).length===3){
	  			$.post(URL+CTL+'/newItem',_push,function (o) {
	  				if(!o)location.reload();else{
  						upgrade(o);
		  				alert("Insert new meta finish!");
		  				_modal.parent().parent().parent().modal('hide');
		  			} 
	  			},'json');
  			}else return false;
	  	})
    });
})(jQuery, window);
