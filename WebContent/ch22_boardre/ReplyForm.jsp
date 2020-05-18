<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	System.out.println("------ ReplyForm.jsp --- ");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>ReplyForm.jsp</title>

<!-- bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery 3.4.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
</style>


<script>
	$(function() {
		$("#btnToWrite").click(function() {
			var form = document.replyForm;
			form.action = "Reply.jsp";
			form.submit();
		});
	});
</script>


</head>


<%
	int num = Integer.parseInt(request.getParameter("num").trim());
	int nowPage = Integer.parseInt(request.getParameter("nowPage")
			.trim());
	int depth = Integer.parseInt(request.getParameter("depth").trim()) + 1;
	int pos = Integer.parseInt(request.getParameter("pos").trim());
	String keyField = "";
	String keyWord = "";
	String ip = request.getParameter("ip");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String name = request.getParameter("name");

	if (request.getParameter("keyWord") != null) {
		//검색어가 있을때
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}

	System.out.println("num " + num);
	System.out.println("nowPage " + nowPage);
	System.out.println("keyField " + keyField);
	System.out.println("keyWord " + keyWord);
	System.out.println("depth " + depth);
	System.out.println("ip " + ip);
	System.out.println("pos " + pos);
%>


<body>
	<!-- 내용 -->

	<!-- bootstrap form start////////////////////////////////////////////// -->
	<div class="container">
		<h2>ReplyForm</h2>
		<form action="" method="POST" name="replyForm">
			<!-- ////////////////////////////////////////////// -->
			<div class="form-group">
				<label for="name">이름</label>
				<!-- ----------------------------------------------------------------------------- -->
				<input name="name" id="name" type="text" class="form-control"
					placeholder="Input name" required="required">
			</div>
			<!-- ////////////////////////////////////////////// -->
			<div class="form-group">
				<label for="email">email</label>
				<!-- ----------------------------------------------------------------------------- -->
				<input name="email" id="email" type="email" class="form-control"
					required="required" placeholder="abc@def.com">
			</div>
			<!-- ////////////////////////////////////////////// -->
			<div class="form-group">
				<label for="subject">제목</label>
				<!-- ----------------------------------------------------------------------------- -->
				<input name="subject" id="subject" type="text" class="form-control"
					required="required">
			</div>
			<!-- ////////////////////////////////////////////// -->
			<div class="form-group">
				<label for="content">내용</label>
				<!-- ----------------------------------------------------------------------------- -->
				<textarea name="content" id="content" class="form-control" rows="5"></textarea>
			</div>
			<!-- ////////////////////////////////////////////// -->
			<div class="form-group">
				<label for="password">암호</label>
				<!-- ----------------------------------------------------------------------------- -->
				<input name="pass" id="pass" placeholder="Input password" type="password"
					class="form-control" required="required">
			</div>
			<!-- ////////////////////////////////////////////// -->
			<div class="btn-group">
				<!-- ----------------------------------------------------------------------------- -->
				<button id="btnToWrite" class="btn btn-success">답글 입력</button>
				<!-- ----------------------------------------------------------------------------- -->
				<input type="reset" value="내용 지우기" class="btn btn-default" />
				<!-- ----------------------------------------------------------------------------- -->
				<a href="List.jsp" class="btn btn-default cancelBtn">목록으로</a>
			</div>

			<br> <br>
			<!-- ////////////////////////////////////////////// -->
			<input type="text" name="ip" value="<%=request.getRemoteAddr()%>"
				class="form-control">
			<!-- ////////////////////////////////////////////// -->
			<input type="text" name="num" value="<%=num%>" class="form-control">
			<!-- ////////////////////////////////////////////// -->
			<input type="text" name="depth" value="<%=depth%>" class="form-control">
			<!-- ////////////////////////////////////////////// -->
			<input type="text" name="keyField" value="<%=keyField%>" class="form-control">
			<!-- ////////////////////////////////////////////// -->
			<input type="text" name="keyWord" value="<%=keyWord%>" class="form-control">
			<!-- ////////////////////////////////////////////// -->
			<input type="text" name="nowPage" value="<%=nowPage%>" class="form-control">
			<!-- ////////////////////////////////////////////// -->
			<input type="text" name="pos" value="<%=pos%>">
			<!-- ////////////////////////////////////////////// -->
		</form>
	</div>
	<!-- bootstrap form end ////////////////////////////////////////////// -->





</body>
</html>