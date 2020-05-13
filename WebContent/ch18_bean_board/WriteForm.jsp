<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%!//변수 선언%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------WriteForm.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>WriteForm.jsp</title>
<%-- bootstrap 3.4.1 --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%-- jquery 3.4.1 --%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
* {
	margin: 0px;
	padding: 0px;
}

td {
	border: 1px solid violet;
	text-align : center;
	padding : 5px;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<!-- 내용 -->
	<h2>WriteForm.jsp</h2>
	<%
		//자바 구문
	%>
	<form action="WriteSave.jsp" method="post">

		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" id="content" cols="30" rows="10"></textarea>
				</td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" value="등록"  class="btn btn-primary" />
				</td>
			</tr>
		</table>

	</form>



</body>

</html>