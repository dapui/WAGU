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
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
       <jsp:include page="top.jsp"></jsp:include>
      </header>

      <main class="main sub">
        <div class="main sub">
          <div class = "popUp_check" style="display: none;">
              <div class="dim"></div>
              <div class = "password_reset">
                  <div class="password_content">
                      <p class="notice_password">가입하셨던 이메일 주소를 입력하시면 비밀번호 재설정 URL을 전송해드립니다.</p>
                      <input class = "reset_login_form_box" type="text" name ="email" placeholder="이메일 주소">
                      <button class ="URL_send" type ="button"> 비밀번호 재설정 URL 보내기 </button>
                  </div>
                  <button class="close_button">
                      <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="close_button_icon" viewBox="0 0 16 16">
                          <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646_2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1_.708.708L8 8.707l_2.646 2.647a.5.5 0 0 1_.708_.708L7.293 8 4.646 5.354a.5.5 0 0 1 0_.708z"/>
                      </svg>
                  </button>
              </div>
          </div>
          <div class="wrapper">
              <div class="wrapper_content">
                  <div class="login_title">로그인</div>
  
                  <form class="login_form" action="LoginAction.jsp" method="post">
                      <input class = "login_form_input" type="email" name ="email" placeholder="이메일 주소" required> <br>
                      <input class = "login_form_input" type="password" name = "password" placeholder="비밀번호" required><br>
                      <input class ="login_button" type ="submit" value="로그인">
                  </form>
      
                  <label class="autologin_check_password_search" >
                      <input type="checkbox" name="autoLogin" style="border-radius:4px;">
                      <span class="autoLogin">자동로그인</span>
                      <span>·</span>
                      <a href="#n"> 비밀번호 찾기</a>
                  </label>
      
                  <p class = "login_or_sns"><span>or</span></p>
                  
                  <div>
                      <button class="kakao_login">
                          <img src="../images/member/kakao.svg" alt="kakaso">
                          <span>로그인</span>
                      </button>
                  </div>
                  <div>
                      <button class="naver_login">
                          <img src="../images/member/naver.svg" alt="naver">
                          <span>로그인</span>
                      </button>
                  </div>
                  <div>
                      <button class="google_login">
                          <img src="../images/member/google.svg" alt="google">
                          <span>로그인</span>
                      </button>
                  </div>
                  <div  class="sign_up_box">
                      <span class="sign_up_check">아직 와그의 멤버가 아니세요?</span>
                      <a href="signUp.jsp" style="color: #d91c84;" >회원가입</a>
                  </div>
              </div>
              
          </div>	
      </div>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
    