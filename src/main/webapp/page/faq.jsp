<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wagu.connection.DBconnection" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 자주 묻는 질문</title>
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
              <li class="point_color">
                <a href="faq.jsp" class="link">
                  <img src="../images/sub/faq_icon01.svg" alt="" class="icon">
                  <span class="menu">자주 묻는 질문</span>
                </a>
              </li>
              <li>
                <a href="faq_question.jsp" class="link">
                  <img src="../images/sub/faq_icon02.svg" alt="" class="icon">
                  <span class="menu">문의하기</span>
                </a>
              </li>
            </ul>
          </article>
          <article class="faq_content">
            <h2 class="faq_content_tit">자주 묻는 질문</h2>
            <div class="faq_content_wrap">
              <ul class="faq_content_tab">
                <li class="active">
                  <a href="#n" class="link">예약</a>
                </li>
                <li>
                  <a href="#n" class="link">결제</a>
                </li>
                <li>
                  <a href="#n" class="link">쿠폰</a>
                </li>
                <li>
                  <a href="#n" class="link">환불</a>
                </li>
                <li>
                  <a href="#n" class="link">계정</a>
                </li>
              </ul>
              <div class="faq_content_menu">
                <div class="faq_content_menu_sec">
                  <ul class="faq_content_menu_list">
                    <li>
                      <h3 class="faq_content_menu_tit">예약 완료 후 바우처 사용은 어떻게 하나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        각 상품별로 사용하는 방법이 다릅니다.<br>
                        예약한 상품의 정보에서 ‘사용방법’을 꼼꼼히 읽어보신 후 순서대로 진행해주시면 됩니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">내 예약 진행상황을 보려면?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        마이페이지에서 구매내역을 확인하면 상품별로 확인할 수 있습니다.<br>
                        결제완료 - 예약진행중 - 예약완료로 표시됩니다.<br>
                        만약 환불을 진행했다면? 환불요청 - 환불완료로 표시됩니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">와그 앱 모바일 바우처는 무엇인가요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        앱 모바일 바우처는 와그 앱 구매내역 혹은 와그 앱 메인 화면 하단 4번째 아이콘을 클릭하면 각 상품별로 클릭해 모바일 바우처 보기 버튼을 이용해 볼 수 있습니다.<br>
                        바우처는 굳이 바우처를 인쇄하지 않고 와그 앱에서 바우처를 제시하고 바로 이용할 수 있어 편리합니다.<br>
                        단, 상품별로 꼭 바우처를 인쇄해야하는 것들이 있으니 사용방법을 잘 확인해주세요.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">예약 후 바우처를 받지 못했어요.<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        각 상품마다 예약 확정 시간 즉, 바우처 제공 시간이 모두 다릅니다.<br>
                        짧게는 즉시 제공하는 것이 있고 최장 3일까지 기다려야 하는 경우도 있습니다.<br>
                        먼저 내가 구매한 상품의 바우처 제공시간을 확인해주세요.<br>
                        바우처는 입력하신 이메일과 와그 앱 바우처에서 확인할 수 있습니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">예약은 어떻게 하나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        여행을 떠날 도시를 선택하고 원하는 상품을 클릭 후 희망 날짜를 선택하면 예약할 수 있는 다양한 옵션이 나옵니다.<br>
                        이 중 원하는 옵션을 선택해 결제를 진행하면 됩니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">꼭 선택한 날짜에만 바우처를 사용해야하나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        투어, 액티비티 그리고 교통편 WIFI 등은 선택한 날짜에만 이용할 수 있습니다.<br>
                        단 주요 테마파크 입장권 같은 경우는 상품정보에 명시된 유효기간내 언제든 이용할 수 있습니다.<br>
                        각 상품의 ‘사용방법’을 꼼꼼히 읽어본 후 구매해주세요.
                      </p>
                    </li>
                  </ul>
                </div>
                <div class="faq_content_menu_sec">
                  <ul class="faq_content_menu_list">
                    <li>
                      <h3 class="faq_content_menu_tit">결제가 되지 않는다면?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        만약 PC일 경우에는 크롬으로 진행하면 가능한 경우가 많이 있습니다.<br>
                        PC가 아닌 모바일 웹이나 앱(APP)이라면 와그 고객센터 07043535959로 연락해주세요.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">결제 수단은 어떤 것이 있나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        와그는 모든 국내 카드 결제와 핸드폰 결제 실시간 계좌이체로 결제할 수 있습니다.<br>
                        카드사 별로 매월 할부 프로모션도 있습니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">결제 금액 확인은 어떻게 하나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        와그의 상품은 매일 환율에 따라 가격이 달라집니다. 또한 상품마다 간혹 날짜마다 가격이 다른 경우가 있습니다.<br>
                        이를 잘 확인해주신 후 구매해주세요.<br>
                        또한 이미 구매한 상품의 금액 확인은 마이페이지 > 구매내역에서 확인할 수 있습니다.
                      </p>
                    </li>
                  </ul>
                </div>
                <div class="faq_content_menu_sec">
                  <ul class="faq_content_menu_list">
                    <li>
                      <h3 class="faq_content_menu_tit">쿠폰은 어떻게 사용하나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        '마이페이지>내 쿠폰' 에서 가지고 계신 쿠폰을 확인하실 수 있으며, 쿠폰번호를 통해 추가를 할 수 있습니다.<br>
                        결제 시 보유한 쿠폰을 선택하거나, 쿠폰 코드번호를 직접 입력하여 사용할 수 있습니다.<br>
                        각 쿠폰코드를 직접 입력 시 코드별로 유효기간 중복 사용 횟수 등이 다름으로 이 점을 잘 확인 후 사용해주세요.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">쿠폰 종류는 어떻게 되나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        와그에서는 이벤트로 와그에서 사용할 수 있는 쿠폰을 발급하고 있습니다.<br>
                        결제 시 5~10% 즉시 할인이나 다양한 금액 할인이 가능한 6자리 알파벳+숫자의 코드번호(쿠폰)입니다.<br>
                        와그 공식 페이스북이나 인스타그램 그리고 네이버 포스트 등에서 확인할 수 있습니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">포인트는 언제 적립되나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        포인트는 상품을 이용하고 난 후 적립됩니다.<br>
                        구매 즉시 적립되는 것이 아닌 실제 이용을 한 다음에 적립되니 이를 꼭 확인해주세요.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">포인트는 어떻게 적립되나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        상품을 구입하면 전체 구입 가액의 1%를 기본 적립금으로 제공해드리고 있습니다.<br>
                        이는 와그 서비스에서 현금처럼 자유롭게 이용할 수 있습니다.
                      </p>
                    </li>
                  </ul>
                </div>
                <div class="faq_content_menu_sec">
                  <ul class="faq_content_menu_list">
                    <li>
                      <h3 class="faq_content_menu_tit">환불 신청을 했는데 아직 받지 못했어요.<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        결제 수단에 따라 환불 처리 소요시간이 다릅니다. 보통 영업일 기준 3일 정도 소요됩니다.<br>
                        만약 일주일이 지나도 처리가 되지 않았다면 와그 고객센터로 연락을 부탁드립니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">환불 신청은 어떻게 하나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        구입한 상품의 환불 규정에서 환불 가능 여부를 확인해주세요.<br>
                        만약 가능한 상품이라면? 와그 고객서비스센터 07043535959로 연락을 주시면 처리해드립니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">결제한 후 환불 받고 싶습니다.<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        먼저 구입한 상품의 취소 및 환불 규정을 잘 확인해주세요. 구매자의 이름이 들어간 날짜 지정 티켓의 경우 대부분 환불이 불가합니다.<br>
                        다만 오픈 티켓이나 투어의 경우 환불이 가능하니 미리 구매한 상품의 환불 규정을 확인하는 것이 좋습니다.<br>
                        만약 다른 사유가 있거나(천재지변) 한다면 와그 고객센터 07043535959로 연락을 주시면 도와드리겠습니다.
                      </p>
                    </li>
                  </ul>
                </div>
                <div class="faq_content_menu_sec">
                  <ul class="faq_content_menu_list">
                    <li>
                      <h3 class="faq_content_menu_tit">계정을 삭제하고 싶어요.<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        PC 에서는 탈퇴가 가능하며, 모바일에서 탈퇴를 원하실 경우, 성함/연락처/이메일/가입경로와 함께 와그로 연락 주시면 도와드립니다.
                      </p>
                    </li>
                    <li>
                      <h3 class="faq_content_menu_tit">내 정보 수정은 어떻게 하나요?<i class="fa-solid fa-chevron-down"></i></h3>
                      <p class="faq_content_menu_txt">
                        와그 앱 혹은 PC사이트에서 마이페이지를 클릭 여행자 정보 등록에서 수정할 수 있습니다.<br>
                        이곳에서 연락처 이메일 등 여행을 예약하는데 필요한 정보를 미리 입력해두면 더 편하게 상품들을 예약할 수 있습니다.
                      </p>
                    </li>
                  </ul>
                </div>
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
