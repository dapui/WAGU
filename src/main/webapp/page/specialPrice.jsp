<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wagu.connection.DBconnection" %>
<%@ page import="com.wagu.dao.SpecialPriceDAO" %>
<%@ page import="com.wagu.dto.ItemDTO" %>
<%
	SpecialPriceDAO specialDAO = new SpecialPriceDAO();
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 특가상품, 와서 구경해~</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/specialPrice.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.3.min.js"></script>
    <script src="../js/common.js" defer></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
        <img src="../images/sub/specialPrice_top_img.jpeg" alt="" class="specialPrice_top_img">
        <section class="specialPrice_sec main_itemList cont_size">
          <h2 class="main_sec_tit">초특가! 놓치면 후회할 가격</h2>
          <p class="main_sec_txt">와그에서 추천하는 초특가 상품을 만나보세요</p>
          <ul class="specialPrice_items">
            <%
            ArrayList<ItemDTO> specialTicket = specialDAO.getTicketSpecialPrice();
            for(ItemDTO list : specialTicket) {
            %>
            <li>
              <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="link">
                <div class="main_itemList_visual">
                  <button class="main_itemList_visual_wishList">
                    <img src="../images/common/wish_off.svg" alt="" class="icon">
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
                  <div class="main_itemList_visual_thumbnail">
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
                  </div>
                </div>
                <div class="main_itemList_info">
                  <%
                  if(list.getAvailable().equals("Y")) {
                  %>
                  <p class="main_itemList_info_available">
                    오늘부터 사용가능 <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">
                  </p>
                  <%
                  }
                  %>
                  <p class="main_itemList_info_name"><%=list.getGoodsName()%></p>
                  <%
                  if(list.getScore() != 0) {
                  %>
                  <p class="main_itemList_info_score">
                    <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=list.getScore()%></span> <span class="review">(이용후기 <span><%=list.getReviewCnt()%></span> 건)</span>
                  </p>
                  <%
                  }
                  %>
                  <p class="main_itemList_info_price">₩ <span><%=list.getPrice()%></span></p>
                  <p class="main_itemList_info_discountedPrice">
                   ₩ <span><%=list.getStringDiscountedPrice()%></span> <span class="discount"><%=list.getDiscountRate()%>%</span>
                 </p>
                </div>
              </a>
              <div class="main_itemList_youtube">
                <div class="dim"></div>
                <i class="fa-solid fa-xmark"></i>
                <div class="url">
                  <iframe src="<%=list.getVideoUrl()%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
              </div>
            </li>
            <%
           	}
            %>
          </ul>
        </section>
        <section class="specialPrice_sec main_itemList cont_size">
          <h2 class="main_sec_tit">인기상품 1만원대로 즐기기</h2>
          <p class="main_sec_txt">리뷰가 인정한 상품 지금 확인하세요</p>
          <ul class="specialPrice_items">
            <%
            ArrayList<ItemDTO> ticket10000 = specialDAO.getTicket10000();
            for(ItemDTO list : ticket10000) {
            %>
            <li>
              <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="link">
                <div class="main_itemList_visual">
                  <button class="main_itemList_visual_wishList">
                    <img src="../images/common/wish_off.svg" alt="" class="icon">
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
                  <div class="main_itemList_visual_thumbnail">
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
                  </div>
                </div>
                <div class="main_itemList_info">
                  <%
                  if(list.getAvailable().equals("Y")) {
                  %>
                  <p class="main_itemList_info_available">
                    오늘부터 사용가능 <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">
                  </p>
                  <%
                  }
                  %>
                  <p class="main_itemList_info_name"><%=list.getGoodsName()%></p>
                  <p class="main_itemList_info_score">
                    <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=list.getScore()%></span> <span class="review">(이용후기 <span><%=list.getReviewCnt()%></span> 건)</span>
                  </p>
                  <p class="main_itemList_info_price">₩ <span><%=list.getPrice()%></span></p>
                  <p class="main_itemList_info_discountedPrice">
                   ₩ <span><%=list.getStringDiscountedPrice()%></span>
                   <span class="discount"><%=list.getDiscountRate()%>%</span>
                 </p>
                </div>
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
            %>
          </ul>
        </section>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
