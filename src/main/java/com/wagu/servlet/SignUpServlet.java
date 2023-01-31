package com.wagu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wagu.dao.MemberDAO;

// 사용자가 JSP에서 id 값 입력 시 그 값이 서블릿으로 이동하고 서블릿에서는 dao클래스의 메소드를 통해 처리합니다.
// 처리한 결과는 다시 jsp를 통해 사용자에게 보이게 됩니다.

// id 중복 확인 서블릿
@WebServlet("/signUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // post이기 때문에 인코딩
		
		String userId = request.getParameter("id");
		
		PrintWriter out = response.getWriter();
		MemberDAO mDao = new MemberDAO();
		
		int cnt = mDao.checkId(userId);
		
		out.print(cnt);
	}

}