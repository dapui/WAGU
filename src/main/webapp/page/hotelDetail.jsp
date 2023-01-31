<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>
<%@ page import="com.wagu.dto.*"%>
<%@ page import="com.wagu.dao.*"%>
<%@ page import="com.wagu.connection.DBconnection"%>

<%
	int hotelId = 0;
	try {
		hotelId = Integer.parseInt(request.getParameter("hotelId"));
	} catch(Exception e){
		e.printStackTrace();
	}
	int checkpeople=0;
	try{
		checkpeople = Integer.parseInt(request.getParameter("checkpeople"));
	}catch(Exception e){
		e.printStackTrace();
	}
	String date1 = (String)request.getParameter("date1");
	String date2 = (String)request.getParameter("date2");
	
	HotelDAO hDao = new HotelDAO();
	ArrayList<HotelMainDTO> hoteldetail = hDao.getHotelDetail(hotelId);
// 	HotelMainDTO result : listhotelmain
	ArrayList<HotelDetailinfoDTO> hoteldetailinfo = hDao.getHotelInfo(hotelId);
	ArrayList<HotelRoomDTO> hotelroomlist = hDao.getRoomList(hotelId);
	
%>
<%
	for(HotelMainDTO detail : hoteldetail) {
%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - <%=detail.getHotelName() %></title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hotelDetails.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/hotelsearch.js"></script>
    <script src="../js/hotelDetails.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script src="../js/common.js"></script>
	<link rel="stylesheet" type="text/css" href="../css/daterangepicker.css" />

    <style>
	    .daterangepicker {
			  top: 851px !important;
			  left: 209px !important;
			}
	</style>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
		
		<div class="hotel_detail_header">
			<div class="header_big_image">
				<div class="header_image" style="background-image: url('../images/hotel/<%=detail.getImagesArr()[0] %>');"></div>
			</div>
			<div class="header_small_image_section">
				<div class="header_small_image top">
					<div class="header_small_image_left">
						<div class="header_image" style="background-image: url('../images/hotel/<%=detail.getImagesArr()[1] %>');"></div>
					</div>
					<div class="header_small_image_right">
						<div class="header_image" style="background-image: url('../images/hotel/<%=detail.getImagesArr()[2] %>');"></div>					
					</div>
				</div>
				<div class="header_small_image bottom">
					<div class="header_small_image_left">
						<div class="header_image" style="background-image: url('../images/hotel/<%=detail.getImagesArr()[3] %>');"></div>					
					</div>
					<div class="header_small_image_right">
						<div class="header_image" style="background-image: url('../images/hotel/<%=detail.getImagesArr()[4] %>');"></div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="hotel_detail_section">
			<div class="hotel_detail_info">
				<div class="city">
					<img class="position_icon" src="../images/hotel/imglocationicon.svg" alt="location icon">
					<%=detail.getCity() %>
				</div>
				<div class="name"><%=detail.getHotelName() %></div>
				<div class="tags">
					<div class="tag_name">호텔</div>
					<div class="device"></div>
					<div class="tag_name"><%=detail.getHotelStar() %></div>
				</div>
			</div>
			
			<div class="hotel_detail_search">
				<div class="hotel_detail_search_wrapper">
					<div class="box">
						<div class="checkinoutbox">
							<div class="checkinoutlogo"></div>
							<input type="hidden" name="date1" id="input_date1" value="<%=date1 %>">
							<input type="hidden" name="date2" id="input_date2" value="<%=date2 %>">
							<input class="checkinout" type="text" name="checkdate" value="">
							<script type="text/javascript" src="../js/checkdatehoteldetails.js"></script>
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
					<div class="button-wrapper">
						<div class="search_button gray_button unactivated">검색</div>
						<div class="search_button pink_button">검색</div>
					</div>
				</div>	
			</div>
			
			<div class="select_options">
				<div class="select_options_section">
					<div class="option price active">가격 비교</div>
					<div class="option info">상세 정보</div>
				</div>
			</div>
			<div>
				<div class="room_list_section">
					<%
					for(HotelRoomDTO roomlist : hotelroomlist) {
					%> 
					<div class="room_list_wrapper">
						<div class="room_list">
							<div class="room_list_image" style="background-image: url('../images/hotel/<%=roomlist.getImage()%>');"></div>
							<div class="room_list_info">
								<div class="name"><%=roomlist.getRoom() %></div>
								<div class="description"><span>환불가능 <%=roomlist.getDescription() %></span></div>
							</div>
							<div class="room_list_priceandreserve">
								<div class="price_section">
									<div class="price">₩ <%=roomlist.getRoom_price_weekday() %></div>
									<div class="included_tax">세금 포함</div>
								</div>
								<div class="reserve_button"><span>예약하기</span></div>
							</div>
						</div>
					</div>
					<%
						}
					%> 
				</div>
				
				<div class="detailed_info_section">
					<div class="detailed_info_list">
						<div class="details_area">
							<div class="detailed_title">상세 정보</div>
							<div class="details_content"><%=detail.getDetails() %></div>
						</div>
						<% } %>
				<%
					for(HotelDetailinfoDTO detailinfo : hoteldetailinfo) {
				%>  
						<div class="amenities_area">
							<div class="detailed_title">편의 시설 및 서비스</div>
							<div class="amenities_wrapper">
								<div class="detailed_subtitle">시설물</div>
								<ul class="amenities_list">
									<li>세미나실</li>
									<li>수영장</li>
									<li>카페</li>
									<li>피트니스</li>
									<li>레스토랑</li>
									<li>사우나</li>
									<li>연회장</li>
									<li>비즈니스센터</li>
									<li>루프탑</li>
								</ul>
							</div>
							<div class="amenities_wrapper">
								<div class="detailed_subtitle">서비스</div>
								<ul class="amenities_list">
									<li>WIFI</li>
									<li>발렛파킹</li>
									<li>조식 서비스</li>
									<li>짐보관</li>
									<li>금연</li>
									<li>무료주차</li>
									<li>바/라운지</li>
									<li>주차가능</li>
								</ul>
							</div>
						</div>
						<% } %>
						<div class="location_area">
							<div class="detailed_title">위치</div>
							<div class="address_box">
								<div class="address_wrapper">
									<img class="spot_icon" src="../images/hotel/imglocation_pinkicon.svg" 
									alt="location icon">
									<div class="address_content">서울 용산구 청파로20길 95</div>
								</div>
								<div class="copy_button">
									<img class="copy_icon" src="../images/hotel/imgcopyicon.svg" alt="copy icon">
									복사
								</div>
							</div>
							<img class="Ex_location" src="../images/hotel/imghotellocation.PNG" alt="hotel_location">
						</div>
					</div>
				</div>
			</div>
		</div>
			<script>
				var date1 = $("#input_date1").val();
				var date2 = $("#input_date2").val();
		// 		alert(date1);
			</script>
		<% DBconnection.getConnection().close(); %>		
       </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>


















