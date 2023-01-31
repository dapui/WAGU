package com.wagu.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.wagu.connection.DBconnection;
import com.wagu.dto.CityBackgroundDTO;
import com.wagu.dto.WeatherDTO;
import com.wagu.dto.HotPlaceDTO;
import com.wagu.dto.BestSellerDTO;
import com.wagu.dto.ItemDTO;
import com.wagu.dto.HotelDTO;

public class TicketDAO {
	Connection conn = DBconnection.getConnection();
	
	// 상단 배경이미지
	public CityBackgroundDTO getCityBackground(String city) {
		CityBackgroundDTO ticketCity = null;
		String sql = "SELECT images FROM travel_area WHERE city = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, city);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String images = rs.getString("images");
				ticketCity = new CityBackgroundDTO(images);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return ticketCity;
	}
	
	// 날씨 api
	public WeatherDTO getWeather(String city) {
		WeatherDTO weather = new WeatherDTO();
		String sql = "SELECT latitude, longitude FROM travel_area WHERE city = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, city);
			ResultSet rs = pstmt.executeQuery();
			
			String latitude = "";	// 현재지역의 위도
			String longitude = "";	// 현재지역의 경도
			if(rs.next()) {
				latitude = rs.getString("latitude");
				longitude = rs.getString("longitude");
				
				weather.setLatitude(latitude);
				weather.setLongitude(longitude);
			}
			rs.close();
			pstmt.close();
			
			 //OpenAPI call하는 URL
            String urlStr = "http://api.openweathermap.org/data/2.5/weather?"
                          + "lat=" + latitude + "&lon=" + longitude
                          + "&appid=f03478f56748202d234058547ce8ed4d";
            URL url = new URL(urlStr);
            String line;
            String result="";

            //날씨 정보를 받아온다.
            BufferedReader bf = new BufferedReader(new InputStreamReader(url.openStream()));

            //버퍼에 있는 정보를 문자열로 변환.
            while((line=bf.readLine())!=null){
                result=result.concat(line);
//                System.out.println(line);
            }

            //문자열을 JSON으로 파싱
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(result);

            //지역 출력
            //System.out.println("지역 : " + jsonObj.get("name"));

            //날씨 출력
            JSONArray weatherArray = (JSONArray) jsonObj.get("weather");
            JSONObject obj = (JSONObject) weatherArray.get(0);
            //System.out.println("날씨 : "+obj.get("main"));
            //System.out.println("날씨 : "+obj.get("description"));
            weather.setWeather((String)(obj.get("description")));
            //System.out.println("아이콘 : "+obj.get("icon"));
            weather.setIcon((String)(obj.get("icon")));

            //온도 출력(절대온도라서 변환 필요)
            JSONObject mainArray = (JSONObject) jsonObj.get("main");
            double ktemp = Double.parseDouble(mainArray.get("temp").toString());
            double temp = ktemp-273.15;
            //System.out.printf("온도 : %.0f\n",temp);
            weather.setTemp(temp);

            bf.close();
			
		} catch(Exception e) {	
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return weather;
	}
	
	// 핫플레이스
	public ArrayList<HotPlaceDTO> getHotPlace() {
		String sql = "SELECT board.city, tr.images					"
				  + " FROM    (SELECT count(*) 상품개수, city	 		"
				  + "		  FROM tickets 							"
				  + "		  WHERE score >= 5 						"
				  + "		  GROUP BY city) board, travel_area tr	"
				  + " WHERE board.city = tr.city					"
				  + " ORDER BY 상품개수 DESC							";
		ArrayList<HotPlaceDTO> list = new ArrayList<HotPlaceDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String city = rs.getString("city");
				String images = rs.getString("images");
				
				list.add(new HotPlaceDTO(city, images));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 베스트 셀러 (액티비티)
	public ArrayList<BestSellerDTO> getBestSellerActivity(String city) {
		String sql = "SELECT content.*									"
				  + " FROM   (SELECT board.*							"
				  + "        FROM    (SELECT ticket_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "                FROM tickets						"
				  + "                WHERE city = '" + city + "') board	"
				  + "        ORDER BY best DESC, score DESC) content	"
				  + " ORDER BY review_count DESC						";
		ArrayList<BestSellerDTO> list = new ArrayList<BestSellerDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 3) { break; }
				int itemID = rs.getInt("ticket_id");
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("review_count");
				int price = rs.getInt("price");
				float discount = rs.getFloat("discount");
				String stringDiscountedPrice = rs.getString("string_discounted_price");
				
				list.add(new BestSellerDTO(itemID, images, videoUrl, available, goodsName, score, reviewCnt, price, discount, stringDiscountedPrice));	
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 베스트 셀러 (스파&원데이클래스&레스토랑&투어)
	public ArrayList<BestSellerDTO> getBestSellerItem(String city, String item) {
		String sql = "SELECT content.*									"
				  + " FROM   (SELECT board.*							"
				  + "        FROM    (SELECT ticket_id, category, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "                FROM tickets						"
				  + "                WHERE city = '" + city + "') board	"
				  + "        WHERE category Like '%" + item + "%' 		"
				  + "        ORDER BY best DESC, score DESC) content	"
				  + " ORDER BY review_count DESC						";
		
		ArrayList<BestSellerDTO> list = new ArrayList<BestSellerDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 3) { break; }
				int itemID = rs.getInt("ticket_id");
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("review_count");
				int price = rs.getInt("price");
				float discount = rs.getFloat("discount");
				String stringDiscountedPrice = rs.getString("string_discounted_price");
				
				list.add(new BestSellerDTO(itemID, images, videoUrl, available, goodsName, score, reviewCnt, price, discount, stringDiscountedPrice));	
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		 return list;
	}
	
