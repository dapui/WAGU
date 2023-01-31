<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>
<%@ page import="com.wagu.dto.*"%>
<%@ page import="com.wagu.dao.*"%>
<%@ page import="com.wagu.connection.DBconnection"%>
<%
	int itemID=0;
		try {
			itemID = Integer.parseInt(request.getParameter("itemID"));
		}catch(Exception e){
			e.printStackTrace();
		}
	ReviewDAO rDao = new ReviewDAO();
	ArrayList<ReviewMainDTO> reviewList = rDao.showReviewList(itemID);
	ArrayList<PhototopDTO> phototopList = rDao.showtopPhoto(itemID);
	
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 사진 후기</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/photoReview.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
    <script src="../js/photoReview.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
     	 <main class="main sub">
			
			<div class="photo_review">
				<div class="left_scroll">
					<div class="photo_review_left_wrapper">
						<div class="photo_review_left">
							<div class="photo_review_dim"></div>
							<div class="back_button"><img src="../images/review/imgbackicon.svg" alt="back icon"></div>
							<div class="photo_review_detail_section">
								<div class="member_info_section">
									<div class="name">이르음</div>
									<div class="day">2022-08-17</div>
								</div>
								<div class="score_section">
									<div class="star_wrapper">
										<img class="star" src="../images/common/star_icon.svg" alt="star icon">
										<img class="star" src="../images/common/star_icon.svg" alt="star icon">
										<img class="star" src="../images/common/star_icon.svg" alt="star icon">
										<img class="star" src="../images/common/star_icon.svg" alt="star icon">
										<img class="star" src="../images/common/star_icon.svg" alt="star icon">
									</div>
									<div class="score_wrapper">
										<div class="score">5</div>
										<div class="fixed_score">/5</div>
									</div>
								</div>
								<div class="photo_section"><img src="../images/review/imgreviewsample.jpeg" alt="photo" id="photosection"></div>
								<div class="content">
								2년만에 다시 찾아온 롯데월드 … 사람이 없을 줄 알고 기대했던 나지만 화요일인데도 불구하고 사람이 굉장히 많았다는.. ㅠㅠ
								</div>
							</div>
						</div>
					</div>
					
				</div>
<!-- 				itemID를 파라미터로받기 -->
				<div class="photo_review_right">
					<div class="photo_review_right_wrapper">
						<div class="title">사진 후기</div>
						<div class="photo_list_section">
						<% for(int i=0; i<=phototopList.size()-1; i++){  %>
						<div class="photo_list">
							<div class="photo"><img src="../images/review/<%=phototopList.get(i).getImage() %>" alt="photo"></div>
							<div class="photo_dim active"></div>
						</div>
						<% } %>
						</div>
					</div>
				</div>
			</div>
			
       </main>
    </div>
  </body>
</html>



















    