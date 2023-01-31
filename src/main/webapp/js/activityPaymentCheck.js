$(function(){
	// 예약 상세 정보 모달창
	$('#reservation_detail_info').on('click', function(){
		$('.detailedinfo_popup').css('display','block');
		$('.main.sub').css('z-index','99');
		$('body').css('overflow', 'hidden');
	});
	$('.close_button.agree').on('click', function(){
		$('.detailedinfo_popup').css('display','none');
		$('.main.sub').css('z-index','0');
		$('body').css('overflow', '');
	});
	
	// 구매 내역 페이지로 이동
	$("#purchase_detail").click(function(){
		location.href = "mypageActivity.jsp";
	});
	
})