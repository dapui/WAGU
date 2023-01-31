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
    <link rel="stylesheet" href="../css/korailPaymentCheck.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <!-- <script src="../js/subItems.js"></script> -->
    <script>
      $(function(){
     	$('.basket_btn').click(function(){
     		location.href="mypageKorail.jsp";
     	})
      })
    </script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>

      <main class="main sub">
        <div class="waiting_payment">
          <div class="top">
            <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
              <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
            </svg>
            <span>결제 대기중입니다.</span>
            <span>(금일 자정까지 입금이 완료되지 않을 경우, 자동 취소됩니다.)</span>
            <button class="basket_btn">구매내역</button>
          </div>
          <div class="center">
            <div class="title">예약 정보</div>
            <div class="content">
              <div class="content_detail">
                <div class="korail_logo">
                  <img src="../images/korail/station_icon.svg" alt="코레일">
                  <span>코레일</span>
                </div>
                <div class="reservation_info" style="margin-bottom: 20px;">
                  <div class="train_info train">
                    <div class="start">
                      <p class="station">대전</p>
                      <p class="time">05:28</p>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"/>
                    </svg>
                    <div class="arrive" style="margin-right: 20px;">
                      <p class="station">서울</p>
                      <p class="time">07:38</p>
                    </div>
                  </div>
                  <div class="train_info">
                    <p class="tit">열차</p>
                    <p class="text">무궁화 1316</p>
                  </div>
                  <div class="train_info">
                    <p class="tit">출발일</p>
                    <p class="text">2023년 01월 16일(월)</p>
                  </div>
                  <div class="train_info">
                    <p class="tit">인원</p>
                    <p class="text">성인1,어린이1</p>
                  </div>
                  <div class="train_info">
                    <p class="tit">좌석</p>
                    <p class="text">1호차 1,2</p>
                  </div>
                </div>
                 <div class="reservation_info">
                  <div class="train_info train">
                    <div class="start">
                      <p class="station">서울</p>
                      <p class="time">05:15</p>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-arrow-right-short" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"/>
                    </svg>
                    <div class="arrive" style="margin-right: 20px;">
                      <p class="station">대전</p>
                      <p class="time">06:14</p>
                    </div>
                  </div>
                  <div class="train_info">
                    <p class="tit">열차</p>
                    <p class="text">KTX 1</p>
                  </div>
                  <div class="train_info">
                    <p class="tit">출발일</p>
                    <p class="text">2023년 01월 17일(화)</p>
                  </div>
                  <div class="train_info">
                    <p class="tit">인원</p>
                    <p class="text">성인1,어린이1</p>
                  </div>
                  <div class="train_info">
                    <p class="tit">좌석</p>
                    <p class="text">1호차 1A,1B</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="bottom">
            <div class="title">결제 정보</div>
            <div class="payment_info">
              <div class="left">
                <div class="payment">
                  <span style="color:#c0c0c0">결제수단</span>
                  <span>무통장 입금</span>
                </div>
                <div class="total_price">
                  <span style="color:#c0c0c0">총 금액</span>
                  <span>₩ 51,750</span>
                </div>
              </div>
              <div class="right">
                <div class="total_korail_price" >
                  <span>총 결제 금액</span>
                  <span style="color:#d91c84;">₩ 51,750</span>
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
