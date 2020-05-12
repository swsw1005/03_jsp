<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test07_config.jsp</title>
</head>
<body>

	<h4>서블릿 이름:</h4><%=config.getServletName()%><br>
	<h4>서블릿 :</h4><%=config.getServletContext()%><br>

	<h2>web.xml에서 설정해놓은 이름 출력</h2>
	<br>
	<h4>이름:</h4><%=config.getServletContext().getInitParameter("name")%><br>
	<h4>이름:</h4><%=application.getInitParameter("name")%>

	<br>
	<br>
	<br>
	<br>
	<%
		//자바 구문
		out.println("<context-param>");
		out.println("<param-name>name</param-name>");
		out.println("<param-value>홍길동</param-value>");
		out.println("</context-param>");
	%>

</body>
</html>