/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.util.Properties;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.util.Random;

public class SendGmail {

    public boolean isValidEmail(String email) {
        // Kiểm tra cấu trúc email
        return email.matches("[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}");
    }

    public String generateOTP() {
        Random random = new Random();
        int otp = random.nextInt(900000) + 100000; // Sinh số ngẫu nhiên từ 100000 đến 999999
        return String.valueOf(otp);
    }

    public void sendOTPToEmail(String email, String otp, String content) {
        String host = "smtp.gmail.com";
        int port = 587;
        String username = "hightech05vn@gmail.com"; // Thay bằng địa chỉ email của bạn
        String password = "hhhbasicfoexmpyw"; // Thay bằng mật khẩu email của bạn

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("OTP Code");
            message.setText(content + otp);
            Transport.send(message);
            System.out.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
