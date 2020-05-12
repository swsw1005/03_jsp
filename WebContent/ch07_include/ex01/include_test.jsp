<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
<%!
//변수 선언
 
%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------include_test.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> include_test.jsp  </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
 * { margin: 0px;   padding: 0px;  } 
 
 
</style>
<script>
// 스크립트
 
 
</script>
</head>
<body>
<!-- 내용 -->
<h2> include_test.jsp </h2>
includeTest.jsp내용<br>
includeTest.jsp내용<br>
includeTest.jsp내용<br>

&lt;%@ include file="filename"%&gt;
<br>
<%@ include file="copyright.jsp" %>
<br>
includeTest.jsp내용<br>
includeTest.jsp내용<br>
includeTest.jsp내용<br>
 
</body>
 
</html>