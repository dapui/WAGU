function sendAjaxSeatPopup(start_date, train_type, ho, start_station, arrive_station) {
	//alert("ajax - send start_date:"+start_date+" / train_type:"+ train_type + " / ho:" + ho);

	$.ajax({
		type:"get",
		url: "../SeatsReservedServlet" ,
		data: {"startDate":start_date, "trainType":train_type, "ho":ho, "startStation":start_station, "arriveStation":arrive_station },
		datatype: "json",
		success: function(data){
			//alert("서버로부터 받은 데이터 data.result="+data.result);
			var arrSeatsReserved = new Array(data.result.length);
			for(var i=0; i<=data.result.length-1; i++) {
				arrSeatsReserved[i] = data.result[i].seat;
			}

			//console.log(arrSeatsReserved);
			
			$(".select_seat_box > ul > li").removeClass("reserved");
			$(".select_seat_box > ul > li").each(function(idx, item) {
				var num = $(item).find("span").text();
				if(arrSeatsReserved.indexOf(num)>-1) {
					// The seat is reserved.
					$(item).addClass("reserved");
				}
			});
			
			$(".seat_remaining_info").each(function(idx, item) {
				var total_count = Number($(item).find("span:nth-child(3)").text().replace("/","").replace("석","").trim());		// "/ 72석"
				var reserved_count = arrSeatsReserved.length;
				$(item).find("span:nth-child(2)").text("잔여 " + (total_count-reserved_count) + "석");
			});
			//alert($(".seat_remaining_info > span:nth-child(3)").text().replace("/","").replace("석","").trim());
			//alert("잔여 " + (total_count-reserved_count) + "석");
			// "잔여 72석"
		},
		error: function(r,s,e) { // Ex13.jsp 참고
			alert("에러!");
		}
	});

}

