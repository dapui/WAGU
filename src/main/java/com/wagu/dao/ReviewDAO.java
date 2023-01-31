package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.PhotoReviewDTO;
import com.wagu.dto.PhototopDTO;
import com.wagu.dto.ReviewMainDTO;

public class ReviewDAO {
	Connection conn = DBconnection.getConnection();
	
	public ArrayList<ReviewMainDTO> showReviewList(int itemID){
		ArrayList<ReviewMainDTO> reviewList = new ArrayList<ReviewMainDTO>();
		
		String sql = "SELECT ticket_review_id reviewid, ticket_id itemid, member_id, write_date, bestreview, score, content, images FROM tickets_review WHERE ticket_id="+itemID+" UNION" 
				+" SELECT restaurant_review_id reviewid, restaurant_id itemid, member_id, write_date, bestreview, score, content, images FROM restaurants_review WHERE restaurant_id="+itemID+" ORDER BY bestreview DESC, write_date DESC";
//				+ " ORDER BY bestreview DESC, write_date DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int reviewID = rs.getInt("reviewid");
				int itemId = itemID;
				int memberID = rs.getInt("member_id");
				String writeDate = rs.getString("write_date");
				String bestreview = rs.getString("bestreview");
				int score = rs.getInt("score");
				String content = rs.getString("content");
//				String images = rs.getString("images");
//				int likes = rs.getInt("likes");
//				String comments = rs.getString("comments");
//				String commentDate = rs.getString("comment_date");
				reviewList.add(new ReviewMainDTO(reviewID, itemID, memberID, writeDate, bestreview, score, content));
				
			}
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return reviewList;
	
	}
	
	public ArrayList<PhotoReviewDTO> showPhoto(int itemID){
		ArrayList<PhotoReviewDTO> photoList = new ArrayList<PhotoReviewDTO>();
		String sql = "SELECT * FROM (SELECT images, ticket_review_id review_id, write_date FROM tickets_review WHERE images IS NOT NULL AND ticket_id="+itemID+" UNION ALL"
					+ " SELECT images, restaurant_review_id review_id, write_date FROM restaurants_review WHERE images IS NOT NULL AND restaurant_id="+itemID+") ORDER BY write_date DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int reviewID = rs.getInt("review_id");
				String images = rs.getString("images");
				photoList.add(new PhotoReviewDTO(itemID, reviewID, images));
			}
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return photoList;
		
	}
	
	public ArrayList<PhototopDTO> showtopPhoto(int itemID){
		ArrayList<PhototopDTO> phototopList = new ArrayList<PhototopDTO>();
		String sql = "SELECT * FROM (SELECT images, ticket_review_id review_id, write_date FROM tickets_review WHERE images IS NOT NULL AND ticket_id="+itemID+" UNION ALL"
					+ " SELECT images, restaurant_review_id review_id, write_date FROM restaurants_review WHERE images IS NOT NULL AND restaurant_id="+itemID+") ORDER BY write_date DESC";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int reviewID = rs.getInt("review_id");
				String images = rs.getString("images");
				String[] imageArr = images.split("___");
				if(imageArr.length>1) {
					for(int i=0; i<=imageArr.length-1; i++) {
						phototopList.add(new PhototopDTO(itemID, reviewID, imageArr[i]));
					}
				} else {
					phototopList.add(new PhototopDTO(itemID, reviewID, imageArr[0]));
				}
			}
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return phototopList;
		
	}
	

}








