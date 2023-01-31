$(function() {
  // 개인정보 동의 전문보기 클릭
  $('.professional_view').on('click',function() {
    $('.privacy_popup').addClass('active');
    $('.main.sub').css('z-index','99');
    $('body').css('overflow', 'hidden');
    return false;
  });

  // 개인정보 동의 팝업창 닫기
  $('.close_button.agree').on('click', function(){
    $('.privacy_popup').removeClass('active');
    $('.main.sub').css('z-index','0');
    $('body').css('overflow', '');
    return false;
  });

  // 카드 & 무통장
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
  });

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

  $('.paymentlist').on('click', function(){
    $(this).addClass('active');
    $('.paymentlist').removeClass('active');
    $('.selecting_payment.bank').css('display','none'); 
    $('.monthly_payment.bank').text($(this).text());
  });

  // 약관 동의
  //전체 체크 박스 클릭
  $('.allAgree').click(function () {
    if($('.allAgree').prop("checked")){
      $('.agreeDetail').prop("checked",true);
    }else {
      $('.agreeDetail').prop("checked",false);
    }
  });

  // 전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
  $('.agreeDetail').click(function() {
    if($("input[name='agreeDetail']:checked").length==2) {
      $('.allAgree').prop("checked",true);
    }else {
      $('.allAgree').prop("checked",false);
    }
  });
});