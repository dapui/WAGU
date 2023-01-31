$(function(){
  /****** Ajax *******/
  // 위시리스트 상품 추가 or 삭제 (메인)
  $('.main.mainPage .main_itemList_visual_wishList').on('click', function() {
	let icon = $(this).find('.icon');
	let url = $(this).parents('li').find('.main_itemList_info').attr('href');
	let urlArr = url.split('=',2);
	let itemID = urlArr[1];
	let memberID = 900001;
	$.ajax({
		type: 'post',
		url: 'WishItemServlet',
		data: {
			'memberID' : memberID,
			'itemID' : itemID,
		},	
		datatype: 'json',
		success: function(data) {
			alert(data.message);
		},
		error: function(request, status, error) {
			alert('code:'+request.status+'\n'
				 +'message:'+request.responseText+'\n'
				 +'error:'+error);
		}
	});
  });
	
  // 위시리스트 상품 추가 or 삭제 (서브)
  $('.main.sub .main_itemList_visual_wishList').on('click', function() {
	let icon = $(this).find('.icon');
	let url = $(this).parents('li').find('.main_itemList_info').attr('href');
	let urlArr = url.split('=',2);
	let itemID = urlArr[1];
	let memberID = 900001;
	$.ajax({
		type: 'post',
		url: '../WishItemServlet',
		data: {
			'memberID' : memberID,
			'itemID' : itemID,
		},	
		datatype: 'json',
		success: function(data) { 
			alert(data.message);
		},
		error: function(request, status, error) {
			alert('code:'+request.status+'\n'
				 +'message:'+request.responseText+'\n'
				 +'error:'+error);
		}
	});
  });
  
  
  
  
  /****** Ajax end *******/

  
  // ajaxs의 경우 $(document).on('click', '.header_user_profile', function(){ ... } 으로 수정
  // $(document).on('click', '.header_user_profile', function(){
  //   $('.header_user_list').slideToggle(350);
  // });
  
  // 상단 프로필
  $('.header_user_profile').on('click', function(){
    $('.header_user_list').slideToggle(350);
  });
  
  // 전체 지역 보기/닫기
  $('.header_area_tit').on('click', function(){
    $('.header_area').css('display','block'); 
  });
  $('.header_area > .btn_close').on('click', function(){
    $('.header_area').css('display','none'); 
  });

  // 스크롤 탑
  $(window).scroll(function() {
    if ($(this).scrollTop() > 700 ) {
      $(".scroll_top").css("display","block");
    } else {
      $(".scroll_top").css("display","none");
    }
  });
  var iOS = ( navigator.userAgent.match(/(iPad|iPhone|iPod)/g) ? true : false );
  if(iOS) {
    $(".scroll_top svg:first-of-type").click(function() {
      $("html, body").animate({
        scrollTop : 0
      }, 400,"easeOutQuart");
      return false;
    });
    $(".scroll_top svg:last-of-type").click(function() {
      $("html, body").animate({
        scrollTop : $(".footer").offset().top
      }, 400,"easeOutQuart");
      return false;
    });
  }else{
    $(".scroll_top svg:first-of-type").click(function() {
      $("html, body").animate({
        scrollTop : 0
      }, 400);
      return false;
    });
    $(".scroll_top svg:last-of-type").click(function() {
      $("html, body").animate({
        scrollTop : $(".footer").offset().top
      }, 400);
      return false;
    });
  }
  
  /***** 상품 리스트 *****/
  // 상품 리스트 영역에 이미지 사이즈 조절
  var response_ratio_img = function(img) {
    var $img = $(img);
    var img_n_w = img.naturalWidth;
    var img_n_h = img.naturalHeight;
    var img_ratio = img_n_w / img_n_h;
    var p_w = $(img).parent().width();
    var p_h = $(img).parent().height();
    var p_ratio = p_w / p_h;

    // 세로가 더 길 경우
    if(img_n_h >= img_n_w){ 
      $img.addClass("portrait");
    }
    //영역보다 이미지 가로가 작을경우
    if(p_w > img_n_w){
      $img.addClass("portrait");
    }
    // 극단적인 가로 비율 커버
    if(p_ratio > img_ratio){ 
      $img.addClass("portrait");
    }else {
      $img.removeClass("portrait");
    }
  }

  // 상품 리스트 영역의 위시리스트 체크 (메인)
  // (hover)
  $('.mainPage .main_itemList_visual_wishList').hover(function(){
    var $icon = $(this).find('.icon');
    if(!$icon.hasClass('active')){
      $icon.attr('src','images/common/wish_on.svg');
    }
  },function(){
    var $icon = $(this).find('.icon');
    if(!$icon.hasClass('active')){
      $icon.attr('src','images/common/wish_off.svg');
    }
  });
  // (click)
  $('.mainPage .main_itemList_visual_wishList').on('click', function(){
    var $icon = $(this).find('.icon');
    if(!$icon.hasClass('active')){
      $icon.addClass('active');
      $icon.attr('src','images/common/wish_on.svg');
    } else {
      $icon.removeClass('active');
      $icon.attr('src','images/common/wish_off.svg');
    }
  });
  
  // 상품 리스트 영역의 위시리스트 체크 (서브)
  // (hover)
  $('.main.sub .main_itemList_visual_wishList').hover(function(){
    var $icon = $(this).find('.icon');
    if(!$icon.hasClass('active')){
      $icon.attr('src','../images/common/wish_on.svg');
    }
  },function(){
    var $icon = $(this).find('.icon');
    if(!$icon.hasClass('active')){
      $icon.attr('src','../images/common/wish_off.svg');
    }
  });
  // (click)
  $('.main.sub .main_itemList_visual_wishList').on('click', function(){
	console.log('click!');
    var $icon = $(this).find('.icon');
    if(!$icon.hasClass('active')){
      $icon.addClass('active');
      $icon.attr('src','../images/common/wish_on.svg');
    } else {
      $icon.removeClass('active');
      $icon.attr('src','../images/common/wish_off.svg');
    }
  });

  // 상품 리스트 영역의 유튜브
  $('.main_itemList_youtube .url iframe').attr('src').replace('watch?v=','embed/');
  $('.main_itemList_visual_youtube').on('click', function(){
    $(this).parents('li').find('.main_itemList_youtube').addClass('active');
    $(this).closest('.main_itemList').find('ul').css({'transform':'inherit', 'z-index':'99999'});
    $('.main').css('z-index','999');
  });
  $('.main_itemList_youtube > i').on('click', function(){
    $(this).parents('li').find('.main_itemList_youtube').removeClass('active');
    $('.main').css('z-index','9');
  });
	//$('.main_itemList_youtube .url iframe').attr('src').replace('watch?v=','embed/');
  
  // video popup open
  function intro_video_popup() {
    $('.vod_popup_wrap').addClass('active');
    $('.vod_popup_wrap video').trigger('play');
  }
  // video popup close
  function btn_close() {
    $('.vod_popup_wrap').removeClass('active');
    $('.vod_popup_wrap video').trigger('pause');
  }
  
  // 상품리스트 가격에 콤마찍기 
  $('.main_itemList_info_price > span').each(function(idx, obj) {
	let price = $(this).text();
	price = comma(price);
	$(this).text(price);
  });
  // 호텔리스트 가격에 콤마찍기 
  $('.main_itemList_info_discountedPrice > span').each(function(idx, obj) {
	let price = $(this).text();
	price = comma(price);
	$(this).text(price);
  });
  

}); // end

// 카테고리 초기화
$('.itemPage_category_select_list > li.reset button').on('click', function() {
  $(".itemPage_category_select_list input").prop("checked", false);
  $('.select_box_price input[name=rangeOne]').val(0);
  $('.select_box_price input[name=rangeTwo]').val(410000);
  $('.select_box_price .outputOne').text('0');
  $('.select_box_price .outputTwo').text('410,000');
  $('.select_box_price .incl-range').css({'width':'100%', 'left':'0'});
});


// 숫자 천단위 콤마찍기 
function comma(sum) {
  return sum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}



/****** Initialize Swiper *******/
// 배너
var swiper = new Swiper('.ad_bannerList_area .mySwiper', {
  autoplay: {
  delay: 4000,
  disableOnInteraction: false,
  },
  speed: 2000,
  slidesPerView: 1,
  spaceBetween: 20,
  slidesPerGroup: 5,
  navigation: {
    nextEl: '.ad_bannerList_area .swiper-button-next',
    prevEl: '.ad_bannerList_area .swiper-button-prev',
  },
  pagination: {
    el: ".ad_bannerList_area .swiper-pagination",
  },
});