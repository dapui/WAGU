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
import com.wagu.dto.SearchCityDTO;
import com.wagu.dto.SearchItemDTO;

@WebServlet("/SearchMainServlet")
public class SearchMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search="";
		try {
			search = request.getParameter("search");
		} catch(NumberFormatException e) {
			e.printStackTrace();
		}
		//System.out.println("POST가 들어옴. search: " + search);
		
		// 응답을 만듦:
		response.setContentType("application/json; charset=utf-8");	// 응답의 형식을 지정(명시적으로) ex. text/html
		PrintWriter out = response.getWriter();	// 응답을 쓸 수 있는 펜처럼 생각.
		JSONArray jsonArrCity = new JSONArray();	// JSONArray : ArrayList의 개념.
		JSONArray jsonArrActivity = new JSONArray();	// JSONArray : ArrayList의 개념.
		JSONArray jsonArrRestaurant = new JSONArray();	// JSONArray : ArrayList의 개념.
		SearchDAO searchDAO = new SearchDAO(); 
		
		if(search == "") {
			ArrayList<SearchCityDTO> seachDefaultCityList = searchDAO.getSearchCity();
			ArrayList<SearchItemDTO> seachDefaultActivityList = searchDAO.getSearchTicket(); 
			ArrayList<SearchItemDTO> seachDefaultRestaurantList = searchDAO.getSearchRestaurant();
			
			for(int i=0; i<seachDefaultCityList.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("city", seachDefaultCityList.get(i).getCity());
				jsonArrCity.add(obj);
			}
			for(int i=0; i<seachDefaultActivityList.size(); i++) {
				JSONObject obj = new JSONObject();	// JSONObject : dto의 개념.
				obj.put("itemID", seachDefaultActivityList.get(i).getItemID());
				obj.put("itemName", seachDefaultActivityList.get(i).getItemName());
				jsonArrActivity.add(obj);
				if(i == 10) {
					break;
				}
			}
			for(int i=0; i<seachDefaultRestaurantList.size(); i++) {
				JSONObject obj = new JSONObject();	// JSONObject : dto의 개념.
				obj.put("itemID", seachDefaultRestaurantList.get(i).getItemID());
				obj.put("itemName", seachDefaultRestaurantList.get(i).getItemName());
				jsonArrRestaurant.add(obj);
				if(i == 10) {
					break;
				}
			}
		} else {
			ArrayList<SearchCityDTO> seachCityList = searchDAO.getSearchCity(search); 
			ArrayList<SearchItemDTO> seachActivityList = searchDAO.getSearchTicket(search);
			ArrayList<SearchItemDTO> seachRestaurantList = searchDAO.getSearchRestaurant(search);
			
			for(SearchCityDTO dto : seachCityList) {
				JSONObject obj = new JSONObject();
				obj.put("city", dto.getCity());
				jsonArrCity.add(obj);
			}
			for(SearchItemDTO dto : seachActivityList) {
				JSONObject obj = new JSONObject();
				obj.put("itemID", dto.getItemID());
				obj.put("itemName", dto.getItemName());
				jsonArrActivity.add(obj);
			}
			for(SearchItemDTO dto : seachRestaurantList) {
				JSONObject obj = new JSONObject();
				obj.put("itemID", dto.getItemID());
				obj.put("itemName", dto.getItemName());
				jsonArrRestaurant.add(obj);
			}
		}
		
		JSONObject searchObj = new JSONObject();
		searchObj.put("searchCity", jsonArrCity);
		searchObj.put("searchItem", jsonArrActivity);
		searchObj.put("searchRestaurant", jsonArrRestaurant);
		out.println(searchObj);
	}

}
