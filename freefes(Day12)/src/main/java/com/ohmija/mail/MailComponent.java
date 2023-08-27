package com.ohmija.mail;

import java.io.IOException;
import java.util.Properties;
import java.util.Scanner;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

@Component
public class MailComponent {
	
	// src/main/java
	// src/main/resources
	@Value("classpath:mailAccount.txt")
	private Resource mailAccount;
	
	private String host = "smtp.naver.com";
	private int port = 465;
	private String serverId = "";	// 네이버 혹은 구글의 사용자 계정
	private String serverPw = "";	// 계정의 비밀번호
	
	private Properties props = new Properties();

	public int sendMail(String email, String content) throws IOException {
		// 메일 계정 정보 불러오기
		Scanner sc = new Scanner(mailAccount.getFile());
		while(sc.hasNextLine()) {
			String text = sc.nextLine();
			serverId = text.split("/")[0];
			serverPw = text.split("/")[1];
		}
		sc.close();
		
		// 메일 보내기 환경 설정
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);
		
		Session mailSession = Session.getDefaultInstance(props, new Authenticator() {
			String un = serverId;
			String pw = serverPw;
			
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		mailSession.setDebug(true); // 메일 전송 과정을 화면에 출력하도록 한다
		
		// 보낼 메시지 형식을 구성
		Message mimeMessage = new MimeMessage(mailSession);
		
		try {
			mimeMessage.setFrom(new InternetAddress(serverId + "@naver.com"));	// 보내는 사람
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 받는사람
			mimeMessage.setSubject("[KGITBANK] 인증번호 입니다");	// 제목

//			mimeMessage.setText(content);	// 단순 텍스트 내용
			if(content.contains("<") == false) {
				String tag = "<pre style=\"%s\">%s</pre>";
				String style = "";
				style += "border: 1px solid black;";
				style += "padding: 10px;";
				style += "font-size: 20px;";
				style += "width: fit-content;";
				style += "font-weight: bold;";
				
				content = String.format(tag, style, content);
			}
			
			mimeMessage.setContent(content, "text/html; charset=utf-8");
			
			Transport.send(mimeMessage);
			return 1;
			
		} catch(AddressException e) {
			System.out.println("잘못된 주소입니다");
			return -1;
			
		} catch(MessagingException e) {
			System.out.println("메시지 전송에 문제가 발생했습니다");
			return -2;
		}
	}
}
