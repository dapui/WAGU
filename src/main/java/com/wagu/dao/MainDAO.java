package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.HotelDTO;
import com.wagu.dto.ItemDTO;

public class MainDAO {
	Connection conn = DBconnection.getConnection();
	
	// 제주 상품 리스트
	public ArrayList<ItemDTO> getJejuList() {
		String sql = "SELECT board.* 										"
				  + " FROM    (SELECT ticket_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count "
				  + "    	  FROM tickets 									"
				  + "    	  WHERE city = '제주도' AND score IS NOT NULL		"
				  + "    	  ORDER BY best DESC, score DESC) board			"
				  + " UNION													"
				  + " SELECT board.* 										"
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count "
				  + "    	  FROM restaurants 								"
				  + "    	  WHERE city = '제주도' AND score IS NOT NULL		"
				  + "    	  ORDER BY best DESC, score DESC) board			"
				  + " ORDER BY review_count DESC								";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 7) { break; }
				int itemId = rs.getInt("ticket_id");
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("review_count");
				int price = rs.getInt("price");
				float discount = rs.getFloat("discount");
				String stringDiscountedPrice = rs.getString("string_discounted_price");
				
				list.add(new ItemDTO(itemId, images, videoUrl, available, goodsName, score, reviewCnt, price, discount, stringDiscountedPrice));	
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 티켓 리스트
	public ArrayList<ItemDTO> getTicketList() {
		String sql = "SELECT board.* 									" 
				  + " FROM    (SELECT ticket_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"  
				  + " 		  FROM tickets								" 
				  + "  		  WHERE score >= 4 OR best >= 100			" 	
				  + "  		  ORDER BY best DESC, score DESC) board		" 
				  + " ORDER BY review_count DESC						";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 7) { break; }
				int itemId = rs.getInt("ticket_id");
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("review_count");
				int price = rs.getInt("price");
				float discount = rs.getFloat("discount");
				String stringDiscountedPrice = rs.getString("string_discounted_price");
				
				list.add(new ItemDTO(itemId, images, videoUrl, available, goodsName, score, reviewCnt, price, discount, stringDiscountedPrice));	
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 호텔 리스트
	public ArrayList<HotelDTO> getHotelList() {
		String sql = "SELECT board.* , (SELECT min(room_price_weekday) FROM hotels_room WHERE hotel_id = board.hotel_id) 최저가" 
				  + " FROM    (SELECT images, name, location, hotel_id	"  
				  + " 		  FROM hotels								" 
				  + "  		  WHERE grade = '최고'						" 	
				  + "  		  ORDER BY score DESC) board				";
		ArrayList<HotelDTO> list = new ArrayList<HotelDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 7) { break; }
				int hotelID = rs.getInt("hotel_id"); 
				String images = rs.getString("images"); 
				String name = rs.getString("name");
				String location = rs.getString("location");
				int lowestPrice = rs.getInt("최저가");
				
				list.add(new HotelDTO(hotelID, images, name, location, lowestPrice));		
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 레스토랑 리스트
	public ArrayList<ItemDTO> getRestaurantList() {
		String sql = "SELECT board.* 									" 
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"  
				  + " 		  FROM restaurants							" 
				  + "  		  WHERE score >= 4 OR best >= 100			" 	
				  + "  		  ORDER BY best DESC, score DESC) board		" 
				  + " ORDER BY review_count DESC							";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 7) { break; }
				int itemId = rs.getInt("restaurant_id");
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("review_count");
				int price = rs.getInt("price");
				float discount = rs.getFloat("discount");
				String stringDiscountedPrice = rs.getString("string_discounted_price");
				
				list.add(new ItemDTO(itemId, images, videoUrl, available, goodsName, score, reviewCnt, price, discount, stringDiscountedPrice));
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	
}
