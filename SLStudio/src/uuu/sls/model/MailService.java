package uuu.sls.model;

///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package uuu.sls.model;
//
//import java.net.PasswordAuthentication;
//import java.util.Properties;
//
///**
// *
// * @author Admin
// */
//public class MailService {
//    public static void sendHelloMailWithLogo(String to){
//        if(to == null){
//            to="carry.mo.tw@gmail.com";
//        }
//        
//        //以下違紀建所需的SMTP伺服器與帳號設定,這裡使用gmail的SMTP Server
//        final String host = "smtp.gmail.com";
//        final int port = 587;
//        final String username = "ucom.java55@gmail.com";
//        final String password = "UcomJava%5";//password
//        Properties props = new Properties();
//        props.put("mail.smtp.host",host);
//        props.put("mail.smtp.auth","true");
//        props.put("mail.smtp.starttl.enable","true");
//        props.put("mail.smtp.port",port);
//        
////        Session session = Session.getInstance(props,new javax.mail.Authenticator(){
////            protected PasswordAuthentication getPasswordAuthentication(){
////                return new PasswordAuthentication(username,password);
////            }           
////        });
////        
////        try{
////            //以下建立
//            
//            
//        }catch(Exception ex){
//            System.out.println("ex= "+ex);
//            if(ex.getCause()!=null){
//                System.out.println("ex.getCause():" + ex.getCause());
//            }
//        }
//        
//        
//        
//        
//    }
//}
