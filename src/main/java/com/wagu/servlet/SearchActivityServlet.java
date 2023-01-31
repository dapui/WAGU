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

import com.wagu.dao.SearchDAO;
import com.wagu.dto.SearchItemDTO;

@WebServlet("/SearchActivityServlet")
public class SearchActivityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String city="", search="";
		try {
			city = request.getParameter("city");
			search = request.getParameter("search");
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		//System.out.println("POST가 들어옴. city: " + city + "search: " + search);
		
		// 응답을 만듦:
		response.setContentType("application/json; charset=utf-8");	// 응답의 형식을 지정(명시적으로) ex. text/html
		PrintWriter out = response.getWriter();	// 응답을 쓸 수 있는 펜처럼 생각.
		JSONArray jsonArr = new JSONArray();	// JSONArray : ArrayList의 개념.
		SearchDAO searchDAO = new SearchDAO();
		
		ArrayList<SearchItemDTO> seachDefaultList = searchDAO.getSearchByCity(city); 
		ArrayList<SearchItemDTO> seachItemList = searchDAO.getSearchByCity(city,search); 
		
		if(search == "") {
			for(int i=0; i<seachDefaultList.size(); i++) {
				JSONObject obj = new JSONObject();	// JSONObject : dto의 개념.
				obj.put("itemID", seachDefaultList.get(i).getItemID());
				obj.put("itemName", seachDefaultList.get(i).getItemName());
				jsonArr.add(obj);
				if(i == 10) {
					break;
				}
			}
		} else {
			for(SearchItemDTO dto : seachItemList) {
				JSONObject obj = new JSONObject();
				obj.put("itemID", dto.getItemID());
				obj.put("itemName", dto.getItemName());
				jsonArr.add(obj);
			}
		}
		JSONObject searchObj = new JSONObject();
		searchObj.put("searchItem", jsonArr);
		out.println(searchObj);
		
		
	}
	
	

	

}
