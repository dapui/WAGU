let cnt = 0;   // 전역변수는 모든 함수들 밖에 선언.

$(function (){
	
	// 스크롤 했을 때 header색 변경
	$(window).scroll(function() {
	    if ($(this).scrollTop() > 1250 ) {
	      $(".header").removeClass("detail_header");
	    } else {
	      $(".header").addClass("detail_header");
		  $(".header .header_logo").addClass(".detail_header");
	    }
	 });
	
	// 이미지 모달
	$(".image_left img").click(function(){
		if(!$(".image_left").hasClass("like_heart"&&"play_section")){
		    $(".swiper_section").css({ display:"flex"});
			new Swiper('.swiper.mySwiper2', {initialSlide: 0}); 
			$(".swiper-slide").removeClass(".swiper-slide-active");
		}
	});
	$(".size1").click(function(){
	    $(".swiper_section").css({ display:"flex"});
		new Swiper('.swiper.mySwiper2', {initialSlide: 1}); 
		$(".swiper-slide").removeClass(".swiper-slide-active");
	});
	$(".size2").click(function(){
	    $(".swiper_section").css({ display:"flex"});
		new Swiper('.swiper.mySwiper2', {initialSlide: 2}); 
		$(".swiper-slide").removeClass(".swiper-slide-active");
	});
	$(".size3").click(function(){
	    $(".swiper_section").css({ display:"flex"});
		new Swiper('.swiper.mySwiper2', {initialSlide: 3}); 
		$(".swiper-slide").removeClass(".swiper-slide-active");
	});
	$(".size4").click(function(){
	    $(".swiper_section").css({ display:"flex"});
		new Swiper('.swiper.mySwiper2', {initialSlide: 4}); 
		$(".swiper-slide").removeClass(".swiper-slide-active");
	});
	
	
	// 모달 닫기
	$(".close_button").click(function(){
		$(".swiper_section").css({display:"none"});
	});
	
	// 위시리스트 하트 마우스 갖다 댔을때
	let num = 0;
	$(".like_heart img").mouseover(function(){
		$(this).attr("src","../images/detailPage/heart_pink.svg");
	});
	
	// 하트 눌렀을 때
	$(".like_heart img").click(function () {
		if(num==0){
			$(this).attr("src","../images/detailPage/heart_pink.svg");
			num = 1;
		} else {
			num = 0;
		}
	});
	
	// 위시리스트 하트 마우스 뗐을 때
	$(".like_heart img").mouseout(function(){
		$(this).attr("src","../images/detailPage/heart_white.svg");
		if(num==1){
			$(this).attr("src","../images/detailPage/heart_pink.svg");
		}
	});

	// 가격 스크롤이랑 같이 내려가기
	$(document).ready(function(){
		$(window).scroll(function(){
			$('#price_area').css('top',$(window).scrollTop()+500);
		});
	});
	
	// 상단바 스크롤
	$(window).scroll(function() {
	    if ($(this).scrollTop() < 1250 ) {
	      	$(".top_bar").css("display","none");
	    } else {
			$(".top_bar").css("display","flex");
		}
	});
	
	
    // 마우스 올리면 색 변경
	//let cnt = 0;
	cnt = 0;
	$(".top").mouseover(function(){
		$(this).css("color","#D91C84");
	})
	.mouseout(function(){
		$(this).css("color","#999");
	});
	
	
	
	// top_bar 맞는 위치로 눌렀을 때 이동
	$('.top_bar li a.top_content1').click(function(){
		var height = $("#top_content1").offset();
    	$("html, body").animate({scrollTop: height.top-90}, 100, "linear");
	});
	$('.top_bar li a.top_content2').click(function(){
		var height = $("#top_content2").offset();
    	$("html, body").animate({scrollTop: height.top-90}, 100, "linear");
	});
	$('.top_bar li a.top_content3').click(function(){
		var height = $("#top_content3").offset();
    	$("html, body").animate({scrollTop: height.top-90}, 100, "linear");
	});
	$('.top_bar li a.top_content4').click(function(){
		var height = $("#top_content4").offset();
    	$("html, body").animate({scrollTop: height.top-90}, 100, "linear");
	});
	$('.top_bar li a.top_content5').click(function(){
		var height = $("#top_content5").offset();
    	$("html, body").animate({scrollTop: height.top-90}, 100, "linear");
	});
	$('.top_bar li a.top_content6').click(function(){
		var height = $("#top_content6").offset();
    	$("html, body").animate({scrollTop: height.top-90}, 100, "linear");
	});
	
	// target 위치 표시와, 이동  
    var sections = $(".target"),
        nav = $(".top_bar"),
        nav_height = nav.outerHeight();

    $(window).on("scroll", function() {
        var cur_pos = $(this).scrollTop();

        sections.each(function() {
            var top = $(this).offset().top-nav_height-90,
                bottom = top + $(this).outerHeight();

            if (cur_pos >= top && cur_pos <= bottom) {
                nav.find("a").parent().removeClass("on");
                sections.removeClass("active");

                $(this).parent().addClass("on");
                nav.find('a.' + $(this).attr('id')).parent().addClass("on");
            }
        });
    });

	var counts = [0,0,0,0,0,0,0,0,0];
	// 옵션보기
	$(".option_title").click(function (){
		var idx = $(".option_title").index(this);
		if(counts[idx]==0) {
			//$(".option_content_section").show();
			$(this).parent().find(".option_content_section").show();
			counts[idx]=1;
		} else {
			//$(".option_content_section").hide();
			$(this).parent().find(".option_content_section").hide();
			counts[idx]=0;
		}
		if(!$(this).hasClass("option_active")){
			//$(".option_title").addClass("option_active");
			$(this).addClass("option_active");
		} else {
			//$(".option_title").removeClass("option_active");
			$(this).removeClass("option_active");
		}
	});
	
	// 프로그램 이미지 경로 변경
	$(".program img").attr("src", "\"../../\""+"src")
	
	// 위치 복사
	$("#copy").click(function() {
      var copyText = document.getElementById("address");//클립보드에 복사할 텍스트 가져옴
      var textArea = document.createElement("textarea");//textarea 생성
      
      textArea.value = copyText.textContent;//textarea에 텍스트 입력
      document.body.appendChild(textArea);//body에 textarea 추가
      
      textArea.select();//선택
      document.execCommand("Copy");//복사
      textArea.remove();//생성한 textarea 삭제
      
      alert("주소가 복사되었습니다.");
    });

	
})

