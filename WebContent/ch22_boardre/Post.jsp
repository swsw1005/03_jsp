<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--Post.jsp--%>
<html>
<head>

<!-- bootstrap 3.4.1 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- jquery 3.4.1 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>





<script type="text/javascript">
	function check() {
		if (document.postForm.name.value == '') {
			alert("글쓴이를 입력 하시요 ");
			document.postForm.name.focus();
			return;
		}
		if (document.postForm.subject.value == '') {
			alert("글제목를 입력 하시요 ");
			document.postForm.subject.focus();
			return;
		}
		if (document.postForm.content.value == '') {
			alert("글내용를 입력 하시요 ");
			document.postForm.content.focus();
			return;
		}
		if (document.postForm.pass.value == '') {
			alert("암호를 입력 하시요 ");
			document.postForm.pass.focus();
			return;
		}
		document.postForm.submit();//서버로 전송 

	}//check() end
</script>


<style type="text/css">
table {
	margin: auto;
}
</style>
</head>
<body>
	<!-- bootstrap form start////////////////////////////////////////////// -->
	<div class="container">
		<h2>글 쓰기</h2>
		<form action="PostPro.jsp" method="POST">
			<!-- ////////////////////////////////////////////// -->
			<div class="form-group">
				<label for="name">이름</label>
				<!-- ----------------------------------------------------------------------------- -->
				<input name="name" id="name" placeholder="Input name" type="text"
					class="form-control" required="required">
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
				<input name="subject" id="subject" placeholder="Input subject"
					type="text" class="form-control" required="required">
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
				<input name="pass" id="pass" placeholder="Input password"
					type="password" class="form-control" required="required">
			</div>
			<!-- ////////////////////////////////////////////// -->
			<div class="btn-group">
				<!-- ----------------------------------------------------------------------------- -->
				<input type="submit" value="저장&쓰기" class="btn btn-default" />
				<!-- ----------------------------------------------------------------------------- -->
				<input type="reset" value="내용 지우기" class="btn btn-default" />
				<!-- ----------------------------------------------------------------------------- -->
				<ahref ="List.jsp" class="btn btn-default">목록으로</a>
			</div>
			<!-- ////////////////////////////////////////////// -->
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
			<!-- ////////////////////////////////////////////// -->
		</form>
	</div>
	<!-- bootstrap form end ////////////////////////////////////////////// -->



</body>
</html>