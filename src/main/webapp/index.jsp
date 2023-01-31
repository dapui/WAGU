<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wagu.connection.DBconnection" %>
<%@ page import="com.wagu.dto.*" %>
<%@ page import="com.wagu.dao.*" %>
<%
	CommonDAO comDAO = new CommonDAO();
	MemberDAO mDAO = new MemberDAO();
	MainDAO mainDAO = new MainDAO();
	SearchDAO searchDAO = new SearchDAO();
	WishDAO wishDAO = new WishDAO();
	
	int memberID = mDAO.getIdFromEmail((String)session.getAttribute("loginEmail"));
	String s2;
	String s;
	if(session.getAttribute("loginEmail")==null){
		s="display:none";
		s2="display:flex";
	
	}else {
		s="display:flex";
		s2="display:none";
	}
%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 당신이 찾는 모든 여행, 와서 구경해~</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="js/jquery-3.6.3.min.js"></script>
    <script src="js/common.js" defer></script>
    <script src="js/index.js" defer></script>
    <script type="text/javascript">
   	// 검색창 Ajax
   	function searchFunction(){
   		let searchInput = document.getElementById('mainSearchItem').value;
		$.ajax({
			type: 'post',
			url: 'SearchMainServlet',
			data: {
				'search' : searchInput,
			},	
			datatype: 'json',
			success: function(data) {
				// 지역 검색
				$('.main_sec01_search_item_area > .city').text('');
				if(data.searchCity.length !== 0) {
					var cityList = '';
					cityList += '<p class="main_sec01_search_item_category">지역</p>'							;
					cityList += '<ul class="main_sec01_search_item_list city">'								;
					for(var i=0; i<data.searchCity.length; i++){
						var city = data.searchCity[i].city;
						cityList += '<li>'																	;
						cityList += '  <a href="page/ticket.jsp?city='+city+'" class="link">'+city+'</a>'	;
						cityList += '</li>'																	;
					} 
					cityList += '</ul>'																		;
					$('.main_sec01_search_item_area > .city').append(cityList);	
				}
				
				// 액티비티 검색
				$('.main_sec01_search_item_area > .activity').text('');
				if(data.searchItem.length !== 0) {
					var activityList = '';
					activityList += '<p class="main_sec01_search_item_category">인기 액티비티</p>'						;
					activityList += '<ul class="main_sec01_search_item_list activity">'								;
					for(var i=0; i<data.searchItem.length; i++){
						var itemID = data.searchItem[i].itemID;
						var itemName = data.searchItem[i].itemName;
						activityList += '<li>'																		;
						activityList += '  <a href="activity.jsp?itemID='+itemID+'" class="link">'+itemName+'</a>'	;
						activityList += '</li>'																		;
					}
					activityList += '</ul>'																			;
					$('.main_sec01_search_item_area > .activity').append(activityList);
				}
				
				
				// 레스토랑 검색
				$('.main_sec01_search_item_area > .restaurant').text('');
				if(data.searchRestaurant.length !== 0) {
					var restaurantList = '';
					restaurantList += '<p class="main_sec01_search_item_category">인기레스토랑</p>';
					restaurantList += '<ul class="main_sec01_search_item_list restaurant">';
					for(var i=0; i<data.searchRestaurant.length; i++){
						var itemID = data.searchRestaurant[i].itemID;
						var itemName = data.searchRestaurant[i].itemName;
						restaurantList += '<li>'																		;
						restaurantList += '  <a href="activity.jsp?itemID='+itemID+'" class="link">'+itemName+'</a>'	;
						restaurantList += '</li>'																		;
					}
					restaurantList += '</ul>';
					$('.main_sec01_search_item_area > .restaurant').append(restaurantList);
				}
			},
			error: function(request, status, error) {
				alert('code:'+request.status+'\n'
					 +'message:'+request.responseText+'\n'
					 +'error:'+error);
			}
		});
    }	// searchFunction() end
    
    var timeout = null;
   	function delaySearchFunction() {
		clearTimeout(timeout);
   		
   		timeout = setTimeout(function() {
   			searchFunction();
   		}, 500)
    }
    
    window.onload = function() {
    	searchFunction();
    } 
    </script>
  </head>
  <body>
    <div class="wrap">
      <header class="header mainPage">
        <div class="header_left">
          <a href="index.jsp" class="header_logo"></a>
          <p class="header_area_tit">다른 도시 보기 <i class="fa-solid fa-chevron-down"></i></p>
          <div class="header_area">
            <a href="#n" class="btn_close">
              <img src="images/common/close_icon.svg" alt="close">
            </a>
            <nav class="header_area_menu">
              <p class="header_area_menu_tit">국내 도시의 신나는 <span class="underline">액티비티</span>를 발견해 보세요.</p>
              <ul class="header_area_menu_list">
                <%
                ArrayList<CityDTO> cityList = comDAO.getCityMenu();
                for(CityDTO list : cityList) {
                %>
                <li>
                  <a href="page/ticket.jsp?city=<%=list.getCity()%>" class="link">
                    <span class="list_img">
                      <img src="images/main/<%=list.getImagesArr()[1]%>" alt="" class="img">
                    </span>
                    <span class="list_city"><%=list.getCity()%></span>
                  </a>
                </li>
                <%
                }
                %>
              </ul>
            </nav>
          </div>
        </div>
        <div class="header_right">
          <div class="header_user_info">
            <a href="page/Login.jsp" class="login" style="<%=s2%>">
		  		<span style="font-size:14px; font-weight:400; margin-right:20px; color:#fff;">로그인</span>
		  	</a>
		    <i class="fa-solid fa-magnifying-glass"></i>
		    <p class="header_user_profile" style="<%=s%>">
			    <span class="img">
			    	<img src ="images/common/<%=mDAO.getImageFromEmail((String)session.getAttribute("loginEmail")) %>">
			    </span>
			    <span class="name">
			    	<%=mDAO.getNameFromEmail((String)session.getAttribute("loginEmail")) %>
			    </span>
		    </p>
            <ul class="header_user_list">
              <li>
                <a href="page/mypageProfile.jsp" class="link">
                  <span><i class="fa-solid fa-user"></i></span>
                  내정보
              </a>
              </li>
              <li>
                <a href="page/mypageActivity.jsp" class="link">
                  <span><i class="fa-solid fa-clipboard-list"></i></span>
                  예약 및 구매 내역
                </a>
              </li>
              <li>
                <a href="page/mypageCoupon.jsp" class="link">
                  <span><i class="fa-solid fa-ticket"></i></span>
                  쿠폰
                </a>
              </li>
              <li>
                <a href="page/mypageReview.jsp" class="link">
                  <span><i class="fa-solid fa-comment-dots"></i></span>
                  이용후기
                </a>
              </li>
              <li>
                <a href="page/mypageBasket.jsp" class="link">
                  <span><i class="fa-solid fa-basket-shopping"></i></span>
                  장바구니
                </a>
              </li>
              <li>
                <a href="page/mypageWishlist.jsp" class="link">
                  <span><i class="fa-solid fa-heart"></i></span>
                  위시리스트
                </a>
              </li>
              <li>
                <a href="page/Logout.jsp" class="link logout">로그아웃</a>
              </li>
            </ul>
          </div>
        </div>
        <aside class="scroll_top">
          <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-arrow-up-circle" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z"/>
          </svg>
          <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z"/>
          </svg>
        </aside>
      </header>
      <main class="main mainPage">
        <section class="main_sec01">
          <div class="main_sec01_banner mySwiper">
            <ul class="main_sec01_banner_list swiper-wrapper">
              <li class="swiper-slide">
                <span class="animation"></span>
              </li>
              <li class="swiper-slide">
                <span class="animation"></span>
              </li>
            </ul>
          </div>
          <div class="swiper-pagination"></div>
          <div class="main_sec01_search">
            <p class="main_sec01_search_tit">경험해보세요. 더 많은 것들을.</p>
            <div class="main_sec01_search_item">
              <div class="main_sec01_search_input">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="search" id="mainSearchItem" onkeyup="delaySearchFunction();" placeholder="액티비티 또는 지역명으로 검색하세요">
              </div>
              <div class="main_sec01_search_item_area">
          		<div class="city">
          			<!-- 검색창 [지역] Ajax data -->
          		</div>
                <div class="activity">
	       			<!-- 검색창 [액티비티] Ajax data -->
                </div>
                <div class="restaurant">
	                <!-- 검색창 [레스토랑] Ajax data -->
                </div>
              </div>
            </div>
          </div>
        </section>
        <section class="main_sec02 cont_size">
          <ul class="main_sec02_quick">
            <li>
              <a href="#n" class="link ticket">
                <img src="images/main/quick_ticket.png" alt="" class="icon">
                <span class="txt">입장권</span>
              </a>
            </li>
            <li>
              <a href="page/restaurant.jsp" class="link">
                <img src="images/main/quick_restaurant.png" alt="" class="icon">
                <span class="txt">레스토랑</span>
              </a>
            </li>
            <li>
              <a href="page/hotelMain.jsp" class="link">
                <img src="images/main/quick_hotel.png" alt="" class="icon">
                <span class="txt">호텔</span>
              </a>
            </li>
            <li>
              <a href="page/korailMain.jsp" class="link">
                <img src="images/main/quick_korail.png" alt="" class="icon">
                <span class="txt">코레일</span>
              </a>
            </li>
          </ul>
        </section>
        <section class="main_sec03 cont_size">
          <h2 class="main_sec_tit">인기 여행지</h2>
          <p class="main_sec_txt">올해 가장 핫한 여행지를 추천해요</p>
          <div class="main_sec03_quick mySwiper">
            <ul class="main_sec03_quick_list swiper-wrapper">
              <%
		      for(CityDTO list : cityList) {
		      %>
              <li class="swiper-slide">
                <a href="page/ticket.jsp?city=<%=list.getCity()%>" class="link">
                  <img src="images/main/<%=list.getImagesArr()[0]%>" alt="" class="img">
                  <span class="txt"><%=list.getCity()%></span>
                </a>
              </li>
              <%
		      }
              %>
            </ul>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </section>
        <section class="main_sec04 ad_bannerList_area">
          <div class="ad_bannerList mySwiper">
            <ul class="ad_bannerList_swiper swiper-wrapper">
              <li class="swiper-slide">
                <a href="page/bestReview.jsp" class="link">
                  <img src="images/common/banner_bestreview.jpg" alt="" class="img">
                </a>
              </li>
              <li class="swiper-slide">
                <a href="page/specialPrice.jsp" class="link">
                  <img src="images/common/banner_specialprice.jpg" alt="" class="img">
                </a>
              </li>
            </ul>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-pagination"></div>
        </section>
        <section class="main_sec05 cont_size">
          <h2 class="main_sec_tit">이런 여행은 어때요?</h2>
          <p class="main_sec_txt">와그 에디터가 추천하는 여행을 만나보세요</p>
          <div class="main_sec05_recommend mySwiper">
            <ul class="main_sec05_recommend_list swiper-wrapper">
            <%
            ArrayList<CityDTO> recommendList = comDAO.getCityMenu();
      		
      		int[] randomArr = new int[3];
      		for(int i=0; i < 3; i++) {
      			int random = (int)(Math.random() * 8);
      			// 중복제거
      			boolean found = false;	// true이면 같은 값을 찾은 것.
      			for(int j=0; j<i; j++) {
      				if(randomArr[j] == random) {
      					found = true;
      				}
      			}
      			if(!found) {
      				randomArr[i] = random;
      			} else {	// found가 true라면 ---> 해당 i에 대한 '작업'을 한번 더 함. 
      				i--;
      				continue;
      			}
		      %>
              <li class="swiper-slide">
                <a href="page/ticket.jsp?city=<%=recommendList.get(random).getCity()%>" class="link">
                  <p class="img_area">
                    <img src="images/main/<%=recommendList.get(random).getImagesArr()[1]%>" alt="" class="img">
                  </p>
                  <p class="info">
                    <span class="info_keyword"><%=recommendList.get(random).getKeyword()%></span>
                    <span class="info_title"><%=recommendList.get(random).getTitle()%></span>
                    <span class="info_content"><%=recommendList.get(random).getContent()%></span>
                  </p>
                </a>
              </li>
              <%
		      }
              %>
            </ul>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </section>
        <section class="main_sec06 main_itemList">
          <h2 class="main_sec_tit">제주도에서 뭐하지?</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<ItemDTO> jejuList = mainDAO.getJejuList();
              for(ItemDTO list : jejuList) {
              %>
              <li class="swiper-slide">
                  <div class="main_itemList_visual">
                    <button class="main_itemList_visual_wishList">
                      <%
                  	  if(!wishDAO.checkMyWishList(memberID, list.getItemID())) {
                  	  %>
                      <img src="images/common/wish_off.svg" alt="" class="icon">
                      <%
                  	  } else {
                      %>
                      <img src="images/common/wish_on.svg" alt="" class="icon active">
                      <%
                  	  }
                      %>
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
                    <a href="page/activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="images/detailPage/ticket/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="page/activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
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
                    <p class="main_itemList_info_score">
                      <img src="images/common/star_icon.svg" alt="" class="score_icon"> <span><%=list.getScore()%></span> <span class="review">(이용후기 <span><%=list.getReviewCnt()%></span> 건)</span>
                    </p>
                    <%
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
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </section>
        <section class="main_sec07 main_itemList">
          <h2 class="main_sec_tit">액티비티 & 투어 베스트셀러</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<ItemDTO> ticketList = mainDAO.getTicketList();
              for(ItemDTO list : ticketList) {
              %>
              <li class="swiper-slide">
                  <div class="main_itemList_visual">
                    <button class="main_itemList_visual_wishList">
                  	  <%
                  	  if(!wishDAO.checkMyWishList(memberID, list.getItemID())) {
                  	  %>
                      <img src="images/common/wish_off.svg" alt="" class="icon">
                      <%
                  	  } else {
                      %>
                      <img src="images/common/wish_on.svg" alt="" class="icon active">
                      <%
                  	  }
                      %>
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
                    <a href="page/activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="images/detailPage/ticket/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="page/activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
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
              %>
            </ul>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </section>
        <section class="main_sec08 main_itemList">
          <h2 class="main_sec_tit">인기숙소 & 호캉스</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<HotelDTO> hotelList = mainDAO.getHotelList();
              for(HotelDTO list : hotelList) {
              %>
              <li class="swiper-slide">
                  <div class="main_itemList_visual">
                    <button class="main_itemList_visual_wishList">
                      <%
                  	  if(!wishDAO.checkMyWishList(memberID, list.getHotelID())) {
                  	  %>
                      <img src="images/common/wish_off.svg" alt="" class="icon">
                      <%
                  	  } else {
                      %>
                      <img src="images/common/wish_on.svg" alt="" class="icon active">
                      <%
                  	  }
                      %>
                    </button>
                    <a href="page/hotelDetail.jsp?hotelID=<%=list.getHotelID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="images/detailPage/hotel/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="page/hotelDetail.jsp?hotelID=<%=list.getHotelID()%>" class="main_itemList_info">
                    <p class="main_itemList_info_name"><%=list.getName()%></p>
                    <p class="main_itemList_info_location"><%=list.getLocation()%></p>
                    <p class="main_itemList_info_discountedPrice">₩ <span><%=list.getLowestPrice()%></span></p>
                  </a>
              </li>
              <%
              }
              %>
            </ul>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </section>
        <section class="main_sec09 main_itemList">
          <h2 class="main_sec_tit">인기 레스토랑</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<ItemDTO> restaurantList = mainDAO.getRestaurantList();
              for(ItemDTO list : restaurantList) {
              %>
              <li class="swiper-slide">
                  <div class="main_itemList_visual">
                    <button class="main_itemList_visual_wishList">
                      <%
                  	  if(!wishDAO.checkMyWishList(memberID, list.getItemID())) {
                  	  %>
                      <img src="images/common/wish_off.svg" alt="" class="icon">
                      <%
                  	  } else {
                      %>
                      <img src="images/common/wish_on.svg" alt="" class="icon active">
                      <%
                  	  }
                      %>
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
                    <a href="page/activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
                      <div class="thumbnail_cover">
                        <img src="images/detailPage/res/<%=list.getImagesArr()[0]%>" alt="" class="img">
                      </div>
                    </a>
                  </div>
                  <a href="page/activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">
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
                      <img src="images/common/star_icon.svg" alt="" class="score_icon"> <span><%=list.getScore()%></span> <span class="review">(이용후기 <span><%=list.getReviewCnt()%></span> 건)</span>
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
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </section>
      </main>
      <footer class="footer">
        <div class="footer_content">
          <div class="footer_content_page">
            <ul class="footer_content_page_list">
              <li class="footer_tit">고객센터</li>
              <li>
                <a href="page/faq.jsp" class="link">FAQ</a>
              </li>
              <li>
                <a href="page/agreement.jsp" class="link">이용약관</a>
              </li>
              <li>
                <a href="page/privacy.jsp" class="link">개인정보 처리방침</a>
              </li>
            </ul>
            <ul class="footer_content_page_list">
              <li class="footer_tit">회사소개</li>
              <li>
                <a href="page/aboutus.jsp" class="link">About us</a>
              </li>
            </ul>
            <ul class="footer_content_page_list">
              <li class="footer_tit">파트너쉽</li>
              <li>
                <a href="page/contactus.jsp" class="link">Contact us</a>
              </li>
            </ul>
          </div>
          <div class="footer_content_payment">
            <p class="footer_tit">결제수단</p>
            <img src="images/main/pay_icon01.svg" alt="" class="icon">
            <img src="images/main/pay_icon02.svg" alt="" class="icon">
            <img src="images/main/pay_icon03.svg" alt="" class="icon">
          </div>
          <div class="footer_content_sns">
            <p class="footer_tit">Follow us</p>
            <a href="https://www.facebook.com/waugkorea" target="_blank" class="link">
              <img src="images/main/sns_facebook.svg" alt="" class="icon">
            </a>
            <a href="https://www.instagram.com/waug_official/" target="_blank" class="link">
              <img src="images/main/sns_instagram.svg" alt="" class="icon">
            </a>
            <a href="https://post.naver.com/ravetrip" target="_blank" class="link">
              <img src="images/main/sns_naverpost.svg" alt="" class="icon">
            </a>
            <a href="https://blog.waug.com/" target="_blank" class="link">
              <img src="images/main/sns_blog.svg" alt="" class="icon">
            </a>
          </div>
        </div>
        <div class="footer_address">
          <address>
            Republic of Korea : 2F, 36, Gyeonghuigung-gil, Jongno-gu, Seoul, Republic of Korea<br>
            Customer Support Center : +82 ) 070-4353-5959<br>
            Weekday AM 10:00 - PM 06:00 (GMT+9)<br>
            Weekends & Public Holidays AM 10:00 - PM 05:00 (GMT+9)<br>
            help@waug.com<br>
            Singapore : 10 Anson Road, #34-10 International Plaza, Singapore<br>
            WAGU Inc. is a sales broker, we are not responsible for any product information and transactions.
          </address>
          <address>
            <span>WAGU Team.<br>
            Oh, Dahyun | Jeong, Yukyung | Jo, Yeojeong | Kim, Daeun</span> <br>
            Business Registration Number, 113-86-94943<br>
            Mail-order Distributor Registration Number, 2020-서울종로-1199<br>
            South Korea Travel Agent Licence : 2020 - 000029<br>
            Singapore Travel Agent Licence : 03226<br>
            © 2022 WAGU Project. All Rights Reserved.
          </address>
        </div>
      </footer>
    </div>
    <%
    DBconnection.close();
    %>
  </body>
</html>
