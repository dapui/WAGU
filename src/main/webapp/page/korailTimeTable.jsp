<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.wagu.dao.*"%>
<%@page import="com.wagu.dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%
	String startStation = request.getParameter("station_start");
	String arriveStation = request.getParameter("station_arrive");
	//String startDate = request.getParameter("startdate");
	//String endDate = request.getParameter("enddate");
	String checkinout = request.getParameter("checkinout");
	//System.out.println(checkinout);
	String date1 = "";
	String date2 = "";
	if(checkinout==null){
		date1 = request.getParameter("date1");
		date2 = request.getParameter("date2");
	} else {
		//System.out.println("checkinout : " + checkinout);   // 01월+19일+-+01월+26일
		date1 = checkinout.split(" - ")[0];
		date2 = checkinout.split(" - ")[1];
		//System.out.println("date1.date2. : " + date1 + "." + date2 + ".");
	}
	int adult = Integer.parseInt(request.getParameter("adult"));
	int child = Integer.parseInt(request.getParameter("child"));
	
	String way = request.getParameter("way");   // 왕복 or 편도
	if(way==null) way = "";
	
	String paramOrder = request.getParameter("order");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 액티비티, 와서 구경해~</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/korailMainTop.css">
    <link rel="stylesheet" href="../css/korailTimeTable.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/korailMainTop.js"></script>
    <script src="../js/korailTimeTable.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/korailDaterangepicker.css" />
    <script>
    	var date1 = '<%=date1%>';
    	var date2 = '<%=date2%>';
    	
    	function on_click_submit() {
    		var input1_date 	= $(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(1)").text();
    		var input1_time 	= $(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(2)").text();
    		var input1_trainnum = $(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(3)").text();
    		var input1_adult_child = $(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(4)").text();
    		var input1_seat_type = $(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(5)").text();
    		var input1_price 	= $(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(6)").text();
    		
    		var input2_date 	= $(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(1)").text();
    		var input2_time 	= $(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(2)").text();
    		var input2_trainnum = $(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(3)").text();
    		var input2_adult_child = $(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(4)").text();
    		var input2_seat_type = $(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(5)").text();
    		var input2_price 	= $(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(6)").text();

    		return false;
    	}
    	
    	function get_way() {
			if( $(".content_timetable .selected_bar").css('left').replace("px","")==0 ) return "가는편";
			return "오는편";
    	}
    	
    	$(function() {
		<%
    	if("왕복".equals(way)) {
		%>
			//alert('왕');
			 var script = document.createElement("script");
			    script.type = "text/javascript";
			    script.src = "../js/korailCheckdate.js"; // 왕복
			$(".korail_wrapper_top div").removeClass("border");
			$(".korail_wrapper_top div:nth-child(1)").addClass("border");
		    $(".round_trip").parent().siblings('.korail_wrapper_bottom').find('.checkinoutbox').find('script').remove();
		    $(".round_trip").parent().siblings('.korail_wrapper_bottom').find('.checkinoutbox').append(script);
		    $("#input_way").val('왕복');
		<%
    	} else if("편도".equals(way)){
		%>
			//alert('편');
			  var script2 = document.createElement("script");
			  script2.type = "text/javascript";
			  script2.src = "../js/korailCheckdate2.js"; // 편도
			$(".korail_wrapper_top div").removeClass("border");
			$(".korail_wrapper_top div:nth-child(2)").addClass("border");
			$(".one_way").parent().siblings('.korail_wrapper_bottom').find('.checkinoutbox').find('script').remove();
			$(".one_way").parent().siblings('.korail_wrapper_bottom').find('.checkinoutbox').append(script2);
		    $("#input_way").val('편도');
		<%
    	}
		%>
		
		$(".btn_seat_complete").click(function() {
			var seat_hocha_selected = $(this).parent().find(".seat_trainho").text();
			//alert('hocha:' + seat_hocha_selected);	
			var seat_selected = $(this).parent().find(".seat_text").text();
			//alert("seat_text :" + $(this).parent().find(".seat_text").text());
			$(this).parent().parent().parent().parent().hide();
			
			var way = get_way();  // '가는편' 또는 '오는편'
			//alert( Number($(".content_timetable .selected_bar").css('left').replace("px",""))==0 );
			//alert( Number($(".content_timetable .selected_bar").css('left').replace("px",""))>0 );
			
			if(way=="가는편") {
				$(".search_info_box > .search_info_content_wrapper:nth-child(1) > div > div:nth-child(5)").text( seat_hocha_selected + " / " + seat_selected );
			} else if(way=="오는편") {
				$(".search_info_box > .search_info_content_wrapper:nth-child(2) > div > div:nth-child(5)").text( seat_hocha_selected + " / " + seat_selected );
			}
		});
		
		$(".people_num .adult_text").text("성인 <%=adult%> 명");
		$(".people_num .child_text").text("어린이 <%=child%> 명");
		// 여기서부터, 요일계산.
		var weekdays = ['일','월','화','수','목','금','토'];
		d1 = date1.substr(0,2);
		d2 = date1.substr(4,2);
		d3 = date2.substr(0,2);
		d4 = date2.substr(4,2);
    	$("#form_date1").text(date1 + "(" + (weekdays[new Date(2023,Number(d1)-1,Number(d2)).getDay()]) + ")"); 
    	$("#form_date2").text(date2 + "(" + (weekdays[new Date(2023,Number(d3)-1,Number(d4)).getDay()]) + ")"); 
   		$('.next_btn').click(function(){
   			location.href="korailReservation.jsp";
   		})

	  });
    </script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>

      <main class="main sub">
        <div class="korail_timetable_page">
          <!-- --------------------------------------------------------------------------------------- -->
          <div class="filter_popup_box">
            <!-- <div class="going_popup" style="display:none;"> -->
              <div class="filter_popup">
                <div class="dim"></div>
                <div class="filter_popup_content">
                  <div class="filter_popup_header">
                    <div class="filter_popup_title">필터 - 가는편</div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button filter_btn" viewBox="0 0 16 16">
                      <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                  </div>
                  <div class="filter_popup_content_scroll">
                    <div class="container">
                      <div class="title">열차 종류</div>
                      <div class="checkbox_input_container">
                        <div class="checkbox_container_detail">
                          <input type="checkbox"><span>KTX</span>
                        </div>
                        <div class="checkbox_container_detail">
                          <input type="checkbox"><span>무궁화</span>
                        </div>
                      </div>
                    </div>
                    <div class="container">
                      <div class="title">예약</div>
                      <div class="checkbox_input_container">
                        <div class="checkbox_container_detail">
                          <input type="checkbox"><span>예약가능한 열차만 보기</span>
                        </div>
                      </div>
                    </div>
                    <div class="container">
                      <div class="title">출발 시간대</div>
                      <div class="sub_title">00:00 이후 출발</div>
                      <input type="range" min="00:00" max="23:00" step="01:00" class="slider">
                    </div>
                  </div>
                  <div class="filter_popup_footer">
                    <button class="reset">초기화</button>
                    <button class="apply">적용하기</button>
                  </div>
                </div>
              </div>
            <!-- </div> -->
            <!-- <div class="coming_popup" style="display:none;">
              <div class="filter_popup">
                <div class="dim"></div>
                <div class="filter_popup_content">
                  <div class="filter_popup_header">
                    <div class="filter_popup_title">필터 - 오는편</div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button filter_btn" viewBox="0 0 16 16">
                      <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                  </div>
                  <div class="filter_popup_content_scroll">
                    <div class="container">
                      <div class="title">열차 종류</div>
                      <div class="checkbox_input_container">
                        <div class="checkbox_container_detail">
                          <input type="checkbox"><span>KTX</span>
                        </div>
                        <div class="checkbox_container_detail">
                          <input type="checkbox"><span>무궁화</span>
                        </div>
                      </div>
                    </div>
                    <div class="container">
                      <div class="title">예약</div>
                      <div class="checkbox_input_container">
                        <div class="checkbox_container_detail">
                          <input type="checkbox"><span>예약가능한 열차만 보기</span>
                        </div>
                      </div>
                    </div>
                    <div class="container">
                      <div class="title">출발 시간대</div>
                      <div class="sub_title">00:00 이후 출발</div>
                      <input type="range" min="00:00" max="23:00" step="01:00" class="slider">
                    </div>
                  </div>
                  <div class="filter_popup_footer">
                    <button class="reset">초기화</button>
                    <button class="apply">적용하기</button>
                  </div>
                </div>
              </div>
            </div> -->
          </div>
          <!------------------------------------------------------------------------------------------  -->
          <!-- <div class="going_popup" style="display: none;"> -->
          <div class="random_seat_popup">
            <div class="dim"></div>
            <div class="random_seat_content">
                <div class="random_seat_content_title">바로 예약</div>
                <div class="random_seat_content_sub_title">바로 예약 시, 좌석이 임의로 배정됩니다.</div>
                <div class="random_seat_btn">
                  <button class="cancel">취소</button>
                  <button class="confirm">확인</button>
                </div>
            </div>
          </div>
          <!-- </div> -->
          <div class="coming_popup" style="display: none;">
            <div class="random_seat_popup">
              <div class="dim"></div>
              <div class="random_seat_content">
                  <div class="random_seat_content_title">바로 예약</div>
                  <div class="random_seat_content_sub_title">바로 예약 시, 좌석이 임의로 배정됩니다.</div>
                  <div class="random_seat_btn">
                    <button>취소</button>
                    <button>확인</button>
                  </div>
              </div>
            </div>
          </div>
          <!------------------------------------------------------------------------------------------  -->
          <!-- <div class="going_popup" style="display: none;"> -->
            <div class="seat_popup Mugunghwa">
              <div class="dim"></div>
              <div class="Mugunghwa">
                <div class="seat_popup_content">
                  <div class="title_close_button">
                    <div class="seat_popup_header">좌석 선택 - 가는편</div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button seat_btn" viewBox="0 0 16 16">
                      <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                  </div>
                  <div class="seat_type">
                    <div class="type">
                      <img src="../images/korail/seat_icon1.png" alt="선택가능 아이콘">
                      <span>선택 가능</span>
                    </div>
                    <div class="type">
                      <img src="../images/korail/seat_icon2.png" alt="선택된좌석 아이콘">
                      <span>선택된 좌석</span>
                    </div>
                    <div class="type">
                      <img src="../images/korail/seat_icon3.png" alt="선택불가 아이콘">
                      <span>선택 불가</span>
                    </div>
                    <div class="type">
                      <img src="../images/korail/seat_icon4.png" alt="순방향 아이콘">
                      <span>순방향</span>
                    </div>
                  </div>
                  <div class="select_trainho">
                    <div class="trainho" style="color:black">1호차</div>
                    <div class="trainho">2호차</div>
                    <div class="trainho">3호차</div>
                    <div class="trainho">4호차</div>
                    <div class="trainho">5호차</div>
                    <div class="trainho">6호차</div>
                    <div class="trainho_selected_bar"></div>
                  </div>
                  <div class="seat_remaining_info">
                    <span>무궁화 1312</span>
                    <span>잔여 72석</span>
                    <span>/ 72석</span>
                  </div>
                  <div class="select_seat_box">
                    <ul class="select_seat_name">
                      <li>창측</li>
                      <li>내측</li>
                      <li></li>
                      <li> 내측</li>
                      <li>창측</li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>1</span></li>
                      <li class="seat"><span>2</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>3</span></li>
                      <li class="seat"><span>4</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>5</span></li>
                      <li class="seat"><span>6</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>7</span></li>
                      <li class="seat"><span>8</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>9</span></li>
                      <li class="seat"><span>10</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>11</span></li>
                      <li class="seat"><span>12</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>13</span></li>
                      <li class="seat"><span>14</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>15</span></li>
                      <li class="seat"><span>16</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>17</span></li>
                      <li class="seat"><span>18</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>19</span></li>
                      <li class="seat"><span>20</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>21</span></li>
                      <li class="seat"><span>22</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>23</span></li>
                      <li class="seat"><span>24</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>25</span></li>
                      <li class="seat"><span>26</span></li>
                      
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>27</span></li>
                      <li class="seat"><span>28</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>29</span></li>
                      <li class="seat"><span>30</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>31</span></li>
                      <li class="seat"><span>32</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>33</span></li>
                      <li class="seat"><span>34</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>35</span></li>
                      <li class="seat"><span>36</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>37</span></li>
                      <li class="seat"><span>38</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>39</span></li>
                      <li class="seat"><span>40</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>41</span></li>
                      <li class="seat"><span>42</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>43</span></li>
                      <li class="seat"><span>44</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>45</span></li>
                      <li class="seat"><span>46</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>47</span></li>
                      <li class="seat"><span>48</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>49</span></li>
                      <li class="seat"><span>50</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>51</span></li>
                      <li class="seat"><span>52</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>53</span></li>
                      <li class="seat"><span>54</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>55</span></li>
                      <li class="seat"><span>56</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>57</span></li>
                      <li class="seat"><span>58</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>59</span></li>
                      <li class="seat"><span>60</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>61</span></li>
                      <li class="seat"><span>62</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>63</span></li>
                      <li class="seat"><span>64</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>65</span></li>
                      <li class="seat"><span>66</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>67</span></li>
                      <li class="seat"><span>68</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>69</span></li>
                      <li class="seat"><span>70</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>71</span></li>
                      <li class="seat"><span>72</span></li>
                    </ul>
        
                  </div>
                  <diV class="select_seat_number_info">
                    <div class="seat_number_info_title">
                      <span>선택된 좌석 번호 :</span>
                      <span class="seat_count">0명 좌석 선택</span>
                      <span>/</span>
                      <span>총 <%=adult+child%>명</span>
                      <span class="seat_trainho">1호차</span>
                      <span>/</span>
                      <span class="seat_text"></span>
                    </div>
                    <button class="btn_seat_complete">좌석 선택 완료</button>
                  </diV>
                </div>
              </div>
            </div>
            <div class="seat_popup KTX" style="display: none;">
              <div class="dim"></div>
              <div class="KTX">
                <div class="seat_popup_content">
                  <div class="title_close_button">
                    <div class="seat_popup_header">좌석 선택 - 가는편</div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button seat_btn" viewBox="0 0 16 16">
                      <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
                    </svg>
                  </div>
                  <div class="seat_type">
                    <div class="type">
                      <img src="../images/korail/seat_icon1.png" alt="선택가능 아이콘">
                      <span>선택 가능</span>
                    </div>
                    <div class="type">
                      <img src="../images/korail/seat_icon2.png" alt="선택된좌석 아이콘">
                      <span>선택된 좌석</span>
                    </div>
                    <div class="type">
                      <img src="../images/korail/seat_icon3.png" alt="선택불가 아이콘">
                      <span>선택 불가</span>
                    </div>
                    <div class="type">
                      <img src="../images/korail/seat_icon4.png" alt="순방향 아이콘">
                      <span>순방향</span>
                    </div>
                  </div>
                  <div class="select_trainho">
                    <div class="trainho" style="color:black">1호차</div>
                    <div class="trainho">2호차</div>
                    <div class="trainho">3호차</div>
                    <div class="trainho">4호차</div>
                    <div class="trainho">5호차</div>
                    <div class="trainho">6호차</div>
                    <div class="trainho">7호차</div>
                    <div class="trainho">8호차</div>
                    <div class="trainho">9호차</div>
                    <div class="trainho">10호차</div>
                    <div class="trainho_selected_bar"></div>
                  </div>
                  <div class="seat_remaining_info">
                    <span>KTX 116</span>
                    <span>잔여 60석</span>
                    <span>/ 60석</span>
                  </div>
                  <div class="select_seat_box">
                    <ul class="select_seat_name">
                      <li>창측</li>
                      <li>내측</li>
                      <li></li>
                      <li> 내측</li>
                      <li>창측</li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>1A</span></li>
                      <li class="seat"><span>1B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>1C</span></li>
                      <li class="seat"><span>1D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>2A</span></li>
                      <li class="seat"><span>2B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>2C</span></li>
                      <li class="seat"><span>2D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>3A</span></li>
                      <li class="seat"><span>3B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>3C</span></li>
                      <li class="seat"><span>3D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>4A</span></li>
                      <li class="seat"><span>4B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>4C</span></li>
                      <li class="seat"><span>4D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>5A</span></li>
                      <li class="seat"><span>5B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>5C</span></li>
                      <li class="seat"><span>5D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>6A</span></li>
                      <li class="seat"><span>6B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>6C</span></li>
                      <li class="seat"><span>6D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>7A</span></li>
                      <li class="seat"><span>7B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>7C</span></li>
                      <li class="seat"><span>7D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>8A</span></li>
                      <li class="seat"><span>8B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>8C</span></li>
                      <li class="seat"><span>8D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>9A</span></li>
                      <li class="seat"><span>9B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>9C</span></li>
                      <li class="seat"><span>9D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>10A</span></li>
                      <li class="seat"><span>10B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>10C</span></li>
                      <li class="seat"><span>10D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>11A</span></li>
                      <li class="seat"><span>11B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>11C</span></li>
                      <li class="seat"><span>11D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>12A</span></li>
                      <li class="seat"><span>12B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>12C</span></li>
                      <li class="seat"><span>12D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>13A</span></li>
                      <li class="seat"><span>13B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>13C</span></li>
                      <li class="seat"><span>13D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>14A</span></li>
                      <li class="seat"><span>14B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>14C</span></li>
                      <li class="seat"><span>14D</span></li>
                    </ul>
                    <ul class="select_seat">
                      <li class="seat"><span>15A</span></li>
                      <li class="seat"><span>15B</span></li>
                      <li class="seat"><img src="../images/korail/korail_arrow.png" alt="화살표"></li>
                      <li class="seat"><span>15C</span></li>
                      <li class="seat"><span>15D</span></li>
                    </ul>
                  
        
        
                  </div>
                  <diV class="select_seat_number_info">
                    <div class="seat_number_info_title">
                      <span>선택된 좌석 번호 :</span>
                      <span class="seat_count">0명 좌석 선택</span>
                      <span>/</span>
                      <span>총 <%=adult+child%>명</span>
                      <span class="seat_trainho">1호차</span>
                      <span>/</span>
                      <span class="seat_text"></span>
                    </div>
                    <button class="btn_seat_complete">좌석 선택 완료</button>
                  </diV>
                </div>
              </div>
            </div>
    
          <div class="korail_sub">
            <div class="korail_header">
              <div class="korail_page-title">
                <div class="title_content">코레일</div>
              </div>
            </div>
            <div class="wrapper">
              <div class="wrapper_content">
                <div class="korail_wrapper_top">
                  <div class="round_trip border">왕복</div>
                  <div class="one_way">편도</div>
                </div>
          
                <div class="korail_wrapper_bottom">
                  <form class="korail_search_wrapper round_trip">   <!-- onsubmit="return abc()"  -->
           			<input type="hidden" value="<%=request.getParameter("station_start") %>" id="start_input" name="station_start">
           			<input type="hidden" value="<%=request.getParameter("station_arrive") %>" id="arrive_input" name="station_arrive">
                  	<input type="hidden" name="date1" id="input_date1" value="<%=request.getParameter("date1")%>"/>
                	<input type="hidden" name="date2" id="input_date2" value="<%=request.getParameter("date2")%>"/>
                  	
                    <div class="korail_search_wrapper_form" >
                      <div class="station start">
                        <div class="station_form start">
                          <div class="station_div start" name="station_start"><%=startStation %></div>
                          <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="start_x_circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                          </svg>
                        </div>
                        <div class = "station_popup start">
                            <div class = "korail_station_popup_box">
                              <div class = "korail_station_popup_title">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi_search" viewBox="0 0 16 16">
                                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                                <input type="text" placeholder="어디로 떠나시나요?" class="korail_station_popup_title_input">
                              </div>
                              <div class="korail_station_popup_content">
                                <div class="popular_station">
                                  <div class="popular_station_title">주요역</div>
                                  <div class="popular_station_name">광주</div>
                                  <div class="popular_station_name">대전</div>
                                  <div class="popular_station_name">동대구</div>
                                  <div class="popular_station_name">목포</div>
                                  <div class="popular_station_name">부산</div>
                                  <div class="popular_station_name">서대전</div>
                                  <div class="popular_station_name">신경주</div>
                                  <div class="popular_station_name">익산</div>
                                  <div class="popular_station_name">용산</div>
                                </div>
                              
                                <div class="railWay_station">
                                  <div class="railWay_station_title">철도역</div>
                                  <div class="railWay_station_list">
                                    <div class="consonants">
                                      <ul class ="consonants_ul">
                                        <li class="consonants_list on">ㄱ</li>
                                        <li class="consonants_list">ㄴ</li>
                                        <li class="consonants_list">ㄷ</li>
                                        <li class="consonants_list">ㅁ</li>
                                        <li class="consonants_list">ㅂ</li>
                                        <li class="consonants_list">ㅅ</li>
                                        <li class="consonants_list">ㅇ</li>
                                        <li class="consonants_list">ㅈ</li>
                                        <li class="consonants_list">ㅊ</li>
                                        <li class="consonants_list">ㅌ</li>
                                        <li class="consonants_list">ㅍ</li>
                                        <li class="consonants_list">ㅎ</li>
                                      </ul>
                                    </div>
                                    <div class = "railWay_station_name_box">
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">가평</li>
                                        <li class="railWay_satation_name">강경</li>
                                        <li class="railWay_satation_name">강경</li>
                                        <li class="railWay_satation_name">강릉</li>
                                        <li class="railWay_satation_name">개포</li>
                                        <li class="railWay_satation_name">건천</li>
                                        <li class="railWay_satation_name">경산</li>
                                        <li class="railWay_satation_name">경주</li>
                                        <li class="railWay_satation_name">계룡</li>
                                        <li class="railWay_satation_name">고한</li>
                                        <li class="railWay_satation_name">곡성</li>
                                        <li class="railWay_satation_name">공주</li>
                                        <li class="railWay_satation_name">광명</li>
                                        <li class="railWay_satation_name">광양</li>
                                        <li class="railWay_satation_name">광주</li>
                                        <li class="railWay_satation_name">광주송정</li>
                                        <li class="railWay_satation_name">광천</li>
                                        <li class="railWay_satation_name">구래구</li>
                                        <li class="railWay_satation_name">구미</li>
                                        <li class="railWay_satation_name">구포</li>
                                        <li class="railWay_satation_name">군북</li>
                                        <li class="railWay_satation_name">군산</li>
                                        <li class="railWay_satation_name">극락강</li>
                                        <li class="railWay_satation_name">기장</li>
                                        <li class="railWay_satation_name">김제</li>
                                        <li class="railWay_satation_name">김천</li>
                                        <li class="railWay_satation_name">김천구미</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">나주</li>
                                        <li class="railWay_satation_name">남성현</li>
                                        <li class="railWay_satation_name">남원</li>
                                        <li class="railWay_satation_name">남창</li>
                                        <li class="railWay_satation_name">논산</li>
                                        <li class="railWay_satation_name">능주</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">다시</li>
                                        <li class="railWay_satation_name">단양</li>
                                        <li class="railWay_satation_name">대구</li>
                                        <li class="railWay_satation_name">대야</li>
                                        <li class="railWay_satation_name">대전</li>
                                        <li class="railWay_satation_name">대천</li>
                                        <li class="railWay_satation_name">덕소</li>
                                        <li class="railWay_satation_name">덕하</li>
                                        <li class="railWay_satation_name">도계</li>
                                        <li class="railWay_satation_name">도고온천</li>
                                        <li class="railWay_satation_name">동대구</li>
                                        <li class="railWay_satation_name">동백산</li>
                                        <li class="railWay_satation_name">동해</li>
                                        <li class="railWay_satation_name">둔내</li>
                                        <li class="railWay_satation_name">독량</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">마산</li>
                                        <li class="railWay_satation_name">만종</li>
                                        <li class="railWay_satation_name">매곡</li>
                                        <li class="railWay_satation_name">명봉</li>
                                        <li class="railWay_satation_name">목포</li>
                                        <li class="railWay_satation_name">몽탄</li>
                                        <li class="railWay_satation_name">무안</li>
                                        <li class="railWay_satation_name">묵호</li>
                                        <li class="railWay_satation_name">물금</li>
                                        <li class="railWay_satation_name">민둥산</li>
                                        <li class="railWay_satation_name">밀양</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">반성</li>
                                        <li class="railWay_satation_name">백양사</li>
                                        <li class="railWay_satation_name">벌교</li>
                                        <li class="railWay_satation_name">보성</li>
                                        <li class="railWay_satation_name">봉화</li>
                                        <li class="railWay_satation_name">부강</li>
                                        <li class="railWay_satation_name">부산</li>
                                        <li class="railWay_satation_name">부전</li>
                                        <li class="railWay_satation_name">북영천</li>
                                        <li class="railWay_satation_name">북천</li>
                                        <li class="railWay_satation_name">분천</li>
                                        <li class="railWay_satation_name">불국사</li>
                                        <li class="railWay_satation_name">봉양</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">사복</li>
                                        <li class="railWay_satation_name">사상</li>
                                        <li class="railWay_satation_name">삼랑진</li>
                                        <li class="railWay_satation_name">삼례</li>
                                        <li class="railWay_satation_name">삼산</li>
                                        <li class="railWay_satation_name">삼탄</li>
                                        <li class="railWay_satation_name">삼교</li>
                                        <li class="railWay_satation_name">상동</li>
                                        <li class="railWay_satation_name">상봉</li>
                                        <li class="railWay_satation_name">상주</li>
                                        <li class="railWay_satation_name">서경주</li>
                                        <li class="railWay_satation_name">서광주</li>
                                        <li class="railWay_satation_name">서대전</li>
                                        <li class="railWay_satation_name">서울</li>
                                        <li class="railWay_satation_name">서정리</li>
                                        <li class="railWay_satation_name">서천</li>
                                        <li class="railWay_satation_name">석불</li>
                                        <li class="railWay_satation_name">석포</li>
                                        <li class="railWay_satation_name">성환</li>
                                        <li class="railWay_satation_name">센텀</li>
                                        <li class="railWay_satation_name">수원</li>
                                        <li class="railWay_satation_name">순천</li>
                                        <li class="railWay_satation_name">승부</li>
                                        <li class="railWay_satation_name">신경주</li>
                                        <li class="railWay_satation_name">신기</li>
                                        <li class="railWay_satation_name">신녕</li>
                                        <li class="railWay_satation_name">신동</li>
                                        <li class="railWay_satation_name">신례원</li>
                                        <li class="railWay_satation_name">신탄진</li>
                                        <li class="railWay_satation_name">신태인</li>
                                        <li class="railWay_satation_name">신해운대</li>
                                        <li class="railWay_satation_name">심천</li>
                                        <li class="railWay_satation_name">서원주</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">아산</li>
                                        <li class="railWay_satation_name">안강</li>
                                        <li class="railWay_satation_name">안동</li>
                                        <li class="railWay_satation_name">안양</li>
                                        <li class="railWay_satation_name">약목</li>
                                        <li class="railWay_satation_name">양원</li>
                                        <li class="railWay_satation_name">양평</li>
                                        <li class="railWay_satation_name">여수엑스포</li>
                                        <li class="railWay_satation_name">여천</li>
                                        <li class="railWay_satation_name">연산</li>
                                        <li class="railWay_satation_name">영덕</li>
                                        <li class="railWay_satation_name">영동</li>
                                        <li class="railWay_satation_name">영등포</li>
                                        <li class="railWay_satation_name">영월</li>
                                        <li class="railWay_satation_name">영주</li>
                                        <li class="railWay_satation_name">영천</li>
                                        <li class="railWay_satation_name">예당</li>
                                        <li class="railWay_satation_name">예미</li>
                                        <li class="railWay_satation_name">예산</li>
                                        <li class="railWay_satation_name">예천</li>
                                        <li class="railWay_satation_name">오근장</li>
                                        <li class="railWay_satation_name">오산</li>
                                        <li class="railWay_satation_name">오송</li>
                                        <li class="railWay_satation_name">오수</li>
                                        <li class="railWay_satation_name">옥산</li>
                                        <li class="railWay_satation_name">옥천</li>
                                        <li class="railWay_satation_name">온야온천</li>
                                        <li class="railWay_satation_name">완사</li>
                                        <li class="railWay_satation_name">왜관</li>
                                        <li class="railWay_satation_name">용궁</li>
                                        <li class="railWay_satation_name">용문</li>
                                        <li class="railWay_satation_name">용산</li>
                                        <li class="railWay_satation_name">울산</li>
                                        <li class="railWay_satation_name">웅천</li>
                                        <li class="railWay_satation_name">원동</li>
                                        <li class="railWay_satation_name">원주</li>
                                        <li class="railWay_satation_name">월포</li>
                                        <li class="railWay_satation_name">음성</li>
                                        <li class="railWay_satation_name">의성</li>
                                        <li class="railWay_satation_name">이양</li>
                                        <li class="railWay_satation_name">이원</li>
                                        <li class="railWay_satation_name">익산</li>
                                        <li class="railWay_satation_name">일로</li>
                                        <li class="railWay_satation_name">일신</li>
                                        <li class="railWay_satation_name">임기</li>
                                        <li class="railWay_satation_name">임성리</li>
                                        <li class="railWay_satation_name">임실</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">장사</li>
                                        <li class="railWay_satation_name">장성</li>
                                        <li class="railWay_satation_name">장항</li>
                                        <li class="railWay_satation_name">전의</li>
                                        <li class="railWay_satation_name">전주</li>
                                        <li class="railWay_satation_name">점촌</li>
                                        <li class="railWay_satation_name">정동진</li>
                                        <li class="railWay_satation_name">정읍</li>
                                        <li class="railWay_satation_name">제천</li>
                                        <li class="railWay_satation_name">조성</li>
                                        <li class="railWay_satation_name">조치원</li>
                                        <li class="railWay_satation_name">좌천</li>
                                        <li class="railWay_satation_name">주덕</li>
                                        <li class="railWay_satation_name">중리</li>
                                        <li class="railWay_satation_name">증평</li>
                                        <li class="railWay_satation_name">지탄</li>
                                        <li class="railWay_satation_name">지평</li>
                                        <li class="railWay_satation_name">진례</li>
                                        <li class="railWay_satation_name">진부</li>
                                        <li class="railWay_satation_name">진상</li>
                                        <li class="railWay_satation_name">진영</li>
                                        <li class="railWay_satation_name">진주</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">창원</li>
                                        <li class="railWay_satation_name">창원중앙</li>
                                        <li class="railWay_satation_name">천안</li>
                                        <li class="railWay_satation_name">천안아산</li>
                                        <li class="railWay_satation_name">청도</li>
                                        <li class="railWay_satation_name">청량리</li>
                                        <li class="railWay_satation_name">청리</li>
                                        <li class="railWay_satation_name">청소</li>
                                        <li class="railWay_satation_name">청주</li>
                                        <li class="railWay_satation_name">청주공항</li>
                                        <li class="railWay_satation_name">추풍령</li>
                                        <li class="railWay_satation_name">춘앙</li>
                                        <li class="railWay_satation_name">충주</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">탐리</li>
                                        <li class="railWay_satation_name">태백</li>
                                        <li class="railWay_satation_name">태화강</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">판교</li>
                                        <li class="railWay_satation_name">평창</li>
                                        <li class="railWay_satation_name">평택</li>
                                        <li class="railWay_satation_name">포항</li>
                                        <li class="railWay_satation_name">풍기</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">하동</li>
                                        <li class="railWay_satation_name">하양</li>
                                        <li class="railWay_satation_name">한림정</li>
                                        <li class="railWay_satation_name">함안</li>
                                        <li class="railWay_satation_name">함창</li>
                                        <li class="railWay_satation_name">함평</li>
                                        <li class="railWay_satation_name">행신</li>
                                        <li class="railWay_satation_name">현동</li>
                                        <li class="railWay_satation_name">호계</li>
                                        <li class="railWay_satation_name">홍성</li>                          
                                        <li class="railWay_satation_name">화명</li>
                                        <li class="railWay_satation_name">화본</li>
                                        <li class="railWay_satation_name">화순</li>
                                        <li class="railWay_satation_name">황간</li>                              
                                        <li class="railWay_satation_name">횡성</li>
                                        <li class="railWay_satation_name">횡천</li>
                                        <li class="railWay_satation_name">효천</li>
                                      </ul>
                                    </div>
                                  </div>
                                </div>
                              </div>
      
      
                              <div class="no_search">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                                <p>검색 결과가 없습니다.</p>
                              </div>
                            </div>
                          </div>
                      </div>
          
                      <div class="round_trip_icon">
                        <img  src="../images/korail/round_trip_icon.svg" alt="왕복아이콘" class="round_trip_img">
                      </div>
          
                      <div class="station arrive">
                        <div class="station_form arrive">
                          <div class="station_div arrive" name="station_arrive"><%=arriveStation %></div>
                          <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="arrive_x_circle" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                          </svg>
                        </div>
      
                        <div class = "station_popup arrive">
                            <div class = "korail_station_popup_box">
                              <div class = "korail_station_popup_title">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi_search" viewBox="0 0 16 16">
                                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                                <input type="text" placeholder="어디로 떠나시나요?" class="korail_station_popup_title_input">
                              </div>
                              <div class="korail_station_popup_content">
                                <div class="popular_station">
                                  <div class="popular_station_title">주요역</div>
                                  <div class="popular_station_name">광주</div>
                                  <div class="popular_station_name">대전</div>
                                  <div class="popular_station_name">동대구</div>
                                  <div class="popular_station_name">목포</div>
                                  <div class="popular_station_name">부산</div>
                                  <div class="popular_station_name">서대전</div>
                                  <div class="popular_station_name">신경주</div>
                                  <div class="popular_station_name">익산</div>
                                  <div class="popular_station_name">용산</div>
                                </div>
                              
                                <div class="railWay_station">
                                  <div class="railWay_station_title">철도역</div>
                                  <div class="railWay_station_list">
                                    <div class="consonants">
                                      <ul class ="consonants_ul">
                                        <li class="consonants_list on">ㄱ</li>
                                        <li class="consonants_list">ㄴ</li>
                                        <li class="consonants_list">ㄷ</li>
                                        <li class="consonants_list">ㅁ</li>
                                        <li class="consonants_list">ㅂ</li>
                                        <li class="consonants_list">ㅅ</li>
                                        <li class="consonants_list">ㅇ</li>
                                        <li class="consonants_list">ㅈ</li>
                                        <li class="consonants_list">ㅊ</li>
                                        <li class="consonants_list">ㅌ</li>
                                        <li class="consonants_list">ㅍ</li>
                                        <li class="consonants_list">ㅎ</li>
                                      </ul>
                                    </div>
                                    <div class = "railWay_station_name_box">
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name disabled">가평</li>
                                        <li class="railWay_satation_name">강경</li>
                                        <li class="railWay_satation_name">강경</li>
                                        <li class="railWay_satation_name">강릉</li>
                                        <li class="railWay_satation_name">개포</li>
                                        <li class="railWay_satation_name">건천</li>
                                        <li class="railWay_satation_name">경산</li>
                                        <li class="railWay_satation_name">경주</li>
                                        <li class="railWay_satation_name">계룡</li>
                                        <li class="railWay_satation_name">고한</li>
                                        <li class="railWay_satation_name">곡성</li>
                                        <li class="railWay_satation_name">공주</li>
                                        <li class="railWay_satation_name">광명</li>
                                        <li class="railWay_satation_name">광양</li>
                                        <li class="railWay_satation_name">광주</li>
                                        <li class="railWay_satation_name">광주송정</li>
                                        <li class="railWay_satation_name">광천</li>
                                        <li class="railWay_satation_name">구래구</li>
                                        <li class="railWay_satation_name">구미</li>
                                        <li class="railWay_satation_name">구포</li>
                                        <li class="railWay_satation_name">군북</li>
                                        <li class="railWay_satation_name">군산</li>
                                        <li class="railWay_satation_name">극락강</li>
                                        <li class="railWay_satation_name">기장</li>
                                        <li class="railWay_satation_name">김제</li>
                                        <li class="railWay_satation_name">김천</li>
                                        <li class="railWay_satation_name">김천구미</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">나주</li>
                                        <li class="railWay_satation_name">남성현</li>
                                        <li class="railWay_satation_name">남원</li>
                                        <li class="railWay_satation_name">남창</li>
                                        <li class="railWay_satation_name">논산</li>
                                        <li class="railWay_satation_name">능주</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">다시</li>
                                        <li class="railWay_satation_name">단양</li>
                                        <li class="railWay_satation_name">대구</li>
                                        <li class="railWay_satation_name">대야</li>
                                        <li class="railWay_satation_name">대전</li>
                                        <li class="railWay_satation_name">대천</li>
                                        <li class="railWay_satation_name">덕소</li>
                                        <li class="railWay_satation_name">덕하</li>
                                        <li class="railWay_satation_name">도계</li>
                                        <li class="railWay_satation_name">도고온천</li>
                                        <li class="railWay_satation_name">동대구</li>
                                        <li class="railWay_satation_name">동백산</li>
                                        <li class="railWay_satation_name">동해</li>
                                        <li class="railWay_satation_name">둔내</li>
                                        <li class="railWay_satation_name">독량</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">마산</li>
                                        <li class="railWay_satation_name">만종</li>
                                        <li class="railWay_satation_name">매곡</li>
                                        <li class="railWay_satation_name">명봉</li>
                                        <li class="railWay_satation_name">목포</li>
                                        <li class="railWay_satation_name">몽탄</li>
                                        <li class="railWay_satation_name">무안</li>
                                        <li class="railWay_satation_name">묵호</li>
                                        <li class="railWay_satation_name">물금</li>
                                        <li class="railWay_satation_name">민둥산</li>
                                        <li class="railWay_satation_name">밀양</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">반성</li>
                                        <li class="railWay_satation_name">백양사</li>
                                        <li class="railWay_satation_name">벌교</li>
                                        <li class="railWay_satation_name">보성</li>
                                        <li class="railWay_satation_name">봉화</li>
                                        <li class="railWay_satation_name">부강</li>
                                        <li class="railWay_satation_name">부산</li>
                                        <li class="railWay_satation_name">부전</li>
                                        <li class="railWay_satation_name">북영천</li>
                                        <li class="railWay_satation_name">북천</li>
                                        <li class="railWay_satation_name">분천</li>
                                        <li class="railWay_satation_name">불국사</li>
                                        <li class="railWay_satation_name">봉양</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">사복</li>
                                        <li class="railWay_satation_name">사상</li>
                                        <li class="railWay_satation_name">삼랑진</li>
                                        <li class="railWay_satation_name">삼례</li>
                                        <li class="railWay_satation_name">삼산</li>
                                        <li class="railWay_satation_name">삼탄</li>
                                        <li class="railWay_satation_name">삼교</li>
                                        <li class="railWay_satation_name">상동</li>
                                        <li class="railWay_satation_name">상봉</li>
                                        <li class="railWay_satation_name">상주</li>
                                        <li class="railWay_satation_name">서경주</li>
                                        <li class="railWay_satation_name">서광주</li>
                                        <li class="railWay_satation_name">서대전</li>
                                        <li class="railWay_satation_name">서울</li>
                                        <li class="railWay_satation_name">서정리</li>
                                        <li class="railWay_satation_name">서천</li>
                                        <li class="railWay_satation_name">석불</li>
                                        <li class="railWay_satation_name">석포</li>
                                        <li class="railWay_satation_name">성환</li>
                                        <li class="railWay_satation_name">센텀</li>
                                        <li class="railWay_satation_name">수원</li>
                                        <li class="railWay_satation_name">순천</li>
                                        <li class="railWay_satation_name">승부</li>
                                        <li class="railWay_satation_name">신경주</li>
                                        <li class="railWay_satation_name">신기</li>
                                        <li class="railWay_satation_name">신녕</li>
                                        <li class="railWay_satation_name">신동</li>
                                        <li class="railWay_satation_name">신례원</li>
                                        <li class="railWay_satation_name">신탄진</li>
                                        <li class="railWay_satation_name">신태인</li>
                                        <li class="railWay_satation_name">신해운대</li>
                                        <li class="railWay_satation_name">심천</li>
                                        <li class="railWay_satation_name">서원주</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">아산</li>
                                        <li class="railWay_satation_name">안강</li>
                                        <li class="railWay_satation_name">안동</li>
                                        <li class="railWay_satation_name">안양</li>
                                        <li class="railWay_satation_name">약목</li>
                                        <li class="railWay_satation_name">양원</li>
                                        <li class="railWay_satation_name">양평</li>
                                        <li class="railWay_satation_name">여수엑스포</li>
                                        <li class="railWay_satation_name">여천</li>
                                        <li class="railWay_satation_name">연산</li>
                                        <li class="railWay_satation_name">영덕</li>
                                        <li class="railWay_satation_name">영동</li>
                                        <li class="railWay_satation_name">영등포</li>
                                        <li class="railWay_satation_name">영월</li>
                                        <li class="railWay_satation_name">영주</li>
                                        <li class="railWay_satation_name">영천</li>
                                        <li class="railWay_satation_name">예당</li>
                                        <li class="railWay_satation_name">예미</li>
                                        <li class="railWay_satation_name">예산</li>
                                        <li class="railWay_satation_name">예천</li>
                                        <li class="railWay_satation_name">오근장</li>
                                        <li class="railWay_satation_name">오산</li>
                                        <li class="railWay_satation_name">오송</li>
                                        <li class="railWay_satation_name">오수</li>
                                        <li class="railWay_satation_name">옥산</li>
                                        <li class="railWay_satation_name">옥천</li>
                                        <li class="railWay_satation_name">온야온천</li>
                                        <li class="railWay_satation_name">완사</li>
                                        <li class="railWay_satation_name">왜관</li>
                                        <li class="railWay_satation_name">용궁</li>
                                        <li class="railWay_satation_name">용문</li>
                                        <li class="railWay_satation_name">용산</li>
                                        <li class="railWay_satation_name">울산</li>
                                        <li class="railWay_satation_name">웅천</li>
                                        <li class="railWay_satation_name">원동</li>
                                        <li class="railWay_satation_name">원주</li>
                                        <li class="railWay_satation_name">월포</li>
                                        <li class="railWay_satation_name">음성</li>
                                        <li class="railWay_satation_name">의성</li>
                                        <li class="railWay_satation_name">이양</li>
                                        <li class="railWay_satation_name">이원</li>
                                        <li class="railWay_satation_name">익산</li>
                                        <li class="railWay_satation_name">일로</li>
                                        <li class="railWay_satation_name">일신</li>
                                        <li class="railWay_satation_name">임기</li>
                                        <li class="railWay_satation_name">임성리</li>
                                        <li class="railWay_satation_name">임실</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">장사</li>
                                        <li class="railWay_satation_name">장성</li>
                                        <li class="railWay_satation_name">장항</li>
                                        <li class="railWay_satation_name">전의</li>
                                        <li class="railWay_satation_name">전주</li>
                                        <li class="railWay_satation_name">점촌</li>
                                        <li class="railWay_satation_name">정동진</li>
                                        <li class="railWay_satation_name">정읍</li>
                                        <li class="railWay_satation_name">제천</li>
                                        <li class="railWay_satation_name">조성</li>
                                        <li class="railWay_satation_name">조치원</li>
                                        <li class="railWay_satation_name">좌천</li>
                                        <li class="railWay_satation_name">주덕</li>
                                        <li class="railWay_satation_name">중리</li>
                                        <li class="railWay_satation_name">증평</li>
                                        <li class="railWay_satation_name">지탄</li>
                                        <li class="railWay_satation_name">지평</li>
                                        <li class="railWay_satation_name">진례</li>
                                        <li class="railWay_satation_name">진부</li>
                                        <li class="railWay_satation_name">진상</li>
                                        <li class="railWay_satation_name">진영</li>
                                        <li class="railWay_satation_name">진주</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">창원</li>
                                        <li class="railWay_satation_name">창원중앙</li>
                                        <li class="railWay_satation_name">천안</li>
                                        <li class="railWay_satation_name">천안아산</li>
                                        <li class="railWay_satation_name">청도</li>
                                        <li class="railWay_satation_name">청량리</li>
                                        <li class="railWay_satation_name">청리</li>
                                        <li class="railWay_satation_name">청소</li>
                                        <li class="railWay_satation_name">청주</li>
                                        <li class="railWay_satation_name">청주공항</li>
                                        <li class="railWay_satation_name">추풍령</li>
                                        <li class="railWay_satation_name">춘앙</li>
                                        <li class="railWay_satation_name">충주</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">탐리</li>
                                        <li class="railWay_satation_name">태백</li>
                                        <li class="railWay_satation_name">태화강</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">판교</li>
                                        <li class="railWay_satation_name">평창</li>
                                        <li class="railWay_satation_name">평택</li>
                                        <li class="railWay_satation_name">포항</li>
                                        <li class="railWay_satation_name">풍기</li>
                                      </ul>
                                      <ul class="railWay_satation_name_ul">  
                                        <li class="railWay_satation_name">하동</li>
                                        <li class="railWay_satation_name">하양</li>
                                        <li class="railWay_satation_name">한림정</li>
                                        <li class="railWay_satation_name">함안</li>
                                        <li class="railWay_satation_name">함창</li>
                                        <li class="railWay_satation_name">함평</li>
                                        <li class="railWay_satation_name">행신</li>
                                        <li class="railWay_satation_name">현동</li>
                                        <li class="railWay_satation_name">호계</li>
                                        <li class="railWay_satation_name">홍성</li>                            
                                        <li class="railWay_satation_name">화명</li>
                                        <li class="railWay_satation_name">화본</li>
                                        <li class="railWay_satation_name">화순</li>
                                        <li class="railWay_satation_name">황간</li>                              
                                        <li class="railWay_satation_name">횡성</li>
                                        <li class="railWay_satation_name">횡천</li>
                                        <li class="railWay_satation_name">효천</li>
                                      </ul>
                                    </div>
                                  </div>
                                </div>
                              </div>
      
                              <div class="no_search">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                                <p>검색 결과가 없습니다.</p>
                              </div>
                            </div>
                          </div>
                      </div>
                      
                	  <div class="date_form">
                        <div class="checkinoutbox">
                          <img src="../images/korail/calendar_icon.svg" alt="달력아이콘">
                          <input class="checkinout" type="text" value=""  name="checkinout" onfocus="this.blur()">
                         <%--  <input class="startdate" type ="hidden" name="startdate" value="<%=startDate%>">
                          <input class="enddate" type="hidden" name="enddate" value="<%=endDate%>"> --%>
                          <script src="../js/korailCheckdate.js"></script>
                        </div>
                      </div>
                      <div class="people">
                        <div class="people_form">
                          <img alt="사람아이콘" src="../images/korail/people_icon.svg">
                          <div class="people_num">
                            <span class="adult_text" name="adult">성인 1 명</span>
                            / 
                            <span class="child_text" name="">어린이 0 명</span>
                          </div>
                        </div>
                        <div class ="people_popup">
                          <div class="select_people">
                            <div class = "select_people_title">
                              <p class="number_of_passengers">탑승인원 선택</p>
                              <p style="font-size: 14px; color: #999;">성인 포함 최대 5명까지 선택 가능합니다.</p>
                            </div>
                            <div class="adult_count_box">
                              <div class="count_title">
                                <p style="font-size: 15px; ">성인</p>
                                <p style="font-size: 14px; color: #999;">(만 13세 이상)</p>
                              </div>
                              <div class="count_input_wrapper">
                                <button  type="button" class="btn_minus">ㅡ</button>
                                <input type="text" class="qty adult" value="<%=adult%>" name="adult"/>
                                <button type="button" class="btn_plus">＋</button>
                              </div>
                            </div>
                            <div class="child_count_box">
                              <div class="count_title">
                                <p style="font-size: 15px; ">어린이</p>
                                <p style="font-size: 14px; color: #999;">(만 6세이상 ~ 12세 미만)</p>
                              </div>
                              <div class="count_input_wrapper ">
                                <button type="button" class="btn_minus">ㅡ</button>
                                <input type="text" class="qty child" value="<%=child%>" name="child"/>
                                <button type="button" class="btn_plus">＋</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="search_div one">
                        <input type="submit" class="search" value="검색하기">
                      </div>
                    </div>
                  </form>
      
                </div>
              </div>
            </div>
        
            <div class="page_center_box">
              <div class = "content_header">
                <div class="timetable_title">
                  열차 조회
                </div>
              </div>
              <div class="page_content_left">
                <div class="content_timetable">
                  <div class="moving_tab">
                    <div class="timetable_going">가는편</div>
                    <div class="timetable_coming">오는편</div>
                    <div class="selected_bar"></div>
                  </div>
                </div>
        
                <div class = "sort_wrapper">
                  <div class="sort_tab">
                    <div class="sort_order on">출발 시간순</div>
                    <div class="slash">/</div>
                    <div class="sort_order">도착 시간순</div>
                    <div class="slash">/</div>
                    <div class="sort_order">소요 시간순</div>
                  </div>
                  <button class="filter_box">
                    <img alt="필터 아이콘" src="../images/korail/filter_icon.svg" class="filter_icon">
                    <div class="filter_title">필터</div>
                  </button>
                </div>
                
                <div class="timetable">
                  <ul class="timetable_box">
                  <% 
                  	KorailTimeTableDAO kDAO = new KorailTimeTableDAO();
                  	ArrayList<KorailTimeTableDTO> listK = kDAO.listTimetable( startStation,  arriveStation,  adult,  child, paramOrder);  // 가는편 
                  	ArrayList<KorailTimeTableDTO> listK2 = kDAO.listTimetable( arriveStation, startStation,  adult,  child, paramOrder);  // 오는편
                  %>
                  <%
                  	for(KorailTimeTableDTO timeTable :listK){
                  %>
                    <li class="timetable_list">
                      <div class="timetable_list_header">
                        <img alt="기차 아이콘" src="../images/korail/station_icon.svg" class="train_icon">
                        <div class="train_type"><span><%=timeTable.getTrainType() %></span><%=timeTable.getTrainNum() %> <span class="bar">|</span> 예약가능</div>
                      </div>
                      <div class="timetable_list_content">
                        <div class="timetable_list_time">
                          <div class="time"><%=timeTable.getStartTime() %></div>
                          <p class = "timetaken"><span><%=timeTable.getTimeTaken() %></span></p>
                          <div class="time"><%=timeTable. getArriveTime() %></div>
                        </div>
                        <div class="timetable_list_content_right">
                          <div class="price_form">
                            ₩<%=timeTable.getSumPrice() %>
                          </div>
                          <div class="btn_wrapper">
                            <button>바로 예약</button>
                            <button>좌석 선택</button>
                          </div>
                        </div>
                        <div class="price_btn">
                          <button>요금 조회</button>
                        </div>
                      </div>
                    </li>
				   <%
                  	}
				   %>	
                  </ul>
				  <ul class="timetable_box" style="display:none;">
                  <%
                  	for(KorailTimeTableDTO timeTable :listK2){
                  %>
                    <li class="timetable_list">
                      <div class="timetable_list_header">
                        <img alt="기차 아이콘" src="../images/korail/station_icon.svg" class="train_icon">
                        <div class="train_type"><span><%=timeTable.getTrainType() %></span><%=timeTable.getTrainNum() %> <span class="bar">|</span> 예약가능</div>
                      </div>
                      <div class="timetable_list_content">
                        <div class="timetable_list_time">
                          <div class="time"><%=timeTable.getStartTime() %></div>
                          <p class = "timetaken"><span><%=timeTable.getTimeTaken() %></span></p>
                          <div class="time"><%=timeTable. getArriveTime() %></div>
                        </div>
                        <div class="timetable_list_content_right">
                          <div class="price_form">
                            ₩<%=timeTable.getSumPrice() %>
                          </div>
                          <div class="btn_wrapper">
                            <button>바로 예약</button>
                            <button>좌석 선택</button>
                          </div>
                        </div>
                        <div class="price_btn">
                          <button>요금 조회</button>
                        </div>
                      </div>
                    </li>
				   <%
                  	}
				   %>	
                  </ul>
                  
                </div>
              </div>
              <form class="page_content_right" action ="korailReservation.jsp">
                <div class="search_info_box">
                  <div class="search_info_content_wrapper">
                    <span>가는편</span>
                    <div class="search_info_content">
                      <div id="form_date1" class="search_info_content_row"></div>
                      <div class="search_info_content_row"><!-- 05:28 ~ 07:38(2시간 10분) --></div>
                      <div class="search_info_content_row"><!-- 무궁화1312 --></div>
                      <div class="search_info_content_row"><!-- 성인 1, 어린이 1 --></div>
                      <div class="search_info_content_row"><!-- 지정좌석 --></div>
                      <div class="search_info_price_content"><!-- ₩ 16,200 --></div>	
                    </div>
                  </div>
                  <div class="search_info_content_wrapper">
                    <span>오는편</span>
                    <div class="search_info_content">
                      <div id="form_date2" class="search_info_content_row"></div>
                      <div class="search_info_content_row"><!-- 05:15 ~ 06:14(0시간 59분) --></div>
                      <div class="search_info_content_row"><!-- KTX 1 --></div>
                      <div class="search_info_content_row"><!-- 성인 1, 어린이 1 --></div>
                      <div class="search_info_content_row"><!-- 지정좌석 --></div>  <!--  1호차 / 34 35 -->
                      <div class="search_info_price_content"><!-- ₩ 35,550 --></div>
                    </div>
                  </div>
                </div>
                <input type="hidden" id="input1_time" name="input1_time"/>
                <input type="hidden" id="input1_trainnum" name="input1_train"/>
                <input type="hidden" id="input1_adult_child" name="input1_adult_child"/>
                <input type="hidden" id="input1_seat_type" name="input1_seat_type"/>
                <input type="hidden" id="input1_price" name="input1_price"/>
                <input type="hidden" id="input2_time" name="input2_time"/>
                <input type="hidden" id="input2_trainnum" name="input2_train"/>
                <input type="hidden" id="input2_adult_child" name="input2_adult_child"/>
                <input type="hidden" id="input2_seat_type" name="input2_seat_type"/>
                <input type="hidden" id="input2_price" name="input2_price"/>
                <input type="submit" class="next_btn" onclick="return on_click_submit();" value="다음"/>
              </form>
            </div>
          </div>  
        </div>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
