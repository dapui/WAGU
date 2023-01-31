$(function(){
  /****** Ajax *******/
  //
  
  
  // 헤더 스크롤
  if(matchMedia("screen and (min-width: 768px)").matches) {
    $(window).scroll(function() {
      if ($(this).scrollTop() > 500 ) {
        $(".header.mainPage").addClass('on');
        $('.header.mainPage .header_logo').css('background','url(images/common/logo_b.png) no-repeat');
        $(".header.mainPage .header_area_tit").addClass('on');
        $(".header.mainPage .header_user_profile .name").addClass('on');
      } else {
        $(".header.mainPage").removeClass('on');
        $('.header.mainPage .header_logo').css('background','url(images/common/logo_w.png) no-repeat');
        $(".header.mainPage .header_area_tit").removeClass('on');
        $(".header.mainPage .header_user_profile .name").removeClass('on');
      }
      $('.header.mainPage .header_logo').css('background-size','contain');
    });
  
  }
  
  // 입장권(퀵메뉴) 클릭시 전체 지역 보기/닫기
  $('.main_sec02_quick .link.ticket').on('click', function(){
    $('.header_area').css('display','block'); 
  });
  $('.header_area > .btn_close').on('click', function(){
    $('.header_area').css('display','none'); 
  });
  
  // 검색창
  $('.main_sec01_search_item').on('click', function(){
    $('.main_sec01_search_item_area').addClass('show');
  });
  $('html').on('click', function(e){
    if($(e.target).parents('.main_sec01_search_item').length < 1){
      $('.main_sec01_search_item_area').removeClass('show');
      }
  });

   // 모바일 검색창
   if(matchMedia("screen and (max-width: 768px)").matches) {
    $('.header_user_info > i').on('click', function() {
      if(!$('.main_sec01_search').hasClass('active')){
        $(this).removeClass('fa-magnifying-glass');
        $(this).addClass('fa-xmark');
        $('.main_sec01_search').slideDown(400);
        $('.main_sec01_search').addClass('active');
        $('.main_sec01_search_item_area').css('display','block');
      } else {
        $(this).addClass('fa-magnifying-glass');
        $(this).removeClass('fa-xmark');
        $('.main_sec01_search').removeClass('active');
        $('.main_sec01_search_item_area').css('display','none');
      }
    });
  }
}); // jQuery end


/****** Initialize Swiper *******/
// 메인 이미지
var swiper = new Swiper('.main_sec01 .mySwiper', {
  autoplay: {
  delay: 4000,
  disableOnInteraction: false,
  },
  speed: 2000,
  slidesPerView: 1,
  spaceBetween: 0,
  navigation: {
    nextEl: '.main_sec01 .swiper-button-next',
    prevEl: '.main_sec01 .swiper-button-prev',
  },
  pagination: {
    el: ".main_sec01 .swiper-pagination",
    clickable: true,
  }
});

// 인기 여행지
var swiper = new Swiper('.main_sec03 .mySwiper', {
  slidesPerView: 8,
  spaceBetween: 15,
  navigation: {
    nextEl: '.main_sec03 .swiper-button-next',
    prevEl: '.main_sec03 .swiper-button-prev',
  },
  breakpoints: {
    1200: {
      slidesPerView: 8,
      spaceBetween: 15,
    },
    768: {
      slidesPerView: 5,
    },
    500: {
      slidesPerView: 3,
      spaceBetween: 20,
    },
  }
});

// 추천 여행지 
var swiper = new Swiper('.main_sec05 .mySwiper', {
  slidesPerView: 3,
  spaceBetween: 10,
  navigation: {
    nextEl: '.main_sec05 .swiper-button-next',
    prevEl: '.main_sec05 .swiper-button-prev',
  },
  breakpoints: {
    1200: {
      slidesPerView: 3,
      spaceBetween: 20,
    },
    768: {
      slidesPerView: 2,
      spaceBetween: 20,
    },
    500: {
      slidesPerView: 1,
      spaceBetween: 20,
    },
  }
});

//  제주 리스트
var swiper = new Swiper('.main_sec06 .mySwiper', {
  slidesPerView: 5,
  spaceBetween: 10,
  navigation: {
    nextEl: '.main_sec06 .swiper-button-next',
    prevEl: '.main_sec06 .swiper-button-prev',
  },
  breakpoints: {
    1200: {
      slidesPerView: 5,
      spaceBetween: 20,
    },
    768: {
      slidesPerView: 3,
      spaceBetween: 20,
    },
    500: {
      slidesPerView: 2,
      spaceBetween: 20,
    },
  }
});

// 티켓 리스트
var swiper = new Swiper('.main_sec07 .mySwiper', {
  slidesPerView: 5,
  spaceBetween: 10,
  navigation: {
    nextEl: '.main_sec07 .swiper-button-next',
    prevEl: '.main_sec07 .swiper-button-prev',
  },
  breakpoints: {
    1200: {
      slidesPerView: 5,
      spaceBetween: 20,
    },
    768: {
      slidesPerView: 3,
      spaceBetween: 20,
    },
    500: {
      slidesPerView: 2,
      spaceBetween: 20,
    },
  }
});

// 호텔 리스트
var swiper = new Swiper('.main_sec08 .mySwiper', {
  slidesPerView: 5,
  spaceBetween: 10,
  navigation: {
    nextEl: '.main_sec08 .swiper-button-next',
    prevEl: '.main_sec08 .swiper-button-prev',
  },
  breakpoints: {
    1200: {
      slidesPerView: 5,
      spaceBetween: 20,
    },
    768: {
      slidesPerView: 3,
      spaceBetween: 20,
    },
    500: {
      slidesPerView: 2,
      spaceBetween: 20,
    },
  }
});

// 레스토랑 리스트 
var swiper = new Swiper('.main_sec09 .mySwiper', {
  slidesPerView: 5,
  spaceBetween: 10,
  navigation: {
    nextEl: '.main_sec09 .swiper-button-next',
    prevEl: '.main_sec09 .swiper-button-prev',
  },
  breakpoints: {
    1200: {
      slidesPerView: 5,
      spaceBetween: 20,
    },
    768: {
      slidesPerView: 3,
      spaceBetween: 20,
    },
    500: {
      slidesPerView: 2,
      spaceBetween: 20,
    },
  }
});



