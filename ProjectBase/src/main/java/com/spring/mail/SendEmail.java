package com.spring.mail;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/** * * @author mwseong */
public class SendEmail { //extends TestCase {

  
    public void mailSend(String memberName, String emailTo, String tempPw) {

        try {
//			String emailTo = "dnrkfka@nate.com";// 메일 보낼사람 리스트
            String emailFromAddress = "khsportcenter@gmail.com";// 메일 보내는 사람
            String emailMsgTxt = memberName + "님의 임시비밀번호 : " + tempPw; // 내용
            String emailSubjectTxt = "[KH스포츠센터]임시 비밀번호 발급";// 제목

            // 메일보내기
            postMail(emailTo, emailSubjectTxt, emailMsgTxt, emailFromAddress);
            System.out.println("임시비밀번호 발송");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private void postMail(String recipient, String subject, String message, String from) throws MessagingException {
        boolean debug = false;
        //java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        String SMTP_HOST_NAME = "gmail-smtp.l.google.com";
        // Properties 설정
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST_NAME);
        props.put("mail.smtp.auth", "true");
        Authenticator auth = new SMTPAuthenticator();
        Session session = Session.getDefaultInstance(props, auth);
        session.setDebug(debug);
        // create a message
        Message msg = new MimeMessage(session);

        // set the from and to address
        InternetAddress addressFrom = new InternetAddress(from);
        msg.setFrom(addressFrom);
        InternetAddress addressTo = new InternetAddress();
        addressTo = new InternetAddress(recipient);
        msg.setRecipient(Message.RecipientType.TO, addressTo);
        // Setting the Subject and Content Type
        msg.setSubject(subject);
//		msg.setContent(message, "text/plain");
		msg.setContent(message, "text/plain; charset=utf-8");
//		msg.setContent(message, "text/html; charset=utf-8");

        Transport.send(msg);
    }

    /** * * * 구글 사용자 메일 계정 아이디/패스 정보 */
    private class SMTPAuthenticator extends javax.mail.Authenticator {
        public PasswordAuthentication getPasswordAuthentication() {
            String username = "khsportcenter@gmail.com"; // gmail 사용자;
            String password = "vmfhwprxm12"; // 패스워드;
            return new PasswordAuthentication(username, password);
        }
    }
}
