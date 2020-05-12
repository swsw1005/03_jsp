<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>A.jsp</title>
</head>
<body>
<h2>A.jsp</h2>
<%
	request.setCharacterEncoding("UTF-8");
%>


<%
String bloodType=request.getParameter("bloodType");
String name=request.getParameter("name");
%>

<b><%=name %></b>님의 혈액형은 
<b><%=bloodType %></b>형이고
<br>
성실하고 신중하며 완벽 주의자 입니다 

<script>
console.log("<%=name %>");
</script>

</body>
</html>