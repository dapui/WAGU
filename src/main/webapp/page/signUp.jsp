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
    <link rel="stylesheet" href="../css/signUp.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/signUp.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>

      <main class="main sub">
        <div class="login_sub">
          <div class="wrapper">
            <div class="sigUp_top_box">회원가입</div>

            <form action="signUpAction.jsp" class="join_form" onsubmit="return join()" method="post">
              <div class="id_password_creating_form">
                <div class="email_box">
                  <input class="create_signUp_email" type="text" name="id" placeholder="이메일"> 
                  <input type ="button" class="double_check" value="중복확인">
                </div>
      
                <div class="certification_number">
                  <input type="tel" placeholder="이메일 인증번호 입력하세요" class="certification_number_check" value="">
                  <input class="email_number" type="button" value="인증요청">
                </div>
      
                <input class ="create_signUp"  type="password" name="pw" maxlength="15" placeholder="비밀번호" ><br>
                <input class ="create_signUp ch"  type="password" name="pw_check" maxlength="15" placeholder="비밀번호 확인"><br>
               
                <div class = "password_condition">
                  * 비밀번호( 영문 대소문자, 숫자, 특수문자가 각각 1개 이상 10자~15자)
                </div>
                
                <input class ="create_signUp name"  type="text" name="name" placeholder="이름"><br>
      			<input class ="create_signUp birth"  type="text" name="birth" placeholder="생년월일"><br>
                <div class="phone">
                  <input class="tel" type="tel" placeholder="010" maxlength="3" name="phone1">
                  <span>-</span>
                  <input class="tel" type="tel"  maxlength="4" name="phone2">
                  <span>-</span>
                  <input class="tel" type="tel"  maxlength="4" name="phone3" > 
                </div>
      			
                <div class ="agree_box">
                  <div class="all_agree_check">
                    <div class="all_agree_content">
                      <input type="checkbox" name="allAgree" class="allAgree">
                      <label class="all_agree">전체동의</label> 
                    </div>
                  </div>
                  <div class="detail_agreements">
                    <div class="detail_agree">
                      <input type="checkbox" name="agreeDetail" class="agreeDetail" required >
                      <label class="agree_detail1">
                        <a href="#n" class="check">이용 약관 동의</a>
                        <label>(필수)</label>
                      </label> 
                    </div>
                    <div class="detail_agree">
                      <input type="checkbox" name="agreeDetail" class="agreeDetail" required >
                      <label class="agree_detail2">
                        <a href="#n" class="check">만 14세 이상 확인</a>
                        <label>(필수)</label>
                      </label> 
                    </div>
                    <div class="detail_agree">
                      <input type="checkbox" name="agreeDetail" class="agreeDetail" required >
                      <label class="agree_detail3">
                        <a href="#n" class="check">개인정보 수집 및 이용 동의</a>
                        <label>(필수)</label>
                      </label> 
                    </div>
                    <div class="detail_agree">
                      <input type="checkbox" name="agreeDetail" class="agreeDetail" >
                      <label class="agree_detail4">
                        <span>이메일 뉴스레터 수신 동의</span>
                        <label>(선택)</label>
                      </label> 
                    </div>
                  </div>
                </div>
              </div>
     
              <div class="captcha" style="display:none;">
                <img alt="dd" src="../images/member/captcha.JPG" width="100%" height="65px">
              </div>
      
              <div class="signUp">
                <input class ="signUp_button" type ="submit" value="회원가입">
              </div>
            </form>
    
            <p class="signUp_or_sns"><span>or</span></p>
    
            
            <div class="sns_button">
              <button class="signUP_sns">
                  <img src="../images/member/kakao.svg" alt="kako" style="width: 45px; height:14px">
                  <span>회원가입</span>
              </button>
            </div>
            <div>
              <button class="signUP_sns">
                  <img src="../images/member/naver.svg" alt="naver" style="width: 45px; height:14px">
                  <span>회원가입</span>
              </button>
            </div>
            <div>
              <button class="signUP_sns">
                  <img src="../images/member/google.svg" alt="google" style="width: 45px; height:14px">
                  <span>회원가입</span>
              </button>
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
