<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>WAGU - 호텔 예약</title>
	    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
	    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
	    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
	    <link rel="stylesheet" href="../css/reset.css">
	    <link rel="stylesheet" href="../css/common.css">
	    <link rel="stylesheet" href="../css/hotelMain.css">
	    <link rel="stylesheet" href="../css/hotelcommon.css">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
	    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
	    <script src="../js/hotelsearch.js"></script>
	    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	    <script src="../js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="../css/daterangepicker.css" />
	    <script>
	    	var date1 = moment().add(7, 'days');
	    	var date2 = moment().add(8, 'days');
	    	
	    	function onclick_submit() {
	    		var date1 = $(".checkinout").val().split("              .              ")[0];
	    		var date2 = $(".checkinout").val().split("              .              ")[1];
	    		$("#input_date1").val(date1);
	    		$("#input_date2").val(date2);
	    	}
	    </script>
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
							<form action="hotelSearchResult.jsp">
								<div class="search_hotel_wrapper">
										<div class="box hotelsearch">
											<img class="search_lens" src="../images/hotel/imghotelsearchlens.svg" alt="searchicon">
											<div class="text_input">
												<input id="search_location" name="city" value="" placeholder="어디로 떠나시나요?" style="font-size:15px; font-weight:500">
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
												<input type="hidden" name="date1" id="input_date1">
												<input type="hidden" name="date2" id="input_date2">
												<input class="checkinout" type="text" value="" onfocus="this.blur()">
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
																<button type="button" class="button minus">
																	<img src="../images/hotel/imghotelsearchminus.svg" alt="minus icon">
																</button>
																<input type="text" id= "num" class="number" value="2" name="checkpeople">
																<button type="button" class="button plus"> 
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
											<input type="submit" onclick="return onclick_submit();" class="pink_button" value="검색하기">
										</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			
				<div class="latest_popular_area">
					<div class="latest_hotel_section">
						<div class="title">최근 검색한 숙소</div>
						<div class="latest_hotel_list_section">
							<div class="latest_hotel_list_wrapper">
								<div class="latest_hotel_list" style="margin-right: 15px;">
									<div>
										<div class="image"
											style="background-image: url('../images/hotel/imglatesthotellistex01.jpg');">
											<div class="wish_button">
												<img class="heart_icon pink" src="../images/hotel/imghotelheartpink.svg"
													alt="heart icon"> <img class="heart_icon white"
													src="../images/hotel/imghotelheartwhite.svg" alt="heart icon">
											</div>
										</div>
										<div class="name">노보텔 앰배서더 서울 용산</div>
										<div class="city">서울 용산구 청파로20길 95</div>
										<div class="price_section">
											<span class="price">₩ 183,150</span>
										</div>
									</div>
								</div>
								<div class="latest_hotel_list" style="margin-right: 15px;">
									<div>
										<div class="image"
											style="background-image: url('../images/hotel/imglatesthotellistex02.jpg');">
											<div class="wish_button">
												<img class="heart_icon pink" src="../images/hotel/imghotelheartpink.svg"
													alt="heart icon"> <img class="heart_icon white"
													src="../images/hotel/imghotelheartwhite.svg" alt="heart icon">
											</div>
										</div>
										<div class="name">몬드리안 서울 이태원(Mondrian Seoul Itaewon)</div>
										<div class="city">서울 용산구 장문로 23</div>
										<div class="price_section">
											<span class="price">₩ 177,650</span>
										</div>
									</div>
								</div>
							</div>
					</div>
					</div>
					<div class="popular_location_section">
						<div class="title">인기 여행지</div>
						<div class="popular_location_list_section">
							<div class="popular_location_list_wrapper">
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularseoul.png');">
											<div class="location_name_box">
												<div class="location_name">서울</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularbusan.png');">
											<div class="location_name_box">
												<div class="location_name">부산</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularjeju.png');">
											<div class="location_name_box">
												<div class="location_name">제주</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularkangleung.png');">
											<div class="location_name_box">
												<div class="location_name">강릉</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularincheon.png');">
											<div class="location_name_box">
												<div class="location_name">인천</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularshokcho.png');">
											<div class="location_name_box">
												<div class="location_name">속초</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularyeosu.png');">
											<div class="location_name_box">
												<div class="location_name">여수</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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






















