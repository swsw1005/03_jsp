<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--Post.jsp--%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Post.jsp</title>

<!-- bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery 3.4.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


<style>
</style>









</head>
<body>


	<!-- bootstrap form start////////////////////////////////////////////// -->
	<div class="container">
		<h2>글 쓰기</h2>
		<form action="PostPro.jsp" method="POST" name="postForm">
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
				<input type="submit" value="저장&쓰기" class="btn btn-default" />
				<!-- ----------------------------------------------------------------------------- -->
				<input type="reset" value="내용 지우기" class="btn btn-default" />
				<!-- ----------------------------------------------------------------------------- -->
				<a href="List.jsp" class="btn btn-default">목록으로</a>
			</div>
			<!-- ////////////////////////////////////////////// -->
			<input type="text" name="ip" value="<%=request.getRemoteAddr()%>"
				class="form-control">
			<!-- ////////////////////////////////////////////// -->
		</form>
	</div>
	<!-- bootstrap form end ////////////////////////////////////////////// -->



</body>
</html>