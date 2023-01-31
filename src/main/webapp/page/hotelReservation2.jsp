<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>  
<%@ page import="java.util.*" %>
<%@ page import="com.wagu.dto.*"%>
<%@ page import="com.wagu.dao.*"%>
<%@ page import="com.wagu.connection.DBconnection"%>    
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WAGU - 호텔 예약</title>
    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hotelreservation2.css">
    <link rel="stylesheet" href="../css/hotel_popup.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
    <script src="../js/common.js"></script>
    <script src="../js/hotelreservation2.js"></script>
  </head>
  <body>
    <div class="wrap">
      <header class="header sub">
        <jsp:include page="top.jsp"></jsp:include>
      </header>
      <main class="main sub">
		<div class="hotel_reservation_payment">
			<div class="info_left">
				<div class="reservation_info">
					<div class=infocommon_title>예약정보</div>
					<div class="information_section">
						<div class="information_wrapper">
							<div class="info_list">
								<div class="list_title">
									<img class="hotel_icon" src="../images/hotel/imghotelicon.svg" 
									alt="hotel icon">
									<span>숙소</span>
								</div>
								<div class="list_location">
									<div class="hotel_name">그랜드 머큐어 앰배서더 호텔 앤드 레지던스 서울 용산</div>
									<div class="hotel_location">
										<img class="location_icon" src="../images/hotel/imglocationicon.svg"
										alt="location icon">
										서울 용산구 청파로20길 95
									</div>
								</div>
								<div class="list_reserveinfo">
									<div class="reserveinfo_detail">
										<div class="reserveinfo_detail_title">객실</div>
										<div class="reserveinfo_detail_content">주니어 스위트룸 킹침대 1개</div>
									</div>
									<div class="reserveinfo_detail">
										<div class="reserveinfo_detail_title">체크인</div>
										<div class="reserveinfo_detail_content">2022년 1월 23일 (수) 15:00</div>
									</div>
									<div class="reserveinfo_detail">
										<div class="reserveinfo_detail_title">체크아웃</div>
										<div class="reserveinfo_detail_content">2022년 1월 24일 (목) 12:00</div>
									</div>
									<div class="reserveinfo_detail">
										<div class="reserveinfo_detail_title">숙박일</div>
										<div class="reserveinfo_detail_content">1박</div>
									</div>
									<div class="reserveinfo_detail">
										<div class="reserveinfo_detail_title">인원</div>
										<div class="reserveinfo_detail_content">2명</div>
									</div>
								</div>
								<div class="list_notice">
									<div class="list_notice_title">숙소 예약대기 안내</div>
									<ul>
										<li class="dot">해당 숙소는 예약대기상태이며, 숙소의 확인 후 예약확정 여부가 문자로 발송됩니다.</li>
										<li class="dot">숙소의 사정으로 예약이 불가능할 경우 결제된 금액은 자동으로 취소됩니다.</li>
									</ul>
								</div>
								<button class="list_button reserve" type="button">예약 상세 정보</button>
								<button class="list_button refund" type="button">환불 규정</button>
							</div>
						</div>
					</div>
					<div class="price_section">
						<div class="price_notice">※ 결제 금액은 해당 숙소 기준 인원에 대한 요금이며, 인원 추가 및 바비큐 시설 이용 등은 현장 결제가 필요합니다.</div>
						<div class="price_wrapper">
							<div class="total_title">총 금액</div>
							<div class="total_price">₩ 252,450</div>
						</div>
					</div>
				</div>
			</div>
				
			<div class="payment_info">
