<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test05_application.jsp</title>
</head>
<body>

<p>이름: </p><%= application.getInitParameter("name") %><br>
<p>TEL: </p><%= application.getInitParameter("tel") %><br>
<p>주소 : </p><%=application.getInitParameter("addr") %><br>

</body>
</html>