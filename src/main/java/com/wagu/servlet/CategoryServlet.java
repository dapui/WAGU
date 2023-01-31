package com.wagu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String order="", available="", category="";
		int price = 0;
		try {
			order = request.getParameter("order");
			available = request.getParameter("available");
			category = request.getParameter("category");
			price = Integer.parseInt(request.getParameter("price"));
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		//System.out.println("POST가 들어옴. " + order + " / " + available + " / " + category + " / " + price);
		
		// 응답을 만듦:
		response.setContentType("application/json; charset=utf-8");	
		PrintWriter out = response.getWriter();	
		JSONArray jsonArrOrder = new JSONArray();	
		JSONArray jsonArrAvailable = new JSONArray();
		JSONArray jsonArrCategory = new JSONArray();
		JSONArray jsonArrPrice = new JSONArray();
		
		
		
		if(order == "") {
		
		} else {
			
		}
		
		if(available == "") {
			
		} else {
			
		}
		
		if(category == "") {
			
		} else {
			
		}
		
		if(price == 0) {
			
		} else {
			
		}
		
		JSONObject categoryObj = new JSONObject();
		categoryObj.put("order", jsonArrOrder);
		categoryObj.put("available", jsonArrAvailable);
		categoryObj.put("category", jsonArrCategory);
		categoryObj.put("price", jsonArrPrice);
		out.println(categoryObj);
		
		
	}

}
