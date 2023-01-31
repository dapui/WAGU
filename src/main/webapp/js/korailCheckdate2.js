                         	 $(function() {
                        		$('.checkinout').daterangepicker({
                        			
                        			locale: {
                        				"separator": ' - ',
                        				"format": 'MM월 DD일',
                        				"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
                        			    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
                        			    },
                        		    autoApply: true,
                        			alwaysShowCalendars: true,
                        			singleDatePicker: true,
                        			startDate : date1
                        		});   // moment().add(7, 'days')       // ,endDate : moment().add(8, 'days')
                        		$('.checkinout').on('show.daterangepicker', function(ev, picker) {
                        		  console.log(picker.startDate.format('YYYY-MM-DD'));
                        		  console.log(picker.endDate.format('YYYY-MM-DD'));
                        		});
                        	});

/*
$(function() {
	$('.checkinout').daterangepicker({
		
		locale: {
			"separator": ' - ',
			"format": 'MM월 DD일',
			"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
		    },
	    autoApply: true,
		alwaysShowCalendars: true,
		singleDatePicker: true,
		startDate : moment().add(7, 'days'),
     	endDate : moment().add(8, 'days')
	});
	
	$('.checkinout').on('show.daterangepicker', function(ev, picker) {
	  console.log(picker.startDate.format('YYYY-MM-DD'));
	  console.log(picker.endDate.format('YYYY-MM-DD'));
	});
});
*/