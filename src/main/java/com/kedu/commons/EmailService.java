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

            Properties props = new Properties();

            InputStream input =
                    getClass().getClassLoader().getResourceAsStream("mail.properties");

            if (input == null) {
                throw new IllegalStateException("mail.properties 파일을 찾을 수 없습니다.");
            }

            
            props.load(input);
            input.close();

            String username =
                    props.getProperty("mail.username");

            String password =
                    props.getProperty("mail.password");
           
            JavaMailSenderImpl mailSender =
                    new JavaMailSenderImpl();

            mailSender.setHost("smtp.gmail.com");
            mailSender.setPort(587);

            mailSender.setUsername(username);
            mailSender.setPassword(password);


     
            Properties mailProperties = mailSender.getJavaMailProperties();

            mailProperties.put("mail.smtp.auth", "true");
            mailProperties.put(
                    "mail.smtp.starttls.enable",
                    "true"
            );
     
            SimpleMailMessage message = new SimpleMailMessage();

            message.setFrom(username);
            message.setTo(to);
            message.setSubject("[YA900] 이메일 인증 안내");
            message.setText(
                "안녕하세요. YA900입니다.\n\n"
                + text + "\n\n"
                + "본인이 요청하지 않은 메일이라면 무시하셔도 됩니다.\n"
                + "감사합니다.\n"
                + "YA900 팀 드림"
            );

            mailSender.send(message);

        } catch (Exception e) {

            e.printStackTrace();

        }
    }
}