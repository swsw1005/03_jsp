package mail;

import java.io.*;
import com.oreilly.servlet.*;

// MailMessage 클래스 사용 

// 1. 생성자  MailMessage (host) : MailMessage 생성자 인수에 SMTP 서버 주소 지정 한다 
//     host 를 "smtp.nate.com"   매일 무료 서비스 
//    예 : MailMessage ("smtp.nate.com")

// 2. MailMessage 클래스 메서드들 

// from(String from ) : 보내는 사람의 메일 주소 
// to(String to) : 받는 사람의 메일주소
// setSubject(String subject) : 편지 제목
// getPrintStream() :MailMessage 에서 출력용 스트림 생성 
// sendAndClose() : 출력용 스트림의 내용을 보내고 종료 

public class MailSender {
    // 전역변수=필드=프로퍼티=property
    private String from;// 보내는 사람
    private String to;// 받는 사람
    private String subject;// 메일제목
    private String content;// 내용

    public MailSender() {// 생성자 , 초기화 작업
        from = "";
        to = "";
        subject = "";
        content = "";
    }
    // setter만

    public void setFrom(String from) {
        this.from = from;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setContent(String content) {
        this.content = content;
    }

    // 기타 메서드 , 사용자 정의 메서드
    public String send() {
        String reply = "메일전송 성공";
        try {
            MailMessage mm = new MailMessage("smtp.nate.com");// host

            mm.from(from);// 보내는 사람의 메일 주소
            mm.to(to);// 받는 사람의 메일주소
            mm.setSubject(subject);// 편지 제목
            PrintStream out = mm.getPrintStream();// MailMessage 에서 출력용 스트림 생성
            out.println(content);
            mm.sendAndClose();// 출력용 스트림의 내용을 보내고 종료
            reply = "메일 전송 성공";

        } catch (Exception ex) {
            reply = "메일 전송 실패 :" + ex;
        }
        return reply;
    }// send() end

}