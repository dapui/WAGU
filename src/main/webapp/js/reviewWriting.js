$(function(){

$('.star').on('click', function(){
	$(this).siblings().removeClass('activehover');
	$(this).addClass('activeimg');
	$(this).prevAll().addClass('activeimg');
	$(this).nextAll().removeClass('activeimg');	
	
	$(this).parent().next().children().removeClass('active');
	$(this).parent().next().children().eq($(this).index()).addClass('active');
});

$('.star').hover(function(){
	$(this).addClass('activehover');
	$(this).prevAll().addClass('activehover');
}, function(){
	$(this).removeClass('activehover');
	$(this).siblings().removeClass('activehover');
});

$("#cancle_button").click(function(){
    location.href="mypageReview.jsp";
  });
$("#submit_button").click(function(){
	alert('등록되었습니다!');
    location.href="mypageReview.jsp";
  });

	
});