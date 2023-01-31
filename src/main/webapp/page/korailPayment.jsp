<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 액티비티, 와서 구경해~</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/korailPayment.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="../js/common.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <!-- <script src="../js/subItems.js"></script> -->
    <script>
      $(function(){
        $('.payment_next_btn').click(function(){
        	location.href="korailPaymentCheck.jsp";
        });
        
      })
    </script>
    <script src="../js/korailPayment.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <div class="privacy_popup">
        <div class="dim"></div>
        <div class="privacy_popup_content">
          <div class="privacy_popup_top">
            <div class="privacy_popup_title">개인정보 제 3자 제공 동의</div>
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button agree" viewBox="0 0 16 16">
              <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
            </svg>
          </div>
          <div class="privacy_popup_body">
            <div class="policy">
              <strong>회원의 개인정보는 당사의 개인정보처리 방침에 따라 안전하게 보호됩니다.</strong>
              <p>"WAUG Inc."은 이용자들의 개인정보를 "개인정보 처리방침의 개인정보의 수집 및 이용목적"에서 고지한 범위내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지않습니다</p>
              <p>"WAUG Inc."이 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인등 거래이행을 위해 관련된 정보를 필요한 범위내에서 거래 업체에게 제공합니다.</p>
            </div>
            <div class="summary">
              <ul>
                <h2>I 제공 목적</h2>
                <li>구매자 예약 확인</li>
              </ul>
            </div>
            <div class="summary">
              <ul>
                <h2>I 제공 정보</h2>
                <li>성명</li>
                <li>휴대전화번호</li>
                <li>주소</li>
                <li>이메일</li>
              </ul>
            </div>
            <div class="summary">
              <ul>
                <h2>I 보유 및 이용 기간</h2>
                <li>상품 제공 완료 후 3개월</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-------------------------------------------------------------------------->
      <main class="main sub">
        <div class="payment_page_box">
          <div class="left">
            <div class="reservation_payment_info">
              <div class="reservation_payment_header">예약정보</div>
              <div class="reservation_payment_box">
                <div class = "reservation_payment_content">
                  <div class="payment_info_title">
                    <img src="../images/korail/station_icon.svg" alt="기차 아이콘">
                    <p>열차</p>
                  </div>
                  <div class="payment_info_body">
                    <div class="korail_reservation_info_content" >
                      <div class="railWay">가는편</div>
                      <div class="info">
                        <div class="top_info">
                          <div class="time_form">
                            <div class="station">대전</div>
                            <div class="time">05:28</div>
                          </div>
                          <div class="timetaken_form">
                            <div class="train">무궁화 1316</div>
                            <p class = "timetaken"><span>2시간 10분</span></p>
                          </div>
                          <div class="time_form">
                            <div class="station">서울</div>
                            <div class="time">07:38</div>
                          </div>
                        </div>
                        <div class="m_info">
                          <div class="form">
                            <div class="title">출발일</div>
                            <div class="content">2023년 11월 16일(월)</div>
                          </div>
                          <div class="form">
                            <div class="title">인원</div>
                            <div class="content">성인 1 , 어린이 1</div>
                          </div>
                          <div class="form">
                            <div class="title">좌석</div>
                            <div class="content">1호차 1,2</div>
                          </div>
                        </div>
                        <div class="price_info">
                          <div class="price">₩ 16,200</div>
                        </div>
                      </div>
                    </div>
                    <div class="korail_reservation_info_content" >
                      <div class="railWay">오는편</div>
                      <div class="info">
                        <div class="top_info">
                          <div class="time_form">
                            <div class="station">서울</div>
                            <div class="time">05:15</div>
                          </div>
                          <div class="timetaken_form">
                            <div class="train">KTX 1</div>
                            <p class = "timetaken"><span>0시간 59분</span></p>
                          </div>
                          <div class="time_form">
                            <div class="station">대전</div>
                            <div class="time">06:14</div>
                          </div>
                        </div>
                        <div class="m_info">
                          <div class="form">
                            <div class="title">출발일</div>
                            <div class="content">2023년 01월 17일(화)</div>
                          </div>
                          <div class="form">
                            <div class="title">인원</div>
                            <div class="content">성인 1 , 어린이 1</div>
                          </div>
                          <div class="form">
                            <div class="title">좌석</div>
                            <div class="content">1호차 1A,1B</div>
                          </div>
                        </div>
                        <div class="price_info">
                          <div class="price">₩ 35,550</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="reservation_payment_footer">
                <div class="sum_price_title">총 금액</div>
                <div class="sum_price">₩ 51,750</div>
              </div>
            </div>
          </div>
          <div class="right">
            <div class="payment_way">		
              <div class="infocommon_title">결제수단</div>
              
              <div class="selected_payment_way_list_card">
                <div class="selected_wrapper">
                  <div class="title_section card">
                    <img class="payment_logo card" src="../images/common/imgpaymentcardlogoblack.svg" alt="card logo">
                    <div class="payment_list_title">카드</div>
                  </div>
                  <div class="selecting_option"> 
                    <div class="selecting_option_title">카드종류</div>
                    <div class="card_type">
                      <div class="card_option active">
                        <img class="card_image active" src="../images/common/imgcardlogohyundai.svg" alt="hyundai">
                        <div class="card_name">현대카드</div>	
                      </div>	
                      <div class="card_option">
                        <img class="card_image" src="../images/common/imgcardlogosamsung.svg" alt="samsung">
                        <div class="card_name">삼성카드</div>	
                      </div>	
                      <div class="card_option">
                        <img class="card_image" src="../images/common/imgcardlogobc.svg" alt="bc">
                        <div class="card_name">비씨카드</div>	
                      </div>	
                      <div class="card_option">
                        <img class="card_image" src="../images/common/imgcardlogokb.svg" alt="kb">
                        <div class="card_name">국민카드</div>	
                      </div>	
                      <div class="card_option">
                        <img class="card_image" src="../images/common/imgcardlogohana.svg" alt="hana">
                        <div class="card_name">하나카드</div>	
                      </div>	
                      <div class="card_option">
                        <img class="card_image" src="../images/common/imgcardlogolotte.svg" alt="lotte">
                        <div class="card_name">롯데카드</div>	
                      </div>	
                      <div class="card_option">
                        <img class="card_image" src="../images/common/imgcardlogonh.svg" alt="nh">
                        <div class="card_name">농협카드</div>	
                      </div>	
                      <div class="card_option">
                        <img class="card_image" src="../images/common/imgcardlogosh.svg" alt="sh">
                        <div class="card_name">신한카드</div>	
                      </div>	
                    </div>
                    
                    <div class="other_card_section">
                      <div class="other_card_wrapper">
                        <button class="other_card">다른카드 선택</button>
                        <ul class="other_card_listbox" id="other_card_listbox">
                          <!-- <li><button class="cardlist active">다른카드 선택</button></li> -->
                          <li><button class="cardlist">카카오뱅크</button></li>
                          <li><button class="cardlist">하나(외환)카드</button></li>
                          <li><button class="cardlist">KDB 산업체크카드</button></li>
                          <li><button class="cardlist">우리카드</button></li>
                          <li><button class="cardlist">수협카드</button></li>
                          <li><button class="cardlist">전북카드</button></li>
                          <li><button class="cardlist">씨티카드</button></li>
                          <li><button class="cardlist">우체국체크카드</button></li>
                          <li><button class="cardlist">MG 새마을금고체크카드</button></li>
                          <li><button class="cardlist">저축은행체크카드</button></li>
                          <li><button class="cardlist">제주카드</button></li>
                          <li><button class="cardlist">광주카드</button></li>
                          <li><button class="cardlist">신협체크카드</button></li>
                        </ul>
                      </div>
                    </div>
                    
                    <div class="selecting_option_title">할부 선택</div>
                    <div class="monthly_payment_section">
                      <button class="monthly_payment month"></button>
                      <ul class="selecting_payment month" id="selecting_payment">
                        <li><button  class="monthlylist active">일시불</button></li>
                        <li><button  class="monthlylist">2개월</button></li>
                        <li><button  class="monthlylist">3개월</button></li>
                        <li><button  class="monthlylist">4개월</button></li>
                        <li><button  class="monthlylist">5개월</button></li>
                        <li><button  class="monthlylist">6개월</button></li>
                        <li><button  class="monthlylist">7개월</button></li>
                        <li><button  class="monthlylist">8개월</button></li>
                        <li><button  class="monthlylist">9개월</button></li>
                        <li><button  class="monthlylist">10개월</button></li>
                        <li><button  class="monthlylist">11개월</button></li>
                        <li><button  class="monthlylist">12개월</button></li>
                      </ul>
                    </div>
                    <div class="installment_notice">무이자 할부 안내 보기 ></div>
                  </div>
                </div>
              
              </div>
              <div>
                
                <div class="selected_payment_way_list_bank">
                  <div class="bank_wrapper">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="payment_logo" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z"/>
                      <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z"/>
                      <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z"/>
                      <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z"/>
                    </svg>
                    <div class="payment_list_title">무통장 입금</div>
                    </div>
                    <div class="bank_payment_section">
                      <div class="bank_payment_wrapper">
                      <button class="monthly_payment bank">입금은행 선택</button>
                          <ul class="selecting_payment bank" id="selecting_payment">
                            <li><button  class="paymentlist">국민은행</button></li>
                            <li><button  class="paymentlist">하나은행</button></li>
                            <li><button  class="paymentlist">신한은행</button></li>
                            <li><button  class="paymentlist">우리은행</button></li>
                            <li><button  class="paymentlist">농협은행</button></li>
                            <li><button  class="paymentlist">IBK 기업은행</button></li>
                            <li><button  class="paymentlist">SC 제일은행</button></li>
                            <li><button  class="paymentlist">신협은행</button></li>
                            <li><button  class="paymentlist">MG 새마을금고</button></li>
                          </ul>
                    </div>	
                  </div>	
                </div>
              </div>
            </div>
            <div class="agree_box">
              <div class="agree_title">약관동의</div>
              <form class="agree_content">
                <label class="all_agree"><input class="allAgree" type="checkbox" name="agree" value="all">전체 동의</label>
              </form>
              <form class="agree_content_detail">
                <label class="agree">
                  <input class ="agreeDetail" type="checkbox" name="agree" value="agree">개인정보 제3자 제공 동의
                  <button class="professional_view">[전문보기]</button>
                </label>
                <label class="agree">
                  <input class ="agreeDetail" type="checkbox" name="agree" value="agree">코레일 예약 취소 및 환불 내용 동의
                </label>
              </form>
    
              
            </div>
            <div class="payment_info">
              <div class="payment_info_header">결제 정보</div>
              <div class="payment_info_body">
                <div class="payment_info_subtitle">총금액<span>₩ 51,750</span></div>
                <div class="payment_info_subtitle">쿠폰<span>-₩ 0</span></div>
              </div>
              <div class="payment_info_footer">
                <div class="total_price">총 결제 금액 <span>₩ 51,750</span></div>
              </div>
              <div class="last_check">
                ※ (주)와그는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
              </div>
              <div class="payment_next_btn">
                <input type="submit" value="결제하기">
              </div>
            </div>
          </div>
        </div>
      </main>
      <footer class="footer">
        <jsp:include page="bottom.jsp"></jsp:include>
      </footer>
    </div>
  </body>
</html>
