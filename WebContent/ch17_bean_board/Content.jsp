<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="board1.*"%>
<%!//변수 선언%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------Content.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Content.jsp</title>
<%-- bootstrap 3.4.1 --%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style>
* {
	margin: 0px;
	padding: 0px;
}

table {
	margin: auto;
	line-height: 25px;
}

td {
	padding: 5px;
	border: 2px solid violet;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<!-- 내용 -->
	<h2>Content.jsp</h2>
	<%
		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO dao = new BoardDAO();//객체생성
		dao.setHit(num);//조회수 증가
		BoardDTO dto = dao.getContent(num);//num에 해당하는 자료 가져오기

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	%>


	<table>
		<tr>
			<td>글번호</td>
			<td><%=dto.getNum()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=dto.getName()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=dto.getContent()%></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=sdf.format(dto.getRegdate())%></td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=dto.getReadcount()%></td>
		</tr>
	</table>




</body>

</html>