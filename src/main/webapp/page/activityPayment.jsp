<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>WAGU - 액티비티 예약</title>
	<link rel="apple-touch-icon" sizes="57x57" href="../images/favicon.png" />
	<link rel="shortcut icon" sizes="72x72" href="../images/favicon.png"
		type="image/x-icon">
	<link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/common.css">
	<link rel="stylesheet" href="../css/activityPayment.css">
	<link rel="stylesheet" href="../css/activityPopup.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
	<script src="../js/common.js"></script>	
	<script src="../js/activityPayment.js"></script>
</head>
<body>
	<div class="wrap">
		<header class="header sub">
			<jsp:include page="top.jsp"></jsp:include>
		</header>
		<main class="main sub">
				<div class="activity_reservation_payment">
					<div class="info_left">
						<div class="reservation_info">
							<div class=infocommon_title>예약정보</div>
							<div class="information_section">
								<div class="information_wrapper">
									<div class="info_list">
										<div class="list_title">
											<img class="activity_icon" src="../images/activity/activity.svg"
												alt="activity icon"> <span>액티비티</span>
										</div>
										<div class="list_reservation_info">
											<div class="activity_name">서울 잠실 롯데월드 어드벤처 종합이용권</div>
											<div class="option_name">종일 종합이용권 1인 </div>
											<div class="use_date">2023-01-16</div>
										</div>
										<div class="list_reserveinfo">
											<div class="option_in_option">1인 기준</div>
											<div class="count">X 2</div>
										</div>
										<div class="list_modal">
											<div class="list_modal_body">
												<div class="goods_name">서울 잠실 롯데월드 어드벤처 종합이용권</div>
											</div>
										</div>
										<button class="list_button reserve">예약 상세 정보</button>
									</div>
								</div>
							</div>
							<div class="price_section">
								<div class="price_wrapper">
									<div class="total_title">총 금액</div>
									<div class="total_price">₩ 84,000</div>
								</div>
							</div>
						</div>
					</div>
					<div class="payment_info">
						<div class="payment_way">
							<div class="infocommon_title">결제수단</div>
								<!-- <div class="payment_way_list_card">
							<img class="payment_logo" src="../images/activity/imgpaymentcardlogo.svg" alt="card logo">
							<div class="payment_list_title">카드</div>
						</div> -->
								<div class="selected_payment_way_list_card">
									<div class="selected_wrapper">
										<div class="title_section card">
											<img class="payment_logo card"
												src="../images/activity/imgpaymentcardlogoblack.svg"
												alt="card logo">
											<div class="payment_list_title">카드</div>
										</div>
										<div class="selecting_option">
											<div class="selecting_option_title">카드종류</div>
											<div class="card_type">
												<div class="card_option">
													<img class="card_image"
														src="../images/activity/imgcardlogohyundai.svg"
														alt="hyundai">
													<div class="card_name">현대카드</div>
												</div>
												<div class="card_option">
													<img class="card_image"
														src="../images/activity/imgcardlogosamsung.svg"
														alt="samsung">
													<div class="card_name">삼성카드</div>
												</div>
												<div class="card_option">
													<img class="card_image"
														src="../images/activity/imgcardlogobc.svg" alt="bc">
													<div class="card_name">비씨카드</div>
												</div>
												<div class="card_option">
													<img class="card_image"
														src="../images/activity/imgcardlogokb.svg" alt="kb">
													<div class="card_name">국민카드</div>
												</div>
												<div class="card_option">
													<img class="card_image"
														src="../images/activity/imgcardlogohana.svg" alt="hana">
													<div class="card_name">하나카드</div>
												</div>
												<div class="card_option">
													<img class="card_image"
														src="../images/activity/imgcardlogolotte.svg" alt="lotte">
													<div class="card_name">롯데카드</div>
												</div>
												<div class="card_option">
													<img class="card_image"
														src="../images/activity/imgcardlogonh.svg" alt="nh">
													<div class="card_name">농협카드</div>
												</div>
												<div class="card_option">
													<img class="card_image"
														src="../images/activity/imgcardlogosh.svg" alt="sh">
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
										<svg xmlns="http://www.w3.org/2000/svg" fill="currentColor"
											class="payment_logo" viewBox="0 0 16 16">
						              <path fill-rule="evenodd" d="M11 15a4 4 0 1 0 0-8 4 4 0 0 0 0 8zm5-4a5 5 0 1 1-10 0 5 5 0 0 1 10 0z" />
						              <path d="M9.438 11.944c.047.596.518 1.06 1.363 1.116v.44h.375v-.443c.875-.061 1.386-.529 1.386-1.207 0-.618-.39-.936-1.09-1.1l-.296-.07v-1.2c.376.043.614.248.671.532h.658c-.047-.575-.54-1.024-1.329-1.073V8.5h-.375v.45c-.747.073-1.255.522-1.255 1.158 0 .562.378.92 1.007 1.066l.248.061v1.272c-.384-.058-.639-.27-.696-.563h-.668zm1.36-1.354c-.369-.085-.569-.26-.569-.522 0-.294.216-.514.572-.578v1.1h-.003zm.432.746c.449.104.655.272.655.569 0 .339-.257.571-.709.614v-1.195l.054.012z" />
							             <path d="M1 0a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h4.083c.058-.344.145-.678.258-1H3a2 2 0 0 0-2-2V3a2 2 0 0 0 2-2h10a2 2 0 0 0 2 2v3.528c.38.34.717.728 1 1.154V1a1 1 0 0 0-1-1H1z" />
							             <path d="M9.998 5.083 10 5a2 2 0 1 0-3.132 1.65 5.982 5.982 0 0 1 3.13-1.567z" />
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
						<form action="">
							<div class="coupon_section">
								<div class="select_coupon">쿠폰을 선택해 주세요.</div>
								<div class="wrap_coupon">
									<input type="text" name="enter_coupon" placeholder="쿠폰을 선택해 주세요."
										class="coupon_section_input" readonly />
									<div class="coupon_box">쿠폰함</div>
								</div>
							</div>
							<div class="agreement">
								<div class=infocommon_title>약관 동의</div>
								<div class="agree_section">
									<div class="personal_info_agree">
										<input type="checkbox" name="personal_info_agree"
											value="personal_info_agree"> 개인정보 제 3자 제공 동의
									</div>
									<div class="see_all_letters agree">[전문보기]</div>
								</div>
							</div>
							<div class="payment_section">
								<div class="payment_wrapper">
									<div class="infocommon_title">총 결제 금액</div>
									<div class="payment_total_price">₩ 83,000</div>
								</div>
								<button type="submit" id="payment_button">결제하기</button>
							</div>
							</form>
						</div>
					</div>
		</main>
		<div class=detailedinfo_popup>
			<div class="dim"></div>
			<div class="detailedinfo_popup_content">
				<div class="detailedinfo_popup_top">
					<div class="detailedinfo_popup_title">서울 잠실 롯데월드 어드벤처 종합이용권</div>
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="close_button agree" viewBox="0 0 16 16">
		          <path
							d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z" />
		        </svg>
				</div>
				<div class="detailedinfo_popup_body">
					<div class="detailedinfo_title">
						<strong>예약자 정보</strong>
					</div>
					<div class="detailedinfo_content">
						<div class="content">
							<div class="subtitle">예약자명</div>
							<div class="subcontent">조여정</div>
						</div>
						<div class="content">
							<div class="subtitle">휴대전화번호</div>
							<div class="subcontent">01012341234</div>
						</div>
						<div class="content">
							<div class="subtitle">이메일</div>
							<div class="subcontent">abc@naver.com</div>
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
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="close_button refundrule"
						viewBox="0 0 16 16">
		            <path
							d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z" />
		          </svg>
				</div>
			</div>
		</div>
		<div class="installment_popup">
			<div class="dim"></div>
			<div class="installment_popup_content">
				<div class="installment_popup_top">
					<div class="installment_popup_title">무이자 할부 안내</div>
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="close_button installment"
						viewBox="0 0 16 16">
					            <path
							d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z" />
					        </svg>
				</div>
				<div class="installment_list_wrapper">
					<div class="installment_list">
						<div class="installment_card_list">신한카드</div>
						<div class="installment_content">5만원 이상 2~3개월 무이자 할부</div>
					</div>
					<div class="installment_list">
						<div class="installment_card_list">하나(외환)카드</div>
						<div class="installment_content">5만원 이상 2~8개월 무이자 할부(종합병원,
							세금, 가구, 여행사, 항공, 면세점, 차량정비관리 2~6개월/대형마트, 할인점, 일반병원 2~3개월/손해보험
							2~6개월, 10개월/의약품, 환금성, 학원 등 일부 업종 제외)</div>
					</div>
					<div class="installment_list">
						<div class="installment_card_list">현대카드</div>
						<div class="installment_content">1만원 이상 2~3개월 무이자 할부 (B2B,
							의제약 2~3개월/상품권, 홈쇼핑 등 일부 업종 제외)</div>
					</div>
					<div class="installment_list">
						<div class="installment_card_list">국민카드</div>
						<div class="installment_content">5만원 이상 2~3개월 무이자 할부</div>
					</div>
					<div class="installment_list">
						<div class="installment_card_list">삼성카드</div>
						<div class="installment_content">5만원 이상 2~3개월 무이자 할부 (의약품,
							홈쇼핑, 세금 등 일부 업종 제외)</div>
					</div>
					<div class="installment_list">
						<div class="installment_card_list">비씨카드</div>
						<div class="installment_content">5만원 이상 2~3개월 무이자 할부</div>
					</div>
					<div class="installment_list">
						<div class="installment_card_list">농협카드</div>
						<div class="installment_content">5만원 이상 2~8개월 무이자 할부(슈퍼마켓,
							자동차 정비/수리 2~3개월)</div>
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
		<div class="privacy_popup">
			<div class="dim"></div>
			<div class="privacy_popup_content">
				<div class="privacy_popup_top">
					<div class="privacy_popup_title">개인정보 제 3자 제공 동의</div>
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="currentColor" class="close_button agree" viewBox="0 0 16 16">
		            <path
							d="M2.146 2.854a.5.5 0 1 1 .708-.708L8 7.293l5.146-5.147a.5.5 0 0 1 .708.708L8.707 8l5.147 5.146a.5.5 0 0 1-.708.708L8 8.707l-5.146 5.147a.5.5 0 0 1-.708-.708L7.293 8 2.146 2.854Z" />
		          </svg>
				</div>
				<div class="privacy_popup_body">
					<div class="policy">
						<strong>회원의 개인정보는 당사의 개인정보처리 방침에 따라 안전하게 보호됩니다.</strong>
						<p>"WAUG Inc."은 이용자들의 개인정보를 "개인정보 처리방침의 개인정보의 수집 및 이용목적"에서 고지한
							범위내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에
							공개하지않습니다</p>
						<p>"WAUG Inc."이 제공하는 서비스를 통하여 주문 및 결제가 이루어진 경우 구매자 확인등 거래이행을
							위해 관련된 정보를 필요한 범위내에서 거래 업체에게 제공합니다.</p>
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
		<!-- <div class="coupon_popup">
			<div class="dim"></div>
			<div class="coupon_popup_title">
				내 쿠폰
			</div>
			<div class="coupon_popup_body">
				<div>
					쿠폰내역
				</div>
				<div>
					할인 금액
				</div>
				<button>할인 적용</button>
			</div>
		</div> -->
		<footer class="footer">
			<jsp:include page="bottom.jsp"></jsp:include>
		</footer>
	</div>
</body>
</html>