package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.wagu.connection.DBconnection;
import com.wagu.dto.HotelDetailinfoDTO;
import com.wagu.dto.HotelMainDTO;
import com.wagu.dto.HotelRoomDTO;


public class HotelDAO {
	Connection conn = DBconnection.getConnection();
	
	public ArrayList<HotelMainDTO> getHotelList(String city) {
		ArrayList<HotelMainDTO> hotelList = new ArrayList<HotelMainDTO>();
		
		String sql = "SELECT * FROM hotels WHERE city LIKE ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, city+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int hotelId = rs.getInt("hotel_id");
				String hotelName = rs.getString("name");
				String hotelLocation = rs.getString("location");
				String hotelStar = rs.getString("star");
				String images = rs.getString("images");
				hotelList.add(new HotelMainDTO(city, hotelId, hotelName, hotelLocation, hotelStar, images, getHotelPrice(hotelId),""));
			}
			pstmt.close();
			rs.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return hotelList;
	}
	
	public int getHotelPrice(int hotelId) {
			String sql = "SELECT min(room_price_weekday) FROM hotels_room WHERE hotel_id=?";
			int price = 0;
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hotelId);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
					price = rs.getInt("min(room_price_weekday)");
				}
				
				pstmt.close();
				rs.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return price;
	}
	
	public ArrayList<HotelMainDTO> getHotelDetail(int parahotelId) {
		ArrayList<HotelMainDTO> hotelDetail = new ArrayList<HotelMainDTO>();
		
		String sql = "SELECT * FROM hotels WHERE hotel_id=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parahotelId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String city = rs.getString("city");
				String hotelName = rs.getString("name");
				String hotelLocation = rs.getString("location");
				String hotelStar = rs.getString("star");
				String images = rs.getString("images");
				String details = rs.getString("details");
				hotelDetail.add(new HotelMainDTO(city, parahotelId, hotelName, hotelLocation, hotelStar, images, 0, details));
			}
			pstmt.close();
			rs.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return hotelDetail;
	}

	public ArrayList<HotelDetailinfoDTO> getHotelInfo(int parahotelId){
		ArrayList<HotelDetailinfoDTO> hotelDetailinfo = new ArrayList<HotelDetailinfoDTO>();
		
		String sql = "SELECT amenities FROM hotels WHERE hotel_id=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parahotelId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String amenities = rs.getString("amenities");
				hotelDetailinfo.add(new HotelDetailinfoDTO(amenities));
			}
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return hotelDetailinfo;
	}
	
	
	public ArrayList<HotelRoomDTO> getRoomList(int parahotelId){
		ArrayList<HotelRoomDTO> roomlist = new ArrayList<HotelRoomDTO>();
		String sql = "SELECT * FROM hotels_room WHERE hotel_id=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, parahotelId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String room = rs.getString("room");
				int room_price_weekday = rs.getInt("room_price_weekday");
				int room_price_weekend = rs.getInt("room_price_weekend");
				String description = rs.getString("description");
				String image = rs.getString("image");
				roomlist.add(new HotelRoomDTO(room,room_price_weekday,room_price_weekend,description,image));
			}
			pstmt.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return roomlist;
		
	}
	
	
	
	
	
	
}

















