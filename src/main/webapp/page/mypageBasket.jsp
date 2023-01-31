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
          <h3 class="mypage_content_tit">장바구니</h3>
          <form action="" class="mypage_content_basket">
            <table class="mypage_content_basket_tbl">
              <tr>
                <th colspan="2">상품 정보</th>
                <th>옵션 및 수량</th>
                <th>사용 예정일</th>
                <th>비용</th>
              </tr>
              <tr>
                <td>
                  <input type="checkbox" name="select" class="basket_check">
                </td>
                <td>
                  <a href="#n" class="basket_info">
                    <p class="img">
                      <img src="../images/detailPage/res/seoul-res-img01.jpg" alt="">
                    </p>
                    <p class="tit">더리버사이드 호텔 더 가든키친 뷔페 (이용업체 사전예약 필수)</p>
                  </a>
                </td>
                <td class="basket_opt">
                  런치 뷔페 (주중) (유효기간 : 2022.12.01 ~ 2022.12.30) 성인(1인 기준)<br>
                  ₩ 69,300 X 1
                </td>
                <td class="date">2023-02-15</td>
                <td class="price">₩ 69,300</td>
              </tr>
              <tr>
                <td>
                  <input type="checkbox" name="select" class="basket_check">
                </td>
                <td>
                  <a href="#n" class="basket_info">
                    <p class="img">
                      <img src="../images/detailPage/ticket/jeju-ticket-img01.jpg" alt="">
                    </p>
                    <p class="tit">홍대 테라피포유 (MD 추천)</p>
                  </a>
                </td>
                <td class="basket_opt">
                  타이관리 60분 주간 60분 1인<br>
                  ₩ 35,000 X 1
                </td>
                <td class="date">2023-02-15</td>
                <td class="price">₩ 35,000</td>
              </tr>
              <tr>
                <td>
                  <input type="checkbox" name="select" class="basket_check">
                </td>
                <td>
                  <a href="#n" class="basket_info">
                    <p class="img">
                      <img src="../images/detailPage/ticket/seoul-ticket-img01.jpg" alt="">
                    </p>
                    <p class="tit">빚다 도예공방 홍대점</p>
                  </a>
                </td>
                <td class="basket_opt">
                  빚다 홍대직영점 도예 체험 / 1인 기준<br>
                  ₩ 20,000 X 1
                </td>
                <td class="date">2023-02-15</td>
                <td class="price">₩ 20,000</td>
              </tr>
            </table>
            <div class="mypage_content_basket_info">
              <label for="select_all">
                <input type="checkbox" name="select_all" id="select_all" class="basket_check">
                전체 선택 / 해제
              </label>
              <p class="sum">총 <span class="point_color">₩ 0</span></p>
            </div>
            <div class="mypage_content_basket_btn">
              <input type="button" value="선택 삭제" class="delete">
              <input type="button" value="예약하기" class="reservation" onclick="location.href='activityPayment.jsp'">
            </div>
          </form>
          <!-- <div class="mypage_content_basket_none">
            <img src="../images/myPage/basket_noimg.svg" alt="" class="none_img">
            <p class="none_tit">장바구니에 상품이 없습니다.</p>
          </div> -->
        </section>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
