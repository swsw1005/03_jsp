<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
<%!
//변수 선언
 
%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------includeTop.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> includeTop.jsp  </title>
<style>
 * { margin: 0px;   padding: 0px;  } 
 
 
</style>
<script>
// 스크립트
 
 
</script>
</head>
<body>
<body>
<!-- 내용 -->
<h2> includeTop.jsp </h2>
<%
//자바 구문
 
%>

<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

String name=request.getParameter("name");
String addr=request.getParameter("addr");
String tel=request.getParameter("tel");
%>
<table border="1">
  <tr>
    <td colspan="2" align="center">
      includeTop.jsp 처리 결과 
    </td>
  </tr>
  
  <tr>
    <td>ID</td>
    <td><%=id %></td>
  </tr>
  <tr>
    <td>PWD</td>
    <td><%=pwd %></td>
  </tr>
  <tr>
    <td>NAME</td>
    <td><%=name %></td>
  </tr>
  <tr>
    <td>Address</td>
    <td><%=addr %></td>
  </tr>
  <tr>
    <td>TEL</td>
    <td><%=tel %></td>
  </tr>
  
</table>
 
 
</body>
 
</html>