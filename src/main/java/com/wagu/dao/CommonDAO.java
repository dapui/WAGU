package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.CityDTO;

public class CommonDAO {
	Connection conn = DBconnection.getConnection();
	
	// 지역 리스트
	public ArrayList<CityDTO> getCityMenu() {
		String sql = "SELECT * FROM travel_area ORDER BY sequence";
		ArrayList<CityDTO> list = new ArrayList<CityDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String city = rs.getString("city");
				String images = rs.getString("images");
				String keyword = rs.getString("keyword");
				String title = rs.getString("title");
				String content = rs.getString("content");
				list.add(new CityDTO(city, images, keyword, title, content));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
