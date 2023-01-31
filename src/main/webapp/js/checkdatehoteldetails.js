$(function() {
	$('.checkinout').daterangepicker({
		
		locale: {
			"separator": '                                            ',
			"format": 'YYYY-MM-DD',
			"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		    },
	    "autoApply": true,
		"alwaysShowCalendars": true,
		 startDate : date1,
         endDate : date2
	});
	
//	$('input[name="checkdate"]').on(show.daterangepicker, function(ev, picker) {
//	  console.log(picker.startDate.format('YYYY-MM-DD'));
//	  console.log(picker.endDate.format('YYYY-MM-DD'));
//	});
//	function (start, end, label) {
//		$('input[name="startdate"]').val(start.format("YYYY-MM-DD"));
//        $('input[name="enddate"]').val(end.format("YYYY-MM-DD"));
//		console.log(
//            "A new date selection was made: " +
//              start.format("YYYY-MM-DD") +
//              " to " +
//              end.format("YYYY-MM-DD")
//          );
//		}
	$('.checkinout').on('show.daterangepicker', function(ev, picker) {
		console.log(picker.startDate.format('YYYY-MM-DD'));
	  	console.log(picker.endDate.format('YYYY-MM-DD'));
		});
});