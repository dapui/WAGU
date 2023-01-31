<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wagu.connection.DBconnection" %>
<%@ page import="com.wagu.dto.*" %>
<%@ page import="com.wagu.dao.*" %>
<%
	BestReviewDAO bestDAO = new BestReviewDAO();
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 베스트 리뷰</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/bestReview.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.3.min.js"></script>
    <script src="../js/common.js" defer></script>
    <script src="../js/bestReview.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
        <img src="../images/common/banner_bestreview.jpg" alt="" class="bestReview_top_img">
        <section class="bestReview_area cont_size">
          <h2 class="bestReview_tit">베스트 리뷰</h2>
          <div class="bestReview_search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="search" placeholder="검색어 입력">
          </div>
          <div class="bestReview_board">
            <ul class="bestReview_board_list"> <!-- 액티비티 -->
              <%
              ArrayList<BestReviewDTO> bestReviewList = bestDAO.getBestReview();
              for(BestReviewDTO list : bestReviewList) {
              %>
              <li>
                <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="link">
                  <div class="list_img">
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
                  <div class="list_info">
                    <p class="list_info_title"><%=list.getGoodsName()%></p>
                    <p class="list_info_name"><%=list.getMemberName()%></p>
                    <p class="list_info_date"><%=list.getWriteDate()%></p>
                    <p class="list_info_score">
                      <img src="../images/common/star_icon.svg" alt="" class="score_icon">
                      <img src="../images/common/star_icon.svg" alt="" class="score_icon">
                      <img src="../images/common/star_icon.svg" alt="" class="score_icon">
                      <img src="../images/common/star_icon.svg" alt="" class="score_icon">
                      <img src="../images/common/star_icon.svg" alt="" class="score_icon"> 
                      <span>5/5</span>
                    </p>
                    <p class="list_info_cont">아주아주 만족했습니다 ㅎㅎㅎ</p>
                  </div>
                </a>
              </li>
              <%
              }
              %>
            </ul>
          </div>
        </section>
        <section class="bestReview_pagination cont_size">
          <button class="bestReview_pagination_btn pre">이전</button>
          <p class="bestReview_pagination_num">1/10</p>
          <button class="bestReview_pagination_btn next">다음</button>
          <div class="bestReview_pagination_area">
            <ul class="bestReview_pagination_list">
              <li>
                <a href="#n" class="link">1</a>
              </li>
              <li>
                <a href="#n" class="link">2</a>
              </li>
              <li>
                <a href="#n" class="link">3</a>
              </li>
              <li>
                <a href="#n" class="link">4</a>
              </li>
              <li>
                <a href="#n" class="link">5</a>
              </li>
              <li>
                <a href="#n" class="link">6</a>
              </li>
              <li>
                <a href="#n" class="link">7</a>
              </li>
              <li>
                <a href="#n" class="link">8</a>
              </li>
              <li>
                <a href="#n" class="link">9</a>
              </li>
              <li>
                <a href="#n" class="link">10</a>
              </li>
              <li>
                <a href="#n" class="link">11</a>
              </li>
              <li>
                <a href="#n" class="link">12</a>
              </li>
            </ul>
          </div>
        </section>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
     <%
	 DBconnection.getConnection().close();
	 %>
  </body>
</html>
