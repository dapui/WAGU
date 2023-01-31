package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.SearchCityDTO;
import com.wagu.dto.SearchItemDTO;

public class SearchDAO {
	Connection conn = DBconnection.getConnection();
	
	// 검색창 [지역] 기본화면
	public ArrayList<SearchCityDTO> getSearchCity() {	
		String sql = "SELECT city FROM travel_area ORDER BY sequence";
		ArrayList<SearchCityDTO> list = new ArrayList<SearchCityDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String city = rs.getString("city");
				list.add(new SearchCityDTO(city));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	// 검색창 [액티비티] 기본화면
	public ArrayList<SearchItemDTO> getSearchTicket() {	
		String sql = "SELECT board.* , (SELECT count(*) FROM tickets_review WHERE ticket_id = board.ticket_id) 이용후기개수	" 
				  + " FROM	(SELECT goods_name, ticket_id 																"  
				  + " 		 FROM tickets																				" 
				  + "  		 WHERE score >= 5 OR best >= 100															" 	
				  + "  		 ORDER BY best DESC, score DESC) board														" 
				  + " ORDER BY 이용후기개수 DESC																			";
		ArrayList<SearchItemDTO> list = new ArrayList<SearchItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 10) { break; }
				int ticketID = rs.getInt("ticket_id");
				String goodsName = rs.getString("goods_name");
				
				list.add(new SearchItemDTO(ticketID, goodsName));
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	// 검색창 [레스토랑] 기본화면
	public ArrayList<SearchItemDTO> getSearchRestaurant() { 
		String sql = "SELECT board.* , (SELECT count(*) FROM restaurants_review WHERE restaurant_id = board.restaurant_id) 이용후기개수	" 
				  + " FROM	(SELECT goods_name, restaurant_id 																		"  
				  + " 		 FROM restaurants									 													" 
				  + "  		 WHERE score >= 5 OR best >= 100																		" 	
				  + "  		 ORDER BY best DESC, score DESC) board																	" 
				  + " ORDER BY 이용후기개수 DESC																						";
		ArrayList<SearchItemDTO> list = new ArrayList<SearchItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 10) { break; }
				int restaurantID = rs.getInt("restaurant_id");
				String goodsName = rs.getString("goods_name");
				
				list.add(new SearchItemDTO(restaurantID, goodsName));
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	// 검색창 [지역] 결과화면
	public ArrayList<SearchCityDTO> getSearchCity(String input) {	 // getSearchCity() 오버로딩
		String sql = "SELECT city 						"
				  + " FROM travel_area 					"
				  + " WHERE city Like '%" + input + "%' ";
		ArrayList<SearchCityDTO> list = new ArrayList<SearchCityDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String city = rs.getString("city");
				list.add(new SearchCityDTO(city));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	// 검색창 [액티비티] 결과화면
	public ArrayList<SearchItemDTO> getSearchTicket(String input) {	 
		String sql = "SELECT ticket_id, goods_name, score				"
				  + " FROM tickets 										"
				  + " WHERE goods_name Like '%" + input + "%'			"
				  + " ORDER BY score DESC NULLS LAST					";
		
		System.out.println(sql);
		ArrayList<SearchItemDTO> list = new ArrayList<SearchItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int itemID = rs.getInt("ticket_id");
				String goodsName = rs.getString("goods_name");
				list.add(new SearchItemDTO(itemID, goodsName));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 검색창 [레스토랑] 결과화면
	public ArrayList<SearchItemDTO> getSearchRestaurant(String input) {	 
		String sql = "SELECT restaurant_id, goods_name, score 			"
				  + " FROM restaurants									"
				  + " WHERE goods_name Like '%" + input + "%'			"
				  + " ORDER BY score DESC NULLS LAST					";
		
		System.out.println(sql);
		ArrayList<SearchItemDTO> list = new ArrayList<SearchItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int itemID = rs.getInt("restaurant_id");
				String goodsName = rs.getString("goods_name");
				list.add(new SearchItemDTO(itemID, goodsName));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 지역페이지 검색창 [상품] 기본화면
	public ArrayList<SearchItemDTO> getSearchByCity(String city) {
		String sql = "SELECT board.* , (SELECT count(*) FROM tickets_review WHERE ticket_id = board.ticket_id) 이용후기개수	"
				  + " FROM    (SELECT goods_name, ticket_id 															"
				  + "         FROM tickets																				"
				  + "         WHERE city = '" + city + "'																"
				  + "         AND score >= 5																			"
				  + "         ORDER BY best DESC, score DESC) board														"
				  + " UNION																								"
				  + " SELECT board.* , (SELECT count(*) FROM restaurants_review WHERE restaurant_id = board.restaurant_id) 이용후기개수	"
				  + " FROM    (SELECT goods_name, restaurant_id 														"
				  + "		  FROM restaurants																			"
				  + "		  WHERE city = '" + city + "'																"
				  + "		  AND score >= 5 																			"	
				  + "		  ORDER BY best DESC, score DESC) board														"
				  + " ORDER BY 이용후기개수 DESC																			";
		ArrayList<SearchItemDTO> list = new ArrayList<SearchItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 10) { break; }
				int itemID = rs.getInt("ticket_id");
				String goodsName = rs.getString("goods_name");
				
				list.add(new SearchItemDTO(itemID, goodsName));
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 지역페이지 검색창 [상품] 결과화면
	public ArrayList<SearchItemDTO> getSearchByCity(String city, String input) {	 // getSearchByCity() 오버로딩
		String sql = "SELECT ticket_id, goods_name, score				"
				  + " FROM tickets										"
				  + " WHERE city = '" + city + "'						"
				  + " AND goods_name Like '%" + input + "%'				"
				  + " UNION												"
				  + " SELECT restaurant_id, goods_name, score			"
				  + " FROM restaurants									"
				  + " WHERE city = '" + city + "'						"
				  + " AND goods_name Like '%" + input + "%'				"
				  + " ORDER BY score DESC								";
		ArrayList<SearchItemDTO> list = new ArrayList<SearchItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int ticketID = rs.getInt("ticket_id");
				String goodsName = rs.getString("goods_name");
				list.add(new SearchItemDTO(ticketID, goodsName));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
