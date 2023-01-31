package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.ItemDTO;

public class RestaurantDAO {
	Connection conn = DBconnection.getConnection();
	
	// 고객 반응이 가장 좋은
	public ArrayList<ItemDTO> getHotRestaurantList() {
		String sql = "SELECT board.* 									" 
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"  
				  + " 		  FROM restaurants							" 
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
	
	// 럭셔리 호텔에서
	public ArrayList<ItemDTO> getHotelRestaurantList() {
		String sql = "SELECT board.* 							" 
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"  
				  + " 		  FROM restaurants					" 
				  + "		  WHERE goods_name Like '%호텔%'		" 	
				  + "  		  ORDER BY score DESC) board		" 
				  + " ORDER BY review_count DESC				";
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
	
	// 제주의 맛 
	public ArrayList<ItemDTO> getJejuRestaurantList() {
		String sql = "SELECT board.* 										"
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "    	  FROM restaurants 								"
				  + "    	  WHERE city = '제주도' AND score IS NOT NULL		"
				  + "    	  ORDER BY best DESC, score DESC) board			"
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
	
	
	// 부산에서 뭐먹지?
	public ArrayList<ItemDTO> getBusanRestaurantList() {
		String sql = "SELECT board.* 									"
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "    	  FROM restaurants 							"
				  + "    	  WHERE goods_name Like '%부산%'				"
				  + "    	  ORDER BY best DESC, score DESC) board		"
				  + " ORDER BY review_count DESC						";
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
	
	// 카테고리
	public ArrayList<ItemDTO> getCategoryRestaurantList() {
		String sql = "SELECT board.*									"
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "        FROM restaurants							"
				  + "        ORDER BY best DESC, score DESC) board		"
				  + " ORDER BY review_count DESC						";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int itemID = rs.getInt("restaurant_id"); 
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("review_count");
				int price = rs.getInt("price");
				float discount = rs.getFloat("discount");
				String stringDiscountedPrice = rs.getString("string_discounted_price");
				
				list.add(new ItemDTO(itemID, images, videoUrl, available, goodsName, score, reviewCnt, price, discount, stringDiscountedPrice));	
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
		
		
	
}
