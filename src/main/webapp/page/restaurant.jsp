<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wagu.connection.DBconnection" %>
<%@ page import="com.wagu.dto.*" %>
<%@ page import="com.wagu.dao.*" %>
<%
	RestaurantDAO resDAO = new RestaurantDAO();
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 레스토랑 & 다이닝</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/subMain.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/jquery-3.6.3.min.js"></script>
    <script src="../js/common.js" type="text/javascript" defer></script>
    <script src="../js/subMain.js"></script>
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
        <section class="itemPage_top restaurant">
          <div class="itemPage_content">
            <h2 class="itemPage_top_tit">레스토랑 & 다이닝</h2>
          </div>
        </section>
        <section class="ad_bannerList_area">
          <div class="ad_bannerList mySwiper">
            <ul class="ad_bannerList_swiper swiper-wrapper">
              <li class="swiper-slide">
                <a href="bestReview.html" class="link">
                  <img src="../images/common/banner_bestreview.jpg" alt="" class="img">
                </a>
              </li>
              <li class="swiper-slide">
                <a href="specialPrice.html" class="link">
                  <img src="../images/common/banner_specialprice.jpg" alt="" class="img">
                </a>
              </li>
            </ul>
          </div>
          <!-- Add Arrows -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <!-- Add pagination -->
          <div class="swiper-pagination"></div>
          <!-- Initialize Swiper -->
          <script>
            var swiper = new Swiper('.ad_bannerList_area .mySwiper', {
              autoplay: {
              delay: 4000,
              disableOnInteraction: false,
              },
              speed: 2000,
              slidesPerView: 1,
              spaceBetween: 20,
              slidesPerGroup: 5,
              navigation: {
                nextEl: '.ad_bannerList_area .swiper-button-next',
                prevEl: '.ad_bannerList_area .swiper-button-prev',
              },
              pagination: {
                el: ".ad_bannerList_area .swiper-pagination",
              },
            });
          </script>
        </section>
        <section class="res_sec01 main_itemList">
          <h2 class="main_sec_tit">고객 반응이 가장 좋은</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
			  <%
              ArrayList<ItemDTO> hotRestaurant = resDAO.getHotRestaurantList();
              for(ItemDTO list : hotRestaurant) {
              %>
              <li class="swiper-slide">
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
                    <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="../images/detailPage/res/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
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
              %>              
            </ul>
          </div>
          <!-- Add Arrows -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <!-- Initialize Swiper -->
          <script>
            var swiper = new Swiper('.res_sec01 .mySwiper', {
              slidesPerView: 5,
              spaceBetween: 10,
              navigation: {
                nextEl: '.res_sec01 .swiper-button-next',
                prevEl: '.res_sec01 .swiper-button-prev',
              },
              breakpoints: {
                1200: {
                  slidesPerView: 5,
                  spaceBetween: 20,
                },
                768: {
                  slidesPerView: 3,
                  spaceBetween: 20,
                },
                500: {
                  slidesPerView: 2,
                  spaceBetween: 20,
                },
            }
            });
          </script>
        </section>
        <section class="res_sec02 main_itemList">
          <h2 class="main_sec_tit">럭셔리 호텔에서</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<ItemDTO> hotelRestaurant = resDAO.getHotelRestaurantList();
              for(ItemDTO list : hotelRestaurant) {
              %>
              <li class="swiper-slide">
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
                    <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="../images/detailPage/res/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
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
              %>  
            </ul>
          </div>
          <!-- Add Arrows -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <!-- Initialize Swiper -->
          <script>
            var swiper = new Swiper('.res_sec02 .mySwiper', {
              slidesPerView: 5,
              spaceBetween: 10,
              navigation: {
                nextEl: '.res_sec02 .swiper-button-next',
                prevEl: '.res_sec02 .swiper-button-prev',
              },
              breakpoints: {
                1200: {
                  slidesPerView: 5,
                  spaceBetween: 20,
                },
                768: {
                  slidesPerView: 3,
                  spaceBetween: 20,
                },
                500: {
                  slidesPerView: 2,
                  spaceBetween: 20,
                },
            }
            });
          </script>
        </section>
        <section class="res_sec03 main_itemList">
          <h2 class="main_sec_tit">제주의 맛</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<ItemDTO> jejuRestaurant = resDAO.getJejuRestaurantList();
              for(ItemDTO list : jejuRestaurant) {
              %>
              <li class="swiper-slide">
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
                    <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="../images/detailPage/res/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
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
              %>
            </ul>
          </div>
          <!-- Add Arrows -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <!-- Initialize Swiper -->
          <script>
            var swiper = new Swiper('.res_sec03 .mySwiper', {
              slidesPerView: 5,
              spaceBetween: 10,
              navigation: {
                nextEl: '.res_sec03 .swiper-button-next',
                prevEl: '.res_sec03 .swiper-button-prev',
              },
              breakpoints: {
                1200: {
                  slidesPerView: 5,
                  spaceBetween: 20,
                },
                768: {
                  slidesPerView: 3,
                  spaceBetween: 20,
                },
                500: {
                  slidesPerView: 2,
                  spaceBetween: 20,
                },
            }
            });
          </script>
        </section>
        <section class="res_sec04 main_itemList">
          <h2 class="main_sec_tit">부산에서 뭐먹지?</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<ItemDTO> busanRestaurant = resDAO.getBusanRestaurantList();
              for(ItemDTO list : busanRestaurant) {
              %>
              <li class="swiper-slide">
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
                    <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="../images/detailPage/res/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
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
              %>
            </ul>
          </div>
          <!-- Add Arrows -->
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <!-- Initialize Swiper -->
          <script>
            var swiper = new Swiper('.res_sec04 .mySwiper', {
              slidesPerView: 5,
              spaceBetween: 10,
              navigation: {
                nextEl: '.res_sec04 .swiper-button-next',
                prevEl: '.res_sec04 .swiper-button-prev',
              },
              breakpoints: {
                1200: {
                  slidesPerView: 5,
                  spaceBetween: 20,
                },
                768: {
                  slidesPerView: 3,
                  spaceBetween: 20,
                },
                500: {
                  slidesPerView: 2,
                  spaceBetween: 20,
                },
            }
            });
          </script>
        </section>
        <section id="category" class="itemPage_sec05 itemPage_category">
          <h2 class="itemPage_category_tit">레스토랑 & 다이닝 (<span>215</span>)</h2>
          <div class="itemPage_category_select">
            <select name="category" id="category_select">
              <option value="추천순" selected>WAGU 추천순</option>
              <option value="별점순">별점순</option>
              <option value="낮은가격순">낮은 가격순</option>
              <option value="높은가격순">높은 가격순</option>
            </select>
          </div>
          <div class="itemPage_category_area">
            <div class="itemPage_category_select_form">
              <ul class="itemPage_category_select_list">
                <li class="w_100">
                  <h3 class="select_box_tit">지역</h3>
                  <ul class="select_box_item">
                    <li>
                      <label for="seoul">
                        <input type="checkbox" id="seoul" name="서울">
                        서울
                      </label>
                    </li>
                    <li>
                      <label for="gyeonggi">
                        <input type="checkbox" id="gyeonggi" name="경기도">
                        경기도
                      </label>
                    </li>
                    <li>
                      <label for="incheon">
                        <input type="checkbox" id="incheon" name="인천">
                        인천
                      </label>
                    </li>
                    <li>
                      <label for="chung">
                        <input type="checkbox" id="chung" name="충청도">
                        충청도
                      </label>
                    </li>
                    <li>
                      <label for="kw">
                        <input type="checkbox" id="kw" name="강원도">
                        강원도
                      </label>
                    </li>
                    <li>
                      <label for="ks">
                        <input type="checkbox" id="ks" name="경상도">
                        경상도
                      </label>
                    </li>
                    <li>
                      <label for="jeolla">
                        <input type="checkbox" id="jeolla" name="전라도">
                        전라도
                      </label>
                    </li>
                    <li>
                      <label for="jeju">
                        <input type="checkbox" id="jeju" name="제주도">
                        제주도
                      </label>
                    </li>
                  </ul>
                </li>
                <li class="reset">
                  <button type="button">초기화</button>
                </li>
              </ul>
            </div>
            <div class="itemPage_category_list">
              <ul class="itemPage_category_list_items">
              <%
              ArrayList<ItemDTO> categoryRestaurant = resDAO.getCategoryRestaurantList();
              for(ItemDTO list : categoryRestaurant) {
              %>
              <li class="swiper-slide">
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
                    <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="../images/detailPage/res/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
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
              %>
              </ul>
            </div>
          </div>
        </section>

      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
