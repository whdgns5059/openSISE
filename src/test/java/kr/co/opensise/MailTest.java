package kr.co.opensise;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.junit.Test;

import kr.co.opensise.member.encrypt.seed.KISA_SEED_CBC;

public class MailTest {

	@Test
	public void mailSendTest() throws AddressException, MessagingException{

		// 암호화 처리
				String seedEncrypt = KISA_SEED_CBC.Encrypt("openSise@gmail.com");
				System.out.println("seedEncrypt : " + seedEncrypt);
				
				// 네이버일 경우 smtp.naver.com 
				// Google일 경우 smtp.gmail.com 
				String host = "smtp.naver.com";

				final String username = "openSise"; 
				final String password = "nikfdcsobtusygbi"; 
				int port=465; //포트번호

				// 메일 내용 
				String recipient = "openSise@gmail.com"; //받는 사람의 메일주소
				String subject = "회원인증"; //메일 제목 입력해주세요.
				String body = "<html><h2>OpenSise 회원인증</h2></br> "
						+ "<h5>아래 이미지 클릭시 회원인증 처리가 완료 됩니다!</h5></br> "
						+ "<a href=\"http://localhost:8081/login/passCertification?OpenSise="+seedEncrypt + "\"> <img src=\"http://www.mictmyeongin.co.kr/img/openSise.PNG\"  border=\"0\"></a>\r\n"
						+ "</html>";
				
				Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

				// SMTP 서버 정보 설정
				props.put("mail.smtp.host", "smtp.gmail.com"); 
				props.put("mail.smtp.port", 465); 
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.ssl.enable", "true");
				props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

				//Session 생성 
				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
					String un=username; 
					String pw=password; 
					protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
						return new javax.mail.PasswordAuthentication(un, pw); } });

				session.setDebug(true); //for debug
				
				MimeMessage mimeMessage = new MimeMessage(session); //MimeMessage 생성
				mimeMessage.setFrom(new InternetAddress("openSise@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소

				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음

				mimeMessage.setSubject(subject); //제목셋팅 
				mimeMessage.setText(body, "utf-8", "html"); //내용셋팅
				Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
	}
	
	//@Test
	public void mailSendTest2() throws AddressException, MessagingException{

		final String username = "openSise"; 
		final String password = "nikfdcsobtusygbi"; 
		int port=465; //포트번호

		// 메일 내용 
		String recipient = "jwlee1728@gmail.com"; //받는 사람의 메일주소
		String subject = "회원인증"; //메일 제목 입력해주세요.
		String body = "<h2>OpenSise 회원인증</h2></br> "
				+ "아래 링크 클릭시 회원인증 처리가 완료 됩니다!</br> "
				
				+ "<a href=\"http://localhost:8081/login/passCertification?OpenSise=test\" >"
				+ " <img src=\"cid:image\"  alt=\"오픈시세 로그인\" title=\"오픈시세 로그인 \" />"
				+ "</a>"; //메일 내용
		//<img src="/img/openSise_login.png"  alt="오픈시세 로그인" title="오픈시세 로그인 " />
		
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성

		// SMTP 서버 정보 설정
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", 465); 
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		//Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() { 
			String un=username; 
			String pw=password; 
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw); } });

		session.setDebug(true); //for debug
		
		MimeMessage mimeMessage = new MimeMessage(session); //MimeMessage 생성
		mimeMessage.setFrom(new InternetAddress("openSise@gmail.com")); //발신자 셋팅 , 보내는 사람의 이메일주소
		
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음

		mimeMessage.setSubject(subject); //제목셋팅 
		//mimeMessage.setText(body, "utf-8", "html"); //내용셋팅
		
		
		MimeMultipart multipart = new MimeMultipart("related");
		BodyPart messageBodyPart = new MimeBodyPart();
		String htmlText = "<H1>Hello</H1><img src=\"cid:image\">";
		messageBodyPart.setContent(htmlText, "text/html");
		multipart.addBodyPart(messageBodyPart);
		
		messageBodyPart = new MimeBodyPart();
		DataSource fds = new FileDataSource("C:\\start.jpg");
		messageBodyPart.setDataHandler(new DataHandler(fds));
		messageBodyPart.setHeader("Content-ID","<image>");
		
		multipart.addBodyPart(messageBodyPart);
		
		mimeMessage.setContent(multipart);
		
		Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
	}
}
