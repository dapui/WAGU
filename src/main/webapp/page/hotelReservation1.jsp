<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>
<%@ page import="com.wagu.dto.*"%>
<%@ page import="com.wagu.dao.*"%>
<%@ page import="com.wagu.connection.DBconnection"%>
<!DOCTYPE html>
<html lang="ko">
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
    <link rel="stylesheet" href="../css/hotelreservation1.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
    <script src="../js/hotelreservation1.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
		<div class="border"></div>
		<div class="hotel_reservation">
			<div class="hotel_info_section">
				<div class="title">선택된 숙소 정보</div>
				<div class="hotel_info_wrapper">
					<div class="image" style="background-image: url('../images/hotel/imgdetailheader01.jpg');"></div>
					<div class="content">
						<div class="name">그랜드 머큐어 앰배서더 호텔 앤드 레지던스 서울 용산</div>
						<div class="city">서울 용산구 청파로20길 95</div>
						<div class="content_box">
							<div class="sub">체크인</div>
							<div class="sub_content">2022년 1월 23일 (월) 15:00</div>
						</div>
						<div class="content_box">
							<div class="sub">체크아웃</div>
							<div class="sub_content">2022년 1월 24일 (화) 12:00</div>
						</div>
						<div class="content_box">
							<div class="sub">숙박일</div>
							<div class="sub_content">1박</div>
						</div>
						<div class="content_box">
							<div class="sub">인원</div>
							<div class="sub_content">성인 2</div>
						</div>
					</div>
				</div>
				<div class="hotelroom_info_wrapper">
					<div class="image" style="background-image: url('../images/hotel/imghotelroom.jpg');"></div>
					<div class="content">
						<div class="name">주니어 스위트룸 킹침대 1개</div>
						<div class="description"><span>환불가능</span></div>
					</div>
				</div>
			</div>
			<div class="people_info_section">
				<div class="title">예약자 정보</div>
				<div class="sub_title">※예약자 성함과 연락처는 실제 상품을 구매하는 분의 정보를 기입해 주시기 바랍니다.</div>
				<div class="member_info_wrapper">
					<div class="member_info_input">
						<div class="title">이름</div>
						<input id="member_name" class="input" placeholder="이름" value="오다현">
					</div>
					<div class="member_info_input">
						<div class="title">전화번호</div>
						<div class="phone_number">
							<input class="input fixed_num" placeholder="010">
							<input id="member_midphone" class="input" value="4945">
							<input id="member_lastphone" class="input" value="1002">
						</div>
					</div>
					<div class="member_info_input">
						<div class="title">이메일</div>
						<input id="member_email" class="input" placeholder="이메일을 입력해주세요" value="ykykyk1010@naver.com">
					</div>
				</div>
			</div>
			<div class="people_info_section">
				<div class="title">투숙객 정보</div>
				<div class="sub_title">※투숙객 성함은 반드시 한글로 기입해 주시기 바랍니다.</div>
				<div class="check_info">
<!-- 					<div class="checkbox"></div> -->
<!-- 					<div class="checkbox_sub">예약자 정보와 동일한 경우 체크해주시기 바랍니다.</div> -->
					<input type="checkbox" id="check"> 예약자 정보와 동일한 경우 체크해주시기 바랍니다.
				</div>
				<div class="member_info_wrapper">
					<div class="member_info_input">
						<div class="title">이름</div>
						<input type="text" id="guest_name" class="input" placeholder="이름" value>
					</div>
					<div class="member_info_input">
						<div class="title">전화번호</div>
						<div class="phone_number">
							<input type="text" class="input fixed_num" placeholder="010">
							<input type="text" id="guest_midphone" class="input" value="">
							<input type="text" id="guest_lastphone" class="input" value="">
						</div>
					</div>
					<div class="member_info_input">
						<div class="title">이메일</div>
						<input type="text" id="guest_email" class="input" placeholder="이메일을 입력해주세요" value>
					</div>
				</div>
			</div>
		</div>
		
		<div class="next_button_section">
			<div class="next_button">다음</div>
		</div>
		
       </main>
       <footer class="footer"></footer>
    </div>
  </body>
</html>


















    