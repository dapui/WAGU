<%@page import="com.wagu.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<%
	String email = request.getParameter("email");
	String pw = request.getParameter("password");
	MemberDAO dao = new MemberDAO();
	if(dao.loginCheck(email,pw)==1) {
		session.setAttribute("loginEmail", email);	
%>
		<script>
			location.href="korailMain.jsp";
		</script> <!-- 로그인 성공 -->
<%		
	} else {
%>
		<script>
		alert("아이디 또는 비밀번호가 틀렸습니다.");
		location.href="Login.jsp";
		</script> <!-- 로그인 실패 -->
<%		
	}
%>
