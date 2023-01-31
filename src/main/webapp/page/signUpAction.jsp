<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.wagu.dao.*"%>
<%@page import="com.wagu.dto.*"%>
<%
	request.setCharacterEncoding("UTF-8"); // post방식 한글깨짐 해결.
	String email = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	int birth = Integer.parseInt(request.getParameter("birth"));
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	// MemberDAO이용,
	MemberDAO mDao = new MemberDAO();
	
	// insert 수행.
	MemberDTO mdto = new MemberDTO();
	
	mdto.setEmail(email);
	mdto.setPw(pw);
	mdto.setName(name);
	mdto.setBirth(birth);
	mdto.setPhone1(phone1);
	mdto.setPhone2(phone2);
	mdto.setPhone3(phone3);
	mDao.memberInsert(mdto);
%> 
<script>
alert("회원가입이 되었습니다.");
location.href="Login.jsp"
</script>