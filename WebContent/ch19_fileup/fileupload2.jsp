<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>    

<%
request.setCharacterEncoding("utf-8");//html의 form안의 데이터 인코딩 처리 
String savePath="c:\\DOWNLOAD";
int size=1024*1024*5;

try{
	MultipartRequest mm=new MultipartRequest(request,savePath,size,"utf-8",new DefaultFileRenamePolicy());
	//                                                              파일 이름
	
	// 폼안의 전송된 파일 정보를 가져온다
	Enumeration formNames=mm.getFileNames();
	
	// 자료가 많을 경우엔 while 문을 사용
	String formName=(String)formNames.nextElement(); 
	
	//서버에 저장된 파일 이름를 리턴 (파일의 이름 얻기)
	String fileName=mm.getFilesystemName(formName); 
	
	if(fileName==null){//파일 업로드가 되지 않았을때
		out.println("파일 업로드가 되지 않았습니다");
	}else{//파일 업로드 된 경우
		//웹 브라우저에 출력
	  out.print("Name:"+mm.getParameter("name")+"<BR>");//★★★
	  out.print("ID:"+mm.getParameter("id")+"<BR>");//★★★
	  out.print("PWD:"+mm.getParameter("pwd")+"<BR>");//★★★
	  
	  out.print("File Name  : <strong>" + fileName+"</strong><br>");//별의미 없음
	  
	  //input 태그속성이 file인것,//서버에 저장된 파일 이름  
	  String fileName2=mm.getFilesystemName("f1");
	  out.println("서버에 저장된 파일 이름 :<strong>"+fileName2+"</strong><br>");
	  
	  // 전송된 원래 파일 이름
	  String original=mm.getOriginalFileName("f1");
	  out.println("원래 파일 이름(실제파일이름) :<strong>"+original+"</strong><br>");
	  
	  //input 항목이름에 해당하는 
	  //파일 정보를 File형으로 리턴합니다
	  File file=mm.getFile("f1"); 
	  out.println("input 항목이름 :<strong>"+file+"</strong><br>");
	  if(file != null){
		  out.println("파일 size:<strong>"+file.length()+"</strong><br>");
	  }
	  
	  // 전송된 file 의 contentType
	  String type=mm.getContentType("f1");
	  out.println("전송된 file 의 contentType :<strong>"+type+"</strong><br>");
		  
	}//else end
	
}catch(Exception ex){
	out.println("파일 업로드 예외 :"+ ex);
}

%>
<%--fileupload2.jsp--%>