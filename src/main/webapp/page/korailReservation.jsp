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
    <link rel="stylesheet" href="../css/korailReservation.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <!-- <script src="../js/subItems.js"></script> -->
    <script>
      $(function(){
        $('.header').load('top.html');
        var script = document.createElement("script");
            script.type = "text/javascript";
            script.src = "../js/common.js";
            $("head").append(script);
        $('.next_button').click(function(){
        	location.href="korailPayment.jsp";
        })
        
      })
    </script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <!-- top.html -->
      </header>

      <main class="main sub">
        <div class="order_korail_info">
          <div class="korail_reservation_info_wrapper">
            <div class="korail_reservation_info_title">선택된 승차권 정보</div>
            <div class="korail_reservation_info_content">
              <div class="railWay">가는편</div>
              <div class="top_info">
                <div class="time_form">
                  <div class="station">대전</div>
                  <div class="time">05:28</div>
                </div>
                <div class="timetaken_form">
                  <div class="train">무궁화 1316</div>
                  <p class = "timetaken"><span>2시간 10분</span></p>
                </div>
                <div class="time_form">
                  <div class="station">서울</div>
                  <div class="time">07:38</div>
                </div>
              </div>
              <div class="m_info">
                <div class="form">
                  <div class="title">출발일</div>
                  <div class="content">2023년 01월 16일(월)</div>
                </div>
                <div class="form">
                  <div class="title">인원</div>
                  <div class="content">성인 1 , 어린이 1</div>
                </div>
                <div class="form">
                  <div class="title">좌석</div>
                  <div class="content">1호차 1A,1B</div>
                </div>
              </div>
              <div class="price_info">
                <div class="price">₩ 16,200</div>
              </div>
            </div>
            <div class="korail_reservation_info_content" >
              <div class="railWay">오는편</div>
              <div class="top_info">
                <div class="time_form">
                  <div class="station">서울</div>
                  <div class="time">05:15</div>
                </div>
                <div class="timetaken_form">
                  <div class="train">KTX1</div>
                  <p class = "timetaken"><span>0시간 59분</span></p>
                </div>
                <div class="time_form">
                  <div class="station">대전</div>
                  <div class="time">06:14</div>
                </div>
              </div>
              <div class="m_info">
                <div class="form">
                  <div class="title">출발일</div>
                  <div class="content">2023년 01월 17일(화)</div>
                </div>
                <div class="form">
                  <div class="title">인원</div>
                  <div class="content">성인 1 , 어린이 1</div>
                </div>
                <div class="form">
                  <div class="title">좌석</div>
                  <div class="content">1호차 1A,1B</div>
                </div>
              </div>
              <div class="price_info">
                <div class="price">₩ 35,550</div>
              </div>
            </div>
          </div>
          <div class="passenger_info_wrapper">
            <div class="passenger_info_title">열차 탑승객 정보</div>
            <div class="sub_title">※ 입력하신 정보는 기차 탑승 및 탑승권 확인 시 활용됩니다.</div>
            <div class="name_info">
              <div class="content_title">이름(대표 탑승자 이름)</div>
              <input type="text" placeholder="이름을 입력해주세요" class="name_input" value="김다은">
            </div>
            <div class="birth_info">
              <div class="content_title">생년월일</div>
              <input type="text" placeholder="생년월일을 입력해주세요" class="birth_input" value="19971222">
            </div>
            <div class="phone_info">
              <div class="content_title">휴대전화번호</div>
              <input type="text" placeholder="휴대전화번호를 입력해주세요" class="phone_input" value="01012345678">
            </div>
            <div class="email_info">
              <div class="content_title">이메일</div>
              <input type="text" placeholder="이메일을 입력해주세요" class="email_input" value="ekdms12@naver.com">
            </div>
          <!--   <a href="#n" class="my_info">내 정보 불러오기</a> -->
          </div>
          <button class="next_button">
            <div class="next">다음</div>
          </button>
        </div>
      </main>
      <footer class="footer">
        <!-- bottom.html -->
      </footer>
    </div>
  </body>
</html>
