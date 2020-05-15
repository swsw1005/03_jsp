package mailupload;

import java.io.*;

import javax.servlet.http.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

public class EmailUpload {
	// 사용자 정의 메서드
	public String upload(HttpServletRequest request) {
		String reply = "";// 변수
		String savePath = "c:\\download\\";
		int size = 1024 * 1024 * 5;// 5MB
		try {

			// 파일업로드
			MultipartRequest mm = new MultipartRequest(request, savePath, size, "utf-8", new DefaultFileRenamePolicy());

			// 메일보내기
			String from = mm.getParameter("from");
			String to = mm.getParameter("to");
			String subject = mm.getParameter("subjec");
			String content = mm.getParameter("content");
			//
			subject = new String(subject.getBytes("utf-8"), "8859_1");
			content = new String(content.getBytes("utf-8"), "8859_1");
			//
			MailMessage mail = new MailMessage("smtp.nate.com");
			mail.from(from);
			mail.to(to);
			mail.setSubject(subject);
			PrintStream out = mail.getPrintStream();
			out.print(content);

			mail.sendAndClose();// 출력용 스트림의 내용을 보내고 종료

			reply = "메일보내기 파일업로드 성공";
		} catch (Exception ex) {
			ex.printStackTrace();
			reply = "메일보내기 파일업로드 실패 :";
		}
		return reply;
	}// upload() end
		// 컴파일
}// class end
