<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 문의하기</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/subPage.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.3.min.js"></script>
    <script src="../js/common.js" defer></script>
    <script src="../js/subPage.js"></script>
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
        <section class="faq_top">
          <h2 class="faq_top_tit">무엇이든 물어보세요</h2>
        </section>
        <section class="faq_area cont_size">
          <article class="faq_menu">
            <ul class="faq_menu_list">
              <li>
                <a href="faq.jsp" class="link">
                  <img src="../images/sub/faq_icon01.svg" alt="" class="icon">
                  <span class="menu">자주 묻는 질문</span>
                </a>
              </li>
              <li class="point_color">
                <a href="faq_question.jsp" class="link">
                  <img src="../images/sub/faq_icon02.svg" alt="" class="icon">
                  <span class="menu">문의하기</span>
                </a>
              </li>
            </ul>
          </article>
          <article class="faq_content">
            <h2 class="faq_content_tit">문의하기</h2>
            <div class="faq_content_wrap">
              <div class="faq_question_msg">
                <p class="txt">
                  와그 컨시어지팀이 빠르고 친절하게 답변해드려요.
                </p>
                <p class="txt">
                  <strong>유선상담 / 카카오톡 플러스 친구 / 라인</strong><br>
                  AM 10:00 ~ PM 06:00 (GMT+9)<br>
                  (주말 및 공휴일 제외)
                </p>
              </div>
              <ul class="faq_question_list">
                <li>
                  <a href="tel:070-4353-5959" class="link">
                    <p class="icon">
                      <img src="../images/sub/faq_tel.svg" alt="">
                    </p>
                    <p class="txt">(+82) 070-4353-5959</p>
                  </a>
                </li>
                <li>
                  <a href="https://pf.kakao.com" target="_blank" class="link">
                    <p class="icon">
                      <img src="../images/sub/faq_kakao.png" alt="">
                    </p>
                    <p class="txt">
                      @waug <span class="c_gray">(한국어 지원)</span>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="https://line.me/R/ti/p/%40tnk3253j" target="_blank" class="link">
                    <p class="icon">
                      <img src="../images/sub/faq_line.png" alt="">
                    </p>
                    <p class="txt">
                      @waug <span class="c_gray">(영어/일본어 지원)</span>
                    </p>
                  </a>
                </li>
                <li>
                  <a href="https://www.facebook.com/waugtravelglobalcs" target="_blank" class="link">
                    <p class="icon">
                      <img src="../images/sub/faq_facebook.svg" alt="">
                    </p>
                    <p class="txt">
                      @waug <span class="c_gray">(영어 지원)</span>
                    </p>
                  </a>
                </li>
              </ul>
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

