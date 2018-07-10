;(function ($, window, undefined) {
    UniqueId = (function() {
      function s4() {
        return Math.floor((1 + Math.random()) * 0x10000)
          .toString(16)
          .substring(1);
      }
      return function() {
        return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
               s4() + '-' + s4() + s4() + s4();
      };
    })();
    $.fn.closeBtn = function (option) {
        var defaults = {
            align: 'right',
            valign: 'top',
            padding: '0.75rem',
            dimension: '24px'
        };
        this.each(function(){
            var origin = $(this);
            var options = $.extend({}, defaults, option);
            var btn_algin = options.align+':'+options.padding;
            var btn_valgin = options.valign+':'+options.padding;
            var btn_style = [btn_algin,btn_valgin,'width:'+options.dimension,'height:'+options.dimension];
            var cl_btn = $("<div/>",{class:'close-btn',style:btn_style.join(";")}).html($("<i/>",{class:"material-icons"}).html("close"));
            if(origin.find(".close-btn").length==0){
                origin.css("position","relative").append(cl_btn);
            }
            cl_btn.on({
                click:function () {
                    var check=confirm("Do you want close this tab?");
                    if(check){
                        origin.slideUp("slow");
                    }
                }
            })
            $(document).on('mousemove',function () {
                if(origin.css("display")=="none"){
                    origin.css("display","block").remove();
                }
            })
        })
    }    
    $.fn.ShowApi = function (options) {
        var layout="",
            api="",
            data=null;
        var defaults = {
            layout:"",
            url:"",
            data:{},
            editor:{}
        };
        if(options === "remove"){
            this.each(function() {
                $(this).empty();
            });
            return false;
        }
        options = $.extend(defaults, options);
        return this.each(function(data) {            
            var origin = $(this);
            var base=this;
            if(origin.data("url")===undefined||origin.data("url")===''){
                base.api=options.url;
            }else{
                base.api=origin.data("url");
            }
            if(base.api===undefined||base.api===''){
                console.log("PLz add API");
                return false;
            }
            // if(options.url===undefined||options.url===''){
            //     console.log("PLz add API");
            //     return false;
            // }else api=options.url;
            if(origin.data("layout")===undefined||origin.data("layout")===''){
                base.template=options.layout;
            }else{
                base.template=origin.data("layout");
            }
            if(base.template===undefined||base.template===''){
                console.log("PLz add layout");
                return false;
            }
            // if(options.layout===undefined||options.layout===''){
            //     console.log("PLz add layout");
            //     return false;
            // }else template=options.layout;
            var showItems = function(result) {
                origin.empty();             
                $.each(result,function(){
                    var layout=$(base.template);                    
                    var _data=this;
                    var showParent = function (item,got,parent) {
                        if(got.lenght>0){
                            $.each(got,function () {
                                if(this.menu==parent)var selected='selected:selected';
                                layout.find(item).append($('<option/>',{value:this.id,selected}).html(this.menu));
                            })
                        }
                    }
                    if(options.editor){
                        $.each(options.editor,function(k,v) {
                            if(k.match(/select.(.*)/)){
                                layout.find(k).addClass("selected-"+_data.id)
                                if(v=='current'){
                                    $.each(result,function () {
                                    if(this.menu==_data.parent)var selected='selected:selected';
                                        layout.find(".selected-"+_data.id).addClass("dirty").append($('<option/>',{value:this.id,selected}).html(this.menu));
                                    })
                                }else{
                                    $.get(v,function(res){
                                        showParent(".selected-"+_data.id,res,_data.parent)
                                    },'json');
                                }
                            }else if(k.match(/data-(.*)/)){
                                if(k=='data-style'){
                                    layout.find('['+k+']').attr('style',_data[v]);
                                }else{
                                    layout.find('['+k+']').attr(k,_data[v]);
                                }
                            }else if(k.match(/\[text=(.*)\]/)){
                                layout.find(k).html(_data[v]);
                            }else{
                                if(_data[v]!=''){
                                    layout.find("[data-input='"+k+"']").attr({"id":k+"_"+_data.id}).val(_data[v]).addClass('dirty');
                                }
                                if(v!='not'){
                                    layout.find("[data-input='"+k+"']");
                                }else{
                                    layout.find("[data-input='"+k+"']").attr("id",k+"_"+_data.id).val(_data.id).addClass('dirty');
                                }
                            } 
                            if(_data.ctl==1){
                                layout.addClass('bg-warning').find("input").not('[type="checkbox"]').attr("disabled","disabled");
                                layout.find(".btn-warning.btn-lock").addClass("btn-success btn-unlock").removeClass("btn-warning btn-lock").attr("title","Unlock this menu").children("i.fa.fa-lock").addClass("fa-unlock").removeClass("fa-lock");
                                layout.find('[data-toggle="tooltip"]').tooltip()
                            }
                            layout.find(".input-group-btn").attr("data-id",_data.id)
                            if(typeof(options.editor.lock) === "string"){
                                //lock on string
                                // layout.find(".input-field").addClass("red lighten-5").find(options.editor.lock).hide()
                            }else{
                                if(options.editor.lock && $.isArray(options.editor.lock.items)){
                                    $.each(options.editor.lock.items,function (k,v) {
                                        if(options.editor.lock.key && $.isArray(options.editor.lock.key)){
                                            $.each(options.editor.lock.key,function (k1,v1) {
                                                if(v1==_data.name){
                                                    layout.find(v).attr("disabled","disabled")
                                                }
                                            })
                                        }else{
                                            if(options.editor.lock.key==_data.name){
                                                layout.find(v).attr("disabled","disabled")
                                            }
                                        }                                      
                                    })
                                }else{
                                    if(options.editor.lock && $.isArray(options.editor.lock.key)){
                                        $.each(options.editor.lock.key,function (k1,v1) {
                                            if(v1==_data.name){
                                                layout.find(options.editor.lock.items).attr("disabled","disabled")
                                            }
                                        })
                                    }else{
                                        if(options.editor.lock && options.editor.lock.key==_data.name){
                                            layout.find(options.editor.lock.items).attr("disabled","disabled")
                                        }
                                    }   
                                }
                            }                           
                        })
                    }
                    origin.append(layout);
                    $(".meta-manage").find('[data-toggle="tooltip"]').tooltip();
                })            
            }
            var load = function (data) {
                /*$.post(base.api,options.data,function(result){
                    showItems(result);                    
                },'json');*/
            }
            if(base.api&&base.template){
                if(options.data){
                    $.post(base.api,options.data,function(result){
                        showItems(result);                    
                    },'json');
                }else{
                    $.get(base.api,function(result){
                        showItems(result);                    
                    },'json');
                }
            }
        });
    }; 
    $.fn.actionBtn = function (options) {
        var defaults = {
            layout:"vertizontal",//"horizontal",
            action:"click",
        };
        if(options === "remove"){
            this.each(function() {
                $(this).empty();
            });
            return false;
        }
        _o=$.extend(defaults, options);
        return this.each(function(data) {            
            var _origin = $(this);
            if(_o.layout=='vertizontal'){
                _origin.addClass('vertizontal').removeClass('horizontal');
                _target=_origin.find("ul").fadeOut('fast');
                _origin.on(_o.action,function () {
                    if(_target.is(':hidden')){
                        _target.fadeIn('slow')
                    }else{
                        _target.fadeOut('slow')
                    }
                }) 
                $(document).on("click", function(e) {
                    if(!$(event.target).closest(_origin).length){
                        _target.fadeOut('slow')
                    }
                });                
            }else if(_o.layout=='horizontal'){                
                _origin.addClass('horizontal').removeClass('vertizontal'); 
                _target=_origin.find("ul");
                _origin.on(_o.action,function () {
                    if(_target.is(':hidden')){
                        _target.slideDown('slow')
                    }else{
                        _target.slideUp('slow')
                    }
                })
                $(document).on("click", function(e) {
                    if(!$(event.target).closest(_origin).length){
                        _target.slideUp('slow')
                    }
                });                
            }
        });
    };
    $.fn.littleShow = function (options) {
        var defaults = {
            height:300
        };
        if(options === "remove"){
            this.each(function() {
                $(this).empty();
            });
            return false;
        }
        _o=$.extend(defaults, options);
        return this.each(function(data) {            
           var _origin = $(this);
           var _h = $(this).height();
           _origin.animate({"height":_o.height},"slow");
           var _btn=$("<div/>",{"class":"toggle-btn show-more"}).append($("<a/>",{"class":"btn btn-primary btn-block btn-show-more"}).html("<b>Show more</b>"))
           _origin.append(_btn);
           $(document).on("click",".toggle-btn",function(){
                if($(this).hasClass("show-less")){
                    _origin.animate({"height":_o.height},"slow");
                    $(this).addClass("show-more").removeClass("show-less").find("b").html("Show more");
                }else{
                    _origin.animate({"height":_h},"slow");
                    $(this).addClass("show-less").removeClass("show-more").find("b").html("Show less"); 
                }
                
           })
        });
    };
    $.fn.calender = function (option) {
            var defaults = {
                align: 'right',
            };
            this.each(function(){
                var origin = $(this);
                var options = $.extend({}, defaults, option);
                origin.datepicker({
                    calendarWeeks: true,
                    todayHighlight: true, 
                    todayBtn: true, 
                    endDate: new Date  
                });             
            })
    };
    $(document).ready(function () {		
	  	var LG=$("body").attr("lg"),CTL=$("body").attr("ctl"),URL=$("body").attr("url")+'admin/',ACT=$("body").attr("act");
        /*$(document).on('change','#guide-setting',function (){
            $.post($("body").attr("url")+'api/changeGuide',function(){
            })
        })*/
        $(".fixed-action-btn").actionBtn({layout:'horizontal'})
        $('[data-toggle="tooltip"]').tooltip();
    });   
})(jQuery, window);