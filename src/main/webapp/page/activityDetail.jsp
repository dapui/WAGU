<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="java.util.*" %>
<%@ page import="com.wagu.dao.*" %>
<%@ page import="com.wagu.dto.*" %>
<%--@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"--%>
<%---@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"--%>
<% 
	int itemID = 0;
	try{
		itemID = Integer.parseInt(request.getParameter("itemID"));
	} catch(NumberFormatException e) {
		e.printStackTrace();	
	}
	
	ActivityDetailDAO aDao = new ActivityDetailDAO();
	ArrayList<ActivityDetailTopDTO> listTop = aDao.detailPageTop(itemID);
	ArrayList<ActivityDetailInfoDTO> listInfo = aDao.detailPageInfo(itemID);
	ArrayList<ActivityDetailBottomDTO> listBottom = aDao.detailPageBottom(itemID);
	ArrayList<ActivityDetailOptionDTO> listOption = aDao.detailOption(itemID);
	ArrayList<ActivityDetailOptionSubDTO> listSub = aDao.detailOptionSub(itemID);
%>
<%
	for(ActivityDetailTopDTO dt : listTop) {
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>WAGU - <%=dt.getGoods_name() %></title>
	<link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
	<link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
	<link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/activityDetail.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
	<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/df844253b1.js"crossorigin="anonymous"></script>
	<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="../js/common.js"></script>
	<script src="../js/activityDetail.js"></script>
	
</head>
<body>
	<div class="wrap">
		<header class="header sub detail_header">
			<jsp:include page="top.jsp"></jsp:include>
		</header>
		<main class="main sub">
		
			<div class="swiper_section">
				<div class="swiper_area">
					<div style="--swiper-navigation-color: #fff; --swiper-pagination-color: #fff" class="swiper mySwiper2">
						<div class="swiper-wrapper">
							<div class="swiper-slide"><img src="../images/detailPage/ticket/<%=dt.getImage()[0] %>" class="slide1"></div>
							<div class="swiper-slide slide"><img src="../images/detailPage/ticket/<%=dt.getImage()[1] %>" class="slide2"></div>
							<div class="swiper-slide slide"><img src="../images/detailPage/ticket/<%=dt.getImage()[2] %>"></div>
							<div class="swiper-slide slide"><img src="../images/detailPage/ticket/<%=dt.getImage()[3] %>"></div>
							<div class="swiper-slide slide"><img src="../images/detailPage/ticket/<%=dt.getImage()[4] %>"></div>
						</div>
						<div class="close_button"><img src="../images/detailPage/cancel_button_w.png" class="modal_close"></div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
					<div class="swiper_collection">
						<div thumbsSlider="" class="swiper mySwiper">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="../images/detailPage/ticket/<%=dt.getImage()[0] %>" class="menu_style"/>
								</div>
								<div class="swiper-slide">
									<img src="../images/detailPage/ticket/<%=dt.getImage()[1] %>" class="menu_style"/>
								</div>
								<div class="swiper-slide">
									<img src="../images/detailPage/ticket/<%=dt.getImage()[2] %>" class="menu_style"/>
								</div>
								<div class="swiper-slide">
									<img src="../images/detailPage/ticket/<%=dt.getImage()[3] %>" class="menu_style"/>
								</div>
								<div class="swiper-slide">
									<img src="../images/detailPage/ticket/<%=dt.getImage()[4] %>" class="menu_style"/>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- swiper js -->
			<script>
				var swiper = new Swiper(".mySwiper", {
			        spaceBetween: 10,
			        slidesPerView: 5,
			        freeMode: true,
			        watchSlidesProgress: true,
			    });
			    var swiper2 = new Swiper(".mySwiper2", {
			        spaceBetween: 10,
			        navigation: {
			          nextEl: ".swiper-button-next",
			          prevEl: ".swiper-button-prev",
			        },
			        thumbs: {
			          swiper: swiper,
			        },
			    });
			</script>
			
			<div class="images">
				<div class="image_left">
					<img src="../images/detailPage/ticket/<%=dt.getImage()[0] %>" class="main_image"/>
					<div class="like_heart">
						<img src="../images/detailPage/heart_white.svg" class="like">
					</div>
					<div class="play_section">
						<a href="<%=dt.getVideo_url() %>" target="_blank"> 
							<img src="../images/detailPage/play.png" class="image_play" />
						</a>
					</div>
				</div>
				<div class="image_right">
					<img src="../images/detailPage/ticket/<%=dt.getImage()[1] %>" class="size1" /> 
					<img src="../images/detailPage/ticket/<%=dt.getImage()[2] %>" class="size2" /> 
					<img src="../images/detailPage/ticket/<%=dt.getImage()[3] %>" class="size3" /> 
					<img src="../images/detailPage/ticket/<%=dt.getImage()[4] %>" class="size4" />
				</div>
			</div>
			<% if(dt.getBest()>0) { %>
			<div class="satisfaction">
				<img src="../images/detailPage/trophy.svg" class="trophy">
				 <%=dt.getBest() %>명이 매우 만족한 최고의 액티비티!
			</div>
			<% } %>
			<div class="main_area">
				<div class="goods_main">
					<div class="title">
						<div class="goods_title">
							<div class="region">
								<a href="activity.html"> <img src="../images/detailPage/location_white.png">
									<%=dt.getCity() %>
								</a>
							</div>
							<br>
							<div class="goods_name"><%=dt.getGoods_name() %></div>
							<div class="category_area">
								<div class="category">
									<%=dt.getCategory() %>
								</div>
							</div>
						</div>
						<div class="info">
							<% if(dt.getAvailable().equals("Y")) { %>
							<div class="available">
								오늘부터 사용가능 <img src="../images/detailPage/thunder.svg" width="12px"
									height="12px">
							</div>
							<% } %>
							<div class="detail_info">
							<%
								for(ActivityDetailInfoDTO dInfo : listInfo) {
							%>
								<div class="detail">
									<img src="../images/detailPage/<%=dInfo.getIcon() %>" class="icon_detail">
									<%=dInfo.getContent() %>
								</div>
							<% } %>
							</div>
							<% if(dt.getCoupon()>0) { %>
							<div class="coupon">
								<img src="../images/detailPage/coupon_border.svg">
								<div class="coupon_content">
									<div class="coupon_content_discount">
										₩ <%=dt.getCoupon() %><br>
									</div>
									<div class="coupon_content_info">1인 이상 추가할인</div>
								</div>
							</div>
							<% } %>
						</div>
					</div>
					<div class="price_area" id="price_area">
						<div class="price_check">
							<% if(dt.getDiscount()>0) { %>
							<div class="discount_check">
								<div class="coupon_discount">쿠폰할인</div>
								<img src="../images/detailPage/help_logo_white.png" class="help_icon" />
								<div class="price">
									<del>₩ <%=dt.getPrice() %></del>
								</div>
							</div>
							<div class="discount_price">₩ <%=dt.getDis_price() %>&nbsp;</div>
							<% } %>
							<div class="score">
								<div class="score_star">
									<img src="../images/detailPage/star.png" class="star"> 
									<img src="../images/detailPage/star.png" class="star"> 
									<img src="../images/detailPage/star.png" class="star">
									<img src="../images/detailPage/star.png" class="star">
									<img src="../images/detailPage/star.png" class="star">
								</div>
								<div class="score_number"><%=dt.getScore() %></div>
							</div>
						</div>
						<div class="reservation_button">
							<button id="reservation">예약하기</button>
							<script>
								// 다음 페이지로 이동
								$("#reservation").click(function(){
									location.href = "activityReservation1.jsp?itemId=<%=dt.getTicket_id() %>"
								})
							</script>
						</div>
					</div>
				</div>
			</div>
			<% } %>
			<div class="top_bar">
				<ul>
					<li>
						<a href="#n" class="top_option top top_content1">상품 옵션</a>
					</li>
					<li>
						<a href="#n" class="top_program top top_content2">프로그램</a>
					</li>
					<li>
						<a href="#n" class="top_include top top_content3">포함 사항</a>
					</li>
					<li>
						<a href="#n" class="top_use top top_content4">사용 방법</a>
					</li>
					<li>
						<a href="#n" class="top_certainly top top_content5">꼭 알아두세요</a>
					</li>
					<li>
						<a href="#n" class="top_refund top top_content6">환불 규정</a>
					</li>
				</ul>
			</div>
			<%
				for(ActivityDetailBottomDTO db : listBottom ) {
			%>
			<div class="content_area">
				<% if(!(db.getChecks()==null)) { %>
				<div class="content required_section">
					<div class="required_checklist_title">
						<img src="../images/detailPage/essential_checks.svg">
						<div class="required_checklist">필수 확인 사항</div>
					</div>
					<div class="check_content">
						<%=db.getChecks() %>
					</div>
				</div>
				<% } %>
				<div class="content">
					<span class="title">매력포인트</span><br />
					<div class="point">
						<%=db.getPoint() %>
					</div>
				</div>
				<div class="content">
					<span class="title">이용후기</span><br />
					<div class="score_area">
						<div class="score_circle">
							<div class="grade">
								평점
							</div>
							<div class="grade_circle">
								<%=db.getScore() %>
							</div>	
						</div>
						<div class="grade_area">
							<div class="best">
								<img src="../images/detailPage/heart_pink.svg" class="emoji">
								최고(4-5)
								<div class="best_rod">
								</div>
								100%
							</div>
							<div class="satisfied">
								<img src="../images/detailPage/smile.svg" class="emoji">
								만족(3)
								<div class="satisfied_rod">
								</div>
								0%
							</div>
							<div class="normal">
								<img src="../images/detailPage/bad.svg" class="emoji">
								보통(1-2)
								<div class="normal_rod">
								</div>
								0%
							</div>
						</div>
					</div>
					<div class="photo_review">
						<div class="photo_section">
							<div class=photo_list><img class="review_photo" src="../images/review/imgreviewsample.jpeg" alt="photo"></div>
							<div class=photo_list><img class="review_photo" src="../images/review/imgreviewsample.jpeg" alt="photo"></div>
							<div class=photo_list><img class="review_photo" src="../images/review/imgreviewsample.jpeg" alt="photo"></div>
							<div class=photo_list><img class="review_photo" src="../images/review/imgreviewsample.jpeg" alt="photo"></div>
							<div class=last_photo_list>
								<img class="review_photo" src="../images/review/imgreviewsample.jpeg" alt="photo">
								<span class="photo_number">+62</span>
							</div>
						</div>
					</div>
					<div class="review_section">
						<div class="review_list">
							<div class="member_info_section">
								<div class="name">이르음</div>
								<div class="day">2022-08-17</div>
								<div class="best_review">Best Review</div>
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
							<div class="content_section">
								<span>아이와 저렴하게 잘 다녀왔어요</span>
							</div>
							<div class="photo_section">
								<div class=photo_list><img class="review_photo" src="../images/review/imgreviewsample.jpeg" alt="photo"></div>
								<div class=photo_list><img class="review_photo" src="../images/review/imgreviewsample.jpeg" alt="photo"></div>
								<div class=photo_list><img class="review_photo" src="../images/review/imgreviewsample.jpeg" alt="photo"></div>
							</div>
							<div class="like_button_section">
								<div class="like_button">
								<img class="like_icon" src="../images/review/imglikeicon.svg" alt="like icon">Up</div>
							</div>
						</div>
					</div>
					<div class="view_more_area">
						<div class="view_more">
							<%=db.getReview_count() %>개 후기 보러가기
						</div>
					</div>	
				</div>
				<div class="content target" id="top_content1">
					<span class="title">상품옵션</span><br />
					<div class="option_section">
						<%
							for(ActivityDetailOptionDTO ado : listOption ) {
						%>
						<div class="option_area">
							<div class="option_title">
								<div class="option_name"><%=ado.getTitle() %></div>
								<div class=option_price>₩ <%=ado.getPrice() %></div>
								<i class="fa-solid fa-angle-down"></i>
							</div>
							<div class="option_content_section">
								<%
									for(ActivityDetailOptionSubDTO ados : listSub ) { 
															if(ado.getTicket_opt_id()==ados.getTicket_opt_id()) {
								%>
								<div class="option_content">
									<div class="option_content_name"><%=ados.getContent() %></div>
									<div class="option_content_price">₩ <%=ados.getPrice() %></div>
								</div>
								<%
								} 
									} 
								 	if(!(ado.getContent()==null)){ 
								 %>
								<div class="option_description"><%=ado.getContent() %></div>
								<% } %>
							</div>
						</div>
						<% } %>
					</div>
				</div>
				<div class="content target" id="top_content2">
					<span class="title">프로그램</span><br />
					<div class="program">
						<script>
							$(function(){
								$(".program").load("../html/ticketProgram/<%=db.getProgram() %>");
							})
						</script>
					</div>
				</div>
				<div class="content target" id="top_content3">
					<span class="title">포함사항</span><br />
					<ul class="include">
						<li class="include_content"><%=db.getInclude() %></li>
					</ul>
				</div>
				<% if(!(db.getExclude()==null)) { %>
				<div class="content">
					<span class="title">불포함사항</span><br />
					<ul class="exclude">
						<li class="exclude_content"><%=db.getExclude() %></li>
					</ul>
				</div>
				<% } %>
				<div class="content target" id="top_content4">
					<span class="title">사용방법</span><br />
					<div class="how_to_use">
						<%=db.getHow_to_use() %>
					</div>
				</div>
				<div class="content target" id="top_content5">
					<span class="title">꼭 알아두세요</span><br />
					<ul class="must_know_contents">
						<%=db.getDetail_notice() %>
					</ul>
					<% if(!(db.getCaution()==null)) { %>
					<div class="caution_area">
						<div class="caution_content">
							<div class="caution_icon">
								<img src="../images/detailPage/exclamation_mark.png">
							</div>
							<ul class="caution">
								<%=db.getCaution() %>
							</ul>
						</div>
					</div>
					<% } %>
				</div>
				<div class="content target" id="top_content6">
					<span class="title">환불 규정</span><br />
					<div class="refund">
						<%=db.getRefund() %>
					</div>
				</div>
				<div class="last_content">
					<span class="title">위치</span><br />
					<div class="location">
						<div class="location_left">
							<div><img src="../images/detailPage/location.png" height="20" /> </div>
							<span id="address"><%=db.getLocation() %></span>
						</div>
						<button id="copy" class="location_right" onclick="copyToClipboard()">
							<img src="../images/detailPage/copy.png" width="20" height="20" /> 복사
						</button>
						<div style="clear: both;"></div>
						<section id="map-section">
			              <div id="map">
			              <script>    
			                var marker;
			                function initMap() {
			                  var map = new google.maps.Map(document.getElementById('map'), {
			                    zoom: 13,
			                    scrollwheel: false,
			                    center: {lat:  <%=db.getLatitude()%>, lng: <%=db.getLongitude()%>},
			                    mapTypeId: 'roadmap'
			                  });
			                  marker = new google.maps.Marker({
			                    title: '제주 고흐의정원',
			                    infoWindow: {
			                      content: ''},
			                      map: map,
			                      draggable: true,
			                      animation: google.maps.Animation.DROP,
			                      position: {lat:  <%=db.getLatitude()%>, lng: <%=db.getLongitude()%>}	
			                    });
			                    marker.addListener('click', toggleBounce);
			                  }
			                  function toggleBounce() {
			                    if (marker.getAnimation() !== null) {
			                      marker.setAnimation(null);
			                    } else {
			                      marker.setAnimation(google.maps.Animation.BOUNCE);
			                    }
			                  }	   
			                </script>
			                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2g2ME9BU-rlvZP04CfFBrJw_sj0_mIkw&callback=initMap">
			                </script>
			              </div>
            		</section>  
					</div>
				</div>
			</div>
			<% } %>
			<div class="list_item"></div>
		</main>
		<footer class="footer">
			<jsp:include page="bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>