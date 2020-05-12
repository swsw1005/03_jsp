<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
<%!
//변수 선언
 
%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------includeTag.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> includeTag.jsp  </title>
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
<h2> includeTag.jsp </h2>
<%
//자바 구문
 
%>

<p>includeTag.jsp내용</p>
<p>includeTag.jsp내용</p>
<p>includeTag.jsp내용</p>

<hr color="red">
  <jsp:include page="includeTop.jsp">
    <jsp:param name="name" value="수퍼맨"/>
    <jsp:param name="addr" value="서울 구로구 구로 5동"/>
    <jsp:param name="tel"  value="010-2323-7878"/>
  </jsp:include>

<hr color="red">
<p>includeTag.jsp내용</p>
<p>includeTag.jsp내용</p>
<p>includeTag.jsp내용</p>
 
</body>
 
</html>