<!-- 				여기부터  결제수단 (카드,무통장입금) -->
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
									</div>
									<ul class="other_card_listbox" id="other_card_listbox">
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
<!-- 				여기까지  결제수단 (카드,무통장입금) -->
				
				<div class="rule_and_refund">
					<div class=rule_section>
						<div class="infocommon_title">숙소 이용 규칙</div>
							<button class="see_all_letters rule" type="button">[전문보기]</button>
						 
					</div>
					<div class=refund_section>
						<div class="infocommon_title">숙소 예약 취소 및 환불</div>
							<button class="see_all_letters refund" type="button">[전문보기]</button>
					</div>
				</div>
				
				<div class="agreement">
					<div class=infocommon_title>약관 동의</div>
					<div class="whole_agree">
						<input type="checkbox" id="whole_agree" value="whole_agree">
						전체 동의
					</div>
					<div class="agree_section">
						<div class="personal_info_agree">
							<input type="checkbox" name="agree" class="agreecheck">
							개인정보 제 3자 제공 동의
						</div>
						<button class="see_all_letters agree" type="button">[전문보기]</button>
					</div>
					
					<div class="hotel_rule_agree">
						<input type="checkbox" name="agree" class="agreecheck">
						숙소 이용 규칙, 숙소 예약 취소 및 환불 내용 동의
					</div>
				</div>
				<div class="payment_section">
					<div class="payment_wrapper">
						<div class="infocommon_title">총 결제 금액</div>
						<div class="payment_total_price">₩ 252,450</div>
					</div>
					<div class="payment_notice">※ WAGU는 통신판매중개자로서 통신판매의 당사자가 아니며, 상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.</div>
					<div class="payment_button">결제하기</div>
				</div>
			</div>
			
		</div>
			
		</main>
		<div class=detailedinfo_popup>
			<div class="dim"></div>
		    <div class="detailedinfo_popup_content">
		      <div class="detailedinfo_popup_top">
		        <div class="detailedinfo_popup_title">그랜드 머큐어 앰배서더 호텔 앤드 레지던스 서울 용산</div>
		        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button agree" viewBox="0 0 16 16">
		          <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
		        </svg>
		      </div>
		      <div class="detailedinfo_popup_body">
		          <div class="detailedinfo_title">
		          	<strong>예약자 정보</strong>
		          </div>
		          <div class="detailedinfo_content">
		          	<div class="content">
		          		<div class="subtitle">예약자명</div>
		          		<div class="subcontent">오다현</div>
		          	</div>
		          	<div class="content">
		          		<div class="subtitle">휴대전화번호</div>
		          		<div class="subcontent">010-4945-1002</div>
		          	</div>
		          	<div class="content">
		          		<div class="subtitle">이메일</div>
		          		<div class="subcontent">ykkdj311@naver.com</div>
		          	</div>
		          </div>
		          <div class="detailedinfo_title">
		          	<strong>투숙객 정보</strong>
		          </div>
		          <div class="detailedinfo_content">
		          	<div class="content">
		          		<div class="subtitle">투숙객명</div>
		          		<div class="subcontent">오다현</div>
		          	</div>
		          	<div class="content">
		          		<div class="subtitle">휴대전화번호</div>
		          		<div class="subcontent">010-4945-1002</div>
		          	</div>
		          	<div class="content">
		          		<div class="subtitle">이메일</div>
		          		<div class="subcontent">ykkdj311@naver.com</div>
		          	</div>
		          </div>
		          
		        </div>
		    </div>
		</div>
		<div class="refund_rule_popup">
		      <div class="dim"></div>
		      <div class="refund_rule_popup_content">
		        <div class="refund_rule_popup_top">
		          <div class="refund_rule_popup_title">환불규정</div>
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button refundrule" viewBox="0 0 16 16">
		            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
		          </svg>
		        </div>
		        <div class="body_container refundrule">
		        	<div class="body_wrapper refundrule">
			            <div class="body_title refundrule">숙소 환불 안내</div>
			            <ul class="body_list">
			              <li>예약 확정 이후 취소 시 다음의 환불 규정에 따라 적용됩니다. 구매 전 해당 내용을 반드시 숙지하시고 신중한 구매 부탁드립니다.</li>
			              <li>본 상품은 예약 확정 후 변경/취소할 경우 여행약관 제5조(특약)에 따른 취소 수수료가 부과됩니다.</li>
			            </ul>
			          </div>
			          <div class="body_content refundrule">
			          	<p>2022-12-28 23:59:59까지 취소 시 수수료 0원</p>
			          	<p>2022-12-29 23:59:59까지 취소 시 수수료 280,500원</p>
			          </div>
		        </div>
		      </div>
		 </div>
		 <div class="installment_popup">
			<div class="dim"></div>
				<div class="installment_popup_content">
					<div class="installment_popup_top">
						<div class="installment_popup_title">무이자 할부 안내</div>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button installment" viewBox="0 0 16 16">
					            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
					        </svg>
					</div>
					<div class="installment_list_wrapper">
						<div class="installment_list">
							<div class="installment_card_list">신한카드</div>
							<div class="installment_content">5만원 이상 2~3개월 무이자 할부</div>
						</div>
						<div class="installment_list">
							<div class="installment_card_list">하나(외환)카드</div>
							<div class="installment_content">
								5만원 이상 2~8개월 무이자 할부(종합병원, 세금, 가구, 여행사, 항공, 면세점, 차량정비관리 2~6개월/대형마트, 할인점, 
								일반병원 2~3개월/손해보험 2~6개월, 10개월/의약품, 환금성, 학원 등 일부 업종 제외)
							</div>
						</div>
						<div class="installment_list">
							<div class="installment_card_list">현대카드</div>
							<div class="installment_content">
								1만원 이상 2~3개월 무이자 할부 (B2B, 의제약 2~3개월/상품권, 홈쇼핑 등 일부 업종 제외)
							</div>
						</div>
						<div class="installment_list">
							<div class="installment_card_list">국민카드</div>
							<div class="installment_content">5만원 이상 2~3개월 무이자 할부</div>
						</div>
						<div class="installment_list">
							<div class="installment_card_list">삼성카드</div>
							<div class="installment_content">
								5만원 이상 2~3개월 무이자 할부 (의약품, 홈쇼핑, 세금 등 일부 업종 제외)
							</div>
						</div>
						<div class="installment_list">
							<div class="installment_card_list">비씨카드</div>
							<div class="installment_content">5만원 이상 2~3개월 무이자 할부</div>
						</div>
						<div class="installment_list">
							<div class="installment_card_list">농협카드</div>
							<div class="installment_content">5만원 이상 2~8개월 무이자 할부(슈퍼마켓, 자동차 정비/수리 2~3개월)</div>
						</div>
						<div class="installment_list">
							<div class="installment_card_list">전북카드</div>
							<div class="installment_content">5만원 이상 2~6개월 무이자 할부</div>
						</div>
						<div class="installment_list">
							<div class="installment_card_list">광주카드</div>
							<div class="installment_content">5만원 이상 2~7개월 무이자 할부</div>
						</div>
					</div>
				</div>
			</div>
		<div class="hotel_rule_popup">
			<div class="dim"></div>
				<div class="hotel_rule_popup_content">
					<div class="hotel_rule_popup_top">
						<div class="hotel_rule_popup_title">숙소 이용 규칙</div>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button rule" viewBox="0 0 16 16">
					            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
					        </svg>
					</div>
					<ul class="hotel_rule_list">
					    <li>숙소 이용자는 각 숙박시설의 규정을 준수해야 합니다. 숙박시설 규정 위반 시 입실 불가, 퇴실 조치, 추가 요금 등이 발생할 수 있으며 이에 대한 모든 책임은 이용자에게 있으므로 숙박시설의 이용규칙과 시설 현황을 반드시 확인하시기 바랍니다.</li>
					    <li>숙소 규정 내 이용 가능 인원(기준 인원)을 초과한 경우, 이용 불가 통보 또는 기준 인원에 대한 추가 요금이 발생할 수 있습니다.</li>
					    <li>기준 인원 요금 외 인원 추가 요금은 현장 결제로 진행됩니다.</li>
					    <li>
					       	미성년자 투숙 시 청소년 보호법 등 관계 법령에 따라 미성년자(만 19세 미만 청소년)의 경우 혼숙이 금지되며 법정대리인 동행 없이 혼숙이 불가한 점 반드시 유의하여 주시기 바랍니다.
					    	 이에 따라 입실 시 현장에서 신분증 제시를 요구할 수 있으며, 미지참 시 입실이 거부될 수 있습니다. (취소/환불 불가)
					    </li>
					    <li>차량 이용 시, 주차 가능 여부를 숙소 시설물 정보나 숙소 연락처를 통해 꼭 사전에 문의 확인해 주시기 바랍니다.</li>
					    <li> 반려동물은 숙소 규정에 따라 출입이 제한될 수 있으니 숙소 연락처를 통해 꼭 사전에 문의 확인해 주시기 바랍니다.</li>
					    <li>WAGU에서 판매되고 있는 숙박시설 정보는 예약을 위한 참고 자료로써 숙박시설 내 자체 변동 또는 기타 사유로 인해 실제와 차이가 있을 수 있으며, 이에 대해 WAGU는 책임을 지지 않습니다.</li>
					</ul>
				</div>
			</div>
		<div class="hotel_reservation_refund_popup">
		      <div class="dim"></div>
		      <div class="hotel_reservation_refund_popup_content">
		        <div class="hotel_reservation_refund_popup_top">
		          <div class="hotel_reservation_refund_popup_title">숙소 예약 취소 및 환불</div>
		          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="close_button refund" viewBox="0 0 16 16">
		            <path d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z"/>
		          </svg>
		        </div>
		        <div class="body_container">
		        	<div class="body_wrapper">
			          <div class="body">
			            ※ 본 규정에서 말하는 숙소(숙박시설)의 범위는 WAGU 상품 카테고리 [숙소 > 펜션 & 풀빌라] 또는 [숙소 > 캠핑 & 글램핑]에서 직접 결제를 통해 예약 가능한 상품을 말합니다. 부킹닷컴, 아고다, 익스피디아, 씨트립 등과 같은 파트너사 서비스에서 결제를 진행한 상품은 제외됩니다.
			          </div>
			          <div class="body">
			            <div class="body_title">숙소 예약 취소 및 환불</div>
			            <ul class="body_list">
			              <li>예약 확정 후 변경 또는 취소는 해당 각 숙소의 환불 규정에 따라 적용됩니다.</li>
			              <li>숙소 사정에 의한 취소 발생 시 전액 환불이 가능합니다.</li>
			              <li>예약 취소 불가 상품은 규정과 상관없이 취소 불가합니다.</li>
			              <li>당일 결제를 포함한 체크인 당일 예약 취소는 불가합니다.</li>
			              <li>부과된 취소 수수료가 결제 금액과 동일하거나 초과할 경우 예약 취소는 불가합니다.</li>
			              <li> 환불 금액은 결제 금액(포인트, 쿠폰 포함가)에서 취소 수수료를 제외한 금액이 지급됩니다.</li>
			              <li>환불은 결제수단에 따라 주말, 공휴일을 제외한 최대 영업일 3~5일까지 소요될 수 있습니다.</li>
			              <li>포인트를 사용하여 결제한 경우, 취소 수수료가 적용되지 않는 경우에 한하여 사용한 포인트가 모두 환급됩니다. (비'숙소' 상품의 경우 제외)</li>
			              <li>할인쿠폰을 사용하여 결제한 경우 취소 및 환불 요청 시 적용한 쿠폰은 복원됩니다. (비'숙소' 상품의 경우 제외)</li>
			              <li>숙소의 예약/결제를 완료 하였으나 해당 날짜에 체크인하지 않은 경우(NO-SHOW) 이용하지 않은 객실에 대해서는 환불되지 않습니다.</li>
			              <li> 2박 이상의 예약 시 별도의 연락 없이 해당 날짜에 체크인하지 않은 경우(NO-SHOW) 경우 나머지 날짜에 대한 예약도 자동으로 취소될 수 있으며 환불되지 않을 수 있습니다.</li>
			            </ul>
			          </div>
			          <div class="body">
			            <div class="body_title">숙소 취소 수수료</div>
			            <ul class="body_list">
			              <li>예약 확정 후 변경 또는 취소할 경우 여행약관 제5조(특약)에 의거, 특별 약관에 따른 취소 수수료가 부과될 수 있습니다.</li>
			              <li>포인트를 사용하여 결제한 경우, 취소 수수료는 1. 포인트 2. 결제금액의 순서로 차감됩니다.</li>
			              <li>할인쿠폰을 사용하여 결제한 경우, 취소 수수료는 총 판매가(포인트, 쿠폰 미포함) 기준으로 산정되며 실 결제금액에서 선차감됩니다.</li>
			            </ul>
			          </div>
			        </div>  
		        </div>
		      </div>
		 </div>
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
       <footer class="footer"></footer>
    </div>
     
  </body>
 
</html>


















    