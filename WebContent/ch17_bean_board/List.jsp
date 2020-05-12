<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="board1.*"%>



<%!//변수 선언%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------List.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>List.jsp</title>
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
</style>
<script>
	// 스크립트
</script>
</head>
<body>
	<!-- 내용 -->
	<h2>List.jsp</h2>
	<%
		//자바 구문
		BoardDAO dao = new BoardDAO();
		Vector<BoardDTO> vec = dao.getList();
	%>

	<div class="container">
		<h2>게시판 리스트</h2>
		<h2><%=vec.size() %> </h2>
		<table class="table">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>

			<%
				for (int i = 0; i < vec.size(); i++) {
			%>
			<tr class="dataRow">
			
			
			
				<td class="no"><%=vec.get(i).getNum()%></td>
				<td> <a href="Content.jsp?num=<%=vec.get(i).getNum()%>"><%= vec.get(i).getTitle()%></a></td>
				<td><%=vec.get(i).getContent()%></td>
				<td><%=vec.get(i).getName()%></td>
				<td><%=vec.get(i).getRegdate()%></td>
				<td><%=vec.get(i).getReadcount()%></td>
			</tr>

			<%
				}
			%>



			<!-- 반복의 끝 -->
			<!-- 버튼 처리 -->
			<tr>
				<td colspan="5"><a href="WriteForm.jsp" class="btn btn-primary">글쓰기</a>
				</td>
			</tr>
		</table>
	</div>


</body>

</html>