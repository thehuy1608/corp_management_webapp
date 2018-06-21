/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.bean;

import java.io.File;
import java.io.UnsupportedEncodingException;
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

    public void send_password(String to, String new_password) {
        try {
            MimeMessage mail = mailer.createMimeMessage();
            MimeMessageHelper helper
                    = new MimeMessageHelper(mail, true, "utf-8");
            helper.setFrom("kisstherain12342@gmail.com", "kisstherain12342@gmail.com");
            helper.setTo(to);
            helper.setReplyTo("kisstherain12342@gmail.com", "kisstherain12342@gmail.com");
            helper.setSubject("New Password");
            helper.setText("Your new password is:\n" + new_password, true);
            mailer.send(mail);
        } catch (UnsupportedEncodingException | MessagingException | MailException e) {
        }
    }
}
