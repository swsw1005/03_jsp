<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
<%!
//변수 선언
 
%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Document</title>
<style>
 * { margin: 0px;   padding: 0px;  } 
 
 
</style>
<script>
// 스크립트
 
 
</script>
</head>
<body>
<!-- 내용 -->
<br>
<h3>getServletInfo</h3>
<br>
<%=
 this.getServletInfo()
%>
<br>
<br>
<h3>getServletName</h3>
<br>
<%=
 this.getServletName()
%>
<br>
<br>
<h3>getClass</h3>
<br>
<%=
 this.getClass()
%>
<br>
 
 
</body>
 
</html>