<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mybean.*"%>
<%!//변수 선언%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------TestBean.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>TestBean.jsp</title>
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
	<h2>TestBean.jsp</h2>
	<br>


	<jsp:useBean id="testBean" class="mybean.TestBean">

		<jsp:setProperty name="testBean" property="id" value="swsw" />
		<jsp:setProperty name="testBean" property="pwd" value="12345" />
		<jsp:setProperty name="testBean" property="name" value="임성우" />

		<h3>
			<br> 자바Beans
		</h3>
		<h4>id</h4>
		<jsp:getProperty name="testBean" property="id" />
		<h4>pwd</h4>
		<jsp:getProperty name="testBean" property="pwd" />
		<h4>name</h4>
		<jsp:getProperty name="testBean" property="name" />

	</jsp:useBean>

	<h3>
		<br> 직접Getter메소드
	</h3>

<%
//자바 구문
 testBean.setId("swswsw");
 testBean.setPwd("1234");
 testBean.setName("림성우");
%>

	<h4>id</h4>
	<%=testBean.getId()%>
	<h4>pwd</h4>
	<%=testBean.getPwd()%>
	<h4>name</h4>
	<%=testBean.getName()%>




</body>

</html>