$(function(){
  // 가는편 오는편 클릭
  $(".timetable_going").click(function() {
    $(".selected_bar").css('left', '0px');
    $(this).siblings(".timetable_coming").css('color','#ccc');
    $(this).css('color','black');
    $(".timetable > .timetable_box:nth-child(2)").hide();
    $(".timetable > .timetable_box:nth-child(1)").show();
  });
  $(".timetable_coming").click(function() {
    $(".selected_bar").css('left', '125px');
    $(this).siblings(".timetable_going").css('color','#ccc');
    $(this).css('color','black');
    $(".timetable > .timetable_box:nth-child(1)").hide();
    $(".timetable > .timetable_box:nth-child(2)").show();
  });

  // 정렬순 클릭
  $('.sort_order').on('click',function(){
    if(!$(this).hasClass('on')){
      $(this).siblings().removeClass('on');
      $(this).addClass('on');
    };
    
  });

  // 필터 버튼
  $('.filter_box').click(function(){
    $(this).parents('.korail_sub').siblings('.filter_popup_box').find('.filter_popup').show();
  });

  // 필터 초기화 버튼
  $('.reset').click(function(){
    $(this).parent().siblings('.filter_popup_content_scroll').find('input').prop('checked',false);
  });


  // 필터 닫기 버튼
  $(".close_button.filter_btn").click(function(){
    $('.filter_popup').css('display','none');
  });

  // 요금조회 버튼 클릭
  $(".price_btn").click(function(){
    $(this).css("display","none");
    $(this).siblings('.timetable_list_content_right').css('display','flex');
  });

  // 바로예약 버튼
  $(".btn_wrapper>button:nth-child(1)").click(function(){
    $(".random_seat_popup").css("display","block");
  });

  // 바로예약 취소 버튼
  $(".cancel").click(function(){
    $(".random_seat_popup").css("display","none");
  });

  // 바로예약 확인 버튼
  $('.confirm').click(function(){
    $('.search_info_content>div:nth-child(4)').text("임의배정");
    $(".random_seat_popup").css("display","none");
  });



  // 좌석팝업창
  $(".btn_wrapper>button:nth-child(2)").click(function(){
	
    if($(this).parents('.timetable_list').find('.train_type>span:nth-child(1)').text()=="KTX"){
      $(".seat_popup.KTX").css("display","block");
    }else if($(this).parents('.timetable_list').find('.train_type>span:nth-child(1)').text()=="무궁화"){
      $(".seat_popup.Mugunghwa").css("display","block");
    }

    var way = get_way();   // '가는편' 또는 '오는편'
    // 가격 복사
    var price = $(this).parent().parent().find('.price_form').text();
    if(way=='가는편') {
    	$(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(6)").text( price );
	} else {
		$(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(6)").text( price );
	}
	// 시간 복사  -- ex."05:15 ~ 06:14(0시간 59분)"]
	var start = $(this).parent().parent().prev().find("div:nth-child(1)").text();   // 05:15
	var arrive = $(this).parent().parent().prev().find("div:nth-child(3)").text();   // 06:14
	var soyo = $(this).parent().parent().prev().find("span").text();  // 0시간59분
	if(way=='가는편') {
    	$(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(2)").text( start + " ~ " + arrive + "(" + soyo + ")" );
	} else {
		$(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(2)").text( start + " ~ " + arrive + "(" + soyo + ")" );
	}
	
	// train type
	var train_type = $(this).parent().parent().parent().prev().text().trim().split(" ")[0];    // 무궁화1312
	if(way=='가는편') {
    	$(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(3)").text( train_type );
	} else {
		$(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(3)").text( train_type );
	}
	// train type을 popup에 보여줌.
	if(train_type.indexOf("무궁화")>-1) {
		$(".seat_popup.Mugunghwa .seat_remaining_info > span:nth-child(1)").text(train_type);
	} else if(train_type.indexOf("KTX")>-1) {
		$(".seat_popup.KTX .seat_remaining_info > span:nth-child(1)").text(train_type);
	}
	
	// .people_form .people_num
	var people1 = $(".people_form .people_num").text().split("/")[0].trim().replace("명",",");
	var people2 = $(".people_form .people_num").text().split("/")[1].trim().replace("명","").trim();
	if(way=='가는편') {
    	$(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(4)").text( people1+people2 );
	} else {
		$(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(4)").text( people1+people2 );
	}
	
	// Ajax : reserved seats를 가져와서 표시.
	var start_date = $("#input_date1").val();    // "01월 19일""
	start_date = "2023-" + start_date.substr(0, 2) + "-" + start_date.substr(4, 2);    // (참고) JS의 substr()과 Java의 substring() 비교!
	train_type = train_type.replace("무궁화","").replace("KTX","");    // "chaining"
	var ho = 1;
	start_station = $(".station_div.start").text();
	arrive_station = $(".station_div.arrive").text();
	sendAjaxSeatPopup(start_date, train_type, ho, start_station, arrive_station);   // ex. 2023-01-19, 1312, 1
	// --------------------------- Ajax 끝.
  });

  // 좌석 팝업창 닫기 버튼
  $(".close_button.seat_btn").click(function(){
    $('.seat_popup').css('display','none');
  });

  // 호차 선택
  $(".trainho").click(function(){
    let idx = $(this).index();
    $(this).siblings('.trainho_selected_bar').css('left','calc(85px*'+ idx+ ')');
    $(this).siblings().css('color','#ccc');
    $(this).css('color','black'); 
    $(this).parents('.select_trainho').siblings('.select_seat_number_info').find('.seat_number_info_title .seat_trainho').text($(this).text());
    $(this).parents('.select_trainho').siblings('.select_seat_number_info').find('.seat_number_info_title .seat_text').text("");
    $(this).parents('.select_trainho').siblings('.select_seat_number_info').find('.seat_number_info_title .seat_count').text("0명 좌석 선택");
    // $(this).parents('.select_trianho').siblings('.select_seat_box').find('.select_seat .seat').removeClass('other_seat');
    $(this).parents('.select_trainho').siblings('.select_seat_box').find('.select_seat .seat').removeClass('other_seat');
    
	// Ajax : reserved seats를 가져와서 표시.
	var start_date = $("#input_date1").val();    // "01월 19일""
	start_date = "2023-" + start_date.substr(0, 2) + "-" + start_date.substr(4, 2);    // (참고) JS의 substr()과 Java의 substring() 비교!
	//train_type = train_type.replace("무궁화","").replace("KTX","");    // "chaining"
	var train_type = $(this).parent().parent().find(".seat_remaining_info > span:nth-child(1)").text().replace("무궁화","").replace("KTX","").trim();
	var ho = idx+1;
	start_station = $(".station_div.start").text();
	arrive_station = $(".station_div.arrive").text();
	sendAjaxSeatPopup(start_date, train_type, ho, start_station, arrive_station);   // ex. 2023-01-19, 1312, 1
	// --------------------------- Ajax 끝.
    
  });

  // 좌석 선택
  $('.seat').on('click',function(){
	if($(this).hasClass("reserved")) {
		return;
	}
	
    let seat_num = $(this).find('span').text();
    if(!$(this).hasClass('other_seat')){
      let adult = Number($(".people_popup").find(".qty.adult").val());
      let child = Number($(".people_popup").find(".qty.child").val());
      /*if($('.seat.other_seat').length>=(adult+child)){
          return;
      }*/
	  if($(this).parent().parent().find('.seat.other_seat').length>=(adult+child)){
          return;
      }
	  
	  if($(this).parent().parent().find('.seat.other_seat').length==(adult+child)){
		$(this).parent().parent().next().find('.btn_seat_complete').css('color', 'red');   // not working. (TODO)
	  }
	  
      $(this).addClass('other_seat');
      $(this).parents('.select_seat_box').siblings('.select_seat_number_info').find('.seat_number_info_title .seat_text').append('<span>'+seat_num+' </span>');
    } else {
      $(this).removeClass('other_seat');
      $(this).parents('.select_seat_box').siblings('.select_seat_number_info').find('.seat_number_info_title .seat_text span:contains('+seat_num+')').text($(this).parents('.select_seat_box').siblings('.seat_number_info_title .seat_text span:contains('+seat_num+')')).replaceWith(''); 

  
    }
    
    $(this).parents('.select_seat_box').siblings('.select_seat_number_info	').find('.seat_number_info_title .seat_count').text($(this).parent().parent().next().find('.seat_text>span').length + "명 좌석 선택");

  });
  

 
});
