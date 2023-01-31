package com.wagu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.wagu.dao.WishDAO;
import com.wagu.dto.WishDTO;

@WebServlet("/WishItemServlet")
public class WishItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberID = 0, itemID = 0;
		try {
			memberID = Integer.parseInt(request.getParameter("memberID"));
			itemID = Integer.parseInt(request.getParameter("itemID"));
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		WishDAO wishDAO = new WishDAO(); 
		ArrayList<WishDTO> checkWishList = wishDAO.getMyWishList(memberID);
		String message = "";
		
		if(!wishDAO.checkMyWishList(memberID, itemID)) {			// 위시리스트에 상품이 없을 경우.
			wishDAO.addWishItem(memberID, itemID);
			message = "위시리스트에 추가되었습니다.";
		} else {
			for(int i=0; i<checkWishList.size(); i++) {				// 위시리스트에 이미 상품이 있을 경우.
				if(checkWishList.get(i).getGoodsID() == itemID) {
					wishDAO.deleteWishItem(itemID);
					message = "위시리스트에서 삭제되었습니다.";
				}
			}
		}
		
		JSONObject obj = new JSONObject();	
		obj.put("message", message);	
		out.println(obj);
		
		
	}

}
