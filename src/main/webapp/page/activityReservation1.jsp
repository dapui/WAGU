<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	/* try{
		int itemID = Integer.parseInt(request.getParameter("itemID"));
	} catch(NumberFormatException e) {
		
	} */
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>- WAGU</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/activityReservation1.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
    <script src="../js/activityReservation1.js"></script>
    <script>
      $(function(){
        $('.calendar').load('../html/activityCalendar.html');
      })
    </script>
</head>
<body>
	<div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
   <main class="main sub">
   	<div class="reservation_section">
		<div class="goods_name">
			서울 잠실 롯데월드 어드벤처 종합이용권
		</div>
		<div class="reservation_content">
			<div class="calendar">
			</div>
			<div class="option">
				<div class="option_box">
					<div class="option_select">
						옵션을 선택해주세요.
					</div>
					<div class="date">
						2023-01-20
					</div>
				</div>
				<div class="option_info">
					<div class="option_name">
						종일 종합이용권 1인 
					</div>
					<div class="option_price">
						₩ 42,000
					</div>
					<img src="../images/activityReservation1/option_arrow.svg" class="arrow">
				</div>
				<div class="option_info">
					<div class="option_name">
						AFTER4 종합이용권 1인
					</div>
					<div class="option_price">
						₩ 33,000
					</div>
					<img src="../images/activityReservation1/option_arrow.svg" class="arrow">
				</div>
			</div>
		</div>
	</div>
	<div class="option_background">
		<div class="background">
		</div>
		<div class="option_wrap">
			<img src="../images/activityReservation1/cancel_button.svg" class="cancel">
			<form action="#n" id="goods_info">
				<div class="option_section">
					<div class="option_detail">
						<div class="option_names">
							<div class="detail_goods_name">
								서울 잠실 롯데월드 어드벤처 종합이용권
							</div>
							<div class="detail_option_name">
								종일 종합이용권 1인 
							</div>
							<div class="option_date">
								2023-01-20
							</div>
						</div>
						<div class="option_condition_area">
							<div class="option_condition">
								<div class="condition">
									1인 기준
								</div>
								<div class="price_personnel">
									<div class="detail_price">
										₩42,000
									</div>	
									<div class="personnel_button">
										<input type="button"
											  class="minus"
										      value="-"/>
										<input type="text" class="result" value="0" readonly/>
										<input type="button"
											   class="plus"
										       value="+"/>
									</div>
									<div class="temporary_price">	
										0
									</div>	
								</div>
							</div>
						</div>
					</div>
					<div class="total_price_area">
						Total
						<div class="total_price">
							₩ 0
						</div>
					</div>
				</div>	
				<div class="reservation_area">
					<div class="reservation_button">
						<button type="submit" id="basket">장바구니 담기</button>
						<button type="submit" id="reservation">바로 예약하기</button>
					</div>
				</div>
			</form>	
		</div>
	</div>
	 </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
</body>
</html>