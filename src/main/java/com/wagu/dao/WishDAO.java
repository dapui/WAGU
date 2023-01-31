package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.HotelDTO;
import com.wagu.dto.ItemDTO;
import com.wagu.dto.WishDTO;

public class WishDAO {
	Connection conn = DBconnection.getConnection();
	
	// 내 위시리스트(테이블) 목록.
	public ArrayList<WishDTO> getMyWishList(int memberID) {
		String sql = "SELECT member_id, goods_id, status	"
	  			  + " FROM wish_list 						"
	  			  + " WHERE member_id = " + memberID		; 
		ArrayList<WishDTO> list = new ArrayList<WishDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int memberId = rs.getInt("member_id");
				int goodsId = rs.getInt("goods_id");
				String status = rs.getString("status"); 
				
				list.add(new WishDTO(memberId, goodsId, status));	
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 내 위시리스트(아이템) 목록.
	public ArrayList<ItemDTO> getMyWishItemList(int itemID) {
		String sql = "SELECT board.*										"
				  + " FROM    (SELECT ticket_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "        FROM tickets									"
				  + "        WHERE ticket_id = " + itemID + ") board		"
				  + " UNION													"
				  + " SELECT board.*										"
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "        FROM restaurants								"
				  + "        WHERE restaurant_id = " + itemID + ") board	";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int activityID = rs.getInt("ticket_id"); 
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("review_count");
				int price = rs.getInt("price");
				float discount = rs.getFloat("discount");
				String stringDiscountedPrice = rs.getString("string_discounted_price");
				
				list.add(new ItemDTO(activityID, images, videoUrl, available, goodsName, score, reviewCnt, price, discount, stringDiscountedPrice));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	// 내 위시리스트(호텔) 목록.
	public ArrayList<HotelDTO> getMyWishHotelList(int itemID) {
		String sql = "SELECT board.* , (SELECT min(room_price_weekday) FROM hotels_room WHERE hotel_id = board.hotel_id) 최저가"
				  + " FROM	(SELECT hotel_id, images, name, location	"
				  + "		FROM hotels) board							"
				  + " WHERE hotel_id = " + itemID 						;
		ArrayList<HotelDTO> list = new ArrayList<HotelDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int hotelID = rs.getInt("hotel_id"); 
				String images = rs.getString("images"); 
				String name =rs.getString("name");
				String location = rs.getString("location");
				int lowestPrice = rs.getInt("최저가");
				
				list.add(new HotelDTO(hotelID, images, name, location, lowestPrice));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 내 위시리스트에 선택한 상품이 이미 있는지 확인.
	public boolean checkMyWishList(int memberID, int itemID) {
		String sql = "SELECT status		"
	  			  + " FROM wish_list 	"
	  			  + " WHERE member_id = " + memberID
	  			  + " AND goods_id = " + itemID; 
		ArrayList<WishDTO> list = new ArrayList<WishDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String status = rs.getString("status");
				if(status.equals("Y")) {
					return true;
				}
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	// 내 위시리스트에서 상품 제거.
	public void deleteWishItem(int itemID) {
		String sql = "DELETE FROM wish_list WHERE goods_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemID);
			pstmt.executeUpdate();
			//System.out.println("위시리스트에 추가되었습니다.");
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
	}
	
	
	// 위시리스트에 상품 추가.
	public void addWishItem(int memberID, int itemID) {
		String sql = "INSERT INTO wish_list(wish_id, goods_id, member_id, status)	"
				  + " VALUES(?, ?, ?, 'Y')											";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			if(!checkMyWishList(itemID, itemID)) {
				pstmt.setInt(1, getNextBno());
				pstmt.setInt(2, itemID);
				pstmt.setInt(3, memberID);
				pstmt.executeUpdate();
				//System.out.println("위시리스트에 추가되었습니다.");
			}
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
	}
	
	// getNextBno() : 이번에 insert되는 글의 bno값을 리턴. (currval+1)
	public int getNextBno() {
		String sql = "SELECT MAX(wish_id)+1 FROM wish_list";
		int ret = 0;
		
		PreparedStatement pstmt;
		ResultSet rs;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ret = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ret;
	}
	
	
}
