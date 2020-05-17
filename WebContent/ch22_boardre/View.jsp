<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@page import="boardre.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ View.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>View.jsp</title>

<!-- bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery 3.4.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
* {
	margin: 0px;
	padding: 0px;
}

pre {
	margin: 0px;
	padding: 0px;
	border: none;
	background: none;
	font-size: 1em;
}
</style>
<script>
	// 스크립트

	//btnToUpdate
	$(function() {

		$("#btnToUpdate").click(function() {
			var form = document.listForm;

			form.submit();
		});

	});
</script>
</head>
<body>
	<!-- 내용 -->
	<%
		boardre.BoardDAO dao = new BoardDAO();

		//조회수 증가
		dao.upPos();

		int num = Integer.parseInt(request.getParameter("num").trim());
		int nowPage = Integer.parseInt(request.getParameter("nowPage"));
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");

		dao.upCount(num);//조횟수 증가 메서드 호출 
		boardre.BoardDTO dto = dao.getDto(num);
		System.out.println(dto.toString());

		String name = dto.getName();
		String email = dto.getEmail();
		String subject = dto.getSubject();
		String regdate = dto.getRegDate();

		String content = dto.getContent();
		String ip = dto.getIp();
		int count = dto.getCount();
	%>


	<!-- bootstrap 3.4.1 container -->
	<div class="container">
		<h2>View</h2>

		<table class="table table-bordered">

			<tbody>
				<%-- no --%>
				<tr>
					<td><label for="no">글번호</label></td>
					<td><%=dto.getNum()%></td>
				</tr>
				<%-- title --%>
				<tr>
					<td colspan="2"><label for="title">제목</label></td>
				</tr>
				<tr>
					<td colspan="2"><%=dto.getSubject()%></td>
				</tr>
				<%-- content --%>
				<tr>
					<td colspan="2"><label for="content">본문</label></td>
				</tr>
				<tr>
					<td colspan="2"><pre><%=dto.getContent()%></pre></td>
				</tr>
				<%-- writer --%>
				<tr>
					<td><label for="writer">작성자</label></td>
					<td><%=dto.getName()%></td>
				</tr>
				<%-- writedate --%>
				<tr>
					<td><label for="writedate">작성일</label></td>
					<td><%=dto.getRegDate()%></td>
				</tr>
				<%-- 버튼_그룹 --%>
				<tr>
					<td colspan="2">
						<div class="btn-group">

							<!-- 버튼1 -->
							<a href="WriteForm.jsp" class="btn btn-default">새 글 쓰기</a>
							<!-- 버튼2 -->
							<button id="btnToUpdate" class="btn btn-default cancelBtn">수정하기</button>
							<!-- 버튼3 -->
							<a href="List.jsp" class="btn btn-default cancelBtn">목록보기</a>
							<!-- 버튼4 -->
							<a href="Delete.jsp?no=<%=num%>" class="btn btn-default cancelBtn">삭제하기</a>

						</div>
					</td>
				</tr>

			</tbody>
		</table>

		<br>
		<br>


		<%
			if (keyWord == null || keyWord.equals("")) {//전체List
		%>
		<form name="listForm" method="post" action="UpdateForm.jsp">
			<input type="text" name="num" value="<%=num%>">
			<!-- .............................................................................. -->
			<input type="text" name="nowPage" value="<%=nowPage%>">
		</form>
		<%
			} else {//검색한 경우
		%>
		<form name="listForm" method="post" action="UpdateForm.jsp">
			<input type="text" name="num" value="<%=num%>">
			<!-- .............................................................................. -->
			<input type="text" name="nowPage" value="<%=nowPage%>">
			<!-- .............................................................................. -->
			<input type="text" name="keyWord" value="<%=keyWord%>">
			<!-- .............................................................................. -->
			<input type="text" name="keyField" value="<%=keyField%>">
		</form>
		<%
			}//else end
		%>
	
</body>
</html>