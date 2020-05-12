<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test06_pageContext.jsp</title>
</head>
<body>
<%
//JspWriter out=pageContext.getOut(); // 내장객체
JspWriter outt=pageContext.getOut();
outt.println("2020년 04월 27일 <br>");
%>

<p>요청 객체:</p><%=pageContext.getRequest() %><br>
<p>세션 객체:</p><%=pageContext.getSession() %><br>
<p>예외 객체:</p><%=pageContext.getException() %><br>

<%
pageContext.getOut().println("무슨소린지");

String name=pageContext.getServletContext().getInitParameter("name");
out.println(name);
%>
</body>
</html>