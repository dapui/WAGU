<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wagu.dto.*" %>
<%@ page import="com.wagu.dao.*" %>
<%
	MemberDAO mDAO = new MemberDAO();
	WishDAO wishDAO = new WishDAO();
	int memberID = mDAO.getIdFromEmail((String)session.getAttribute("loginEmail")) ;
%>
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
      <main class="main sub mypage">
        <h2 class="mypage_tit">내 정보</h2>
        <section class="mypage_left">
          <jsp:include page="mypageLeft.jsp"></jsp:include>
        </section>
        <section class="mypage_content">
          <h3 class="mypage_content_tit wishlist">위시리스트</h3>
          <article class="mypage_content_wishlist">
            <ul class="mypage_content_wishlist_tab">
              <li class="active">
                <img src="../images/myPage/wishlist_item_on.svg" alt="">
                액티비티
              </li>
              <li>
                <img src="../images/myPage/wishlist_hotel_off.svg" alt="">
                숙소
              </li>
            </ul>
            <div class="mypage_content_wishlist_content main_itemList">
              <ul class="mypage_content_wishlist_sec">
                <%
                ArrayList<WishDTO> myWishList = wishDAO.getMyWishList(memberID);
                for(WishDTO myList : myWishList) {
	                ArrayList<ItemDTO> wishListActivity = wishDAO.getMyWishItemList(myList.getGoodsID());
	                for(ItemDTO list : wishListActivity) {
                %>
                <li>
                  <div class="main_itemList_visual">
                    <button class="main_itemList_visual_wishList">
                      <img src="../images/common/wish_on.svg" alt="" class="icon active">
                    </button>
                    <%
	                if(list.getVideoUrl() != null) {
	                %>
                    <button class="main_itemList_visual_youtube">
                      <i class="fa-brands fa-youtube"></i>
                    </button>
                    <%
	                }
                    %>
                    <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                   	 	<%
                        if((list.getItemID()+"").substring(2,3).equals("1")) {
                        %>
                        <img src="../images/detailPage/ticket/<%=list.getImagesArr()[0]%>" alt="" class="img">
                        <%
                        } else {
                        %>
                        <img src="../images/detailPage/res/<%=list.getImagesArr()[0]%>" alt="" class="img">
                        <%
                        }
                        %>
                      </div>
                    </a>
                  </div>
                  <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
                    <%
                    if(list.getAvailable().equals("Y")) {
                    %>
                    <p class="main_itemList_info_available">
                      오늘부터 사용가능 <img src="images/common/thunder_icon.svg" alt="" class="available_icon">
                    </p>
                    <%
                    }
                    %>
                    <p class="main_itemList_info_name"><%=list.getGoodsName()%></p>
                    <%
                    if(list.getScore() != 0) {
                    %>
                    <p class="main_itemList_info_score">
                      <img src="images/common/star_icon.svg" alt="" class="score_icon"> <span><%=list.getScore()%></span> <span class="review">(이용후기 <%=list.getReviewCnt()%> 건)</span>
                    </p>
                    <%
                    }
                    if(list.getDiscountRate() != 0) {
                    %>
                    <p class="main_itemList_info_price">₩ <span><%=list.getPrice()%></span></p>
                    <%
                    }
                    %>
                    <p class="main_itemList_info_discountedPrice">
                      ₩ <span><%=list.getStringDiscountedPrice()%></span>
                        <%
	                    if(list.getDiscountRate() != 0) {
	                    %>
                        <span class="discount"><%=list.getDiscountRate()%>%</span>
                        <%
	                    }
                        %>
                    </p>
                  </a>
	                <%
	                if(list.getVideoUrl() != null) {
	                %>
	                <div class="main_itemList_youtube">
	                  <div class="dim"></div>
	                  <i class="fa-solid fa-xmark"></i>
	                  <div class="url">
	                    <iframe src="<%=list.getVideoUrl()%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	                  </div>
	                </div>
	                <%
	                }
	                %>
                </li>
                <%
                	}
                }
                if(myWishList.size() == 0) {
                %>
                <div class="mypage_content_wishlist_none">
	                <img src="../images/myPage/wishlist_noimg.svg" alt="" class="none_img">
	                <p class="none_tit">아직 위시리스트가 없습니다.</p>
	                <p class="none_txt">와그와 여행을 떠나보세요!</p>
              	</div>
                <%
                }
                %>
              </ul>
              <ul class="mypage_content_wishlist_sec">
              	<%
                for(WishDTO myList : myWishList) {
	                ArrayList<HotelDTO> wishListHotel = wishDAO.getMyWishHotelList(myList.getGoodsID());
	                for(HotelDTO list : wishListHotel) {
                %>
                <li class="swiper-slide">
                  <div class="main_itemList_visual">
                    <button class="main_itemList_visual_wishList">
                      <img src="../images/common/wish_on.svg" alt="" class="icon active">
                    </button>
                    <a href="hotelDetail.jsp?hotelID=<%=list.getHotelID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="../images/detailPage/hotel/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="hotelDetail.jsp?hotelID=<%=list.getHotelID()%>" class="main_itemList_info">
                    <p class="main_itemList_info_name"><%=list.getName()%></p>
                    <p class="main_itemList_info_location"><%=list.getLocation()%></p>
                    <p class="main_itemList_info_discountedPrice">₩ <span><%=list.getLowestPrice()%></span></p>
                  </a>
              </li>
                <%
	                }
	            }
                if(myWishList.size() == 0) {
                %>
                <div class="mypage_content_wishlist_none">
	                <img src="../images/myPage/wishlist_noimg.svg" alt="" class="none_img">
	                <p class="none_tit">아직 위시리스트가 없습니다.</p>
	                <p class="none_txt">와그와 여행을 떠나보세요!</p>
              	</div>
                <%
                }
                %>
              </ul>
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
