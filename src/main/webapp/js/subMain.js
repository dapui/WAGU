$(function(){
  /****** Ajax *******/
  // 검색창 
  
  
  
  
  
  
  /****** Ajax end *******/
  
  // 검색창
  $('.itemPage_search_item').on('click', function(){
    $('.itemPage_search_item_area').addClass('show');
  });
  $('html').on('click', function(e){
    if($(e.target).parents('.itemPage_search_item').length < 1){
      $('.itemPage_search_item_area').removeClass('show');
      }
  });    
  // 모바일 검색창
  $(document).on('click', '.header_user_info > i', function() {
    if(!$('.itemPage_search').hasClass('active')){
      $(this).removeClass('fa-magnifying-glass');
      $(this).addClass('fa-xmark');
      $('.itemPage_search').slideDown(400);
      $('.itemPage_search').addClass('active');
      $('.itemPage_search_item_area').css('display','block');
    } else {
      $(this).addClass('fa-magnifying-glass');
      $(this).removeClass('fa-xmark');
      $('.itemPage_search').removeClass('active');
      $('.itemPage_search_item_area').css('display','none');
    }
  });

  // 퀵메뉴 클릭시 해당 카테고리 이동
  $('.itemPage_quick_list > li').on('click', function() {
    let idx = $(this).index();
    $(this).parents('.main.sub').find('.select_box_item > li').eq(idx).find('input').prop('checked', true);
  });

  // 베스트 셀러
  $('.itemPage_sec02_bestSeller_tab > li').on('click', function(){
    let idxTab = $(this).index();
    $(this).addClass('on').siblings().removeClass('on');
    $(this).parents('.itemPage_sec02_bestSeller').find('.itemPage_sec02_bestSeller_content > .itemPage_sec02_bestSeller_list').hide().eq(idxTab).css('display','flex');
  });

  

  
  
  
}); // end

// 카테고리 input[type=range]
var rangeOne = document.querySelector('input[name="rangeOne"]'),
rangeTwo = document.querySelector('input[name="rangeTwo"]'),
outputOne = document.querySelector('.outputOne'),
outputTwo = document.querySelector('.outputTwo'),
inclRange = document.querySelector('.incl-range'),
updateView = function () {
  if (this.getAttribute('name') === 'rangeOne') {
    outputOne.innerHTML = comma(this.value);
    outputOne.style.left = this.value / this.getAttribute('max') * 100 + '%';
  } else {
    outputTwo.style.left = this.value / this.getAttribute('max') * 100 + '%';
    outputTwo.innerHTML = comma(this.value);
  }
  if (parseInt(rangeOne.value) > parseInt(rangeTwo.value)) {
    inclRange.style.width = (rangeOne.value - rangeTwo.value) / this.getAttribute('max') * 100 + '%';
    inclRange.style.left = rangeTwo.value / this.getAttribute('max') * 100 + '%';
  } else {
    inclRange.style.width = (rangeTwo.value - rangeOne.value) / this.getAttribute('max') * 100 + '%';
    inclRange.style.left = rangeOne.value / this.getAttribute('max') * 100 + '%';
  }
};
function comma(sum) {
  return sum.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
document.addEventListener('DOMContentLoaded', function () {
  updateView.call(rangeOne);
  updateView.call(rangeTwo);
  $('input[type="range"]').on('mouseup', function() {
    this.blur();
  }).on('mousedown input', function () {
    updateView.call(this);
  });
});   





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

// 핫플레이스
var swiper = new Swiper('.itemPage_sec01 .mySwiper', {
  autoplay: {
  delay: 4000,
  disableOnInteraction: false,
  },
  speed: 2000,
  slidesPerView: 4,
  spaceBetween: 20,
  breakpoints: {
    1200: {
      slidesPerView: 4,
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
  },
  navigation: {
    nextEl: '.itemPage_sec01 .swiper-button-next',
    prevEl: '.itemPage_sec01 .swiper-button-prev',
  },
  pagination: {
    el: ".itemPage_sec01 .swiper-pagination",
  },
});

// 액티비티&투어 베스트셀러
var swiper = new Swiper('.itemPage_sec03 .mySwiper', {
  slidesPerView: 5,
  spaceBetween: 10,
  navigation: {
    nextEl: '.itemPage_sec03 .swiper-button-next',
    prevEl: '.itemPage_sec03 .swiper-button-prev',
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

// 인기숙소&호캉스
var swiper = new Swiper('.itemPage_sec04 .mySwiper', {
  slidesPerView: 5,
  spaceBetween: 10,
  navigation: {
    nextEl: '.itemPage_sec04 .swiper-button-next',
    prevEl: '.itemPage_sec04 .swiper-button-prev',
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

// 인기 레스토랑 
var swiper = new Swiper('.itemPage_sec05 .mySwiper', {
  slidesPerView: 5,
  spaceBetween: 10,
  navigation: {
    nextEl: '.itemPage_sec05 .swiper-button-next',
    prevEl: '.itemPage_sec05 .swiper-button-prev',
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

/****** Initialize Swiper end *******/
