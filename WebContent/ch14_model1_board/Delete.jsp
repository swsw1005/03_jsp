<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%!String DRIVER = "com.mysql.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/mydb1";
	String USER = "root";
	String PWD = "12345";%>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");//p.k
%>

<%--Delete.jsp --%>
num:<%=request.getParameter("num")%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function check() {
		console.log("111");
		if (document.delForm.pwd.value == '') {
			alert('암호를 입력하세요');
			document.delForm.pwd.focus();
			return;
		}

		document.delForm.action="DeleteSave.jsp?num=<%=num%>";
		document.delForm.submit();
	}//check end
</script>
</head>
<body>
	<h2>글삭제폼</h2>

	<form name="delForm" method="post">

		<table>
			<tr>
				<td>
					<h5>글삭제를 원하면 암호를 입력하</h5>
				</td>
			</tr>

			<tr>
				<td>비밀번호 : <input type="password" name="pwd">
				</td>
			</tr>
			<tr>
				<td><br> <input type="button" value="글삭제"
					onclick="check()"> <br> <input type="button"
					value="돌아가기" onclick="history.go(-1)"></td>
			</tr>
		</table>

	</form>



</body>
</html>