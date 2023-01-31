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

import com.wagu.dao.KorailTimeTableDAO;

@WebServlet("/SeatsReservedServlet")
public class SeatsReservedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startDate = request.getParameter("startDate");
		int trainType = Integer.parseInt(request.getParameter("trainType"));
		int ho = Integer.parseInt(request.getParameter("ho"));
		String startStation = request.getParameter("startStation");
		String arriveStation = request.getParameter("arriveStation");

		System.out.println("요청 들어옴 - startDate/trainType/ho/startStation/arriveStation : " + startDate + "/" + trainType + "/"
						+ ho + "/" + startStation + "/" + arriveStation);
		
		KorailTimeTableDAO dao = new KorailTimeTableDAO();
		ArrayList<String> listSeatsReseved = null;
		try {
			// ex. ("2023-01-19", 1312, 1, "대전", "서울");
			listSeatsReseved = dao.getSeatsAvailable(startDate, trainType, ho, startStation, arriveStation);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		System.out.println("listSeatsReserved : " + listSeatsReseved);		
		 
		// 응답을 만듦:
		response.setContentType("application/json"); //응답의 형식 지정(명시적으로)
		PrintWriter out = response.getWriter();
		
		JSONObject objPrint = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		for(String seat : listSeatsReseved) {
			JSONObject dataInner = new JSONObject();
			dataInner.put("seat", seat);
			jsonArray.add(dataInner);
		}
		objPrint.put("result", jsonArray);
		out.println(objPrint);
	}

}
