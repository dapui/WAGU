$(function(){
  // FAQ tab 메뉴
  $('.faq_content_tab > li').click(function(){
    var idxTab = $(this).index();
    if(!$(this).hasClass('active')){
      $(this).addClass('active').siblings().removeClass('active');
      $(this).parents('.faq_content_wrap').find('.faq_content_menu > .faq_content_menu_sec').hide().eq(idxTab).css('display','block');
    }
  });
  
  // FAQ tab 메뉴 상세내용
  $('.faq_content_menu_list > li').click(function(){
    var idxTab = $(this).index();
    if($(this).hasClass('active')){
      $(this).removeClass('active');
      $(this).find('.faq_content_menu_txt').slideUp(350);
    } else {
      $(this).addClass('active').siblings().removeClass('active');
      $(this).find('.faq_content_menu_txt').slideDown(350);
      $(this).siblings('li').find('.faq_content_menu_txt').slideUp(350);
    }
  });

  // 파트너쉽 유효성 체크
  $('.contactus_form').submit(function(){
    if($('.contactus_form_sec input[name=sbj]').val() == '') {
      alert('제목을 입력해주세요');
      $('.contactus_form_sec input[name=sbj]').focus();
      $('body, html').animate(
        {
          scrollTop:$('.contactus_form_sec input[name=sbj]').offset().top-100
        } ,300);
      return false;
    } else if($('.contactus_form_sec input[name=company]').val() == '') {
      alert('회사명을 입력해주세요');
      $('.contactus_form_sec input[name=company]').focus();
      $('body, html').animate(
        {
          scrollTop:$('.contactus_form_sec input[name=company]').offset().top-100
        } ,300);
      return false;
    } else if($('.contactus_form_sec input[name=name]').val() == '') {
      alert('담당자명을 입력해주세요');
      $('.contactus_form_sec input[name=name]').focus();
      $('body, html').animate(
        {
          scrollTop:$('.contactus_form_sec input[name=name]').offset().top-100
        } ,300);
      return false;
    } else if($('.contactus_form_sec input[name=email]').val() == '') {
      alert('이메일을 입력해주세요');
      $('.contactus_form_sec input[name=email]').focus();
      $('body, html').animate(
        {
          scrollTop:$('.contactus_form_sec input[name=email]').offset().top-100
        } ,300);
      return false;
    } else if($('.contactus_form_sec input[name=phone]').val() == '') {
      alert('휴대전화번호를 입력해주세요');
      $('.contactus_form_sec input[name=phone]').focus();
      $('body, html').animate(
        {
          scrollTop:$('.contactus_form_sec input[name=phone]').offset().top-100
        } ,300);
      return false;
    } else if($('.contactus_form_sec textarea').val() == '') {
      alert('제휴 내용을 입력해주세요');
      $('.contactus_form_sec textarea').focus();
      $('body, html').animate(
        {
          scrollTop:$('.contactus_form_sec textarea').offset().top-100
        } ,300);
      return false;
    } else if($('.contactus_form_sec input[name=agree]:checked').length < 1) {
      alert('개인정보 수집 및 이용에 동의해주세요');
      $('.contactus_form_sec input[name=agree]').focus();
      $('body, html').animate(
        {
          scrollTop:$('.contactus_form_sec input[name=agree]').offset().top-100
        } ,300);
      return false;
    } 
    alert('제휴 문의가 접수되었습니다.');
  });
  
  // 파트너쉽 등록 버튼 
   $('.contactus_form_sec.form_agreement .check_agree').click(function(){
    if($('input[name=agree]:checkbox').is(':checked')){
      $('.contactus_form_sec.form_agreement .form_agreement_submit').addClass('active');
    } else{
      $('.contactus_form_sec.form_agreement .form_agreement_submit').removeClass('active');
    }
  });

}); // end