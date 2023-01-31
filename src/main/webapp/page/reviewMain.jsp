<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>
<%@ page import="com.wagu.dto.*"%>
<%@ page import="com.wagu.dao.*"%>
<%@ page import="com.wagu.connection.DBconnection"%>
<%
	int itemID = 101001;
// 	try {
// 		itemID = Integer.parseInt(request.getParameter("itemID"));
// 	}catch(Exception e){
// 		e.printStackTrace();
// 	}
	ReviewDAO rDao = new ReviewDAO();
	ArrayList<ReviewMainDTO> reviewList = rDao.showReviewList(itemID);
	ArrayList<PhotoReviewDTO> photoList = rDao.showPhoto(itemID);
	ArrayList<PhototopDTO> phototopList = rDao.showtopPhoto(itemID);


%>


<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>WAGU - 이용 후기</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/reviewMain.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
    <script src="../js/reviewMain.js"></script>

  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
     	 <main class="main sub">
			
			<div class="review_Main">
				<div class="see_policy">
					<img class="policy_icon" src="../images/review/imgpolicyicon.svg" alt="policy icon">운영정책 보기
				</div>
				<div class="photo_review">
					<div class="title">사진 후기</div>
					<div class="photo_section">
						<% 
							if(phototopList.size()<=5){ 
									for(int i=0; i<=phototopList.size()-1; i++){ %>
						<div class=top_photo_list><img class="review_photo top" src="../images/review/<%=phototopList.get(i).getImage() %>" alt="photo" ></div>
						<% } }  %>
						<%
						if(phototopList.size()>5){ 
							
							for(int i=0; i<=3; i++){ %>
								<div class=top_photo_list><img class="review_photo top" src="../images/review/<%=phototopList.get(i).getImage() %>" alt="photo" ></div>
						<% } %>
								<div class="last_photo_list">
									<img class="review_photo top" src="../images/review/<%=phototopList.get(4).getImage() %>" alt="photo">
									<span class="photo_number">+<%=phototopList.size()-5 %></span>
								</div>
						<% } %>
						<script>
							$(function(){
// 								alert('!');
								$('.review_photo.top').click(function(){
// 								alert('!!');
									location.href = 'photoReview.jsp?itemID=<%=itemID %>';
											})
							})
						</script>
					</div>
					
				</div>
				<div class="review_order_section">
					<div class="review_order_detail">
						<div class="review_order_wrapper">
							<button class="review_order_button">test</button>
							<i class="fa-solid fa-chevron-down"></i>
						</div>
					</div>
					<ul class="review_order_listbox" id="review_order_listbox">
						<li><button class="revieworderlist active">베스트리뷰순</button></li>
						<li><button class="revieworderlist">최신순</button></li>
						<li><button class="revieworderlist">평점 높은순</button></li>
						<li><button class="revieworderlist">평점 낮은순</button></li>
					</ul>
				</div>
				<div class="review_section">
					<%
						for(ReviewMainDTO list : reviewList) {
					%>  
					<div class="review_list">
						<div class="member_info_section">
							<div class="name"><%=list.getMemberID() %></div>
							<div class="day"><%=list.getWriteDate() %></div>
							<% if(list.getBestreview().equals("Y")){ %>
							<div class="best_review"></div>
							<% } %>
						</div>
						<div class="score_section">
							<div class="star_wrapper">
								<% for(int i=0; i<=list.getScore()-1; i++){ %>
								<img class="star" src="../images/common/star_icon.svg" alt="star icon">
								<% } %>
								<% for (int i=1; i<=(5-list.getScore()); i++){ %>
								<img class="star_gray" src="../images/common/star_icon.svg" alt="star icon">
								<% } %>
							</div>
							<div class="score_wrapper">
								<div class="score"><%=list.getScore() %></div>
								<div class="fixed_score">/5</div>
							</div>
						</div>
						<div class="content_section">
							<span><%=list.getContent() %></span>
						</div>
						<div class="photo_section">
							<div class=photo_list>
							<%
							for(PhotoReviewDTO photolist : photoList) {
							%>  
							<% if(photolist.getReviewID()==list.getReviewID()){ %>
								<% for(int i=0; i<=photolist.getImagesArr().length-1; i++){ %>
								<img class="review_photo" src="../images/review/<%=photolist.getImagesArr()[i] %>" alt="photo">
								<% } %>
							<% } %>
							<% } %>
							
							</div>
						</div>
						<div class="like_button_section">
							<div class="like_button">
							<img class="like_icon" src="../images/review/imglikeicon.svg" alt="like icon">Up</div>
						</div>
					
				</div>
					<% } %>
			</div>
			</div>
			
       </main>
			<% DBconnection.getConnection().close(); %>		
       <div class="review_rule_popup">
			<div class="dim_revpopup"></div>
				<div class="review_rule_popup_content">
					<div class="review_rule_popup_top">
						<div class="review_rule_popup_title">이용 후기 운영정책</div>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button review" viewBox="0 0 16 16">
					            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
					        </svg>
					</div>
					<ul class="review_rule_list">
					    <li>이용 후기는 이용일 다음날부터 90일까지 작성 가능합니다.</li>
					    <li>이용 후기는 예약 당 한번만 작성할 수 있으며, 작성된 후기는 등록 즉시 사이트에 게재, 모두 공개를 원칙으로 합니다.</li>
					    <li>게시된 이용 후기는 WAGU에 귀속됩니다.</li>
					    <li>이용 후기 쿠폰은 최초 작성된 후기를 기준으로 발급됩니다. 이용 후기 수정 시 쿠폰을 재발급하지 않습니다.</li>
					    <li>이용 후기 삭제 후 재작성 시 쿠폰을 재발급하지 않습니다.</li>
					    <li>이용 후기에 적합하지 않은 내용, 오해의 소지가 있는 내용은 통보없이 삭제될 수 있으며 발급된 쿠폰이 회수될 수 있습니다.</li>
					</ul>
				</div>
		</div>
		

	    
		<div class="swiper mySwiper">
		     <div class="swiper-wrapper">
		       <div class="swiper-slide"><img class="slide_photo" src="../images/review/seoul-review-img01-1.jpg" alt="photo"></div>
		       <div class="swiper-slide"><img class="slide_photo" src="../images/review/seoul-review-img01-2.jpg" alt="photo"></div>
		       <div class="swiper-slide"><img class="slide_photo" src="../images/review/seoul-review-img01-3.jpg" alt="photo"></div>
		     </div>
		     <div class="close_icon"><i class="fa-sharp fa-solid fa-xmark fa-3x"></i></div>
		     <div class="swiper-button-next"></div>
		     <div class="swiper-button-prev"></div>
		     <div class="swiper-pagination"></div>
	    </div>
	    
<!-- 	    Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	    <!-- Initialize Swiper -->
	<script>
	      var swiper = new Swiper(".mySwiper", {
	        pagination: {
	          el: ".swiper-pagination",
	          type: "fraction",
	        },
	        navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
	      });
	</script>
	    
       <footer class="footer"></footer>
    </div>
  </body>
</html>



















