<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wagu.dao.MemberDAO" %>
<%
	MemberDAO mDAO = new MemberDAO();
	int memberID = mDAO.getIdFromEmail((String)session.getAttribute("loginEmail")) ;
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 파트너쉽</title>
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
        <section class="contactus_top">
          <h2 class="contactus_top_tit">지금 와그의 파트너가 되어보세요</h2>
        </section>
        <section class="contactus_sec01">
          <h2 class="contactus_sec_tit">와그와 파트너십을 해야하는 이유</h2>
          <p class="contactus_sec_txt">
            와그는 빠르게 성장하는 자유여행 시장에서 가장 두드러지는 성과를 만들어내고 있는 여행 액티비티 플랫폼으로 <span class="m_hide"></span>
            전 세계의 기업들과 특별한 파트너십을 맺고 있습니다.
          </p>
        </section>
        <section class="contactus_sec02 cont_size">
          <article class="contactus_sec02_cont">
            <h2 class="contactus_sec_tit">자유여행자라면 와그!</h2>
            <p class="contactus_sec_txt">
              급성장하는 자유여행 시장에서 <br>
              와그는 아시아 주요 도시에 직접 진출 하여 <br>
              아시아인들의 큰 사랑을 받고 있습니다.  
            </p>
          </article>
          <article class="contactus_sec02_cont">
            <h2 class="contactus_sec_tit">새로운 수익 창출</h2>
            <p class="contactus_sec_txt">
              아시아에서 200만 명이 넘는 자유여행자들은 <br>
              와그에 방문해 나만의 자유여행을 계획하고 있습니다.<br>
              이들에게 최고의 상품을 제공해보세요.
            </p>
          </article>
          <article class="contactus_sec02_cont">
            <h2 class="contactus_sec_tit">편리한 시스템</h2>
            <p class="contactus_sec_txt">
              와그 파트너 앱으로 매일매일 이용하는 여행자들을 만나보세요.<br>
              몇 번의 터치로 손쉽게 확정하고 관리할 수 있습니다.<br>
              QR코드 인식 한 번으로 모든 확인과정을 끝낼 수 있습니다.
            </p>
          </article>
        </section>
        <section class="contactus_sec03 cont_size">
          <h2 class="contactus_sec_tit">제휴문의</h2>
          <form action="" class="contactus_form" method="post">
            <article class="contactus_form_sec">
              <label for="sbj" class="sbj">
                제목 
                <input type="text" name="sbj" id="sbj">
              </label>
              <label for="company">
                회사명
                <input type="text" name="company" id="company">
              </label>
              <label for="name">
                담당자명
                <input type="text" name="name" id="name">
              </label>
              <label for="email">
                이메일
                <input type="email" name="email" id="email">
              </label>
              <label for="phone">
                휴대전화번호
                <input type="tel" name="phone" id="phone">
              </label>
            </article>
            <article class="contactus_form_sec">
              <label for="content" class="content">
                제휴 내용
                <textarea name="form_content" rows="8" id="content"></textarea>
              </label>
            </article>
            <article class="contactus_form_sec form_agreement">
              <h3 class="form_agreement_tit">개인정보 수집 및 이용 동의</h3>
              <p class="form_agreement_txt">
                (주)와그는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데 최선을 다합니다.
              </p>
              <div class="form_agreement_content">
                <p class="form_agreement_content_txt">
                  1. 목적 : 제휴 제안에 따른 연락<br>
                  2. 항목 : 회사명, 담당자명, 이메일 주소, 전화번호<br>
                  3. 보유기간 : 제휴 제안 사항 상담서비스를 위해 검토 완료 후 3개월 간 보관하며, 이후 해당 정보를 지체 없이 파기합니다.
                </p>
                <p class="form_agreement_content_txt">
                  위 정보 수집에 대한 동의를 거부할 권리가 있으며, 동의 거부 시에는 제휴 제안 접수가 제한될 수 있습니다.<br>
                  더 자세한 내용에 대해서는 <a href="#n" target="_self" class="point_color link">개인정보처리방침</a> 을 참고하시길 바랍니다.
                </p>
              </div>
              <label for="agree" class="check_agree">
                <input type="checkbox" name="agree" id="agree">
                개인정보 수집 및 이용에 동의합니다. (필수)
              </label>
              <input type="submit" value="등록" class="form_agreement_submit">
            </article>
          </form>
        </section>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
