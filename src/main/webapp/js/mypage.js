$(function(){
  
  /********** 프로필 **********/
  // 회원정보 수정버튼 on/off
  $('.mypage_content_profile_info > button.edit').on('click',function(){
    $(this).parents('.mypage_content_profile_info').addClass('active');
    $(this).parents('.mypage_content_profile_info').find('input').attr('readonly',false);
  });

  // 회원정보 수정(취소/확인) 박스 on/off
  $('.mypage_content_profile_info > .edit_box button').on('click',function(){
    $(this).parents('.mypage_content_profile_info').removeClass('active');
    $(this).parents('.mypage_content_profile_info').find('input').attr('readonly',true);
  });
   // 회원정보 수정 (이름,생년월일,이메일)
  $('.mypage_content_profile_info.common .edit_modify').on('click', function() {
    let infoInput = $(this).parents('.mypage_content_profile_info').find('input');
    let oldValue = infoInput.attr('data-oldValue'); 
    let currentValue = infoInput.val();
    infoInput.attr('data-oldValue',currentValue);
    infoInput.attr('value',currentValue);
    if(infoInput.attr('name') == 'name') {  // 이름 수정시
      $('.mypage_profile > .name').text(currentValue);
      $('.header_user_profile .name').text(currentValue);
    }
  });
   // 회원정보 수정 (휴대전화번호)
  $('.mypage_content_profile_info.tel .edit_modify').on('click', function() {
    $(this).parents('.mypage_content_profile_info').find('input[name=tel]').each(function(idx, obj) {
      let oldValue = $(this).attr('data-oldValue');
      let currentValue = $(this).val();
      $(this).attr('data-oldValue',currentValue);
      $(this).attr('value',currentValue);
    });
  });
  // 회원정보 취소 (이름,생년월일,이메일)
  $('.mypage_content_profile_info.common .edit_cancel').on('click', function() {
    let infoInput = $(this).parents('.mypage_content_profile_info').find('input');
    let oldValue = infoInput.attr('data-oldValue'); 
    let currentValue = infoInput.val();
    infoInput.val(oldValue);
    infoInput.attr('value', oldValue);
  });
     // 회원정보 취소 (휴대전화번호)
  $('.mypage_content_profile_info.tel .edit_cancel').on('click', function() {
    $(this).parents('.mypage_content_profile_info').find('input[name=tel]').each(function(idx, obj) {
      let oldValue = $(this).attr('data-oldValue');
      let currentValue = $(this).val();
      $(this).val(oldValue);
      $(this).attr('value',oldValue);
    });
  });

  // 회원탈퇴
  $('.mypage_content_profile_delete > button').on('click',function(){
    $(this).parents('.mypage_content_profile_delete').addClass('active');
  });
  $('.mypage_content_profile_delete > .delete_box > i, .mypage_content_profile_delete > .delete_box > .delete_box_check .cancel').on('click',function(){
    $(this).parents('.mypage_content_profile_delete').removeClass('active');
  });

  /********** 액티비티 **********/
  // 액티비티 하단 구매하기 버튼
  $('.mypage_content_activity_none > button').on('click',function(){
    $('.header_area').css('display','block');
  });

  /********** 이용후기 **********/
  // 이용후기 tab
  $(".mypage_content_review_tab > li").click(function(){
    let idxTab = $(this).index();
    let $tabIcon = $(this).find('img');
    if(!$(this).hasClass('active')){
      $(this).addClass('active').siblings().removeClass('active');
      $(this).parents('.mypage_content_review').find('.mypage_content_review_content > .mypage_content_review_sec').hide().eq(idxTab).css('display','block');
    }
  });

  $(".seat_text:contains(text)").text($("#id1 p:contains('dog')").text().replace('dog', 'doll')); 
    $('.seat').click(function(){
    
    if(!$(this).hasClass('other_seat')){
      $(this).addClass('other_seat');
      $('.seat_number_info_title .seat_text').append($(this).text());
      let seat =$('.seat_number_info_title .seat_text').append('<span> </span>'); 
      $(this).text().appendTo(seat+ '.seat_number_info_title .seat_text');
    }else {
      $(this).removeClass('other_seat');
      $("(.seat_text):contains('$(this).text()')").text($("(.seat_text):contains('$(this).text()')").text().replace('$(this).text', ' ')); 
    }
  });

  /********** 장바구니 **********/
  // 장바구니 전체선택 체크박스(all)
  $('#select_all').click(function(){
    if($('#select_all').is(':checked')){
      $('input[name=select]').prop('checked', true);
    } else{
      $('input[name=select]').prop('checked', false);
    }
  });
  $('input[name=select]').click(function(){
    let total = $('input[name=select]').length;
    let checked = $('input[name=select]:checked').length;
    if(total != checked){
      $('#select_all').prop('checked', false);
    } else {
      $('#select_all').prop('checked', true); 
    }
  });

  // 장바구니 예약버튼 컬러
  $('.basket_check').click(function(){
    if($('.basket_check').is(':checked')){
      $('.mypage_content_basket_btn .reservation').addClass('active');
    } else{
      $('.mypage_content_basket_btn .reservation').removeClass('active');
    }
  });

  // 장바구니 계산
  $('.basket_check').on('click', function() {  
    let sum = 0;
    $('input[name=select]').each(function(idx, obj) {
      let price =  Number($(this).parents('tr').find('.price').text().replace('₩ ','').replace(',',''));
      if($(this).is(':checked')){
        sum += price;
      }
    });
    $('.mypage_content_basket_info > .sum .point_color').text('₩ ' + comma(sum));
  });
  
  /********** 위시리스트 **********/
  // 위시리스트 tab
  $('.mypage_content_wishlist_tab > li').click(function(){
    let idxTab = $(this).index();
    let $tabIcon = $(this).find('img');
    if(!$(this).hasClass('active')){
      $(this).addClass('active').siblings().removeClass('active');
      $(this).parents('.mypage_content_wishlist').find('.mypage_content_wishlist_content > .mypage_content_wishlist_sec').hide().eq(idxTab).css('display','flex');
      $tabIcon.attr('src', $tabIcon.attr('src').replace('_off.svg', '_on.svg'));
      $(this).siblings().find('img').attr('src', $(this).siblings().find('img').attr('src').replace('_on.svg', '_off.svg'));
    }
  });
  
  // 위시리스트 아이콘 클릭시 해당 상품 지우기
  $('.main_itemList_visual_wishList').on('click', function() {
	let item = $(this).parents('li');
	let icon = $(this).find('.icon');
	if(icon.hasClass('active')) {
		item.css('display','none');
	}
		
  });


}); // end