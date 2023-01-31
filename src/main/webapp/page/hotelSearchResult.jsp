<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>
<%@ page import="com.wagu.dto.*"%>
<%@ page import="com.wagu.dao.*"%>
<%@ page import="com.wagu.connection.DBconnection"%>
<%
	String city = (String)request.getParameter("city");
// 	String date1 = (String)request.getParameter("date1");
// 	String date2 = (String)request.getParameter("date2");
	int checkpeople=0;
	try{
		checkpeople = Integer.parseInt(request.getParameter("checkpeople"));
	}catch(Exception e){
		e.printStackTrace();
	}
	String date1 = (String)request.getParameter("date1");
	String date2 = (String)request.getParameter("date2");
	
	
	HotelDAO hDao = new HotelDAO();
	ArrayList<HotelMainDTO> listhotelmain = hDao.getHotelList(city);
%>
									

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 호텔 검색 결과</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hotelsearchResult.css">
    <link rel="stylesheet" href="../css/hotelcommon.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script src="../js/common.js"></script>
    <script src="../js/hotelsearchResult.js"></script>
    <script src="../js/hotelsearch.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/daterangepicker.css" />

    <style>
	    .daterangepicker {
			  top: 469px !important;
			  left: 549px !important;
			}
	</style>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">

		<div class="hotel_header">
			<div class="background" style="background-image: url('../images/hotel/imghotelhead.jpg');">
				<div class="background_cover"></div>
				<div class="head_title_cover">
					<div class="head_title">호텔</div>
				</div>
			</div>
		</div>
		<div class="search_section">
			<div class="search_hotel">
				<div class="search_hotel_position">
					<div class="search_hotel_section">
						<form action="hotelSearchAction">
							<div class="search_hotel_wrapper">
								<div class="box hotelsearch">
									<img class="search_lens" src="../images/hotel/imghotelsearchlens.svg" alt="searchicon">
									
									
									<div class="text_input">
										<input id="search_location" value="<%=city %>" placeholder="어디로 떠나시나요?" style="font-size:15px; font-weight:500">
									</div>
									
									<div class="search_popup">
										<div class="search_area_list">
											<div class="search_area_list_wrapper active">서울</div>
											<div class="search_area_list_wrapper">경기</div>
											<div class="search_area_list_wrapper">인천</div>
											<div class="search_area_list_wrapper">강원</div>
											<div class="search_area_list_wrapper">충청</div>
											<div class="search_area_list_wrapper">경상</div>
											<div class="search_area_list_wrapper">전라</div>
											<div class="search_area_list_wrapper">제주</div>
										</div>
										<div class="search_area_listdetails">
											<div class="search_area_listdetails_wrapper active">
												<div class="tap">서울 전체</div>
												<div class="tap">강남 . 서초</div>
												<div class="tap">송파 . 강동</div>
												<div class="tap">광진 . 성동 . 동대문</div>
												<div class="tap">중구 . 종로. 성북</div>
												<div class="tap">마포 . 은평 . 서대문</div>
												<div class="tap">용산</div>
												<div class="tap">영등포 . 구로</div>
												<div class="tap">노원 . 강북 . 도봉</div>
												<div class="tap">관악 . 금천 . 동작</div>
												<div class="tap">강서</div>
											</div>
											<div class="search_area_listdetails_wrapper">
												<div class="tap">경기 전체</div>
												<div class="tap">가평 . 양평</div>
												<div class="tap">수원 . 화성</div>
												<div class="tap">고양 . 김포 . 파주</div>
												<div class="tap">의정부 . 포천 . 양주 . 동두천 . 연천</div>
												<div class="tap">용인 . 성남</div>
												<div class="tap">평택 . 오산 . 안성</div>
												<div class="tap">구리 . 남양주 . 하남</div>
												<div class="tap">이천 . 여주</div>
												<div class="tap">안양 . 시흥 . 부천 . 안산 . 광명</div>
											</div>
											<div class="search_area_listdetails_wrapper">
												<div class="tap">인천 전체</div>
												<div class="tap">중구 (인천국제공항)</div>
												<div class="tap">부평 . 계양 . 서구</div>
												<div class="tap">연수 . 남동 . 미추홀</div>
												<div class="tap">강화 . 웅진</div>
											</div>
											<div class="search_area_listdetails_wrapper">
												<div class="tap">강원 전체</div>
												<div class="tap">속초 . 양양 . 고성</div>
												<div class="tap">춘천 . 인제 . 양구</div>
												<div class="tap">강릉</div>
												<div class="tap">정선 . 평창 . 영월</div>
												<div class="tap">동해 . 삼척 . 태백</div>
												<div class="tap">원주 . 홍천 . 횡성</div>
											</div>
											<div class="search_area_listdetails_wrapper">
												<div class="tap">충청 전체</div>
												<div class="tap">대전 . 세종특별자치시</div>
												<div class="tap">청주 . 보은</div>
												<div class="tap">충주 . 제천 . 단양</div>
												<div class="tap">진천 . 음성</div>
												<div class="tap">천안 . 아산</div>
												<div class="tap">보령 . 부여 . 서천</div>
												<div class="tap">서산 . 태안</div>
												<div class="tap">공주 . 예산 . 청양</div>
											</div>
											<div class="search_area_listdetails_wrapper">
												<div class="tap">경상 전체</div>
												<div class="tap">부산</div>
												<div class="tap">대구 . 구미 . 안동 . 문경</div>
												<div class="tap">경주 . 청도</div>
												<div class="tap">포항 . 영덕 . 울진 . 청송</div>
												<div class="tap">칠곡 . 성주</div>
												<div class="tap">울산 . 양산</div>
												<div class="tap">거제 . 통영</div>
												<div class="tap">창원 . 김해</div>
												<div class="tap">진주 . 사천 . 남해 . 고성 . 하동</div>
												<div class="tap">거창 . 함양 . 산청</div>
												<div class="tap">밀양 . 창녕</div>
											</div>
											<div class="search_area_listdetails_wrapper">
												<div class="tap">전라 전체</div>
												<div class="tap">전주 . 완주</div>
												<div class="tap">남원 . 부안 . 정읍 . 무주 . 구례</div>
												<div class="tap">군산 . 익산</div>
												<div class="tap">광주 . 나주</div>
												<div class="tap">여수 . 고흥</div>
												<div class="tap">순천 . 광양 . 담양 . 보성 . 화순</div>
												<div class="tap">목포 . 영암 . 강진 . 진도 . 완도</div>
												<div class="tap">영광 . 장성 . 신안 . 무안</div>
											</div>
											<div class="search_area_listdetails_wrapper">
												<div class="tap">제주 전체</div>
												<div class="tap">제주</div>
												<div class="tap">서귀포</div>
											</div>
										</div>
									</div>
									<div class="search_x_icon">
										<img src="../images/hotel/imgsearchxicon.svg" alt="x-icon">
									</div>	
									
								</div>
								<div class="box">
									
									<div class="checkinoutbox">
										<div class="checkinoutlogo"></div>
										<input type="hidden" name="date1" id="input_date1" value="<%=date1%>">
										<input type="hidden" name="date2" id="input_date2" value="<%=date2%>">
										<input class="checkinout" type="text" name="checkinout" value="">
										<script src="../js/hotelcheckdate.js"></script>
										
										<div class="nexticon">
											<i class="fa-solid fa-circle-chevron-right"></i>
										</div>	
									</div>
								</div>
								<div class="box checkpeoplebox">
									<div class="checkpeople">
										인원 <span id="showcheckpeople"></span>명
									</div>
									<div class="checkpeople_popup">
										<div class="checkpeople_popup_section">
											<div class="checkpeople_popup_wrapper">
												<div class="title">인원 선택</div>
												<div class="number_input_section">
													<div class="number_input_wrapper">
														<button class="button minus">
															<img src="../images/hotel/imghotelsearchminus.svg" alt="minus icon">
														</button>
														<input type="text" id= "num" class="number" value="<%=checkpeople %>">
														<button class="button plus"> 
															<img src="../images/hotel/imghotelsearchplus.svg" alt="plus icon">
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="gray_button_wrapper">
									<div class="gray_button">검색하기</div>
								</div>
								<div class="pink_button_wrapper">
									<input class="pink_button" value="검색하기">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="searct_hotel_result_area">
				<div class="result_area_header">
					호텔(283)
				</div>
				<div class="result_area_contents">
					<div class="filter_section">
						<div class="filter_wrapper">
							<div class="filter_list">
								<div class="title">가격
									<span class="sub_title">(세금 포함)</span>
								</div>
								<div class="price_select_section">
									<div class="button total">총액 기준</div>
									<div class="button onenight">1박 기준</div>
								</div>
								<div class="price_range_section">₩ 0 - ₩ 847,000</div>
								<div class="price_silde_section">
									<img src="../images/hotel/imgpriceslider.PNG" style="width: 240px;">
								</div>
							</div>
							<div class="filter_list">
								<div class="title">테마</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									비즈니스
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									3성
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									4성
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									특급
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									5성
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									풀빌라
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									관광
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									특급1급
								</div>
								<div class="more_button">
									<span>더보기</span><span>+</span>
									<span style="display: none">접기</span><span style="display: none">-</span>
								</div>
							</div>
							<div class="filter_list">
								<div class="title">포함 사항</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									WIFI
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									주차가능
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									짐보관
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									금연
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									무료주차
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									조식 서비스
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									발렛파킹
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									바/라운지
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									장애인편의시설
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									프린터 사용
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									개인사물함
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									취사가능
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									반려동물 동반가능
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									공항셔틀
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									마사지
								</div>
								<div class="more_button">
									<span>더보기</span><span>+</span>
									<span style="display: none">접기</span><span style="display: none">-</span>
								</div>
							</div>
							<div class="filter_list">
								<div class="title">시설물</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									레스토랑
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									피트니스
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									연회장
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									사우나
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									수영장
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									비즈니스센터
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									루프탑
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									카페
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									세미나실
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									매점/편의점
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									골프장
								</div>
								<div class="checkbox_wrapper" style="display: none">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									취사가능
								</div>
								<div class="more_button">
									<span>더보기</span><span>+</span>
									<span style="display: none">접기</span><span style="display: none">-</span>
								</div>
							</div>
							<div class="filter_list">
								<div class="title">주변 여행지</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									강/호수 주변
								</div>
								<div class="checkbox_wrapper">
									<div class="checkbox_icon">
										<img src="../images/hotel/imgcheckboxicon.svg" alt="unchecked icon">
									</div>
									해수욕장 주변
								</div>
							</div>
							<div class="button">초기화</div>
						</div>
					</div>
					<div class="list_area">
						<div class="tap_section">
							<div class="tap_wrapper"	>
								<div class="tap_list selected">인기순</div>
								<span class="slash">/</span>
								<div class="tap_list">낮은 가격순</div>
								<span class="slash">/</span>
								<div class="tap_list">높은 가격순</div>
							</div>
						</div>
						<div class="result_hotel_list_section">
							<div class="result_hotel_list_wrapper">
							<%
									
									
									for(HotelMainDTO result : listhotelmain) {
							%>
								<div class="result_hotel_list">
									<div class="wish_button">
										<img class="heart_icon pink" src="../images/hotel/imghotelheartpink.svg"
												alt="heart icon"> <img class="heart_icon white"
												src="../images/hotel/imghotelheartwhite.svg" alt="heart icon">
									</div>
									<div class="result_hotel_info">
										<div class="hotelinfoimage" style="background-image: url('../images/hotel/<%=result.getImagesArr()[0] %>');"></div>
										<div class="contents">
											<div class="contents_info" id="<%=result.getHotelId() %>">
												<div class="name"><%=result.getHotelName() %></div>
												<div class="city"><%=result.getHotelLocation() %></div>
												<div class="tags">
													<div class="tag_name">호텔</div>
													<div class="device"></div>
													<div class="tag_name"><%=result.getHotelStar() %></div>
												</div>
											</div> 
											<div class="contents_price">
												<div class="site">
													<div class="price_wrapper site">
														<div class="image" id="agoda" style="background-image: url('../images/hotel/imghotellogoagoda.png');"></div>
														<div class="price">₩ 189,200</div>
													</div>
													<div class="price_wrapper site">
														<div class="image" id="booking" style="background-image: url('../images/hotel/imghotellogobooking_com.png');"></div>
														<div class="price">₩ 190,000</div>
													</div>
													<div class="price_wrapper site">
														<div class="image" id="expedia" style="background-image: url('../images/hotel/imghotellogoexpedia.svg');"></div>
														<div class="price">₩ 195,000</div>
													</div>
													<div class="price_wrapper site">
														<div class="image" id="trip" style="background-image: url('../images/hotel/imghotellogotrip_com.svg');"></div>
														<div class="price">₩ 195,000</div>
													</div>
												</div>
												<div class="wagu_price">
													<div class="price_wrapper wagu">
														<div class="image" style="background-image: url('../images/hotel/imglogowagu.png');"></div>
														<div class="price" id="waguprice">₩ <%=result.getPrice() %></div>
													</div>
													<div class="included_tax">세금포함</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<% } %>
							</div>
								<script>
									var date1 = $("#input_date1").val();
									var date2 = $("#input_date2").val();
									var checkpeople = $("#num").val();
							// 		alert(date1);
								</script> 

<% DBconnection.getConnection().close(); %>						
							
							<div class="see_more_button_wrapper">
								<div class="see_more_button">더보기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

       </main>
       <footer class="footer"></footer>
    </div>
  </body>
</html>
    