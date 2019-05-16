/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.EmailAlert;

import javax.mail.Authenticator;
import java.util.Date;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.ejb.Stateless;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author paulo.bezerra
 */
@Stateless
public class EmailSessionBean {

    // private int port = 465; // 587;
    // private String host = "smtp.gmail.com";
    private String from = "opportunity.mci@gmail.com";
    //private boolean auth = true;
    private String username = "opportunity.mci@gmail.com";
    private String password = "MCIgroup1987";
    //private Protocol protocol = Protocol.SMTP;
    private boolean debug = true;

    public boolean sendEmail(String to1,
            String subject, String body) {

        boolean emailenviado = false;

        Properties props = new Properties();
        props.put("mail.smtp.host", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Authenticator authenticator = null;
        authenticator = new Authenticator() {
            private javax.mail.PasswordAuthentication pa = new javax.mail.PasswordAuthentication(username, password);

            @Override
            public javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return pa;
            }
        };

        Session session = Session.getInstance(props, authenticator);
        //session.setDebug(debug);

        MimeMessage message = new MimeMessage(session);
        try {

            message.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to1)};
            message.setRecipients(Message.RecipientType.TO, address);
            message.setSubject(subject, "UTF-8");
            // This mail has 2 part, the BODY and the embedded image
            MimeMultipart multipart = new MimeMultipart("related");

            // first part (the html)
            BodyPart messageBodyPart = new MimeBodyPart();
            String htmlText = body + "<br><br><img src=\"cid:image\">";
            messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");
            // add it
            multipart.addBodyPart(messageBodyPart);

            // second part (the image)
            messageBodyPart = new MimeBodyPart();
            DataSource fds = new FileDataSource(
                    "C:\\Users\\paulo.bezerra\\Documents\\NetBeansProjects\\ERP\\src\\main\\webapp\\img\\senac_logo.PNG");
                    //"/opt/tomcat/apache-tomee-webprofile-7.0.2/webapps/logos/senac_logo.PNG");

            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setHeader("Content-ID", "<image>");

            // add image to the multipart
            multipart.addBodyPart(messageBodyPart);

            // put everything together
            message.setContent(multipart);
            // Send message

            message.setSentDate(new Date());
            //message.setText(body,"UTF-8");
            Transport.send(message);
            emailenviado = true;

        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
        System.out.println("email sent = " + emailenviado);
        return emailenviado;
    }

}
