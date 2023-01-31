<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>
<%@ page import="com.wagu.dto.*"%>
<%@ page import="com.wagu.dao.*"%>
<%@ page import="com.wagu.connection.DBconnection"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 이용 후기</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/reviewWriting.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
    <script src="../js/reviewWriting.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
     	 <main class="main sub">
			
		    <div class="background_section">
				<div class="writing_section">
						<div class="title">이용 후기</div>
					<div class="scroll">
					
							<div class="writing_wrapper">
								<div class="sub_title">아보 합정점 - 와그 단독</div>
								<div class="howaboutgoods">상품이 어떠셨나요?</div>
								<div class="score_section">
									<img src="../images/common/star_icon.svg" alt="star icon" class="star">
									<img src="../images/common/star_icon.svg" alt="star icon" class="star">
									<img src="../images/common/star_icon.svg" alt="star icon" class="star">
									<img src="../images/common/star_icon.svg" alt="star icon" class="star">
									<img src="../images/common/star_icon.svg" alt="star icon" class="star">
								</div>
								<div class="evaluation">
									<span class="eval">추천안함</span>
									<span class="eval">별로</span>
									<span class="eval">보통</span>
									<span class="eval">만족</span>
									<span class="eval">최고</span>
									<span class="eval active">평가없음</span>
								</div>
							</div>
						<div class="content_section">
							<form>
								<textarea class="content" placeholder="여러분의 이야기를 들려주세요.(최소 10자 이상)"></textarea>
							</form>
						</div>
						<div class="attachment">
							<div class="attach photo_button">
								<img src="../images/review/imgcameraicon.svg" alt="camera icon">
							</div>
							<div class="attach photo_preview">
								<div class="xbutton_wrapper">
									<img src="../images/review/imgxbuttonicon.svg" alt="xbutton icon">
								</div>
							</div>
						</div>
						
					</div>
					<div class="button_section">
							<div class="button_wrapper">
								<form class="cancle">
									<button type="button" id="cancle_button">취소</button>
								</form>
								<form class="submit">
									<button type="button" id="submit_button">등록하기</button>
								</form>
							</div>
						</div>
				</div>			

       		</div>
       	</main>
       
       <footer class="footer"></footer>
    </div>
  </body>
</html>



















