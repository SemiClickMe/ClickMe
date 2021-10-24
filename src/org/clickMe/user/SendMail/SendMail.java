package org.clickMe.user.SendMail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**   
	* @packageName : org.clickMe.user.SendMail 
	* @Class : SendMail
    * @Comment : 이메일 전송 클래스, 너무 보내기 연습해서 연습용 이메일이 스팸처리가 된듯 ㅠㅠ
	* @fileName : SendMail.java 
	* @author : Hansoo Lee
    * @History : 2021.10.19 Hansoo Lee 처음 작성함 
    * @see 참고할 class나 외부 url
*/
public class SendMail {

	final String HOST = "smtp.gmail.com";
	final String FROM = "clickmeprojectco@gmail.com";
	final String PASSWORD = "clickmehphs";
	final int PORT = 587;
	
	public void mailSender (String userAddress , String userResetPW) throws Exception {
		
		String resetPassword  = userResetPW;
				
		/* 메일 제목 입력 */
		String subject = "[클릭美] 비밀번호 초기화 안내 메일입니다.";
		
		String text = "<div style=\"background-image:url('https://i.imgur.com/lKmC9TI.jpeg'); width:1137px; height:638px;\">\r\n"
				+ "    <div style=\"width:480px; height:220px;\"></div>\r\n"
				+ "    <div style=\"width:490px; height:300px; float:left;\"></div>\r\n"
				+ "    <div style=\"width:220px; height:100px; float:left;\">\r\n"
				+ "    <p style=\"font-size: 35px; text-align: center; font-weight:750; color: #ff00dd;float:left;\">"
				+ resetPassword
				+ "</p>\r\n"
				+ "</div></div>";
		
        Properties props = new Properties();
        props.put("mail.smtp.host", HOST); 	
        props.put("mail.smtp.port", PORT); 
        props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM, PASSWORD);
            }
        });
        
        try {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress());

        /* 받는사람 메일주소 넣기 */ 
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(userAddress)); 

        /* 제목과 내용 삽입 */
        message.setSubject(subject); 
        message.setContent(text,"text/html; charset=euc-kr");    

        Transport.send(message);
        
        System.out.println("전송 완료");
        
        } catch (MessagingException e) {
            e.printStackTrace();
        }
	}
	
	
	
}
