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
          <h3 class="mypage_content_tit">쿠폰</h3>
          <article class="mypage_content_coupon">
            <table class="mypage_content_coupon_tbl">
              <tr>
                <th>쿠폰명</th>
                <th>쿠폰 코드</th>
                <th>할인 금액</th>
                <th>유효 기간</th>
                <th>상태</th>
              </tr>
              <tr>
                <td>[APP전용] 신규회원 1만원 쿠폰</td>
                <td>52BL24A8QS</td>
                <td>₩ 10000 할인</td>
                <td>2022-09-29 13:44까지</td>
                <td class="expire">사용 만료</td>
              </tr>
              <tr>
                <td>[APP전용] 신규회원 5천원 쿠폰</td>
                <td>1L4GKNO51S</td>
                <td>₩ 5000 할인</td>
                <td>2022-09-29 13:44까지</td>
                <td class="complete">사용 완료</td>
              </tr>
              <tr>
                <td>[APP전용] 신규회원 3천원 쿠폰</td>
                <td>JD23ANNV3R</td>
                <td>₩ 3000 할인</td>
                <td>2022-09-29 13:44까지</td>
                <td class="available">사용 가능</td>
              </tr>
              <tr>
                <td>[APP전용] 신규회원 2천원 쿠폰</td>
                <td>J0QECDQXBM</td>
                <td>₩ 2000 할인</td>
                <td>2022-09-29 13:44까지</td>
                <td class="available">사용 가능</td>
              </tr>
            </table>
            <div class="mypage_content_coupon_none">
              <img src="../images/myPage/coupon_noimg.svg" alt="" class="none_img">
              <p class="none_tit">쿠폰내역이 없습니다.</p>
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
