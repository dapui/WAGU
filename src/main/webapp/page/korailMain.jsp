<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    <link rel="stylesheet" href="../css/korailMain.css">
    <link rel="stylesheet" href="../css/korailMainTop.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
    <script src="../js/korailMainTop.js"></script>
    <script src="../js/korailMain.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/korailDaterangepicker.css" />
    <!-- <script src="../js/subItems.js"></script> -->
    <script>
		var date1 = moment();
		var date2 = moment().add(1, 'days');

    	function onclick_submit() {
    		var date1 = $(".checkinout").val().split(" - ")[0];
    		var date2 = $(".checkinout").val().split(" - ")[1];
			$("#input_date1").val(date1);
			$("#input_date2").val(date2);
    		
			if($(".search_div .search").hasClass("pink")) 
    			return true;
			return false;
    	}
    </script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
      	<jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub" style="margin-bottom:100px">
        <div class="korail_main">
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
                <form class="korail_search_wrapper" action="korailTimeTable.jsp"  name="abc">   <!-- onsubmit="return abc()"  -->
                	<input type="hidden" name="date1" id="input_date1"/>
                	<input type="hidden" name="date2" id="input_date2"/>
                  <div class="korail_search_wrapper_form" >
                    <div class="station start">
                      <div class="station_form start">
                        <div class="station_div start">출발역</div>
                      	<input type="hidden" value="" id="start_input" name="station_start">
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
                                      <li class="railWay_satation_name">강구</li>
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
                        <div class="station_div arrive">도착역</div>
                        <input type="hidden" value="" id="arrive_input" name="station_arrive">
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
                        <input class="checkinout" type="text" value=""  onfocus="this.blur()">
                        <!-- <input class="startdate" type ="hidden" name="startdate" value="">
                        <input class="enddate" type="hidden" name="enddate" value=""> -->
                        <script type="text/javascript" src="../js/korailCheckdate.js"></script>
                      </div>
                    </div>
        
                    <div class="people">
                      <div class="people_form">
                        <img alt="사람아이콘" src="../images/korail/people_icon.svg">
                        <div class="people_num">
                          <span class="adult_text">성인 1 명</span>
                          / 
                          <span class="child_text">어린이 0 명</span>
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
                              <input type="text" class="qty adult" value="1" name="adult">
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
                              <input type="text" class="qty child" value="0" name="child">
                              <button type="button" class="btn_plus">＋</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="search_div one">
    				  <input type="hidden" name="way" id="input_way" value="왕복"/>
                      <input type="submit" class="search" id="search" onclick="return onclick_submit();" value="검색하기">
                      <!-- <button type="button" class="search pink" style="display: none;">검색하기</button> -->
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="search_history_wrapper">
            <div class="search_history_content">
              <p class="search_history_content_title">최근 검색 구간</p>
              <div class = "history_section_wrapper">
                <div class="history_section">
                  <div class="history_section_content">
                    <img class ="train_icon" src="../images/korail/station_icon.svg" alt="기차아이콘">
                    <div>대전</div>
                    <img class="onWay_icon" src="../images/korail/onWay_icon.svg" alt="편도 아이콘">
                    <div>서울</div>
                  </div>
                  <img class="close_icon" src="../images/korail/close_button.svg" alt="닫기">
                </div>
                <div class="history_section">
                  <div class="history_section_content">
                    <img class ="train_icon" src="../images/korail/station_icon.svg" alt="기차아이콘">
                    <div>부산</div>
                    <img class="onWay_icon" src="../images/korail/onWay_icon.svg" alt="편도 아이콘">
                    <div>서울</div>
                  </div>
                  <img class="close_icon" src="../images/korail/close_button.svg" alt="닫기">
                </div>
                <div class="history_section">
                  <div class="history_section_content">
                    <img class ="train_icon" src="../images/korail/station_icon.svg" alt="기차아이콘">
                    <div>광주	</div>
                    <img class="onWay_icon" src="../images/korail/onWay_icon.svg" alt="편도 아이콘">
                    <div>목포</div>
                  </div>
                  <img class="close_icon" src="../images/korail/close_button.svg" alt="닫기">
                </div>
              </div>
            </div>
          </div>
    
    
          <div class="notice_wrapper">
            <div class="notice_content">
              <div class="notice_text">
                ※ 운행정보는 열차 사정에 따라 변경될 수 있으며 정확한 확인은 코레일 홈페이지를 이용해 주시기 바랍니다.<br>
                본 서비스는 코레일 한국철도와 제휴하여 제공하는 승차권 조회 및 예매 서비스 입니다. ㈜와그는 승차권의 판매 당사자가 아니며 승차권 예매를 중개하는 역할만을 수행합니다.<br>
                승차권 판매, 이용에 관한 의무와 책임은 한국철도공사에 있습니다.
              </div>
              <img src="../images/korail/korail_info_icon.png" alt="">
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
