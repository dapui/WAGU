$(function() {
  	$('.checkinout').daterangepicker({
  		
  		// maxDate: "+1M",
  		locale: {
  			minDate: 0,
  			"separator": ' - ',
  			"format": 'MM월 DD일',
  			"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
  		  "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
  		  },
  	  autoApply: true,
  	  alwaysShowCalendars: true,
  	  startDate : date1,     
      endDate : date2    
  	});          								//'03월 06일'
  	$('.checkinout').on('show.daterangepicker', function(ev, picker) {
  	  console.log(picker.startDate.format('YYYY-MM-DD'));
  	  console.log(picker.endDate.format('YYYY-MM-DD'));
  	});
  });
/*
$(function() {
	$('.checkinout').daterangepicker({
		// maxDate: "+1M",
		locale: {
			minDate: 0,
			"separator": ' - ',
			"format": 'MM월 DD일',
			"daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
		  "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
		  },
	  autoApply: true,
	  alwaysShowCalendars: true,
	  startDate : moment().add(0, 'days'),   
      endDate : moment().add(1, 'days')

	});
	
	$('.checkinout').on('show.daterangepicker', function(ev, picker) {
	  console.log(picker.startDate.format('YYYY-MM-DD'));
	  console.log(picker.endDate.format('YYYY-MM-DD'));
	});
	
});
*/