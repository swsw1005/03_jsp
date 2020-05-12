<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="mybean.*"%>

<%!//변수 선언%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------TestBean2.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>TestBean2.jsp</title>
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
	<h2>TestBean2.jsp</h2>
	<%
		//자바 구문
	%>

	<jsp:useBean id="tb" class="mybean.TestBean2">
		<jsp:setProperty name="tb" property="*" /><%-- 값 전체를 한방에 가져온다 --%>
	</jsp:useBean>

	<h4>ID</h4>
	<%=tb.getId()%>
	<h4>PW</h4>
	<%=tb.getPwd()%>
	<h4>이름</h4>
	<%=tb.getName()%>
	<h4>주소</h4>
	<%=tb.getAddr()%>
	<h4>이메일</h4>
	<%=tb.getEmail()%>
	<h4>전화</h4>
	<%=tb.getTel()%>


</body>

</html>