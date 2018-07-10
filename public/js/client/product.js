;(function ($, window, undefined) {	
    $(document).ready(function () {
		var LG=$("body").attr("lg"),URL=$("body").attr("url"),CTL=$("body").attr("ctl"),ACT=$("body").attr("act");
	  	$(document).on('click','.like-btn',function (){
	  		var _id=$(this).data('id');
	  		$.post(URL+CTL+'/interest',{item:_id},function (data) {
	  			if(data){
	  				$('.like-btn').removeAttr('class').removeAttr('data-id').html('Thank for Like <i class="fa fa-thumbs-o-up"></i>');
	  			}
	  		},'json');
	  	})
        $(document).on('click','.cart-btn',function (){
            var _id=$(this).data('id');
            $.post(URL+CTL+'/addCart',{item:_id},function (data) {
                if(data){
                    $('.cart-btn').removeAttr('class').removeAttr('data-id').html('Check cart <i class="fa fa-shopping-cart"></i>');
                    var _counter=$('.cart-menu').find('.cart-counter');
                    if(_counter.length!=0){
                        _counter.html(data);
                    }else{
                        $('.cart-menu').append($('<sup/>',{class:"badge style-danger cart-counter",style:"top:-15px;"}).html(data))
                    }
                }
            },'json');
        })
        $(document).scroll(function(){
            if($(window).width()>768){
                var scrollTop = $(document).scrollTop();
                var _item=scrollTop+$('.item-detail').parent().offset().top+$('.item-detail').height()-60;
                var _parent=$('.item-detail').parent().offset().top+$('.item-detail').parent().height();
                if(scrollTop<60){
                    $('.item-detail').css('top',239-scrollTop);
                    $('.item-detail').removeClass('fix-bottom').addClass('fix-top');
                }else{                
                    if(_item>=_parent){
                        $('.item-detail').removeAttr('style');
                        $('.item-detail').removeClass('fix-top').addClass('fix-bottom');
                    }else{
                        $('.item-detail').removeClass('fix-bottom').addClass('fix-top');
                        $('.item-detail').css('top',153);               
                    }
                }
            }
        });
        if($(window).width()<=768){
            $('.row.block.item-block').removeClass('row-eq-height');
            $('.item-detail').removeClass('fix-top');
        }
        $(document).on('click','.image-list.click-view',function(){
            var _img=$(this).data('img');
            $('.image-show').css('background','url('+_img+')');
        }); 
        $(".fa.fa-star-o").on({
            'mouseover':function () {
                var rate=$(this).attr('data-rate');
                var choise=$(".rating").children();
                $.each(choise,function(){
                    if($(this).attr('data-rate')<=rate){
                        $(this).addClass("fa-star").removeClass("fa-star-o");
                    }                       
                });
            },
            'mouseout':function () {
                $(".rating").children().removeClass("fa-stard").addClass("fa-star-o");
            },
            'click':function () {
                var rate=$(this).attr('data-rate');
                var rating=$(this).parent("div");
                var id=rating.attr('data-id');
                $.post(URL+CTL+"/rating",{"id":id,'rate':rate},function(o){                             
                }, 'json');
                rating.html($("<h5/>").text("Your rating"));
                var rateview=$(".rate-view").find("span[data-rated='"+rate+"']");
                rateview.html(parseInt(rateview.text())+1);
                for(i=0;i<rate;i++){
                    rating.append($("<i/>",{'class':'we-star we-3x selected'}));
                }
            }
        }) 
    });
})(jQuery, window);
