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
    <link rel="stylesheet" href="../css/activityReservation2.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
    <script src="../js/activityReservation2.js"></script>
</head>
<body>
	  <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
	<form action="">
		<div class="reservation_info_area">
			<div class="reservation_info">
				<div class="info_area">
				 	<div class="title">
				 		예약자 정보
					</div>
					<div class="caution">
						※ 예약자 성함과 연락처는 실제 상품을 구매하는 분의 정보를 기입해 주시기 바랍니다.
					</div>
					<div class="name_area">
						<div class="name">
							이름
						</div>
						<div class="name_input">
							<input type="text" id="name" value="조여정">
						</div>
						<div class="name_caution">
							실명으로 작성해주세요.
						</div>
					</div>
					<div class="phone">
						휴대전화번호
					</div>
					<div class="phone_number">
						<input type="text" id="phone" value="01012341234" max="11" />
					</div>
					<div class="email">
						이메일
					</div>
					<div class="email_input">
						<input type="email" id="email" value="abc@naver.com">
					</div>
				</div>
			</div>
			<input type="submit" id="next" value="다음">
		</div>
	</form>
	 </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
</body>
</html>