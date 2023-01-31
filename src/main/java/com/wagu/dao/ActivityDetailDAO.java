package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.ActivityDetailBottomDTO;
import com.wagu.dto.ActivityDetailInfoDTO;
import com.wagu.dto.ActivityDetailOptionDTO;
import com.wagu.dto.ActivityDetailOptionSubDTO;
import com.wagu.dto.ActivityDetailTopDTO;

public class ActivityDetailDAO {
	Connection conn = DBconnection.getConnection(); 
	
	public ArrayList<ActivityDetailTopDTO> detailPageTop(int itemID) throws Exception{
		ArrayList<ActivityDetailTopDTO> detailTop = new ArrayList<ActivityDetailTopDTO>();
		
		String sql = "SELECT ticket_id,images,best,video_url,city,goods_name,category,price,discount,score,available,coupon" + 
				" FROM tickets" + 
				" WHERE ticket_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, itemID);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			int ticket_id = rs.getInt("ticket_id");
			String images = rs.getString("images");
			int best = rs.getInt("best");
			String video_url = rs.getString("video_url");
			String city = rs.getString("city");
			String goods_name = rs.getString("goods_name");
			String category = rs.getString("category");
			int price = rs.getInt("price");
			float discount = rs.getFloat("discount");
			float score = rs.getFloat("score");
			String available = rs.getString("available");
			int coupon = rs.getInt("coupon");
			
			detailTop.add(new ActivityDetailTopDTO(ticket_id, images, best, video_url, city, goods_name, category, price, discount, score, available, coupon));
		}
		
		rs.close();
		pstmt.close();
		
		return detailTop;
	}
	
	public ArrayList<ActivityDetailInfoDTO> detailPageInfo(int itemID) throws Exception {
		ArrayList<ActivityDetailInfoDTO> topInfo = new ArrayList<ActivityDetailInfoDTO>();
		
		String sql="SELECT icon,content,ticket_detail_info_id FROM tickets_details_info WHERE ticket_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, itemID);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int ticket_detail_info_id = rs.getInt("ticket_detail_info_id");
			String icon = rs.getString("icon");
			String content = rs.getString("content");
			
			topInfo.add(new ActivityDetailInfoDTO(ticket_detail_info_id, icon, content));
		}
		rs.close();
		pstmt.close();
		
		return topInfo;
	}
	
	public ArrayList<ActivityDetailBottomDTO> detailPageBottom(int itemID) throws Exception {
		ArrayList<ActivityDetailBottomDTO> detailBottom = new ArrayList<ActivityDetailBottomDTO>();
		
		String sql = "SELECT ticket_id, checks, point, score, best_review,review_count,program,include,exclude,how_to_use,detail_notice,caution,refund,location,longitude,latitude" + 
				" FROM tickets" + 
				" WHERE ticket_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, itemID);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			int ticket_id = rs.getInt("ticket_id");
			String checks = rs.getString("checks");
			String point = rs.getString("point");
			float score = rs.getFloat("score");
			int best_review = rs.getInt("best_review");
			int review_count = rs.getInt("review_count");
			String program = rs.getString("program");
			String include = rs.getString("include");
			String exclude = rs.getString("exclude");
			String how_to_use = rs.getString("how_to_use");
			String detail_notice = rs.getString("detail_notice");
			String caution = rs.getString("caution");
			String refund = rs.getString("refund");
			String location = rs.getString("location");
			String longitude = rs.getString("longitude");
			String latitude = rs.getString("latitude");
			
			detailBottom.add(new ActivityDetailBottomDTO(ticket_id, checks,point,score, best_review,review_count, program, include, exclude, how_to_use, detail_notice, caution, refund,location,longitude, latitude));
		}
		rs.close();
		pstmt.close();
		
		return detailBottom;
	}
	
	public ArrayList<ActivityDetailOptionDTO> detailOption(int itemID) throws Exception {
		ArrayList<ActivityDetailOptionDTO> detailOption = new ArrayList<ActivityDetailOptionDTO>();
	
	String sql ="SELECT ticket_opt_id, title, tko.price, tko.content\r\n" + 
			"FROM tickets t, tickets_option tko\r\n" + 
			"WHERE t.ticket_id = ?\r\n" + 
			"AND t.ticket_id=tko.ticket_id";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, itemID);
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
		int ticketOptId = rs.getInt("ticket_opt_id");
		String title = rs.getString("title");
		int price = rs.getInt("price");
		String content = rs.getString("content");
		
		detailOption.add(new ActivityDetailOptionDTO(ticketOptId, title, price, content));
	}
	
	rs.close();
	pstmt.close();
	return detailOption;
	}
	
	public ArrayList<ActivityDetailOptionSubDTO> detailOptionSub(int itemID) throws Exception {
		ArrayList<ActivityDetailOptionSubDTO> optionSub = new ArrayList<ActivityDetailOptionSubDTO>();
		
		String sql = "SELECT tos.ticket_sub_id, tos.ticket_opt_id, tos.content, tos.price\r\n" + 
				"FROM tickets_option tko, tickets_option_sub tos\r\n" + 
				"WHERE ticket_id = ?\r\n" + 
				"AND tko.ticket_opt_id = tos.ticket_opt_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, itemID);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			int ticketSubId = rs.getInt("ticket_sub_id");
			int ticketOptId = rs.getInt("ticket_opt_id");
			String content = rs.getString("content");
			int price = rs.getInt("price");
			
			optionSub.add(new ActivityDetailOptionSubDTO(ticketSubId, ticketOptId, content, price));
		}
		
		rs.close();
		pstmt.close();
		return optionSub;
	}
}
