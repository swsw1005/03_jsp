<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>Test02_request.jsp</h2>
<%
String ip=request.getRemoteAddr();//클라이언트 ip를 구한다
if(ip.equals("192.168.137.47")){
	out.print("접근이 제한된 IP입니다.");
	return;
}
    %>

    <li>메서드 방식:<%=request.getMethod() %></li><br>
    <li>요청 URI:<%=request.getRequestURI() %></li><br>
    <li>요청 URL:<%=request.getRequestURL() %></li><br>
<br>

<li>프로토콜:<%=request.getProtocol() %></li><br> <%-- 서버 HTTP/1.1 --%>
<li>서버 이름:<%=request.getServerName() %></li><br>
<li>서버 포트번호:<%=request.getServerPort() %></li><br>
<br>

<li>사용자 컴퓨터 주소(ip):<%=request.getRemoteAddr() %></li><br> <%-- 클라이언트ip --%>
<li>사용자 컴퓨터 이름:<%=request.getRemoteHost() %></li><br> <%-- 클라이언트 --%>
<br>

<li>현재 사용중인 브라우저 : </li><br>
<%=request.getHeader("User-Agent") %>
<br><br>

<li>브라우저를 지원하는 file의 type:</li><br>
<%=request.getHeader("Accept") %>




</body>
</html>