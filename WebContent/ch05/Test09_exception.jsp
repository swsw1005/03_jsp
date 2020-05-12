<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="Test10_err.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

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
	<!-- 내용 -->
	<%
		//자바 구문
		int a = 7;
		int b = 0;
	%>

	<strong>a+b : </strong>
	<%=a + b%><br>
	<strong>a-b : </strong>
	<%=a - b%><br>
	<strong>a*b : </strong>
	<%=a * b%><br>
	<strong>a/b : </strong>
	<%=a / b%><br>


</body>

</html>