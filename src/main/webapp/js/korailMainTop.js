function buttonPink() {
  let start = $(".station_div.start").text();
  let arrive = $(".station_div.arrive").text();

  if((start!="출발역") && (arrive!="도착역")){
    $('.search').addClass('pink');
  }else {
    $('.search').removeClass('pink');
  }
}

$(function(){
  var script = document.createElement("script");
    script.type = "text/javascript";
    script.src = "../js/korailCheckdate.js"; // 왕복

  var script2 = document.createElement("script");
  script2.type = "text/javascript";
  script2.src = "../js/korailCheckdate2.js"; // 편도

  // 왕복&편도 클릭 
  $(".korail_wrapper_top").children().click(function(){
    //border_bottom black으로 바꾸기
    if(!$(this).hasClass("border")){
      $(this).siblings().removeClass("border");
      $(this).addClass("border");
    };
  });

  $(".round_trip").click(function(){	// 왕복
    $(this).parent().siblings('.korail_wrapper_bottom').find('.checkinoutbox').find('script').remove();
    $(this).parent().siblings('.korail_wrapper_bottom').find('.checkinoutbox').append(script);
    $("#input_way").val('왕복');
  });
  
  $(".one_way").click(function(){		// 편도
    $(this).parent().siblings('.korail_wrapper_bottom').find('.checkinoutbox').find('script').remove();
    $(this).parent().siblings('.korail_wrapper_bottom').find('.checkinoutbox').append(script2);
    $("#input_way").val('편도');
  });
  
  // 출발역
  $(".station_div.start").click(function(){
    // 팝업창 열기
    $(this).parents(".station").find(".station_popup").show();
    $(".korail_station_popup_title_input").focus();
    $(this).parent().css('border','1px solid #d91c84');

    $('html').click(function(e){
      if($(e.target).parents(".station.start").length < 1){
          $(".station_popup.start").css('display','none'); 
          $(".station_form.start").css('border', '1px solid #e5e5e5');
      }
    });

    
    
    // 출발역 -> 주요역
    $(".station_popup.start .popular_station_name").click(function(){
   	  let text = $(this).text();
     
      if((text!="출발역")){
        $(this).parents(".station.start").find(".start_x_circle").css('display','inline');
      }
      //$(this).parents(".station").find(".start_x_circle").css('display','inline');
      let popular_station_title = $(this).text();
      $(this).parents(".station.start").find(".station_div").text(popular_station_title);
      let string =$(this).parents(".station.start").find(".station_div").text(popular_station_title).text();
      $('#start_input').val(string);
      buttonPink();
      $(".station_popup").css('display','none'); 
      $(".station_form").css('border', '1px solid #e5e5e5');
  
    });
 
    
    // 출발역:철도역 클릭
    $(".station_popup.start .railWay_satation_name").click(function(){
      let text = $(this).text();
      
      if((text!="출발역")){
        $(this).parents(".station.start").find(".start_x_circle").css('display','inline');
      }
      // $(this).parents(".station").find(".start_x_circle").css('display','inline');
      let railWay_satation_name = $(this).text();
      $(this).parents(".station.start").find(".station_div").text(railWay_satation_name);
      let string =$(this).parents(".station.start").find(".station_div").text(railWay_satation_name).text();
      $('#start_input').val(string);
      buttonPink();
      $(".station_popup").css('display','none'); 
      $(".station_form").css('border', '1px solid #e5e5e5');
    });
   
    
  });
  
   let text = $(".station_div.start").text(); 
  	
   if((text!="출발역")){
    $(".station_popup.start .popular_station_name").parents(".station.start").find(".start_x_circle").css('display','inline');
   }else {
	$(".station_popup.start .popular_station_name").parents(".station.start").find(".start_x_circle").css('display','none');
  }

  // 도착역 
  $(".station_div.arrive").click(function(){
    //팝업창 열기
    $(this).parents(".station").find(".station_popup").show();
    $(".korail_station_popup_title_input").focus();
    $(this).parent().css('border','1px solid #d91c84');

    $('html').click(function(e){
      if($(e.target).parents(".station.arrive").length < 1){
          $(".station_popup.arrive").css('display','none'); 
          $(".station_form.arrive").css('border', '1px solid #e5e5e5');
      }
    });
    
    // 도착역 -> 주요역
    $(".station_popup.arrive .popular_station_name").click(function(){
      let text = $(this).text();
      if((text!="도착역")){
        $(this).parents(".station.arrive").find(".arrive_x_circle").css('display','inline');
      }
      // $(this).parents(".station").find(".arrive_x_circle").css('display','inline');
      let popular_station_title = $(this).text();
      $(this).parents(".station.arrive").find(".station_div").text(popular_station_title);
      let string =$(this).parents(".station.arrive").find(".station_div").text(popular_station_title).text();
      $('#arrive_input').val(string);
      buttonPink();
      $(".station_popup").css('display','none'); 
      $(".station_form").css('border', '1px solid #e5e5e5');
    });

    // 도착역:철도역 클릭
    $(".station_popup.arrive .railWay_satation_name").click(function(){
      let text = $(this).text();

      if((text!="도착역")){
        $(this).parents(".arrive").find(".arrive_x_circle").css('display','inline');
      }
      // $(this).parents(".station").find(".arrive_x_circle").css('display','inline');
      let railWay_satation_name = $(this).text();
      $(this).parents(".station.arrive").find(".station_div").text(railWay_satation_name);
      let string =$(this).parents(".station.arrive").find(".station_div").text(railWay_satation_name).text();
      $('#arrive_input').val(string);
      buttonPink();
      $(".station_popup").css('display','none'); 
      $(".station_form").css('border', '1px solid #e5e5e5');
    });
  });
   let text2 = $(".station_div.arrive").text(); 
  	
   if((text2!="도착역")){
    $(".station_popup.arrive .popular_station_name").parents(".station.arrive").find(".arrive_x_circle").css('display','inline');
   }else {
	$(".station_popup.arrive .popular_station_name").parents(".station.arrive").find(".arrive_x_circle").css('display','none');
  }


  
  //자음 클릭 시 역 리스트 보여주기
  $(".consonants_list").on('click', function() {
    if(!$(this).hasClass("on")){
      $(this).siblings().removeClass("on");
      $(this).addClass("on");
    };
    let idx = $(this).index();
    $(this).parents(".railWay_station_list").find(".railWay_station_name_box > ul").css('display', 'none');
    $(this).parents(".railWay_station_list").find(".railWay_station_name_box > ul").eq(idx).css('display','flex');
  });

 



  // 출발역 close
  $(".start_x_circle").click(function(){
    $(this).parents(".station_form.start").find(".station_div").text("출발역");
    buttonPink();
    $(this).css('display','none');
    $(this).parents(".station").find(".station_popup.start").css('display', 'none');
    $(this).parents(".station").find(".station_form.start").css('border', '1px solid #e5e5e5');
  });

   // 도착역 close
  $(".arrive_x_circle").click(function(){
    $(this).parents(".station_form.arrive").find(".station_div").text("도착역");
    buttonPink();
    $(this).css('display','none');
    $(this).parents(".station").find(".station_popup.arrive").css('display', 'none');
    $(this).parents(".station").find(".station_form.arrive").css('border', '1px solid #e5e5e5');
  });


  //출발역,도착역에 역 입력 됐을 경우 검색하기 버튼 색상 변경
  
  // 인원수 팝업창
  $(".people_num").click(function(){
    $(this).parents(".people").find(".people_popup").show();
    $(this).parent().css('border','1px solid #d91c84');

    $('html').click(function(e){
      if($(e.target).parents(".people").length < 1){
          $(".people_popup").css('display','none');
          $(".people_form").css('border', '1px solid #e5e5e5');
        }
    });
  });

  // 인원수 마이너스 버튼 클릭
  $(".btn_minus").click(function(){
    let adult= Number($(this).parents(".people_popup").find(".qty.adult").val());
    let child = Number($(this).parents(".people_popup").find(".qty.child").val());
    
    let qty = Number($(this).siblings(".qty").val());
    
    if(child>=0 && adult>=1){
      $(".qty.child").val();
      $(this).siblings(".qty").val(qty-1);

      if(Number($(".qty.adult").val()<1)){
        let adult_qty_plus = Number($(".qty.adult").val())+1;
        $(".qty.adult").val(adult_qty_plus);
      }

      if( Number($(".qty.child").val())<0){
        let child_qty_plus = Number($(".qty.child").val())+1;
        $(".qty.child").val(child_qty_plus);
      }

      let adult_qty = Number($('.adult_count_box').find(".qty").val());
      let child_qty = Number($('.child_count_box').find(".qty").val());

      $(this).parents(".people").find(".people_num>.adult_text").text("성인 " + adult_qty + " 명");
      $(this).parents(".people").find(".people_num>.child_text").text("어린이 " + child_qty + " 명");

    }
  });

  // 인원수 플러스 버튼 클릭
  $(".btn_plus").click(function(){
    let adult= Number($(this).parents(".people_popup").find(".qty.adult").val());
    let child = Number($(this).parents(".people_popup").find(".qty.child").val());

    let qty = Number($(this).siblings(".qty").val());

    if(child+adult<5){
      $(this).siblings(".qty").val(qty+1);
      let adult_qty = Number($('.adult_count_box').find(".qty").val());
      let child_qty = Number($('.child_count_box').find(".qty").val());


      $(this).parents(".people").find(".people_num>.adult_text").text("성인 " + adult_qty + " 명");
      $(this).parents(".people").find(".people_num>.child_text").text("어린이 " + child_qty + " 명");
    }
  });

  
 buttonPink();
})