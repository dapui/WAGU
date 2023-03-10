<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>WAGU - νΈν μμ½</title>
	    <link rel="apple-touch-icon" sizes="57x57"  href="../images/favicon.png"/>
	    <link rel="shortcut icon" sizes="72x72" href="../images/favicon.png" type="image/x-icon">
	    <link rel="stylesheet" href="../fonts/SUIT/SUIT.css">
	    <link rel="stylesheet" href="../css/reset.css">
	    <link rel="stylesheet" href="../css/common.css">
	    <link rel="stylesheet" href="../css/hotelMain.css">
	    <link rel="stylesheet" href="../css/hotelcommon.css">
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
	    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	    <script src="https://kit.fontawesome.com/df844253b1.js" crossorigin="anonymous"></script>
	    <script src="../js/hotelsearch.js"></script>
	    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	    <script src="../js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="../css/daterangepicker.css" />
	    <script>
	    	var date1 = moment().add(7, 'days');
	    	var date2 = moment().add(8, 'days');
	    	
	    	function onclick_submit() {
	    		var date1 = $(".checkinout").val().split("              .              ")[0];
	    		var date2 = $(".checkinout").val().split("              .              ")[1];
	    		$("#input_date1").val(date1);
	    		$("#input_date2").val(date2);
	    	}
	    </script>
	    <style>
		    .daterangepicker {
				  top: 469px !important;
				  left: 549px !important;
				}
		</style>
	</head>
	<body>
		<div class="wrap">
	      <header class="header sub">
	        <jsp:include page="top.jsp"></jsp:include>
	      </header>
	      <main class="main sub">
	
		    <div class="hotel_header">
				<div class="background" style="background-image: url('../images/hotel/imghotelhead.jpg');">
					<div class="background_cover"></div>
					<div class="head_title_cover">
						<div class="head_title">νΈν</div>
					</div>
				</div>
			</div>
			<div class="search_section">
				<div class="search_hotel">
					<div class="search_hotel_position">
						<div class="search_hotel_section">
							<form action="hotelSearchResult.jsp">
								<div class="search_hotel_wrapper">
										<div class="box hotelsearch">
											<img class="search_lens" src="../images/hotel/imghotelsearchlens.svg" alt="searchicon">
											<div class="text_input">
												<input id="search_location" name="city" value="" placeholder="μ΄λλ‘ λ λμλμ?" style="font-size:15px; font-weight:500">
											</div>
											
											<div class="search_popup">
												<div class="search_area_list">
													<div class="search_area_list_wrapper active">μμΈ</div>
													<div class="search_area_list_wrapper">κ²½κΈ°</div>
													<div class="search_area_list_wrapper">μΈμ²</div>
													<div class="search_area_list_wrapper">κ°μ</div>
													<div class="search_area_list_wrapper">μΆ©μ²­</div>
													<div class="search_area_list_wrapper">κ²½μ</div>
													<div class="search_area_list_wrapper">μ λΌ</div>
													<div class="search_area_list_wrapper">μ μ£Ό</div>
												</div>
												<div class="search_area_listdetails">
													<div class="search_area_listdetails_wrapper active">
														<div class="tap">μμΈ μ μ²΄</div>
														<div class="tap">κ°λ¨ . μμ΄</div>
														<div class="tap">μ‘ν . κ°λ</div>
														<div class="tap">κ΄μ§ . μ±λ . λλλ¬Έ</div>
														<div class="tap">μ€κ΅¬ . μ’λ‘. μ±λΆ</div>
														<div class="tap">λ§ν¬ . μν . μλλ¬Έ</div>
														<div class="tap">μ©μ°</div>
														<div class="tap">μλ±ν¬ . κ΅¬λ‘</div>
														<div class="tap">λΈμ . κ°λΆ . λλ΄</div>
														<div class="tap">κ΄μ . κΈμ² . λμ</div>
														<div class="tap">κ°μ</div>
													</div>
													<div class="search_area_listdetails_wrapper">
														<div class="tap">κ²½κΈ° μ μ²΄</div>
														<div class="tap">κ°ν . μν</div>
														<div class="tap">μμ . νμ±</div>
														<div class="tap">κ³ μ . κΉν¬ . νμ£Ό</div>
														<div class="tap">μμ λΆ . ν¬μ² . μμ£Ό . λλμ² . μ°μ²</div>
														<div class="tap">μ©μΈ . μ±λ¨</div>
														<div class="tap">νν . μ€μ° . μμ±</div>
														<div class="tap">κ΅¬λ¦¬ . λ¨μμ£Ό . νλ¨</div>
														<div class="tap">μ΄μ² . μ¬μ£Ό</div>
														<div class="tap">μμ . μν₯ . λΆμ² . μμ° . κ΄λͺ</div>
													</div>
													<div class="search_area_listdetails_wrapper">
														<div class="tap">μΈμ² μ μ²΄</div>
														<div class="tap">μ€κ΅¬ (μΈμ²κ΅­μ κ³΅ν­)</div>
														<div class="tap">λΆν . κ³μ . μκ΅¬</div>
														<div class="tap">μ°μ . λ¨λ . λ―ΈμΆν</div>
														<div class="tap">κ°ν . μμ§</div>
													</div>
													<div class="search_area_listdetails_wrapper">
														<div class="tap">κ°μ μ μ²΄</div>
														<div class="tap">μμ΄ . μμ . κ³ μ±</div>
														<div class="tap">μΆμ² . μΈμ  . μκ΅¬</div>
														<div class="tap">κ°λ¦</div>
														<div class="tap">μ μ  . νμ°½ . μμ</div>
														<div class="tap">λν΄ . μΌμ² . νλ°±</div>
														<div class="tap">μμ£Ό . νμ² . ν‘μ±</div>
													</div>
													<div class="search_area_listdetails_wrapper">
														<div class="tap">μΆ©μ²­ μ μ²΄</div>
														<div class="tap">λμ  . μΈμ’νΉλ³μμΉμ</div>
														<div class="tap">μ²­μ£Ό . λ³΄μ</div>
														<div class="tap">μΆ©μ£Ό . μ μ² . λ¨μ</div>
														<div class="tap">μ§μ² . μμ±</div>
														<div class="tap">μ²μ . μμ°</div>
														<div class="tap">λ³΄λ Ή . λΆμ¬ . μμ²</div>
														<div class="tap">μμ° . νμ</div>
														<div class="tap">κ³΅μ£Ό . μμ° . μ²­μ</div>
													</div>
													<div class="search_area_listdetails_wrapper">
														<div class="tap">κ²½μ μ μ²΄</div>
														<div class="tap">λΆμ°</div>
														<div class="tap">λκ΅¬ . κ΅¬λ―Έ . μλ . λ¬Έκ²½</div>
														<div class="tap">κ²½μ£Ό . μ²­λ</div>
														<div class="tap">ν¬ν­ . μλ . μΈμ§ . μ²­μ‘</div>
														<div class="tap">μΉ κ³‘ . μ±μ£Ό</div>
														<div class="tap">μΈμ° . μμ°</div>
														<div class="tap">κ±°μ  . ν΅μ</div>
														<div class="tap">μ°½μ . κΉν΄</div>
														<div class="tap">μ§μ£Ό . μ¬μ² . λ¨ν΄ . κ³ μ± . νλ</div>
														<div class="tap">κ±°μ°½ . ν¨μ . μ°μ²­</div>
														<div class="tap">λ°μ . μ°½λ</div>
													</div>
													<div class="search_area_listdetails_wrapper">
														<div class="tap">μ λΌ μ μ²΄</div>
														<div class="tap">μ μ£Ό . μμ£Ό</div>
														<div class="tap">λ¨μ . λΆμ . μ μ . λ¬΄μ£Ό . κ΅¬λ‘</div>
														<div class="tap">κ΅°μ° . μ΅μ°</div>
														<div class="tap">κ΄μ£Ό . λμ£Ό</div>
														<div class="tap">μ¬μ . κ³ ν₯</div>
														<div class="tap">μμ² . κ΄μ . λ΄μ . λ³΄μ± . νμ</div>
														<div class="tap">λͺ©ν¬ . μμ . κ°μ§ . μ§λ . μλ</div>
														<div class="tap">μκ΄ . μ₯μ± . μ μ . λ¬΄μ</div>
													</div>
													<div class="search_area_listdetails_wrapper">
														<div class="tap">μ μ£Ό μ μ²΄</div>
														<div class="tap">μ μ£Ό</div>
														<div class="tap">μκ·ν¬</div>
													</div>
												</div>
											</div>
											<div class="search_x_icon">
												<img src="../images/hotel/imgsearchxicon.svg" alt="x-icon">
											</div>	
										</div>
										
										<div class="box">
											
											<div class="checkinoutbox">
												<div class="checkinoutlogo"></div>
												<input type="hidden" name="date1" id="input_date1">
												<input type="hidden" name="date2" id="input_date2">
												<input class="checkinout" type="text" value="" onfocus="this.blur()">
												<script src="../js/hotelcheckdate.js"></script>
												
												<div class="nexticon">
													<i class="fa-solid fa-circle-chevron-right"></i>
												</div>	
											</div>
										</div>
										<div class="box checkpeoplebox">
											<div class="checkpeople">
												μΈμ <span id="showcheckpeople"></span>λͺ
											</div>
											<div class="checkpeople_popup">
												<div class="checkpeople_popup_section">
													<div class="checkpeople_popup_wrapper">
														<div class="title">μΈμ μ ν</div>
														<div class="number_input_section">
															<div class="number_input_wrapper">
																<button type="button" class="button minus">
																	<img src="../images/hotel/imghotelsearchminus.svg" alt="minus icon">
																</button>
																<input type="text" id= "num" class="number" value="2" name="checkpeople">
																<button type="button" class="button plus"> 
																	<img src="../images/hotel/imghotelsearchplus.svg" alt="plus icon">
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="gray_button_wrapper">
											<div class="gray_button">κ²μνκΈ°</div>
										</div>
										<div class="pink_button_wrapper">
											<input type="submit" onclick="return onclick_submit();" class="pink_button" value="κ²μνκΈ°">
										</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			
				<div class="latest_popular_area">
					<div class="latest_hotel_section">
						<div class="title">μ΅κ·Ό κ²μν μμ</div>
						<div class="latest_hotel_list_section">
							<div class="latest_hotel_list_wrapper">
								<div class="latest_hotel_list" style="margin-right: 15px;">
									<div>
										<div class="image"
											style="background-image: url('../images/hotel/imglatesthotellistex01.jpg');">
											<div class="wish_button">
												<img class="heart_icon pink" src="../images/hotel/imghotelheartpink.svg"
													alt="heart icon"> <img class="heart_icon white"
													src="../images/hotel/imghotelheartwhite.svg" alt="heart icon">
											</div>
										</div>
										<div class="name">λΈλ³΄ν μ°λ°°μλ μμΈ μ©μ°</div>
										<div class="city">μμΈ μ©μ°κ΅¬ μ²­νλ‘20κΈΈ 95</div>
										<div class="price_section">
											<span class="price">β© 183,150</span>
										</div>
									</div>
								</div>
								<div class="latest_hotel_list" style="margin-right: 15px;">
									<div>
										<div class="image"
											style="background-image: url('../images/hotel/imglatesthotellistex02.jpg');">
											<div class="wish_button">
												<img class="heart_icon pink" src="../images/hotel/imghotelheartpink.svg"
													alt="heart icon"> <img class="heart_icon white"
													src="../images/hotel/imghotelheartwhite.svg" alt="heart icon">
											</div>
										</div>
										<div class="name">λͺ¬λλ¦¬μ μμΈ μ΄νμ(Mondrian Seoul Itaewon)</div>
										<div class="city">μμΈ μ©μ°κ΅¬ μ₯λ¬Έλ‘ 23</div>
										<div class="price_section">
											<span class="price">β© 177,650</span>
										</div>
									</div>
								</div>
							</div>
					</div>
					</div>
					<div class="popular_location_section">
						<div class="title">μΈκΈ° μ¬νμ§</div>
						<div class="popular_location_list_section">
							<div class="popular_location_list_wrapper">
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularseoul.png');">
											<div class="location_name_box">
												<div class="location_name">μμΈ</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularbusan.png');">
											<div class="location_name_box">
												<div class="location_name">λΆμ°</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularjeju.png');">
											<div class="location_name_box">
												<div class="location_name">μ μ£Ό</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularkangleung.png');">
											<div class="location_name_box">
												<div class="location_name">κ°λ¦</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularincheon.png');">
											<div class="location_name_box">
												<div class="location_name">μΈμ²</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularshokcho.png');">
											<div class="location_name_box">
												<div class="location_name">μμ΄</div>
											</div>
										</div>
									</div>
								</div>
								<div class="popular_location_list" style="margin-right: 15px;">
									<div>
										<div class="location_image" 
											style="background-image: url('../images/hotel/imgpopularyeosu.png');">
											<div class="location_name_box">
												<div class="location_name">μ¬μ</div>
											</div>
										</div>
									</div>
								</div>
							</div>
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






















