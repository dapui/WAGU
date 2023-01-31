package com.wagu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/mailServlet")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // post이기 때문에 인코딩
		
		String userEmail = request.getParameter("email");
		System.out.println(userEmail);
		int auto = (int)((Math.random()* 9000)+1000);
    	String auto2 = String.valueOf(auto);
    	
        Properties p = System.getProperties();          // SMTP서버 정보를 설정
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 true 고정
        p.put("mail.smtp.host", "smtp.naver.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 true 고정
        p.put("mail.smtp.port", "587");                 // 네이버 포트
        p.put("mail.smtp.port", "587");                 // 네이버 포트
           
        Authenticator auth = new MyAuthentication();	// session에 저장된 정보를 바탕으로 내용을 추가해 메일을 구성합니다.
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);  // Properties와 PasswordAuthentication를 저장 및 유지
        MimeMessage msg = new MimeMessage(session);	// session에 저장된 정보를 바탕으로 내용을 추가해 메일을 구성합니다.
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress() ;
            from = new InternetAddress("ekdms5948@naver.com"); //발신자 아이디
            // 이메일 발신자
            msg.setFrom(from);
            // 이메일 수신자
            InternetAddress to = new InternetAddress(userEmail);
            msg.setRecipient(Message.RecipientType.TO, to);
            // 이메일 제목
            msg.setSubject("메일 전송 테스트", "UTF-8");
            // 이메일 내용
            msg.setText("인증번호 코드 : " + auto2 + "입니다.", "UTF-8");
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            //메일보내기
            javax.mail.Transport.send(msg, msg.getAllRecipients());
            System.out.println("전송완료.");
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }catch (Exception msg_e) {
            msg_e.printStackTrace();
        }
        
        PrintWriter out = response.getWriter();
        System.out.println(auto2);
        out.print(auto2);
	}
	class MyAuthentication extends Authenticator {
		
		PasswordAuthentication pa;
		public MyAuthentication(){
			
			String id = "ekdms5948@naver.com";  //네이버 이메일 아이디
			String pw = "ekdms!1209";        //네이버 비밀번호
			
			// ID와 비밀번호를 입력한다.
			pa = new PasswordAuthentication(id, pw);
		}
		
		// 시스템에서 사용하는 인증정보
		public PasswordAuthentication getPasswordAuthentication() {
			return pa;
		}
	} 
}
