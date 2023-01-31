$(function(){

//호텔검색부분 누르면 팝업나오게 하기
$('.text_input').on('click', function(){	
	$('.search_popup').css('display','block'); 
	
});

//호텔검색창 이외 부분 누르면 팝업 close

//$('.html').click(function(e) {   
//	if(!$(e.target).hasClass('.box.hotelsearch')){   
//		$('.search_popup').css('display','none'); 
//	}
//});			>> hasClass가 먹지 않아 하단 방법으로 사용.

$('html').click(function(e){
	if($(e.target).parents('.box.hotelsearch').length < 1){
    	$('.search_popup').css('display','none'); 
    }
});


// area_list 각각 클릭시 해당 area_listdetail 나오게하기 
$('.search_area_list_wrapper').on('click', function(){
	$('.search_area_list_wrapper').removeClass('active');
	$('.search_area_listdetails_wrapper').removeClass('active');
	$(this).addClass('active');
	$('.search_area_list_wrapper').parent('.search_area_list').next()
		.children().eq($(this).index()).show().siblings().hide();
});

$('.tap').on('click', function(){
		let inputresult = $('.tap').parent().parent().prev().children().eq(($(this).parent()).index()).text();
		$("#search_location").val(inputresult);
		$('.search_popup').css('display','none'); 
		
		// 장소검색창에 value있을시 x버튼 노출 
		if($('#search_location').val().length > 1) {
			$('.search_x_icon').css('display','block');
			$('.gray_button_wrapper').css('display','none');
			$('.pink_button_wrapper').css('display','block');
		} 
		if($('#search_location').val().length > 1 && Number($('#num').val())>0) {
			$('.gray_button_wrapper').css('display','none');
			$('.pink_button_wrapper').css('display','block');
		} 
});

// 장소검색창에 value없을 시 x버튼 숨기기 노력중...안된다
//if($('#search_location').val('')) {
//		$('.search_x_icon').css('display','none');
//		};
//$('#search_location').val('', function(){
//	$('.search_x_icon').css('display','none');
//});
		
$('.search_x_icon').on('click', function(){
	$('#search_location').val('');
	$('.search_x_icon').css('display','none');
	$('.gray_button_wrapper').css('display','block');
	$('.pink_button_wrapper').css('display','none');
});
//
//$('html').click(function(e){
//	if($(e.target).parents('.box.hotelsearch').length < 1){
//    	$('.checkinout').css('display','none'); 
//    }
//});

//인원선택 누르면 팝업 나오게하기 and 끄게하기도 해야함 > 범위선택잘하기
$('.checkpeople').on('click', function(){
	$('.checkpeople_popup').css('display','block');
});
$('html').click(function(e){
	if($(e.target).parents('.box.checkpeoplebox').length<1){
		$('.checkpeople_popup').css('display','none');
	}
});


// 디폴트 인원 나타내기
$('#showcheckpeople').text($('#num').val());

// +,-에 따라 달라지는 인원수 구현 및 input update
$('.button.minus').on('click', function(){
	if(Number($('#num').val())==1){ 
//		$('.gray_button_wrapper').css('display','block');
//		$('.pink_button_wrapper').css('display','none');
		return; 
	}
	let num = Number($(this).parents().find('#num').val());
	if(num>0) {
		$(this).parents().find('#num').val(num-1);
	}
	$('#showcheckpeople').text($('#num').val());
});

$('.button.plus').on('click', function(){
	let num = Number($(this).parents().find('#num').val());
	$(this).parents().find('#num').val(num+1);
	$('#showcheckpeople').text($('#num').val());
	if($('#search_location').val().length > 1 && Number($('#num').val())>0) {
		$('.gray_button_wrapper').css('display','none');
		$('.pink_button_wrapper').css('display','block');
	} 
});

//$('.pink_button').on('click', function(){
//	let city = $('#search_location').val();
//	location.href = 'hotelsearchResult.jsp?city='+city;
//});












});		// 끝!










