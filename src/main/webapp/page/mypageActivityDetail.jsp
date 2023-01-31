<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 마이페이지</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/mypage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.3.min.js"></script>
    <script src="../js/common.js" defer></script>
    <script src="../js/mypage.js"></script>
    <style>
      @media screen and (max-width: 768px) {
        .header_user_info > i {
          display: none;
        }
      }
    </style>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
        <h2 class="mypage_tit">내 정보</h2>
        <section class="mypage_left">
          <jsp:include page="mypageLeft.jsp"></jsp:include>
        </section>
        <section class="mypage_content detail">
          <h3 class="mypage_detail_tit">내역 상세</h3>
          <article class="mypage_detail_sec">
            <p class="mypage_detail_sec_tit">예약 정보</p>
            <ul class="mypage_detail_sec_list">
              <li>
                <p class="tit">예약번호</p>
                <p class="txt">4433571</p>
              </li>
              <li>
                <p class="tit">진행상태</p>
                <p class="txt">환불완료</p>
              </li>
              <li>
                <p class="tit">상품명</p>
                <p class="txt">
                  제주 고흐의정원 입장권 <a href="#n" class="link">상품 보기</a>
                </p>
              </li>
              <li>
                <p class="tit">옵션 정보</p>
                <p class="txt">
                  고흐의 정원<br>
                  소인(만 12세 이하) : 1개
                </p>
              </li>
              <li>
                <p class="tit">사용 예정일</p>
                <p class="txt">2022.09.29</p>
              </li>
            </ul>
          </article>
          <article class="mypage_detail_sec">
            <p class="mypage_detail_sec_tit">예약자 정보</p>
            <ul class="mypage_detail_sec_list">
              <li>
                <p class="tit">이름</p>
                <p class="txt">오다현</p>
              </li>
              <li>
                <p class="tit">휴대전화번호</p>
                <p class="txt">01044716388</p>
              </li>
              <li>
                <p class="tit">이메일</p>
                <p class="txt">odh550@naver.com</p>
              </li>
            </ul>
          </article>
          <article class="mypage_detail_sec">
            <p class="mypage_detail_sec_tit">주소</p>
            <section id="map-section">
              <div id="map">
              <script>    
                var marker;
                function initMap() {
                  var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 13,
                    scrollwheel: false,
                    center: {lat: 37.511126, lng: 127.098169},
                    mapTypeId: 'roadmap'
                  });
                  marker = new google.maps.Marker({
                    title: '제주 고흐의정원',
                    infoWindow: {
                      content: ''},
                      map: map,
                      draggable: true,
                      animation: google.maps.Animation.DROP,
                      position: {lat: 37.511126, lng: 127.098169}	
                    });
                    marker.addListener('click', toggleBounce);
                  }
                  function toggleBounce() {
                    if (marker.getAnimation() !== null) {
                      marker.setAnimation(null);
                    } else {
                      marker.setAnimation(google.maps.Animation.BOUNCE);
                    }
                  }	   
                </script>
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2g2ME9BU-rlvZP04CfFBrJw_sj0_mIkw&callback=initMap">
                </script>
              </div>
            </section>  
          </article>
          <article class="mypage_detail_sec">
            <p class="mypage_detail_sec_tit">취소 및 환불 안내</p>
            <p class="mypage_detail_sec_txt">
              바코드는 발급 후 30일간 유효합니다.<br>
              30일 이내에 미사용 티켓에 한해 환불이 가능합니다.<br>
              단, 부분취소 및 부분환불은 불가합니다.
            </p>
          </article>
          <article class="mypage_detail_sec">
            <p class="mypage_detail_sec_tit">고객센터</p>
            <ul class="mypage_detail_sec_list">
              <li>
                <p class="tit">전화 문의</p>
                <p class="txt"><a href="tel:070-1234-1234">(+82) 070-1234-1234</a></p>
              </li>
              <li>
                <p class="tit">메일 문의</p>
                <p class="txt">customer@wagu.team</p>
              </li>
              <li>
                <p class="tit">운영 시간</p>
                <p class="txt">
                  유선상담 : 평일 ㅣ AM 10 : 00 - PM 06: 00 (GMT+9) 주말 및 공휴일 ㅣ AM 10 : 00 - PM 05: 00 (GMT+9)
                </p>
              </li>
            </ul>
          </article>
        </section>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
