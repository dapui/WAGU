<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wagu.connection.DBconnection" %>
<%@ page import="com.wagu.dto.*" %>
<%@ page import="com.wagu.dao.*" %>
<%
	MemberDAO mDAO = new MemberDAO();
	int memberID = mDAO.getIdFromEmail((String)session.getAttribute("loginEmail")) ;
	String city = "";
	try {
		city = request.getParameter("city");
	} catch(NumberFormatException e) {
		e.printStackTrace();
	}
	
	CommonDAO comDAO = new CommonDAO();
	TicketDAO ticketDAO = new TicketDAO();
	SearchDAO searchDAO = new SearchDAO();
	WishDAO wishDAO = new WishDAO();
	WeatherDTO weather = ticketDAO.getWeather(city);
	CityBackgroundDTO cityBackground = ticketDAO.getCityBackground(city);
	
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 액티비티</title>
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
    <script src="../js/subMain.js" type="text/javascript" defer></script>
    <style>
    .itemPage_top {
    	background: url(../images/main/<%=cityBackground.getImagesArr()[1]%>) no-repeat center;
    }
    </style>
    <script type="text/javascript">
   	// 검색창 Ajax
   	function searchFunction(){
   		let searchInput = document.getElementById('searchItem').value;
		$.ajax({
			type: 'post',
			url: '../SearchActivityServlet',
			data: {
				'city' : '<%=city%>', 
				'search' : searchInput,
			},	
			datatype: 'json',
			success: function(data) {
				$('.itemPage_search_item_list').text('');
				var list = '';
				for(var i=0; i<data.searchItem.length; i++){
					var itemID = data.searchItem[i].itemID;
					var itemName = data.searchItem[i].itemName;
	                list += '<li>'																		;
	                list += '  <a href="activity.jsp?itemID='+itemID+'" class="link">'+itemName+'</a>'	;
	                list += '</li>'																		;

				} 
				$('.itemPage_search_item_list').append(list);
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
    // 검색창 Ajax END
    
    // 카테고리(필터) Ajax
    $(function () {
	  $(document).scroll(function() {
	    var maxHeight = $(document).height();
	    var currentScroll = $(window).scrollTop() + $(window).height();
	
	    if (maxHeight <= currentScroll + 100) {
	      $.ajax({
	    	type: 'post',
	    	url: '../CategoryServlet',
	    	data: {
	    		'order' : '',		
				'available' : '',
				'price' : ,
				'category' : ''
			},	
			datatype: 'json',
	        success: function(data) {
	        	<%
                ArrayList<ItemDTO> filterList = ticketDAO.getCategoryList(city);
                for(ItemDTO list : filterList) {
                %>
	        	var itemList = '';
	        	itemList += '<li>';
	        	itemList += '  <div class="main_itemList_visual">';
	        	itemList += '    <button class="main_itemList_visual_wishList" onclick="wishListFunction();">';
                <%
           	    if(!wishDAO.checkMyWishList(memberID, list.getItemID())) {
           	    %>
           	 	itemList += '		<img src="../images/common/wish_off.svg" alt="" class="icon">';
                <%
           	    } else {
                %>
                itemList += '       <img src="../images/common/wish_on.svg" alt="" class="icon active">';
	            <%
	            }
	            %>
	            itemList += '    </button>';
                <%
             	if(list.getVideoUrl() != null) {
             	%>
             	itemList += '    <button class="main_itemList_visual_youtube">';
             	itemList += '      <i class="fa-brands fa-youtube"></i>';
             	itemList += '    </button>';
                <%
             	}
                %>
                itemList += '    <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">';
                itemList += '  	   <div class="thumbnail_cover">';
                <%
                if((list.getItemID()+"").substring(2,3).equals("1")) {
                %>
                itemList += '        <img src="../images/detailPage/ticket/<%=list.getImagesArr()[0]%>" alt="" class="img">';
                <%
                } else {
                %>
                itemList += '        <img src="../images/detailPage/res/<%=list.getImagesArr()[0]%>" alt="" class="img">';
                <%
                }
                %>
                itemList += '      </div>';
                itemList += '    </a>';
                itemList += '  </div>';
                itemList += '  <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_info">';
                <%
                if(list.getAvailable().equals("Y")) {
                %>
                itemList += '    <p class="main_itemList_info_available">';
                itemList += '      오늘부터 사용가능 <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">';
                itemList += '    </p>';
                <%
                }
                %>
                itemList += '    <p class="main_itemList_info_name"><%=list.getGoodsName()%></p>';
                <%
                if(list.getScore() != 0) {
                %>
                itemList += '    <p class="main_itemList_info_score">';
                itemList += '      <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=list.getScore()%></span> <span class="review">(이용후기 <span><%=list.getReviewCnt()%></span> 건)</span>';
                itemList += '    </p>';
                <%
                }
                if(list.getDiscountRate() != 0) {
                %>
                itemList += '    <p class="main_itemList_info_price">₩ <span><%=list.getPrice()%></span></p>';
                <%
                }
                %>
                itemList += '    <p class="main_itemList_info_discountedPrice">';
                itemList += '      ₩ <span><%=list.getStringDiscountedPrice()%></span>';
                <%
            	if(list.getDiscountRate() != 0) {
            	%>
            	itemList += '        <span class="discount"><%=list.getDiscountRate()%>%</span>';
                <%
            	}
                %>
                itemList += '    </p>';
                itemList += '  </a>';
                <%
                if(list.getVideoUrl() != null) {
                %>
                itemList += '  <div class="main_itemList_youtube">';
                itemList += '    <div class="dim"></div>';
                itemList += '  	 <i class="fa-solid fa-xmark"></i>';
                itemList += '    <div class="url">';
                itemList += '      <iframe src="<%=list.getVideoUrl()%>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
                itemList += '    </div>';
                itemList += '  </div>';
                <%
                }
                %>
                itemList += '</li>';'
                <%
                }
                %>
                $('.itemPage_category_list_items').append(itemList);
	        },
	        error: function(request, status, error) {
				alert('code:'+request.status+'\n'
					 +'message:'+request.responseText+'\n'
					 +'error:'+error);
			}
	      });
	    }
	  });
	});	
    // 카테고리(필터) Ajax END
    
    </script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
        <section class="itemPage_top">
          <div class="itemPage_content">
            <h2 class="itemPage_top_tit"><%=city%></h2>
            <div class="itemPage_top_weather">
              <div class="itemPage_top_weather_area">
                <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-clouds icon" viewBox="0 0 16 16">
                  <path d="M16 7.5a2.5 2.5 0 0 1-1.456 2.272 3.513 3.513 0 0 0-.65-.824 1.5 1.5 0 0 0-.789-2.896.5.5 0 0 1-.627-.421 3 3 0 0 0-5.22-1.625 5.587 5.587 0 0 0-1.276.088 4.002 4.002 0 0 1 7.392.91A2.5 2.5 0 0 1 16 7.5z"/>
                  <path d="M7 5a4.5 4.5 0 0 1 4.473 4h.027a2.5 2.5 0 0 1 0 5H3a3 3 0 0 1-.247-5.99A4.502 4.502 0 0 1 7 5zm3.5 4.5a3.5 3.5 0 0 0-6.89-.873.5.5 0 0 1-.51.375A2 2 0 1 0 3 13h8.5a1.5 1.5 0 1 0-.376-2.953.5.5 0 0 1-.624-.492V9.5z"/>
                </svg>
                <p class="temperature"><%=Math.round(weather.getTemp())%>°C</p>
              </div>
            </div>
          </div>
          <div class="itemPage_search">
            <div class="itemPage_search_item">
              <div class="itemPage_search_input">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="search" id="searchItem" onkeyup="delaySearchFunction();" placeholder="액티비티를 검색하세요">
              </div>
              <div class="itemPage_search_item_area"> 
                <p class="itemPage_search_item_category">인기 액티비티</p>
                <ul class="itemPage_search_item_list" id="searchItemList">
    				<!-- Ajax data -->
                </ul>
              </div>
            </div>
          </div>
        </section>
        <section class="itemPage_quick cont_size">
          <ul class="itemPage_quick_list">
            <li>
              <a href="#category" class="link">
                <img src="../images/main/quick_ticket.png" alt="" class="icon">
                <span class="txt">액티비티</span>
              </a>
            </li>
            <li>
              <a href="#category" class="link">
                <img src="../images/main/quick_spa.png" alt="" class="icon">
                <span class="txt">스파 & 마사지</span>
              </a>
            </li>
            <li>
              <a href="#category" class="link">
                <img src="../images/main/quick_class.png" alt="" class="icon">
                <span class="txt">원데이클래스</span>
              </a>
            </li>
            <li>
              <a href="#category" class="link">
                <img src="../images/main/quick_tour.png" alt="" class="icon">
                <span class="txt">투어</span>
              </a>
            </li>
            <li>
              <a href="#category" class="link">
                <img src="../images/main/quick_restaurant.png" alt="" class="icon">
                <span class="txt">레스토랑</span>
              </a>
            </li>
          </ul>
          <a href="#category" class="itemPage_quick_category">전체상품보기</a>
        </section>
        <section class="ad_bannerList_area">
          <div class="ad_bannerList mySwiper">
            <ul class="ad_bannerList_swiper swiper-wrapper">
              <li class="swiper-slide">
                <a href="bestReview.jsp" class="link">
                  <img src="../images/common/banner_bestreview.jpg" alt="" class="img">
                </a>
              </li>
              <li class="swiper-slide">
                <a href="specialPrice.jsp" class="link">
                  <img src="../images/common/banner_specialprice.jpg" alt="" class="img">
                </a>
              </li>
            </ul>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
          </div>
          <div class="swiper-pagination"></div>
        </section>
        <section class="itemPage_sec01 cont_size">
          <div class="itemPage_sec01_info">
            <h2 class="itemPage_sec01_info_tit">핫플레이스</h2>
            <p class="itemPage_sec01_info_txt">지금 가장 핫한 여행지를 경험해보세요!</p>
          </div>
          <div class="itemPage_sec01_list_area">
            <div class="itemPage_sec01_list_cover mySwiper">
              <ul class="itemPage_sec01_list swiper-wrapper">
                <%
                ArrayList<HotPlaceDTO> hotPlaceList = ticketDAO.getHotPlace();
			    for(HotPlaceDTO list : hotPlaceList) {
			    %>
                <li class="swiper-slide">
                  <a href="ticket.jsp?city=<%=list.getCity()%>" class="link">
                    <p class="list_img">
                      <img src="../images/main/<%=list.getImagesArr()[1]%>" alt="" class="img">
                    </p>
                    <span class="city"><%=list.getCity()%></span>
                  </a>
                </li>
                <%
			    }
                %>
              </ul>
              <div class="swiper-button-next"></div>
              <div class="swiper-button-prev"></div>
            </div>
          </div>
        </section>
        <section class="itemPage_sec02">
          <h2 class="main_sec_tit cont_size">베스트 셀러</h2>
          <div class="itemPage_sec02_bestSeller">
            <ul class="itemPage_sec02_bestSeller_tab cont_size">
              <li>
                <a href="#n" class="link">액티비티</a>
              </li>
              <%
              ArrayList<BestSellerDTO> spaList = ticketDAO.getBestSellerItem(city, "spa");
              if(spaList.size() > 0) {
              %>
              <li>
                <a href="#n" class="link">스파 & 마사지</a>
              </li>
              <%
              }
              ArrayList<BestSellerDTO> classList = ticketDAO.getBestSellerItem(city, "클래스");
              if(classList.size() > 0) {
              %>
              <li>
                <a href="#n" class="link">원데이클래스</a>
              </li>
              <%
              }
              %>
              <li>
                <a href="#n" class="link">레스토랑</a>
              </li>
              <%
              ArrayList<BestSellerDTO> tourList = ticketDAO.getBestSellerItem(city, "투어");
              if(tourList.size() > 0) {				
			  %>
              <li>
                <a href="#n" class="link">투어</a>
              </li>
              <%
              }
              %>
            </ul>
            <div class="itemPage_sec02_bestSeller_content cont_size">
              <ul class="itemPage_sec02_bestSeller_list"> <!-- 액티비티 -->
                <%
                ArrayList<BestSellerDTO> bestList = ticketDAO.getBestSellerActivity(city);
                for(int i=0; i<bestList.size(); i++) {
                %>
                <li>
                  <a href="activityDetail.jsp?itemID=<%=bestList.get(i).getItemID()%>" class="link">
                    <div class="list_img">
                      <span class="num"><%=i+1%></span>
                      <img src="../images/detailPage/ticket/<%=bestList.get(i).getImagesArr()[0]%>" alt="" class="img">
                    </div>
                    <div class="main_itemList_info">
                      <%
	                  if(bestList.get(i).getAvailable().equals("Y")) {
	                  %>
                      <p class="main_itemList_info_available">
                        오늘부터 사용가능 <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">
                      </p>
                      <%
	                  }
                      %>
                      <p class="main_itemList_info_name"><%=bestList.get(i).getGoodsName()%></p>
                      <%
                      if(bestList.get(i).getScore() != 0) {
                      %>
                      <p class="main_itemList_info_score">
                        <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=bestList.get(i).getScore()%></span> <span class="review">(이용후기 <span><%=bestList.get(i).getReviewCnt()%></span> 건)</span>
                      </p>
                      <%
                      }
                      %>
                      <%
                      if(bestList.get(i).getDiscountRate() != 0) {
                      %>
                      <p class="main_itemList_info_price">₩ <span>58,000</span></p>
                      <%
                      }
                      %>
                      <p class="main_itemList_info_discountedPrice">
                        ₩ <span><%=bestList.get(i).getStringDiscountedPrice()%></span>
                        <%
                    	if(bestList.get(i).getDiscountRate() != 0) {
                    	%>
                        <span class="discount"><%=bestList.get(i).getDiscountRate()%>%</span>
                        <%
                    	}
                        %>
                      </p>
                    </div>
                  </a>
                </li>
                <%
                }
                %>
              </ul>
              <%
              if(spaList.size() > 0) {
              %>
              <ul class="itemPage_sec02_bestSeller_list"> <!-- 스파 & 마사지 -->
                <%
                for(int i=0; i<spaList.size(); i++) {
                %>
                <li>
                  <a href="activityDetail.jsp?itemID=<%=spaList.get(i).getItemID()%>" class="link">
                    <div class="list_img">
                      <span class="num"><%=i+1%></span>
                      <img src="../images/detailPage/ticket/<%=spaList.get(i).getImagesArr()[0]%>" alt="" class="img">
                    </div>
                    <div class="main_itemList_info">
                      <%
	                  if(spaList.get(i).getAvailable().equals("Y")) {
	                  %>
                      <p class="main_itemList_info_available">
                        오늘부터 사용가능 <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">
                      </p>
                      <%
	                  }
                      %>
                      <p class="main_itemList_info_name"><%=spaList.get(i).getGoodsName()%></p>
                      <%
                      if(spaList.get(i).getScore() != 0) {
                      %>
                      <p class="main_itemList_info_score">
                        <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=spaList.get(i).getScore()%></span> <span class="review">(이용후기 <span><%=spaList.get(i).getReviewCnt()%></span> 건)</span>
                      </p>
                      <%
                      }
                      %>
                      <%
                      if(spaList.get(i).getDiscountRate() != 0) {
                      %>
                      <p class="main_itemList_info_price">₩ <span><%=spaList.get(i).getPrice()%></span></p>
                      <%
                      }
                      %>
                      <p class="main_itemList_info_discountedPrice">
                        ₩ <span><%=spaList.get(i).getStringDiscountedPrice()%></span>
                        <%
                    	if(spaList.get(i).getDiscountRate() != 0) {
                    	%>
                        <span class="discount"><%=spaList.get(i).getDiscountRate()%>%</span>
                        <%
                    	}
                        %>
                      </p>
                    </div>
                  </a>
                </li>
                <%
                }
                %>
              </ul>
              <%
              }
              if(classList.size() > 0) {
              %>
              <ul class="itemPage_sec02_bestSeller_list"> <!-- 원데이클래스 -->
                <%
                for(int i=0; i<classList.size(); i++) {
                %>
                <li>
                  <a href="activityDetail.jsp?itemID=<%=classList.get(i).getItemID()%>" class="link">
                    <div class="list_img">
                      <span class="num"><%=i+1%></span>
                      <img src="../images/detailPage/ticket/<%=classList.get(i).getImagesArr()[0]%>" alt="" class="img">
                    </div>
                    <div class="main_itemList_info">
                      <%
	                  if(classList.get(i).getAvailable().equals("Y")) {
	                  %>
                      <p class="main_itemList_info_available">
                        오늘부터 사용가능 <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">
                      </p>
                      <%
	                  }
                      %>
                      <p class="main_itemList_info_name"><%=classList.get(i).getGoodsName()%></p>
                      <%
                      if(classList.get(i).getScore() != 0) {
                      %>
                      <p class="main_itemList_info_score">
                        <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=classList.get(i).getScore()%></span> <span class="review">(이용후기 <span><%=classList.get(i).getReviewCnt()%></span> 건)</span>
                      </p>
                      <%
                      }
                      %>
                      <%
                      if(classList.get(i).getDiscountRate() != 0) {
                      %>
                      <p class="main_itemList_info_price">₩ <span><%=classList.get(i).getPrice()%></span></p>
                      <%
                      }
                      %>
                      <p class="main_itemList_info_discountedPrice">
                        ₩ <span><%=classList.get(i).getStringDiscountedPrice()%></span>
                        <%
                    	if(classList.get(i).getDiscountRate() != 0) {
                    	%>
                        <span class="discount"><%=classList.get(i).getDiscountRate()%>%</span>
                        <%
                    	}
                        %>
                      </p>
                    </div>
                  </a>
                </li>
                <%
                }
                %>
              </ul>
              <%
              }
              %>
              <ul class="itemPage_sec02_bestSeller_list"> <!-- 레스토랑 -->
                <%
                ArrayList<BestSellerDTO> restaurantList = ticketDAO.getBestSellerRestaurant(city);
                for(int i=0; i<restaurantList.size(); i++) {
                %>
                <li>
                  <a href="activityDetail.jsp?itemID=<%=restaurantList.get(i).getItemID()%>" class="link">
                    <div class="list_img">
                      <span class="num"><%=i+1%></span>
                      <img src="../images/detailPage/res/<%=restaurantList.get(i).getImagesArr()[0]%>" alt="" class="img">
                    </div>
                    <div class="main_itemList_info">
                      <%
	                  if(restaurantList.get(i).getAvailable().equals("Y")) {
	                  %>
                      <p class="main_itemList_info_available">
                        오늘부터 사용가능 <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">
                      </p>
                      <%
	                  }
                      %>
                      <p class="main_itemList_info_name"><%=restaurantList.get(i).getGoodsName()%></p>
                      <%
                      if(restaurantList.get(i).getScore() != 0) {
                      %>
                      <p class="main_itemList_info_score">
                        <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=restaurantList.get(i).getScore()%></span> <span class="review">(이용후기 <span><%=restaurantList.get(i).getReviewCnt()%></span> 건)</span>
                      </p>
                      <%
                      }
                      %>
                      <%
                      if(restaurantList.get(i).getDiscountRate() != 0) {
                      %>
                      <p class="main_itemList_info_price">₩ <span><%=restaurantList.get(i).getPrice()%></span></p>
                      <%
                      }
                      %>
                      <p class="main_itemList_info_discountedPrice">
                        ₩ <span><%=restaurantList.get(i).getStringDiscountedPrice()%></span>
                        <%
                    	if(restaurantList.get(i).getDiscountRate() != 0) {
                    	%>
                        <span class="discount"><%=restaurantList.get(i).getDiscountRate()%>%</span>
                        <%
                    	}
                        %>
                      </p>
                    </div>
                  </a>
                </li>
                <%
                }
                %>
              </ul>
              <%
              if(tourList.size() > 0) {				
			  %>
              <ul class="itemPage_sec02_bestSeller_list"> <!-- 투어 -->
                <%
                for(int i=0; i<tourList.size(); i++) {
                %>
                <li>
                  <a href="activityDetail.jsp?itemID=<%=tourList.get(i).getItemID()%>" class="link">
                    <div class="list_img">
                      <span class="num"><%=i+1%></span>
                      <img src="../images/detailPage/ticket/<%=tourList.get(i).getImagesArr()[0]%>" alt="" class="img">
                    </div>
                    <div class="main_itemList_info">
                      <%
	                  if(tourList.get(i).getAvailable().equals("Y")) {
	                  %>
                      <p class="main_itemList_info_available">
                        오늘부터 사용가능 <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">
                      </p>
                      <%
	                  }
                      %>
                      <p class="main_itemList_info_name"><%=tourList.get(i).getGoodsName()%></p>
                      <%
                      if(tourList.get(i).getScore() != 0) {
                      %>
                      <p class="main_itemList_info_score">
                        <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=tourList.get(i).getScore()%></span> <span class="review">(이용후기 <span><%=tourList.get(i).getReviewCnt()%></span> 건)</span>
                      </p>
                      <%
                      }
                      %>
                      <%
                      if(tourList.get(i).getDiscountRate() != 0) {
                      %>
                      <p class="main_itemList_info_price">₩ <span><%=tourList.get(i).getPrice()%></span></p>
                      <%
                      }
                      %>
                      <p class="main_itemList_info_discountedPrice">
                        ₩ <span><%=tourList.get(i).getStringDiscountedPrice()%></span>
                        <%
                    	if(tourList.get(i).getDiscountRate() != 0) {
                    	%>
                        <span class="discount"><%=tourList.get(i).getDiscountRate()%>%</span>
                        <%
                    	}
                        %>
                      </p>
                    </div>
                  </a>
                </li>
                <%
                }
                %>
              </ul>
              <%
              }
              %>
            </div>
          </div>
        </section>
        <section class="itemPage_sec03 main_itemList">
          <h2 class="main_sec_tit">액티비티 & 투어 베스트셀러</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
			  <%
              ArrayList<ItemDTO> cityTicketList = ticketDAO.getCityActivityList(city);
              for(ItemDTO list : cityTicketList) {
              %>
              <li class="swiper-slide">
	              <div class="main_itemList_visual">
	                <button class="main_itemList_visual_wishList" onclick="wishListFunction();">
	                  <%
                  	  if(!wishDAO.checkMyWishList(memberID, list.getItemID())) {
                  	  %>
                      <img src="../images/common/wish_off.svg" alt="" class="icon">
                      <%
                  	  } else {
                      %>
                      <img src="../images/common/wish_on.svg" alt="" class="icon active">
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
	                <a href="activityDetail.jsp?itemID=<%=list.getItemID()%>" class="main_itemList_visual_thumbnail">
	                  <div class="thumbnail_cover">
	                    <img src="../images/detailPage/ticket/<%=list.getImagesArr()[0]%>" alt="" class="img">
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
	                  <img src="../images/common/star_icon.svg" alt="" class="score_icon"> <span><%=list.getScore()%></span> <span class="review">(이용후기 <%=list.getReviewCnt()%> 건)</span>
	                </p>
	                <%
	                }
	                %>
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
        <section class="itemPage_sec04 main_itemList">
          <h2 class="main_sec_tit">인기숙소 & 호캉스</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<HotelDTO> cityHotelList = ticketDAO.getCityHotelList(city);
              for(HotelDTO list : cityHotelList) {
              %>
              <li class="swiper-slide">
                  <div class="main_itemList_visual">
                    <button class="main_itemList_visual_wishList" onclick="wishListFunction();">
                      <%
                  	  if(!wishDAO.checkMyWishList(memberID, list.getHotelID())) {
                  	  %>
                      <img src="../images/common/wish_off.svg" alt="" class="icon">
                      <%
                  	  } else {
                      %>
                      <img src="../images/common/wish_on.svg" alt="" class="icon active">
                      <%
                  	  }
                      %>
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
        <section class="itemPage_sec05 main_itemList">
          <h2 class="main_sec_tit">인기 레스토랑</h2>
          <div class="mySwiper">
            <ul class="swiper-wrapper">
              <%
              ArrayList<ItemDTO> cityRestaurantList = ticketDAO.getCityRestaurantList(city);
              for(ItemDTO list : cityRestaurantList) {
              %>
              <li class="swiper-slide">
                  <div class="main_itemList_visual">
                    <button class="main_itemList_visual_wishList" onclick="wishListFunction();">
                      <%
                  	  if(!wishDAO.checkMyWishList(memberID, list.getItemID())) {
                  	  %>
                      <img src="../images/common/wish_off.svg" alt="" class="icon">
                      <%
                  	  } else {
                      %>
                      <img src="../images/common/wish_on.svg" alt="" class="icon active">
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
                    %>
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
        <section id="category" class="itemPage_sec06 itemPage_category">
          <h2 class="itemPage_category_tit"><span>서울</span> 액티비티 (<span>543</span>)</h2>
          <div class="itemPage_category_select">
            <select name="category" id="category_select">
              <option value="추천순" selected>WAGU 추천순</option>
              <option value="별점순">별점순</option>
              <option value="낮은가격순">낮은 가격순</option>
              <option value="높은가격순">높은 가격순</option>
            </select>
          </div>
          <section class="itemPage_category_area">
            <div>
              <ul class="itemPage_category_select_list">
                <li>
                  <h3 class="itemPage_category_select_tit">이용일</h3>
                  <div class="select_box_available">
                    <img src="../images/common/thunder_icon.svg" alt="" class="available_icon">
                    <p class="available_txt">바로 사용</p>
                    <label class="available_switch">
                      <input type="checkbox" class="available_switch_checkbox">
                      <span class="available_switch_slider round"></span>
                    </label>
                  </div>
                </li>
                <li>
                  <h3 class="select_box_tit">가격</h3>
                  <div class="select_box_price">
                    <div class="price_txt">
                        ₩ <span class="outputOne"></span> - 
                        ₩ <span class="outputTwo"></span>
                    </div>
                    <section class="range-slider container">
                      <span class="full-range"></span>
                      <span class="incl-range"></span>
                      <input name="rangeOne" value="0" min="0" max="410000" step="10000" type="range">
                      <input name="rangeTwo" value="410000" min="0" max="410000" step="10000" type="range">
                    </section>
                  </div>
                </li>
                <li class="w_100">
                  <h3 class="select_box_tit">카테고리</h3>
                  <ul class="select_box_item">
                    <li>
                      <input type="checkbox" id="activity" name="액티비티">
                      <label for="activity">액티비티</label>
                    </li>
                    <li>
                      <input type="checkbox" id="spa" name="스파">
                      <label for="spa">스파 & 마사지</label>
                    </li>
                    <li>
                      <input type="checkbox" id="oneday" name="클래스">
                      <label for="oneday">원데이클래스</label>
                    </li>
                    <li>
                      <input type="checkbox" id="tour" name="투어">
                      <label for="tour">투어</label>
                    </li>
                    <li>
                      <input type="checkbox" id="restaurant" name="레스토랑">
                      <label for="restaurant">레스토랑</label>
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
                ArrayList<ItemDTO> categoryList = ticketDAO.getCategoryList(city);
                for(ItemDTO list : categoryList) {
                %>
                <li>
                    <div class="main_itemList_visual">
                      <button class="main_itemList_visual_wishList" onclick="wishListFunction();">
	                      <%
	                  	  if(!wishDAO.checkMyWishList(memberID, list.getItemID())) {
	                  	  %>
	                      <img src="../images/common/wish_off.svg" alt="" class="icon">
	                      <%
	                  	  } else {
	                      %>
	                      <img src="../images/common/wish_on.svg" alt="" class="icon active">
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
         </section>
      </main>
      <footer class="footer">
		<%-- <jsp:include page="bottom.jsp"></jsp:include> --%>
      </footer>
    </div>
    <%
    DBconnection.close();
    %>
  </body>
</html>