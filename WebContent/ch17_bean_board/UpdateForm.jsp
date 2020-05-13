<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="board1.*"%>
<%@ page import="java.text.*"%>
<%!//변수 선언%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------UpdateForm.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>UpdateForm.jsp</title>
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

.readonly {
	background: #eeeeee;
}
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<!-- 내용 -->
	<h2>UpdateForm.jsp</h2>
	<%
		int num = Integer.parseInt(request.getParameter("num"));

		BoardDAO dao = new BoardDAO();//객체생성
		BoardDTO dto = dao.getContent(num);//num에 해당하는 자료 가져오기
	%>

	<form action="UpdateSave.jsp" method="post">
		<table>
			<tr>
				<td>글번호</td>
				<td><input type="text" id="num" name="num"
					value="<%=dto.getNum()%>" readonly="true" class="readonly" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="title" name="title"
					value="<%=dto.getTitle()%>" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" id="name" name=""
					name""
					value="<%=dto.getName()%>" readonly="true"
					class="readonly" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea id="content" name="content" cols="50" rows="10"><%=dto.getContent()%></textarea></td>
			</tr>

			<tr>
				<td></td>
				<td><a href="List.jsp" class="btn btn-primary">글목록</a> <a
					href="WriteForm.jsp" class="btn btn-primary">글쓰기</a></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="글 수정" class="btn btn-primary" /></td>
			</tr>
		</table>
	</form>

</body>

</html>