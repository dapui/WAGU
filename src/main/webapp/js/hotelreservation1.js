$(function(){
	
	$('#check').click(function(){
		if($('#check').is(':checked')){
			$('#guest_name').val($('#member_name').val());
			$('#guest_midphone').val($('#member_midphone').val());
			$('#guest_lastphone').val($('#member_lastphone').val());
			$('#guest_email').val($('#member_email').val());
		} else{
			$('#guest_name').val('');
			$('#guest_midphone').val('');
			$('#guest_lastphone').val('');
			$('#guest_email').val('');
		}
	})
	
	$('.next_button').click(function(){
		if($('#guest_name').val().length>1 && $('#guest_midphone').val().length>1 && $('#guest_lastphone').val().length>1 && $('#guest_email').val().length>1){
			location.href = 'hotelReservation2.jsp';
		} else {
			alert('투숙객 정보를 모두 기입해 주세요!');
		}
	});
	
});