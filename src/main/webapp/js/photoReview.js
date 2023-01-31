$(function(){
	$('.photo_list').on('click',function(){
		$('.photo_dim').removeClass('active');
		$(this).children('.photo_dim').addClass('active');
		$('#photosection').attr(
			'src',$(this).children().children().attr('src')
		);
	});
	
});