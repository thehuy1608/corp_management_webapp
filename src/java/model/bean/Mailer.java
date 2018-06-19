/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Random;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 *
 * @author WIN 10
 */
public class Mailer {

    @Autowired
    JavaMailSender mailer;

    public void send(String from, String to, String subject, String body) {
        try {
            MimeMessage mail = mailer.createMimeMessage();
            MimeMessageHelper helper
                    = new MimeMessageHelper(mail, true, "utf-8");
            helper.setFrom(from, from);
            helper.setTo(to);
            helper.setReplyTo(from, from);
            helper.setSubject(subject);
            helper.setText(body, true);
            mailer.send(mail);
        } catch (UnsupportedEncodingException | MessagingException | MailException ex) {
            throw new RuntimeException(ex);
        }
    }

    public void send(String from, String to, String subject, String body, File attached_file) throws MessagingException {
        try {
            MimeMessage mail = mailer.createMimeMessage();
            MimeMessageHelper helper
                    = new MimeMessageHelper(mail, true, "utf-8");
            helper.setFrom(from, from);
            helper.setTo(to);
            helper.setReplyTo(from, from);
            helper.setSubject(subject);
            helper.setText(body, true);
            helper.addAttachment(subject, attached_file);
            mailer.send(mail);
        } catch (UnsupportedEncodingException | MessagingException e) {
        }
    }

    public void send_password(String to) {
        final String new_password = get_salt_string();
        try {
            MimeMessage mail = mailer.createMimeMessage();
            MimeMessageHelper helper
                    = new MimeMessageHelper(mail, true, "utf-8");
            helper.setFrom("kisstherain12342@gmail.com", "kisstherain12342@gmail.com");
            helper.setTo(to);
            helper.setReplyTo("kisstherain12342@gmail.com", "kisstherain12342@gmail.com");
            helper.setSubject("New Password");
            helper.setText("Mật khẩu mới của bạn là:\n" + new_password, true);
            mailer.send(mail);
        } catch (UnsupportedEncodingException | MessagingException | MailException e) {
        }
    }

    private static String get_salt_string() {
        final String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
        StringBuilder salt = new StringBuilder();
        Random random = new Random();
        while (salt.length() < 18) {
            int index = (int) (random.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String salt_string = salt.toString();
        return salt_string;
    }
}
