$(function(){

$('.see_policy').on('click', function(){
	$('.review_rule_popup').css('display','block');
	$('.main.sub').css('z-index','99');
	$('body').css('overflow', 'hidden');
});
$('.close_button.review').on('click', function(){
	$('.review_rule_popup').css('display','none');
	$('.main.sub').css('z-index','0');
	$('body').css('overflow', '');
});	

//$('.review_photo.top').on('click', function(){
//	location.href='photoReview.jsp?itemID='+itemID;
//})

$('.review_order_wrapper').on('click', function(){
	if($('.review_order_listbox').css('display')==('block')){
		$('.review_order_listbox').css('display', 'none');
	} else {
		$('.review_order_listbox').css('display', 'block');
	}
});
$('.review_order_button').text($('.review_order_listbox').find('.active').text());
$('.revieworderlist').on('click', function(){
	$(this).addClass('active');
	$('.revieworderlist').removeClass('active');
	$('.review_order_listbox').css('display','none'); 
	$('.review_order_button').text($(this).text());
});

$('.photo_list').on('click',function(){
	$('.swiper').css('display','block');
});
$('.close_icon').on('click',function(){
	$('.swiper').css('display','none');
});

$('.best_review').text('Best Review');


	
});












