package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.BestReviewDTO;

public class BestReviewDAO {
	Connection conn = DBconnection.getConnection();
	
	public ArrayList<BestReviewDTO> getBestReview() {
		String sql = "SELECT result.* 																			"
				  + " FROM    (SELECT rownum as seq, content.*													"
				  + "        FROM    (SELECT board.*															"
				  + "                FROM    (SELECT t.ticket_id id, t.images, t.goods_name, m.name, tr.write_date, tr.score	"
				  + "                        FROM tickets t, tickets_review tr, members m						"
				  + "                        WHERE t.ticket_id = tr.ticket_id									"
				  + "                        AND tr.member_id = m.member_id										"
				  + "                        AND tr.bestreview = 'Y'											"
				  + "                        UNION																"
				  + "                        SELECT r.restaurant_id id, r.images, r.goods_name, m.name, rr.write_date, rr.score		"
				  + "                        FROM restaurants r, restaurants_review rr, members m				"
				  + "                        WHERE r.restaurant_id = rr.restaurant_id							"
				  + "                        AND rr.member_id = m.member_id										"
				  + "                        AND rr.bestreview = 'Y'											"
				  + "                        ORDER BY score DESC) board											"
				  + "                ORDER BY write_date DESC) content											"
				  + "        ORDER BY seq) result																";
		ArrayList<BestReviewDTO> list = new ArrayList<BestReviewDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 10) { break; }
				int itemID = rs.getInt("id");
				String images = rs.getString("images"); 
				String goodsName = rs.getString("goods_name");
				String name = rs.getString("name");
				String writeDate = rs.getString("write_date");
				int score = rs.getInt("score");
				
				list.add(new BestReviewDTO(itemID, images, goodsName, name, writeDate, score));
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<BestReviewDTO> getBestReviewSearch(String search, int pageNumber) {
		int size = 10;	//  페이지 size:10
		int bnoStart = pageNumber * size - 9;		
		int bnoEnd = pageNumber * size;
		String sql = "SELECT result.* 																			"
				  + " FROM    (SELECT rownum as seq, content.*													"
				  + "        FROM    (SELECT board.*															"
				  + "                FROM    (SELECT t.ticket_id id, t.images, t.goods_name, m.name, tr.write_date, tr.score	"
				  + "                        FROM tickets t, tickets_review tr, members m						"
				  + "                        WHERE t.ticket_id = tr.ticket_id									"
				  + "                        AND tr.member_id = m.member_id										"
				  + "                        AND t.goods_name Like '%" + search + "%'							"
				  + "                        AND tr.bestreview = 'Y'											"
				  + "                        UNION																"
				  + "                        SELECT r.restaurant_id id, r.images, r.goods_name, m.name, rr.write_date, rr.score		"
				  + "                        FROM restaurants r, restaurants_review rr, members m				"
				  + "                        WHERE r.restaurant_id = rr.restaurant_id							"
				  + "                        AND rr.member_id = m.member_id										"
				  + "                        AND r.goods_name Like '%" + search + "%'							"
				  + "                        AND rr.bestreview = 'Y'											"	
				  + "                        ORDER BY score DESC) board											"
				  + "                ORDER BY write_date DESC) content											"
				  + "        ORDER BY seq) result																"
				  + " WHERE seq >= " + bnoStart + " AND seq <= " + bnoEnd										;
		ArrayList<BestReviewDTO> list = new ArrayList<BestReviewDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int itemID = rs.getInt("id");
				String images = rs.getString("images"); 
				String goodsName = rs.getString("goods_name");
				String name = rs.getString("name");
				String writeDate = rs.getString("write_date");
				int score = rs.getInt("score");
				list.add(new BestReviewDTO(itemID, images, goodsName, name, writeDate, score));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
}
