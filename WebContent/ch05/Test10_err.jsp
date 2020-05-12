<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page isErrorPage="true"%>
<%!//변수 선언%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Document</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<h3>에러가 발생하면 Test10_err.jsp 페이지 오도록 한다</h3>

	<%
		String msg = exception.getMessage();
		String obj = exception.toString();
	%>

	<strong>에러 메시지 : </strong><%=msg%>
	<br>
	<strong>에러 실체의 클래스명과 에러 메시지 :</strong>
	<%=obj%>
	<br>
</body>
</html>