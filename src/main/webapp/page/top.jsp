<%@page import="com.wagu.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.wagu.dto.CityDTO" %>
<%@ page import="com.wagu.dao.CommonDAO" %>
<%
	CommonDAO comDAO = new CommonDAO();
	MemberDAO mDAO = new MemberDAO();
	
	int memberID = mDAO.getIdFromEmail((String)session.getAttribute("loginEmail")) ;
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
     
<div class="header_left">
  <a href="../index.jsp" class="header_logo"></a>
  <p class="header_area_tit">다른 도시 보기 <i class="fa-solid fa-chevron-down"></i></p>
  <div class="header_area">
    <a href="#n" class="btn_close">
      <img src="../images/common/close_icon.svg" alt="close">
    </a>
    <nav class="header_area_menu">
      <p class="header_area_menu_tit">국내 도시의 신나는 <span class="underline">액티비티</span>를 발견해 보세요.</p>
      <ul class="header_area_menu_list">
       <%
       ArrayList<CityDTO> cityList = comDAO.getCityMenu();
       for(CityDTO list : cityList) {
       %>
       <li>
         <a href="ticket.jsp?city=<%=list.getCity()%>" class="link">
           <span class="list_img">
             <img src="../images/main/<%=list.getImagesArr()[1]%>" alt="" class="img">
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
  	<a href="Login.jsp" class="login" style="<%=s2%>">
  		<span style="font-size:14px; font-weight:400; margin-right:20px;">로그인</span>
  	</a>
    <i class="fa-solid fa-magnifying-glass"></i>
    <p class="header_user_profile" style="<%=s%>">
	    <span class="img">
	    	<img src ="../images/common/<%=mDAO.getImageFromEmail((String)session.getAttribute("loginEmail")) %>">
	    </span>
	    <span class="name">
	    	<%=mDAO.getNameFromEmail((String)session.getAttribute("loginEmail")) %>
	    </span>
    </p>
    <ul class="header_user_list">
      <li>
        <a href="mypageProfile.jsp" class="link">
          <span><i class="fa-solid fa-user"></i></span>
          내정보
      </a>
      </li>
      <li>
        <a href="mypageActivity.jsp" class="link">
          <span><i class="fa-solid fa-clipboard-list"></i></span>
          예약 및 구매 내역
        </a>
      </li>
      <li>
        <a href="mypageCoupon.jsp" class="link">
          <span><i class="fa-solid fa-ticket"></i></span>
          쿠폰
        </a>
      </li>
      <li>
        <a href="mypageReview.jsp" class="link">
          <span><i class="fa-solid fa-comment-dots"></i></span>
          이용후기
        </a>
      </li>
      <li>
        <a href="mypageBasket.jsp" class="link">
          <span><i class="fa-solid fa-basket-shopping"></i></span>
          장바구니
        </a>
      </li>
      <li>
        <a href="mypageWishlist.jsp" class="link">
          <span><i class="fa-solid fa-heart"></i></span>
          위시리스트
        </a>
      </li>
      <li>
        <a href="Logout.jsp" class="link logout">로그아웃</a>
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