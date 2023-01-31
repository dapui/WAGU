function update_price(_this) {   // 인원수를 체크하면 해당 옵션의 총 금액을 구하는 함수
	let detail_price = _this.parents(".option_condition").find(".detail_price").text();
	let price_num = detail_price.replace('₩','').replace(',','');
	let result = Number(_this.parent().find(".result").val());
	let price = price_num * result;
	_this.parents(".price_personnel").find(".temporary_price").text(price);
		
	update_total_price();
}

function comma(sum){    // 밑에서 구한 총 금액에 ,를 추가
	sum = String(sum);
	sum = sum.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	return sum;
}
function update_total_price(){  // 전체 옵션의 총 금액
	let sum = 0;
	$(".temporary_price").each(function(idx,obj){
		sum += Number($(this).text());
	});
	$(".total_price").text("₩ " + comma(sum));
}

$(function (){
	$(".option_info").click(function (){
		$(".option_background").show();
	});
	$(".background").click(function (){
		$(".option_background").hide();
		$(".result").val(0);
		$(".temporary_price").text(0);
		$(".total_price").text("₩ 0");
	});
	$(".cancel").click(function (){
		$(".option_background").hide();
		$(".result").val(0);
		$(".temporary_price").text(0);
		$(".total_price").text("₩ 0");
	});
	$(".minus").click(function (){
		let result = Number($(this).parent().find(".result").val());
	if(result>0){
		$(this).parent().find(".result").val(result-1);
		update_price($(this));
	}
	});
	$(".plus").click(function (){
		let result = Number($(this).parent().find(".result").val());
	if(result<30){
		$(this).parent().find(".result").val(result+1);
		update_price($(this));
	}		
	});	
	
	// 장바구니 페이지로 이동
	$("#basket").click(function(){
		$("form").attr("action", "mypageBasket.jsp");
	});
	
	// 예약자 정보 입력 페이지로 이동
	$("#reservation").click(function(){
		$("form").attr("action", "activityReservation2.jsp");
	});
})