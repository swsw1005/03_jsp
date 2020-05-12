<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
<%!
//변수 선언
 
%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------copyright.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> copyright.jsp  </title>
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

<hr color="red">
<h2>copyright.jsp</h2>

<a href="mailto:<%@ include file="email.txt"%>">
 <%@ include file="name.txt" %>
</a>

<hr color="red">
 
</body>
 
</html>