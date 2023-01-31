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
        <section class="mypage_content">
          <h3 class="mypage_content_tit review">이용후기</h3>
          <article class="mypage_content_review">
            <ul class="mypage_content_review_tab">
              <li class="active">이용 후기 작성(2)</li>
              <li>내 이용 후기(1)</li>
            </ul>
            <div class="mypage_content_review_content">
              <ul class="mypage_content_review_sec">
                <li>
                  <a href="#n" class="review_info">
                    <p class="img">
                      <img src="../images/detailPage/res/seoul-res-img01.jpg" alt="">
                    </p>
                    <div class="txt">
                      <p class="txt_name">아보 합정점 - 와그 단독</p>
                      <p class="txt_opt">샌드위치 아보 쉬림프 에그 샌드위치 X 1</p>
                      <p class="txt_date">이용일: 2022-09-29</p>
                    </div>
                  </a>
                  <a href="#n" class="review_write">후기 작성하기</a>
                </li>
                <li>
                  <a href="#n" class="review_info">
                    <p class="img">
                      <img src="../images/detailPage/res/seoul-res-img01.jpg" alt="">
                    </p>
                    <div class="txt">
                      <p class="txt_name">아보 합정점 - 와그 단독</p>
                      <p class="txt_opt">샌드위치 아보 쉬림프 에그 샌드위치 X 1</p>
                      <p class="txt_date">이용일: 2022-09-29</p>
                    </div>
                  </a>
                  <a href="#n" class="review_write">후기 작성하기</a>
                </li>
              </ul>
              <ul class="mypage_content_review_sec">
                <li>
                  <a href="#n" class="review_info">
                    <p class="img">
                      <img src="../images/detailPage/res/seoul-res-img01.jpg" alt="">
                    </p>
                    <div class="txt">
                      <p class="txt_name">아보 합정점 - 와그 단독</p>
                      <p class="txt_opt">샌드위치 아보 쉬림프 에그 샌드위치 X 1</p>
                      <p class="txt_date">이용일: 2022-09-29</p>
                    </div>
                  </a>
                  <div class="review_btn">
                    <a href="#n" class="button review_modify">수정</a>
                    <a href="#n" class="button review_delete">삭제</a>
                  </div>
                </li>
              </ul>
              <div class="mypage_content_review_none">
                <img src="../images/myPage/review_noimg.svg" alt="" class="none_img">
                <p class="none_tit">아직 이용후기가 없습니다.</p>
                <p class="none_txt">와그와 여행을 떠나보세요!</p>
              </div>
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
