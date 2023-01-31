let random ="";

function join() {
  let getCheckId = RegExp(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.[a-zA-Z]{2,4}$/);
  let getCheckPw = RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{10,15}$/);
  let getCheckName = RegExp(/^[가-힣]+$/);
  
  // 아이디 공백 확인
  if($(".create_signUp_email").val() == ""){
    alert("이메일을 입력하세요");
    $('.create_signUp_email').focus();
    return false;
  }
  
  //아이디 유효성검사
  if(!getCheckId.test($(".create_signUp_email").val())){
    alert("이메일 형식에 맞게 입력해주세요.");
    $(".create_signUp_email").val("");
    $(".create_signUp_email").focus();
    return false;
  }

  //인증번호 공백 확인
  if($('.certification_number_check').val() == ""){
   alert("인증번호 입력해주세요");
    $('.certification_number_check').focus();
    return false;
  }
 
  if($('.certification_number_check').val()!=random){
	return false;
  }
  

  // 비밀번호 공백 확인
  if($('.create_signUp').val()==""){
    alert("비밀번호를 입력하세요.");
    $('.create_signUp').focus();
    return false;
  } else if($('.create_signUp_email').val()==($('.create_signUp').val())){
    alert("비밀번호랑 아이디가 같습니다.");
    $('.create_signUp').val("");
    $('.create_signUp').focus();
    return false;
  } else if(!getCheckPw.test($('.create_signUp').val())){
    alert("비밀번호 형식에 맞게 입력해주세요.");
    $('.create_signUp').focus();
    return false;
  } else if($('.create_signUp.ch').val()==""){
    alert("비밀번호 확인란을 입력하세요.");
    $('.create_signUp.ch').focus();
    return false;
  } else if($('.create_signUp').val() != $('.create_signUp.ch').val()) {
    alert("비밀번호가 상이합니다.");
    $('.create_signUp').focus();
    return false;
  }

  // 이름 공백 검사
  if($('.create_signUp.name').val() == "") {
    alert("이름을 입력해주세요.");
    $('.create_signUp.name').focus();
    return false;
  } 

  // 이름 유효성 검사
  if(!getCheckName.test($('.create_signUp.name').val())) {
    alert("이름은 한글로만 입력가능합니다.");
    $('.create_signUp.name').val("");
    $('.create_signUp.name').focus();
    return false;
  }

  // 전화번호 공백 검사 
  if($('.tel').val() == ""){
    alert("전호번호 입력란을 입력해주세요.");
    $('.tel').focus();
    return false;
  }

  return true;
}
$(function() {
  //전체 체크 박스 클릭
  $('.allAgree').click(function () {
    if($('.allAgree').prop("checked")){
      $('.agreeDetail').prop("checked",true);
    }else {
      $('.agreeDetail').prop("checked",false);
    }
  });

  // 전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
  $('.agreeDetail').click(function() {
    if($("input[name='agreeDetail']:checked").length==4) {
      $('.allAgree').prop("checked",true);
    }else {
      $('.allAgree').prop("checked",false);
    }
  });
$('.double_check').click(function(){
	// 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
	$.ajax({
		type:"post",
		url: "../SignUpServlet",
		data:{"id": $('.create_signUp_email').val()},
		dataType:"json",
		success: function(result){
			if(result==0){
				alert("사용할 수 없는 아이디 입니다.");
			}else {
				alert("사용할 수 있는 아이디 입니다.");
			}
			
		},
		error: function(request,status,error){
             alert("code:"+request.status+"\n"
                   +"message:"+request.responseTest+"\n"
                   +"error:"+error
                   +"에러!!");
      }
	});
});
  $('.email_number').click(function(){
		// 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
		let email =$('.create_signUp_email').val();
		alert(email);
		$.ajax({
			type:"post",
			url: "../MailServlet",
			data:{"email": email},
			dataType:"json",
			success: function(result){
				random = result;
			},
			error: function(request,status,error){
	             alert("code:"+request.status+"\n"
	                   +"message:"+request.responseTest+"\n"
	                   +"error:"+error
	                   +"에러!!");
	      }
		});
})

	
	/*$('.email_number').click(function(){
		// 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
		let email =$('.create_signUp_email').val();
		alert(email);
		$.ajax({
			type:"post",
			url: "../mailServlet",
			data:{"email": email},
			dataType:"json",
			success: function(result){
				random = result;
			},
			error: function(request,status,error){
	             alert("code:"+request.status+"\n"
	                   +"message:"+request.responseTest+"\n"
	                   +"error:"+error
	                   +"에러!!");
	      }
		});
	});*/
  
});