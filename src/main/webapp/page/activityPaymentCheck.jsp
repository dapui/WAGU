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
    <script src="../js/activityPaymentCheck.js"></script>
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
				결제 대기중입니다.<br>
				(금일 자정까지 입금이 완료되지 않을 경우, 자동 취소됩니다.)
			</div>
			<button id="purchase_detail">
				구매 내역
			</button>
		</div>
		<div class="reservation_info">
			<div class="title">
				예약 정보
			</div>	
			<div class="goods_border">
				<div class="goods_info">
					<div class=" activity_title">
					<img src="../images/paymentCheck/activity.svg">
						액티비티
					</div>
					<div class="goods_area">
						<div class="image">
							<img src="../images/ticket/seoul-ticket-img01.jpg">
						</div>
						<div class="goods_info">
							<h3>
								서울 잠실 롯데월드 어드벤처 종합이용권
							</h3>
							<p class="option_name">종일 종합이용권 1인 </p>
							<p class="use_date">2023-01-16</p>
							<div class="option_amount">
								<p class="option_in_option">1인 기준</p>
								<p class="amount">X 2</p>
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
							₩ 84,000
						</p>
					</div>
					<div class="coupon_amount">
						<p class="payment_title payment_content">
							쿠폰
						</p>
						<p class="payment_content">
							- ₩ 1,000
						</p>
					</div>
				</div>	
				<div class="total_price">
					<p class="total_title">
						총 결제 금액
					</p>
					<p class="total_content">
						₩ 83,000
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