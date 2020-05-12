<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%!//변수 선언%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------forwardForm.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>forwardForm.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	%>

	<h2>forwardForm.jsp</h2>
	<br>

	<form action="forwardPro.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" id=""></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" id=""></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" id=""></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="전송"><input
					type="reset" value="취소"></td>
			</tr>
		</table>
	</form>


</body>

</html>