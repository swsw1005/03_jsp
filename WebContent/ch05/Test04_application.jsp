<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test04_application.jsp</title>
</head>
<body>
<%
	out.println("서버 정보<br>");
	out.println("application.getServerInfo() : " + application.getServerInfo()+"<br>");
	out.println("aa.html MIME type 구하기: ");
	out.println(application.getMimeType("aa.html")+"<br>");
%>
<hr>
<p>메이저 버전:</p> <%= application.getMajorVersion() %><br>
<p>마이너 버전:</p> <%= application.getMinorVersion() %><br>
<p>실제 경로 :</p> <%=application.getRealPath("/") %><br>

<%
//log 기록 
application.log("4월30일부터  5월5일까지 휴무입니다.");

%>
</body>
</html>