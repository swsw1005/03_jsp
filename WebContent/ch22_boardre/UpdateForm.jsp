<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="boardre.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ Update.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Update.jsp</title>
<!-- bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery 3.4.1 -->
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
	String no = request.getParameter("no").trim();
	int num = Integer.parseInt(no);
	
	boardre.BoardDAO dao = new BoardDAO();
	
	BoardDTO dto = dao.getDto(num);
	String subject = dto.getSubject();
	String content = dto.getContent();
	String name = dto.getName();
	
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));

	String	 keyField = request.getParameter("keyField");
	String	keyWord = request.getParameter("keyWord");
		
	
	%>

	<div class="container">
		<h2>Update</h2>
		<form action="Update.jsp" method="post">
			<!-- 글번호 readOnly -->
			<div class="form-group">
				<label for="no">작성자</label> <input value="<%=num %>" type="text"
					class="form-control" id="num" name="num" readOnly>
			</div>

			<!-- 제목입력 -->
			<div class="form-group">
				<label for="subject">제목</label> <input value="<%=subject %>" type="text"
					class="form-control" id="subject" name="subject"
					required="required">
			</div>

			<!-- 내용입력 -->
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content"
					required="required" style="resize: none;"><%=content %></textarea>
			</div>

			<!-- 작성자 입력  readOnly -->
			<div class="form-group">
				<label for="name">작성자</label> <input value="<%=name %>" type="text"
					class="form-control" id="name" name="name" readOnly>
			</div>


			<div class="btn-group">
				<!-- 입력 버튼-->
				<button class="btn btn-default">쓰기</button>
				<!-- reset 버튼 -->
				<button type="reset" class="btn btn-default">새로입력</button>
				<!-- 버튼1 -->
				<a href="List.jsp" class="btn btn-default cancelBtn">목록보기</a>
				<!-- 버튼2 -->
				<a href="View.jsp?no=<%=num%>" class="btn btn-default cancelBtn">돌아가기</a>
			</div>
			
			
			<input type="hidden" name="num" value="">
		<!--  -->
		<input type="hidden" name="page" value="<%=nowPage%>">
		<!--  -->
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<!--  -->
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<!--  -->
			
			
		</form>
	</div>



</body>
</html>