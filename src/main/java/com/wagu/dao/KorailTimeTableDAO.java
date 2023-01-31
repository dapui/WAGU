package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TreeSet;

import com.wagu.connection.DBconnection;
import com.wagu.dto.KorailTimeTableDTO;

public class KorailTimeTableDAO {
	public ArrayList<KorailTimeTableDTO> listTimetable(String startStation, String arriveStation, int adult, int child, String order){
		String strOrderBy = "";
		if(order==null || "출발시간순".equals(order)) {
			strOrderBy = "to_date(start_time, 'hh24:mi')";
		}else if("도착시간순".equals(order)) {
			strOrderBy = "to_date(arrive_time, 'hh24:mi')";
		}else if("소요시간순".equals(order)) {
			strOrderBy = "to_date(taken_time, 'hh24:mi')";
		}
		
		Connection conn = DBconnection.getConnection();
		
		ArrayList<KorailTimeTableDTO> list = new ArrayList<KorailTimeTableDTO>();
		
		String sql = "SELECT tp.train_num, train_type, start_station, terminal_station, start_time, arrive_time,"
				+ "	FLOOR(((to_date(arrive_time, 'hh24:mi')-to_date(start_time, 'hh24:mi'))*24*60)/60) || ':' || MOD(((to_date(arrive_time, 'hh24:mi')-to_date(start_time, 'hh24:mi'))*24*60),60) taken_time,"
				+ "	adultprice, childprice"
				+ "	FROM train_price tp, train_number tn"
				+ "	WHERE tn.train_num = tp.train_num AND start_station = ? AND terminal_station = ?"
				+ " ORDER BY " + strOrderBy;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startStation);
			pstmt.setString(2, arriveStation);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String trainType = rs.getString("train_type");
				int trainNum = rs.getInt("train_num");
				String startTime = rs.getString("start_time"); // db에 있는 출발시간 ex) 8:0
				String arriveTime = rs.getString("arrive_time"); // db에 있는 도착시간 8:0
				
				// 소요시간 = 도착시간- 출발시간
				String timeTaken = "";
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
				
				//요청시간을 Date로 parsing 후 time 가져오기
				Date dateStartTime = sdf.parse(startTime);
				Date dateTerminalTime = sdf.parse(arriveTime);
				long startTime2 = dateStartTime.getTime();
				long arriveTime2 = dateTerminalTime.getTime();
				long difference = arriveTime2-startTime2; // 60000ms=60초=1분
//System.out.println("difference : " + difference);	 			
				if(difference<0) {
					difference += 24 * 60 * 60 * 1000;		
				}
				int minutes = (int)(difference/60000);
				int hours = 0;
				while(minutes>=60) {
					hours++;
					minutes-=60;	
				}
				timeTaken = hours + "시간" + minutes + "분";
				int adultPrice = rs.getInt("adultPrice");
				int childPrice = rs.getInt("childPrice");
				int sumPrice = adult*adultPrice + child*childPrice;
				list.add(new KorailTimeTableDTO(trainType, trainNum, startTime,  arriveTime, timeTaken, sumPrice)); 
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
	// 출발역으로 도착역가져오기
	public ArrayList<String> getArriveStation(String startStation) throws Exception {
		ArrayList<String> listTerminalStation = new ArrayList<String>();
		
		Connection conn = DBconnection.getConnection();
		
		String sql = "SELECT terminal_station From train_price WHERE start_station=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, startStation);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			listTerminalStation.add(rs.getString("terminal_station"));
		}
		rs.close();
		pstmt.close();
		conn.close();
		return listTerminalStation;
	}
	/////////////////////////////////////////////////////////////////////////////////
	private int[] findTimetableId(int trainNum, String strStartStation,	String strTerminalStation /* , String strStartTime */) throws Exception{
		// trainNum:1312, strStartStation:"대전", strTerminalStation:"서울", strStartTime:"5:28"
		Connection conn = DBconnection.getConnection();
		
		int startTimetableId = 0; // timetable 테이블 -> 시작하는 timetable_id
		int endTimetableId = 0;
		
		//System.out.println("trainNum : " + trainNum);
		//System.out.println("strStartStation : " + strStartStation);
		//System.out.println("strStartTime : " + strStartTime);
		//SELECT timetable_id FROM timetable WHERE train_num=1314 AND start_station='천안' AND start_time='7:1'
		String sql = "SELECT timetable_id FROM timetable WHERE train_num=? AND start_station=?"; // AND start_time=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, trainNum);
		pstmt.setString(2, strStartStation);
		//pstmt.setString(3, strStartTime);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			startTimetableId = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
		
//		System.out.println("startID :" + startTimetableId);
		
		sql = "SELECT timetable_id FROM timetable WHERE train_num=? AND timetable_id>=? AND terminal_station=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, trainNum);
		pstmt.setInt(2, startTimetableId);
		pstmt.setString(3, strTerminalStation);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			endTimetableId = rs.getInt(1);
		}
		rs.close();
		pstmt.close();
