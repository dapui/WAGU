<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<a href="mypageProfile.jsp" class="mypage_profile">
  <img src="../images/myPage/user_icon_def.png" alt="" class="img">
  <span class="name">오다현</span>
  <i class="fa-solid fa-chevron-right"></i>
  <i class="fa-solid fa-chevron-right"></i>
</a>
<ul class="mypage_list">
  <li>
    <div href="#n" class="link">
      <i class="fa-solid fa-clipboard-list"></i>
      <p class="title">
        예약 및 구매내역
        <a href="mypageActivity.jsp" class="goods_link">액티비티</a>
        <a href="mypageHotel.jsp" class="goods_link">숙소</a>
        <a href="mypageKorail.jsp" class="goods_link">열차 승차권</a>
      </p>
    </div>
  </li>
  <li>
    <a href="mypageCoupon.jsp" class="link">
      <i class="fa-solid fa-ticket"></i>
      <p class="title">쿠폰 (<span>0</span>)</p>
    </a>
  </li>
  <li>
    <a href="mypageReview.jsp" class="link">
      <i class="fa-solid fa-comment-dots"></i>
      <p class="title">이용후기</p>
    </a>
  </li>
  <li>
    <a href="mypageBasket.jsp" class="link">
      <i class="fa-solid fa-basket-shopping"></i>
      <p class="title">장바구니</p>
    </a>
  </li>
  <li>
    <a href="mypageWishlist.jsp" class="link">
      <i class="fa-solid fa-heart"></i>
      <p class="title">위시리스트</p>
    </a>
  </li>
</ul>