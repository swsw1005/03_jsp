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
	<div class="container">
		<h2>글 쓰기</h2>
		<form action="PostPro.jsp" method="POST"   class="form-horizontal"  >

			<div class="form-group">
				<label for="name" class="control-label col-sm-2">이름</label>

				<div class="col-sm-10">
					<input name="name" id="name" placeholder="Input name" type="text"
						class="form-control" required="required">
				</div>
			</div>

			<div class="form-group">
				<label for="email" class="control-label col-sm-2">email</label>

				<div class="col-sm-10">
					<input name="email" id="email" type="email" class="form-control"
						required="required" placeholder="abc@def.com">
				</div>
			</div>

			<div class="form-group">
				<label for="subject" class="control-label col-sm-2">제목</label>

				<div class="col-sm-10">
					<input name="subject" id="subject" placeholder="Input subject"
						type="text" class="form-control" required="required">
				</div>
			</div>

			<div class="form-group">
				<label for="content" class="control-label col-sm-2">내용</label>

				<div class="col-sm-10">
					<textarea name="content" id="content" class="form-control" rows="5"
						required="required" ></textarea>
				</div>
			</div>

			<div class="form-group">
				<label for="" class="control-label col-sm-2">암호</label>

				<div class="col-sm-10">
					<input name="pass" id="pass" placeholder="Input password"
						type="password" class="form-control" required="required">
				</div>
			</div>

			<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="submit" class="btn btn-primary" /> <input
						type="reset" value="cancel" class="btn btn-warning" /> <a
						href="List.jsp" class="btn btn-success">목록으로</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>