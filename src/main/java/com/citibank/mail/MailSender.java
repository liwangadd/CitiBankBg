package com.citibank.mail;

public class MailSender {

    public static void sendMail(String to, String content) {
        MailSenderInfo mailInfo = new MailSenderInfo();
        mailInfo.setMailServerHost("smtp.qq.com");
        mailInfo.setMailServerPort("25");
        mailInfo.setValidate(true);
        mailInfo.setUserName("269284999@qq.com");
        mailInfo.setPassword("060019zjm");//您的邮箱密码
        mailInfo.setFromAddress("269284999@qq.com");
        mailInfo.setToAddress(to);
        mailInfo.setSubject("citibank");
        mailInfo.setContent(content);
        //这个类主要来发送邮件
        SimpleMailSender sms = new SimpleMailSender();
        sms.sendTextMail(mailInfo);//发送文体格式
    }
}
