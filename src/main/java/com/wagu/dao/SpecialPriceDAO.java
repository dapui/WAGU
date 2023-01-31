package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.ItemDTO;

public class SpecialPriceDAO {
	Connection conn = DBconnection.getConnection();
	
	// 할인률이 60% 이상인 상품을 score순서대로 정렬 후, 이용후기 순으로 재정렬하여 노출.
		public ArrayList<ItemDTO> getTicketSpecialPrice() {
			String sql = "SELECT board.*, (SELECT count(*) FROM tickets_review WHERE ticket_id = board.ticket_id) 이용후기개수				"
					  + " FROM    (SELECT ticket_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price"
					  + "        FROM tickets																							"
					  + "        WHERE discount >= 0.6																					"
					  + "        ORDER BY score) board																					"
					  + " UNION																											"
					  + " SELECT board.*, (SELECT count(*) FROM restaurants_review WHERE restaurant_id = board.restaurant_id) 이용후기개수	"
					  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price	"
					  + "        FROM restaurants																						"
					  + "        WHERE discount >= 0.6																					"
					  + "        ORDER BY score) board																					"
					  + " ORDER BY 이용후기개수 DESC																						";
			ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					int itemID = rs.getInt("ticket_id");
					String images = rs.getString("images"); 
					String videoUrl =rs.getString("video_url");
					String available = rs.getString("available");
					String goodsName = rs.getString("goods_name");
					float score = rs.getFloat("score");
					int reviewCnt = rs.getInt("이용후기개수");
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
	
	// 할인된 가격이 1만원대이고, discount가 null값이 아니면서 score가 5점이상인 상품을 이용후기가 많은 순서대로 노출.
	public ArrayList<ItemDTO> getTicket10000() {
		String sql = "SELECT board.*, (SELECT count(*) FROM tickets_review WHERE ticket_id = board.ticket_id) 이용후기개수				"
				  + " FROM 	  (SELECT ticket_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price"
				  + "         FROM tickets																							"
				  + "         WHERE (price - (price * discount)) BETWEEN 10000 AND 19999											"
				  + "         AND discount IS NOT NULL																				"
				  + "         AND score >= 5) board																					"
				  + " UNION																											"
				  + " SELECT board.*, (SELECT count(*) FROM restaurants_review WHERE restaurant_id = board.restaurant_id) 이용후기개수	"
				  + " FROM	(SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price"
				  + "         FROM restaurants																						"
				  + "         WHERE (price - (price * discount)) BETWEEN 10000 AND 19999											"
				  + "         AND discount IS NOT NULL																				"
				  + "         AND score >= 5) board																					"
				  + " ORDER BY 이용후기개수 DESC																						";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int itemID = rs.getInt("ticket_id");
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("이용후기개수");
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
