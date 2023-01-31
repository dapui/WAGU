$(function(){

$('.list_button.reserve').on('click', function(){
	$('.detailedinfo_popup').css('display','block');
	$('.main.sub').css('z-index','99');
	$('body').css('overflow', 'hidden');
});
$('.close_button.agree').on('click', function(){
	$('.detailedinfo_popup').css('display','none');
	$('.main.sub').css('z-index','0');
	$('body').css('overflow', '');
});

$('.list_button.refund').on('click', function(){
	$('.refund_rule_popup').css('display','block');
	$('.main.sub').css('z-index','99');
	$('body').css('overflow', 'hidden');
});
$('.close_button.refundrule').on('click', function(){
	$('.refund_rule_popup').css('display','none');
	$('.main.sub').css('z-index','0');
	$('body').css('overflow', '');
});

$('.installment_notice').on('click', function(){
	$('.installment_popup').css('display','block');
	$('.main.sub').css('z-index','99');
	$('body').css('overflow', 'hidden');
});
$('.close_button.installment').on('click', function(){
	$('.installment_popup').css('display','none');
	$('.main.sub').css('z-index','0');
	$('body').css('overflow', '');
});

$('.see_all_letters.rule').on('click', function(){
	$('.hotel_rule_popup').css('display','block');
	$('.main.sub').css('z-index','99');
	$('body').css('overflow', 'hidden');
});
$('.close_button.rule').on('click', function(){
	$('.hotel_rule_popup').css('display','none');
	$('.main.sub').css('z-index','0');
	$('body').css('overflow', '');
});


$('.see_all_letters.refund').on('click', function(){
	$('.hotel_reservation_refund_popup').css('display','block');
	$('.main.sub').css('z-index','99');
	$('body').css('overflow', 'hidden');
});
$('.close_button.refund').on('click', function(){
	$('.hotel_reservation_refund_popup').css('display','none');
	$('.main.sub').css('z-index','0');
	$('body').css('overflow', '');
});

$('.see_all_letters.agree').on('click', function(){
	$('.privacy_popup').css('display','block');
	$('.main.sub').css('z-index','99');
	$('body').css('overflow', 'hidden');
});
$('.close_button.agree').on('click', function(){
	$('.privacy_popup').css('display','none');
	$('.main.sub').css('z-index','0');
	$('body').css('overflow', '');
});

// 전체동의
$('#whole_agree').on('click', function(){
	if($('#whole_agree').prop('checked')){
		$('.agreecheck').prop('checked', true);
	} else {
		$('.agreecheck').prop('checked', false);
	}
});
$('.agreecheck').on('click', function(){
	if($('input[name=agree]:checked').length==2){
		$('#whole_agree').prop('checked', true);
	} else {
		$('#whole_agree').prop('checked', false);
	}
});



// 여기부터 결제수단 (카드,무통장입금)
$('.title_section.card').on('click', function(){
	if($('.selecting_option').css('display')=='block'){
		$('.selecting_option').css('display','none');
		$('.title_section').css('color', '#e5e5e5');
		$('.selected_wrapper').css('border-color','#e5e5e5');
		$('.payment_logo.card').css('-webkit-filter','opacity(.5) drop-shadow(0 0 0 #e5e5e5)');
	} else {
		$('.selecting_option').css('display','block');
		$('.title_section').css('color', '#000000');
		$('.selected_wrapper').css('border-color','#000000');
		$('.payment_logo.card').css('-webkit-filter','none');
	}
	$('.bank_payment_section').css('display','none');
	$('.selected_payment_way_list_bank').css('color', '#e5e5e5');
	$('.selected_payment_way_list_bank').css('border-color','#e5e5e5');
})

$('.card_option').on('click', function(){
	$('.card_option').removeClass('active');
	$('.card_image').removeClass('active');
	$(this).addClass('active');
	$(this).children().addClass('active');
});

$('.other_card').on('click', function(){
	if($('.other_card_listbox').css('display')==('block')){
		$('.other_card_listbox').css('display', 'none');
	} else {
		$('.other_card_listbox').css('display', 'block');
	}
	
});
//$('html').click(function(e){
//	if($(e.target).parents('.other_card_section').length < 1){
//    	$('.other_card_listbox').css('display','none'); 
//    }
//});

$('.cardlist').on('click', function(){
	$('.other_card').text($(this).text());
	$('.other_card_listbox').css('display', 'none');
	$('.card_option').removeClass('active');
	$('.card_image').removeClass('active');
});

$('.monthly_payment.month').on('click', function(){
	if($('.selecting_payment.month').css('display')==('block')){
		$('.selecting_payment.month').css('display', 'none');
	} else {
		$('.selecting_payment.month').css('display', 'block');
	}
});
//$('html').click(function(e){
//	if($(e.target).parents('.monthly_payment_section').length < 1){
//    	$('.selecting_payment.month').css('display','none'); 
//    }
//});

$('.monthly_payment.month').text($('.selecting_payment.month').find('.active').text());

$('.monthlylist').on('click', function(){
	$(this).addClass('active');
	$('.monthlylist').removeClass('active');
	$('.selecting_payment.month').css('display','none'); 
	$('.monthly_payment.month').text($(this).text());
});

$('.bank_wrapper').on('click', function(){
	if($('.bank_payment_section').css('display')=='block'){
		$('.bank_payment_section').css('display','none');
		$('.selected_payment_way_list_bank').css('color', '#e5e5e5');
		$('.selected_payment_way_list_bank').css('border-color','#e5e5e5');
	} else {
		$('.bank_payment_section').css('display','block');
		$('.selected_payment_way_list_bank').css('color', '#000000');
		$('.selected_payment_way_list_bank').css('border-color','#000000');
	}
	$('.selecting_option').css('display','none');
	$('.title_section').css('color', '#e5e5e5');
	$('.selected_wrapper').css('border-color','#e5e5e5');
	$('.payment_logo.card').css('-webkit-filter','opacity(.5) drop-shadow(0 0 0 #e5e5e5)');
});

$('.monthly_payment.bank').on('click', function(){
	if($('.selecting_payment.bank').css('display')==('block')){
		$('.selecting_payment.bank').css('display', 'none');
	} else {
		$('.selecting_payment.bank').css('display', 'block');
	}
});

//$('.monthly_payment.bank').text($('.selecting_payment.bank').find('.active').text());

$('.paymentlist').on('click', function(){
	$(this).addClass('active');
	$('.paymentlist').removeClass('active');
	$('.selecting_payment.bank').css('display','none'); 
	$('.monthly_payment.bank').text($(this).text());
});


$('.payment_button').click(function(){
		location.href = 'paymentFinish.jsp';
	});








});		// 끝!