//		System.out.println("endID :"  + endTimetableId);
		
		int[] timeTableId_Array = new int[endTimetableId-startTimetableId+1];
		for(int i=0; i<=endTimetableId-startTimetableId; i++) {
			timeTableId_Array[i] = startTimetableId+i; 
		}
		
		conn.close();
		return timeTableId_Array;
		
	}
	// "2023-01-19", 1312, 1, "대전", "서울" (오라클: Varchar2(20), Number, Number,...) ------> 예약된 좌석 list를 리턴. 
	public ArrayList<String> getSeatsAvailable(String startDate, int trainType, int ho, String startStation, String arriveStation) throws Exception {
		ArrayList<String> listSeatsAvailable = new ArrayList<String>();
		
		int[] arr = findTimetableId(trainType, startStation, arriveStation);
		String strArrTimetableId = "";
		for(int element : arr) {
			strArrTimetableId += "_" + element + "_";
		}
		
		Connection conn = DBconnection.getConnection();
		String sql = "SELECT train_seat"
				+ " FROM train_reservation r, train_reservation_detail rd"
				+ " WHERE r.train_reservation_id = rd.train_reservation_id"
				+ " AND start_date=?"
				+ " AND timetable_id=?"
				+ " AND train_num=?"
				+ " AND train_ho=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, startDate);
		pstmt.setString(2, strArrTimetableId);
		pstmt.setInt(3, trainType);
		pstmt.setInt(4, ho);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			listSeatsAvailable.add(rs.getString("train_seat").trim());
		}
		rs.close();
		pstmt.close();
		conn.close();
		return listSeatsAvailable;
	}
	
	/*
	수정필요public void insertSeatReservation(int trainHo, String strStartDate, int trainNum, String trainSeat, int[] findTimetableId, String timetableId, int adult, int child, int sumPrice) {
		String[] trainSeatArray = trainSeat.split("/");
		Connection conn = DBconnection.getConnection();
		for(int i=0; i<=trainSeatArray.length-1; i++) {
			if(i==0) {
				String sql = "INSERT INTO train_reservation(train_reservation_id, train_Ho, train_seat)"
						+ " VALUES(train_reservation_seq.nextval, ?,?)";
				
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, trainHo);
				pstmt.setString(2, trainSeatArray[i]);
				pstmt.executeUpdate();
				
			}else {
				String sql2 = "INSERT INTO train_reservation(train_reservation_id, train_Ho, train_seat) "
						+ " VALUES(train_reservation_seq.currval, ?,?)";
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, trainHo);
					
					pstmt2.setString(2, trainSeatArray[i]);
					pstmt2.executeUpdate();
			}	
		}
		String sql3 = "INSERT INTO train_reservation_detail(train_reservation_id, email, start_date, train_num, timetable_id, adult, child, sumprice, payment_date, reservation_number, status)"
				+ "	VALUES(train_reservation_seq.currval,?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		
		String newEmail=Korail_timeTableId.profilelist.get(0).email;
		String reservationNumber = null;
		String status = "예약대기";
		PreparedStatement pstmt3 = conn.prepareStatement(sql3);
		pstmt3.setString(1, newEmail);
		pstmt3.setString(2, strStartDate);
		pstmt3.setInt(3, trainNum);
		pstmt3.setString(4, timetableId);
		pstmt3.setInt(5, adult);
		pstmt3.setInt(6, child);
		pstmt3.setInt(7, sumPrice);
		pstmt3.setString(8, reservationNumber);
		pstmt3.setString(9, status);
		pstmt3.executeUpdate();
	}
	*/
}
