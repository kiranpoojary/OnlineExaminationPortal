package oep.regandlog;


import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
   public boolean mailNow(String to,String Name,String instuName,String userType,String logId,String psw) {
      // Recipient's email ID needs to be mentioned.
      //String to = "kiranpjr97@gmail.com";

      // Sender's email ID needs to be mentioned
      String from = "kiranpjr97@gmail.com";
      final String username = "kiranpjr97";//change accordingly
      final String password = "ki1997ran#";//change accordingly

      // Assuming you are sending email through relay.jangosmtp.net
      String host = "smtp.gmail.com";

      Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.port", "587");

      // Get the Session object.
      Session session = Session.getInstance(props,
         new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username, password);
            }
	});

      try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

   	   // Set From: header field of the header.
	   message.setFrom(new InternetAddress(from));

	   // Set To: header field of the header.
	   message.setRecipients(Message.RecipientType.TO,
              InternetAddress.parse(to));

	   // Set Subject: header field
	   message.setSubject(instuName);

	   // Send the actual HTML message, as big as you like
	   if(userType.equals("Student"))
	   {
		   message.setContent(
		              "Welcome <b>"+Name+" ,</b>"+ instuName +" registred you to the Online Examination Portal.<br>LoginID:"+logId+"<br>Password:"+psw+"<br><br><br>Click <a href='http://localhost:8080/OEP/LoginStudent.jsp'>Here</a>to Login<br><br>Regards.<br>Online Examinaion Portal",
		             "text/html");
	   }
	   else
	   if(userType.equals("Teacher"))
	   {
		   message.setContent(
		              "Welcome <b>"+Name+",</b>"+ instuName +" registred you to the Online Examination Portal.<br>LoginID:"+logId+"<br>Password:"+psw+"<br><br><br>Click <a href='http://localhost:8080/OEP/Login.jsp'>Here</a>to Login<br><br>Regards.<br>Online Examinaion Portal",
		             "text/html");
	   }
	   else
	   {
		   message.setContent(
		              "Hello <b>"+Name+",</b>"+ instuName +" scheduled an exam  in Online Examination Portal.<br>Exam Name :"+psw+"<br>Subject Code :"+logId+"<br>Exam Date :"+userType+"<br><br><br><br>Regards.<br>Online Examinaion Portal",
		             "text/html");
	   }

	   // Send message
	   Transport.send(message);

	   System.out.println("Sent message successfully....");

      } catch (MessagingException e) {
    	  e.printStackTrace();
    	  return false;
	   //throw new RuntimeException(e);
	   
      }
      
      return true;
   }
   
   
   
   
   
   
   public boolean sendPassword(String to,int pass) {
	      // Recipient's email ID needs to be mentioned.
	      //String to = "kiranpjr97@gmail.com";

	      // Sender's email ID needs to be mentioned
	      String from = "kiranpjr97@gmail.com";
	      final String username = "Online Examination Portal";//change accordingly
	      final String password = "ki1997ran#";//change accordingly

	      // Assuming you are sending email through relay.jangosmtp.net
	      String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	         new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	               return new PasswordAuthentication(username, password);
	            }
		});

	      try {
	            // Create a default MimeMessage object.
	            Message message = new MimeMessage(session);

	   	   // Set From: header field of the header.
		   message.setFrom(new InternetAddress(from));

		   // Set To: header field of the header.
		   message.setRecipients(Message.RecipientType.TO,
	              InternetAddress.parse(to));

		   // Set Subject: header field
		   message.setSubject("Online Examination Portal");

		   // Send the actual HTML message, as big as you like

			   message.setContent(
			              "Hello,Your OEP account linked with email ID "+to+" password changed successfuly.<br>New Password:"+pass+"<br><br><br><br>Team OEP.",
			             "text/html");
		  
		   // Send message
		   Transport.send(message);

		   System.out.println("Sent message successfully....");

	      } catch (MessagingException e) {
	    	  e.printStackTrace();
	    	  return false;
		   //throw new RuntimeException(e);
		   
	      }
	      
	      return true;
	   }
}