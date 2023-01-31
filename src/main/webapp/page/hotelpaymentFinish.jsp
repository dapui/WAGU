<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 액티비티, 와서 구경해~</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/activityPaymentCheck.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
		<div class="announcement_area">
			<div class="payment_announcement">
				<i class="fa-solid fa-circle-check"></i><br>
				결제가 완료되었습니다.<br>
			</div>
			<div class="purchase_detail">
				구매 내역
			</div>
		</div>
		<div class="reservation_info">
			<div class="title">
				예약 정보
			</div>	
			<div class="goods_border">
				<div class="goods_info">
					<div class=" activity_title">
					<img src="../images/hotel/imghotelicon.svg">
						호텔
					</div>
					<div class="goods_area">
						<div class="image">
							<img src="../images/hotel/imgdetailheader01.jpg">
						</div>
						<div class="goods_info">
							<h3>
								그랜드 머큐어 앰배서더 호텔 앤드 레지던스 서울 용산
							</h3>
							<p class="option_name">주니어 스위트룸 킹침대 1개</p>
							<p class="use_date">체크인: 2022-01-23</p>
							<p class="use_date">체크아웃: 2022-01-24</p>
							<div class="option_amount">
								<p class="option_in_option">인원: 2명</p>
							</div>
						</div>
						<div class="reservation_detail_info">
							예약 상세 정보
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="payment_info_area">
			<div class="payment_info">
				결제 정보
			</div>
			<div class="payment_area">
				<div class="payment_section">
					<div class="method_of_payment">
						<p class="payment_title payment_content">
							결제수단
						</p>
						<p class="payment_content">
							무통장입금
						</p>
					</div>
					<div class="payment_price">
						<p class="payment_title payment_content">
							총 금액
						</p>
						<p class="payment_content">
							₩ 252,450
						</p>
					</div>
				</div>	
				<div class="total_price">
					<p class="total_title">
						총 결제 금액
					</p>
					<p class="total_content">
						₩ 252,450
					</p>
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
