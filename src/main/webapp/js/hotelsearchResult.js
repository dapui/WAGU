$(function(){
	// 호텔디테일로 넘어가는
//	$('.hotelinfoimage').click(function(){
//		location.href = 'hotelDetails.html';
//	});
//	$('.contents_info').click(function(){
//		location.href = 'hotelDetails.html';
//	});
//	$('.wagu_price').click(function(){
//		location.href = 'hotelDetails.html';
//	});
	
	// 예약사이트로 넘어가는
	$('#agoda').click(function(){
		location.href = 'https://www.agoda.com/ko-kr/conrad-seoul_14/hotel/seoul-kr.html?cid=1844947&hid=401199&currency=KRW&checkin=2023-02-15&checkout=2023-02-16&NumberofAdults=2&NumberofChildren=0&Rooms=1&mcid=29005&adults=2&hc=KRW&childs=0&los=1';
	});
	$('#booking').click(function(){
		location.href = 'https://sp.booking.com/searchresults.ko.html?aid=2044601&sid=842caa596563fec3ee42280072e9f0a3&checkin=2023-02-15&checkout=2023-02-16&city=-716583&group_adults=2&group_children=0&highlighted_hotels=433855&hlrd=with_av&keep_landing=1&no_rooms=1&redirected=1&source=hotel&room1=A,A,;';
	});
	$('#expdia').click(function(){
		location.href = 'https://www.expedia.co.kr/Seoul-Hotels-Conrad-Seoul.h5389047.Hotel-Information?paandi=true&chkout=2023.02.16&rm1=a2&chkin=2023.02.15&mrp=0&rateplanid=234223153_24&langid=1042&clickref=1100lwfMpvXf&affcid=KR.DIRECT.PHG.1011l36522.0&';
	});
	$('#trip').click(function(){
		location.href = 'https://kr.trip.com/hotels/list/searchresults?Allianceid=292713&sid=2913863&hotelid=1465780&city=274&locale=ko_KR&checkin=2023-02-15&checkout=2023-02-16&ouid=18411f4c1740.03b98a2ac0e67&shoppingid=b1d47554fabb4028944679136fafd2d3&mincurr=KRW&curr=KRW&roomquantity=&minprice=&mproom=873627130&adult=2&children=0&ages=&language=kokr&swid=0&fgt=1&stand=H4sIAAAAAAAAAONK42KSYBJi4mCUiuH49fvkAmYhLkNDS0MzY3NjAyODl-wWD2IdZ3w7-7d35jQHz7NnzRcp35nhEMAxg3HL7siNjAt3-imvFUly2MHIdJGRAQgi_AUdH4JZDVzCji8Y1x0-UN7FxKglpZBkmGJibmpqkpaYlGRiYGRhaWJiZm5paGyWlpiWYpRirMCosWX-o1lsHoxBbK6G5oYGLlEyXMyhwS6C4h4BfySEZR2kmL2DwhU7WqMu73lcYp_Emp0f7x2U8Yi7IqmLkcmDcRUjwydGa0MDAwNDc3NDI10jAyMjQwMjMwNLY0sDA11C9scbAAC4b3aJDAEAAA';
	});
	
	
	// 가격에 , 추가하기. 근데 적용이안된다 >> 추후수정필요!
//	var num = $("#waguprice").text()
//    	//아이디 tag인 태그의 text를 읽어온다 
//	num2 = $.numberWithCommas(parseInt(num));
//  	// 받아온 text값을 정수로 변환하여 numberwithCommas 함수의 인자값으로 넣는다
//	
//	$.numberWithCommas = function (x) {
//		  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
//		}
		
//	function addComma(num) {
//	  //var rep = /\B(?=(\d{3})+(?!\d))/g;
//	  //return num.toString().replace(rep, ',');
//	  return num;
//	}
//	var price = $('#waguprice').text();
//	addComma(price);
	
	$('.contents_info').click (function(){
//        alert("!");
        var hotelId = $(this).attr('id');
//        location.href='hotelDetail.jsp?hotelId='+hotelId;
        location.href='hotelDetail.jsp?hotelId='+hotelId + "&date1=" + date1 + "&date2=" + date2 + "&checkpeople=" + checkpeople;
     });
	
		
		
		
	
	
});





