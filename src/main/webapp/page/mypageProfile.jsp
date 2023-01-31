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
          <h3 class="mypage_content_tit">내 정보</h3>
          <article class="mypage_content_profile">
            <div class="mypage_content_profile_image">
              <label for="image">
                <input type="file" name="image" id="image">
                <img src="../images/myPage/user_icon_def.png" alt="" class="img">
                <i class="fa-solid fa-gear"></i>
              </label>
            </div>
            <div class="mypage_content_profile_info common">
              <label for="name">
                <span>이름</span>
                <input type="search" name="name" id="name" value="오다현" data-oldValue="오다현" readonly>
              </label>
              <button class="edit">수정</button>
              <div class="edit_box">
                <button class="edit_cancel">취소</button>
                <button class="edit_modify">확인</button>
              </div>
            </div>
            <div class="mypage_content_profile_info common">
              <label for="date">
                <span>생년월일</span>
                <input type="date" name="date" id="date" value="1991-03-15" data-oldValue="1991-03-15" readonly>
              </label>
              <button class="edit">수정</button>
              <div class="edit_box">
                <button class="edit_cancel">취소</button>
                <button class="edit_modify">확인</button>
              </div>
            </div>
            <div class="mypage_content_profile_info tel">
              <label for="tel">
                <span>휴대전화번호</span>
                <input type="tel" name="tel" id="tel" value="010" data-oldValue="010" readonly>
                <input type="tel" name="tel" id="tel2" value="4471" data-oldValue="4471" readonly>
                <input type="tel" name="tel" id="tel3" value="6388" data-oldValue="6388" readonly>
              </label>
              <button class="edit">수정</button>
              <div class="edit_box">
                <button class="edit_cancel">취소</button>
                <button class="edit_modify">확인</button>
              </div>
            </div>
            <div class="mypage_content_profile_info common">
              <label for="email">
                <span>이메일 <span class="point_color">*</span></span>
                <input type="search" name="email" id="email" value="odh550@naver.com" data-oldValue="odh550@naver.com" readonly>
              </label>
              <button class="edit">수정</button>
              <div class="edit_box">
                <button class="edit_cancel">취소</button>
                <button class="edit_modify">확인</button>
              </div>
            </div>
            <div class="mypage_content_profile_delete">
              <button>회원탈퇴</button>
              <div class="delete_box_dim"></div>
              <div class="delete_box">
                <i class="fa-solid fa-xmark"></i>
                <h4 class="delete_box_tit">회원 탈퇴</h4>
                <p class="delete_box_txt">
                  탈퇴 후에는 현재 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
                </p>
                <label for="checkbox">
                  <input type="checkbox" name="checkbox" id="checkbox">
                  안내 사항을 모두 확인하였으며, 이에 동의합니다.
                </label>
                <div class="delete_box_check">
                  <button class="delete">확인</button>
                  <button class="cancel">다음에 할게요!</button>
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
