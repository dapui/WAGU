package com.wagu.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection_bak {
	private static Connection conn;
	
	public static Connection getConnection() {	// 연결
		if(conn == null) {	// 한 번 연결된 객체를 계속 사용하고, 연결되지 않은 경우에만 연결을 시도 (싱글톤:디자인패턴) 
			
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "wagu";
			String dbPW = "webproject";
			
			try {
				Class.forName(driver);	// OracleDriver 클래스에 대한 객체 생성
				System.out.println("JDBC 드라이버 로딩 성공");
				conn = DriverManager.getConnection(url, dbID, dbPW);	// 오라클 서버 실체 연결
				System.out.println("Oracle 접속 성공");
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("Oracle 접속 실패");
			}
			
		}
		return conn;	// 구성된 연결 객체 반환 
	}
	
	public static Connection getConnection(String url, String dbID, String dbPW) {	// getConnection() 메서드의 오버로딩
		if(conn == null) {
			
			String driver = "oracle.jdbc.driver.OracleDriver";
			
			try {
				Class.forName(driver);
				System.out.println("JDBC 드라이버 로딩 성공");
				conn = DriverManager.getConnection(url, dbID, dbPW);
				System.out.println("Oracle 접속 성공");
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("Oracle 접속 실패");
			}
		}
		return conn;
	}
	
	public static void close() {	// DB연결 종료 
		try {
			if(conn != null) {
				if(!conn.isClosed()) {	// true: 연결이 닫힌 상태, false: 연결된 상태 
					conn.close();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn = null;	// 연결 객체 초기화 
	}
	
}

