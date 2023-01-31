$(function(){
	$('.option.price').on('click',function() {
	$(this).addClass('active');
	$('.option.info').removeClass('active');
	$('.room_list_section').css('display','block');
	$('.detailed_info_section').css('display','none');
	});
	$('.option.info').on('click',function(){
		$(this).addClass('active');
		$('.option.price').removeClass('active');
		$('.room_list_section').css('display','none');
		$('.detailed_info_section').css('display','block');
	});
	
	$('.reserve_button').click(function(){
		location.href = 'hotelReservation1.jsp';
	});
	
	
	
	
	
	
});