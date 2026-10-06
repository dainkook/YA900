package com.kedu.commons;

import java.io.InputStream;
import java.util.Properties;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    public void sendEmail(String to, String subject, String text) {

        try {

            // mail.properties 읽기
            Properties props = new Properties();

            InputStream input =
                    getClass().getClassLoader().getResourceAsStream("mail.properties");

            props.load(input);
            

            // 이메일과 비밀번호 가져오기
            String username =
                    props.getProperty("mail.username");

            String password =
                    props.getProperty("mail.password");


            // 메일 서버 설정
            JavaMailSenderImpl mailSender =
                    new JavaMailSenderImpl();

            mailSender.setHost("smtp.gmail.com");
            mailSender.setPort(587);

            mailSender.setUsername(username);
            mailSender.setPassword(password);


            // SMTP 설정
            Properties mailProperties =
                    mailSender.getJavaMailProperties();

            mailProperties.put("mail.smtp.auth", "true");
            mailProperties.put(
                    "mail.smtp.starttls.enable",
                    "true"
            );


            // 이메일 내용
            SimpleMailMessage message =
                    new SimpleMailMessage();

            message.setTo(to);
            message.setSubject(subject);
            message.setText(text);


            // 이메일 전송
            mailSender.send(message);

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}