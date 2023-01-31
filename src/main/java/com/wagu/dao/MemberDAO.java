package com.wagu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.wagu.connection.DBconnection;
import com.wagu.dto.MemberDTO;

public class MemberDAO {
	// 로그인
	// -2: 아이디 없음, -1: 서버오류, 0:비밀번호 틀림, 1: 성공
	public int loginCheck(String email, String  pw) {
		Connection conn = DBconnection.getConnection();
		
		String sql = "SELECT pw FROM members WHERE email=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			
			int check=-2;
			String pwCheck="";
			if(rs.next()) {
				pwCheck= rs.getString(1);
				check = pwCheck.equals(pw)? 1: 0;	
			}
			rs.close();
			pstmt.close();
			conn.close();
			
			return check;
			
		} catch(Exception e) {	
			e.printStackTrace();
			return -1;
		}
	}
	
	// 회원가입 
	public void memberInsert(MemberDTO mDto) {
		Connection conn = DBconnection.getConnection();
		
		String sql = "insert into members(member_id,name,email,pw,birth,phone,image) values(MEMBER_SQ.nextval,?,?,?,?,?,'user_icon_def.png')";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getName());
			pstmt.setString(2,mDto.getEmail());
			pstmt.setString(3,mDto.getPw());
			pstmt.setInt(4,mDto.getBirth());
			pstmt.setString(5,(mDto.getPhone1()+mDto.getPhone2()+mDto.getPhone3()));

			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// id 중복확인
	public int checkId(String email) {
		Connection conn = DBconnection.getConnection();
		
		String sql ="select * from members where email=?";
		
		int cnt;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()|| email.equals("")) {
				cnt = 0; // 이미 존재하는 경우, 빈칸인 경우 -> 생성 불가능
 			} else {
 				cnt = 1; // 존재하는 않는 경우, 생성 가능
 			}
			
			return cnt;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				conn.close();
			} catch(SQLException e) { e.printStackTrace(); }
		}
	}
	
	// 로그인 이름 가져오기
	public String getNameFromEmail(String email) {
		Connection conn = DBconnection.getConnection();
		
		String sql ="select name from members where email=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String name="";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				name = rs.getString("name");
 			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				conn.close();
			} catch(SQLException e) { e.printStackTrace(); }
		}
		return name;
	}
	// 로그인 프로필사진 가져오기
	public String getImageFromEmail(String email) {
		Connection conn = DBconnection.getConnection();
		
		String sql ="select image from members where email=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String image="";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				image = rs.getString("image");
 			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				conn.close();
			} catch(SQLException e) { e.printStackTrace(); }
		}
		return image;
	}
	// 로그인 ID 가져오기
	public int getIdFromEmail(String email) {
		Connection conn = DBconnection.getConnection();
		
		String sql ="select member_id from members where email=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int memberId=0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberId = rs.getInt("member_id");
			}
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				conn.close();
			} catch(SQLException e) { e.printStackTrace(); }
		}
		return memberId;
	}
}