	// 베스트 셀러 (레스토랑)
	public ArrayList<BestSellerDTO> getBestSellerRestaurant(String city) {
		String sql = "SELECT content.*									"
				  + " FROM   (SELECT board.*							"
				  + "        FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "                FROM restaurants					"
				  + "                WHERE city = '" + city + "') board	"
				  + "        ORDER BY best DESC, score DESC) content	"
				  + " ORDER BY review_count DESC						";
		ArrayList<BestSellerDTO> list = new ArrayList<BestSellerDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 3) { break; }
				int restaurantId = rs.getInt("restaurant_id");
				String images = rs.getString("images"); 
				String videoUrl =rs.getString("video_url");
				String available = rs.getString("available");
				String goodsName = rs.getString("goods_name");
				float score = rs.getFloat("score");
				int reviewCnt = rs.getInt("review_count");
				int price = rs.getInt("price");
				float discount = rs.getFloat("discount");
				String stringDiscountedPrice = rs.getString("string_discounted_price");
				
				list.add(new BestSellerDTO(restaurantId, images, videoUrl, available, goodsName, score, reviewCnt, price, discount, stringDiscountedPrice));	
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 상품 리스트 (액티비티)
	public ArrayList<ItemDTO> getCityActivityList(String city) {
		String sql = "SELECT content.*									"
				  + " FROM   (SELECT board.*							"
				  + "        FROM    (SELECT ticket_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "                FROM tickets						"
				  + "                WHERE city = '" + city + "') board	"
				  + "        ORDER BY best DESC, score DESC) content	"
				  + " ORDER BY review_count DESC						";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 7) { break; }
				int itemID = rs.getInt("ticket_id"); 
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
				++count;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {	
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 상품 리스트 (호텔)
	public ArrayList<HotelDTO> getCityHotelList(String city) {
		String sql = "SELECT board.* , (SELECT min(room_price_weekday) FROM hotels_room WHERE hotel_id = board.hotel_id) 최저가"
				  + " FROM    (SELECT images, name, location, hotel_id 								"
				  + "         FROM hotels															"
				  + "         WHERE grade = '최고'	AND city = '" + city + "'						"
				  + "         ORDER BY score DESC) board											";
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
	
	// 상품 리스트 (레스토랑)
	public ArrayList<ItemDTO> getCityRestaurantList(String city) {
		String sql = "SELECT content.*									"
				  + " FROM   (SELECT board.*							"
				  + "        FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "                FROM restaurants					"
				  + "                WHERE city = '" + city + "') board	"
				  + "        ORDER BY best DESC, score DESC) content	"
				  + " ORDER BY review_count DESC						";
		ArrayList<ItemDTO> list = new ArrayList<ItemDTO>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			int count = 0;
			while(rs.next()) {
				if(count == 7) { break; }
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
	public ArrayList<ItemDTO> getCategoryList(String city) {
		String sql = "SELECT board.*									"
				  + " FROM    (SELECT ticket_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "        FROM tickets								"
				  + "        WHERE city = '" + city + "'				"
				  + "        ORDER BY best DESC, score DESC) board		"
				  + " UNION												"
				  + " SELECT board.*									"
				  + " FROM    (SELECT restaurant_id, images, best, video_url, available, goods_name, score, price, discount, to_char(price - (NVL((price * discount),0)),'9,999,999') string_discounted_price, review_count"
				  + "        FROM restaurants							"
				  + "        WHERE city = '" + city + "'				"
				  + "        ORDER BY best DESC, score DESC) board		"
				  + " ORDER BY review_count DESC						";
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
