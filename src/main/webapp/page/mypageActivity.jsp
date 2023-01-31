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
        <section class="mypage_content activity">
          <h3 class="mypage_content_tit">액티비티</h3>
          <article class="mypage_content_activity">
            <ul class="mypage_content_activity_info">
              <li>상품 정보</li>
              <li>예약 번호</li>
              <li>진행 상태</li>
            </ul>
            <ul class="mypage_content_activity_list">
              <li>
                <a href="mypageActivityDetail.jsp" class="link">
                  <div class="activity_list_info">
                    <p class="activity_list_info_img">
                      <img src="../images/detailPage/ticket/jeju-ticket-img01.jpg" alt="">
                    </p>
                    <div class="activity_list_info_content">
                      <h3 class="title">제주 고흐의 정원 입장권</h3>
                      <p class="sub_title">고흐의 정원</p>
                      <p class="content">성인(만 19세 이상)</p>
                      <p class="price">₩ 9,500</p>
                    </div>
                  </div>
                  <p class="activity_list_number">4433571</p>
                  <p class="activity_list_status status_available">사용예정</p>
                </a>
              </li>
              <li>
                <a href="mypageActivityDetail.html" class="link">
                  <div class="activity_list_info">
                    <p class="activity_list_info_img">
                      <img src="../images/detailPage/ticket/jeju-ticket-img01.jpg" alt="">
                    </p>
                    <div class="activity_list_info_content">
                      <h3 class="title">제주 고흐의 정원 입장권</h3>
                      <p class="sub_title">고흐의 정원</p>
                      <p class="content">성인(만 19세 이상)</p>
                      <p class="price">₩ 9,500</p>
                    </div>
                  </div>
                  <p class="activity_list_number">4433571</p>
                  <p class="activity_list_status status_complete">사용완료</p>
                </a>
              </li>
              <li>
                <a href="mypageActivityDetail.html" class="link">
                  <div class="activity_list_info">
                    <p class="activity_list_info_img">
                      <img src="../images/detailPage/ticket/jeju-ticket-img01.jpg" alt="">
                    </p>
                    <div class="activity_list_info_content">
                      <h3 class="title">제주 고흐의 정원 입장권</h3>
                      <p class="sub_title">고흐의 정원</p>
                      <p class="content">성인(만 19세 이상)</p>
                      <p class="price">₩ 9,500</p>
                    </div>
                  </div>
                  <p class="activity_list_number">4433571</p>
                  <p class="activity_list_status status_refund">환불완료</p>
                </a>
              </li>
              <li>
                <a href="mypageActivityDetail.html" class="link">
                  <div class="activity_list_info">
                    <p class="activity_list_info_img">
                      <img src="../images/detailPage/ticket/jeju-ticket-img01.jpg" alt="">
                    </p>
                    <div class="activity_list_info_content">
                      <h3 class="title">제주 고흐의 정원 입장권</h3>
                      <p class="sub_title">고흐의 정원</p>
                      <p class="content">성인(만 19세 이상)</p>
                      <p class="price">₩ 9,500</p>
                    </div>
                  </div>
                  <p class="activity_list_number">4433571</p>
                  <p class="activity_list_status status_refund">환불완료</p>
                </a>
              </li>
            </ul>
            <div class="mypage_content_activity_none">
              <img src="../images/myPage/reservation_noimg.svg" alt="" class="none_img">
              <p class="none_tit">구매하신 액티비티가 없습니다</p>
              <p class="none_txt">와그와 여행을 떠나보세요!</p>
              <button class="link">액티비티 구매하기</button>
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
