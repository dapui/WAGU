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
        <section class="mypage_content hotel">
          <h3 class="mypage_content_tit">숙소</h3>
          <article class="mypage_content_activity">
            <ul class="mypage_content_activity_info">
              <li>숙소 정보</li>
              <li>예약 번호</li>
              <li>진행 상태</li>
            </ul>
            <ul class="mypage_content_activity_list">
              <li>
                <a href="mypageActivityDetail.jsp" class="link">
                  <div class="activity_list_info">
                    <p class="activity_list_info_img">
                      <img src="../images/detailPage/hotel/seoul-hotel-img01.jpg" alt="">
                    </p>
                    <div class="activity_list_info_content">
                      <h3 class="title">앰배서더 서울 풀만 호텔</h3>
                      <p class="content">서울 중구 동호로 287</p>
                      <p class="price">₩ 250,000</p>
                    </div>
                  </div>
                  <p class="activity_list_number">4433571</p>
                  <p class="activity_list_status status_available">투숙예정</p>
                </a>
              </li>
              <li>
                <a href="mypageActivityDetail.html" class="link">
                  <div class="activity_list_info">
                    <p class="activity_list_info_img">
                      <img src="../images/detailPage/hotel/seoul-hotel-img01.jpg" alt="">
                    </p>
                    <div class="activity_list_info_content">
                      <h3 class="title">앰배서더 서울 풀만 호텔</h3>
                      <p class="content">서울 중구 동호로 287</p>
                      <p class="price">₩ 250,000</p>
                    </div>
                  </div>
                  <p class="activity_list_number">4433571</p>
                  <p class="activity_list_status status_complete">투숙완료</p>
                </a>
              </li>
              <li>
                <a href="mypageActivityDetail.html" class="link">
                  <div class="activity_list_info">
                    <p class="activity_list_info_img">
                      <img src="../images/detailPage/hotel/seoul-hotel-img01.jpg" alt="">
                    </p>
                    <div class="activity_list_info_content">
                      <h3 class="title">앰배서더 서울 풀만 호텔</h3>
                      <p class="content">서울 중구 동호로 287</p>
                      <p class="price">₩ 250,000</p>
                    </div>
                  </div>
                  <p class="activity_list_number">4433571</p>
                  <p class="activity_list_status status_refund">투숙취소</p>
                </a>
              </li>
              <li>
                <a href="mypageActivityDetail.html" class="link">
                  <div class="activity_list_info">
                    <p class="activity_list_info_img">
                      <img src="../images/detailPage/hotel/seoul-hotel-img01.jpg" alt="">
                    </p>
                    <div class="activity_list_info_content">
                      <h3 class="title">앰배서더 서울 풀만 호텔</h3>
                      <p class="content">서울 중구 동호로 287</p>
                      <p class="price">₩ 250,000</p>
                    </div>
                  </div>
                  <p class="activity_list_number">4433571</p>
                  <p class="activity_list_status status_available">투숙예정</p>
                </a>
              </li>
            </ul>
            <div class="mypage_content_activity_none">
              <img src="../images/myPage/reservation_noimg.svg" alt="" class="none_img">
              <p class="none_tit">투숙 예정인 숙소가 없습니다</p>
              <p class="none_txt">와그와 여행을 떠나보세요!</p>
              <a href="#n" class="link">숙소 예약하기</a>
            </div>
          </article>
        </section>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
