<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
<%!
//변수 선언
 
%>
 
<%
request.setCharacterEncoding("UTF-8");
System.out.println("------forwardPro2.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> forwardPro2.jsp  </title>
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
<h2> forwardPro2.jsp </h2>
<%
//자바 구문
 
%>

    <table align="center" border="1">
        <tr>
            <td>이름</td>
            <td><%= request.getParameter("name")%></td>
        </tr>
        <tr>
            <td>나이</td>
            <td><%= request.getParameter("age")%></td>
        </tr>
        <tr>
            <td>주소</td>
            <td><%= request.getParameter("addr")%></td>
        </tr>
        <tr>
            <td>전화</td>
            <td><%= request.getParameter("tel")%></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><%= request.getParameter("email")%></td>
        </tr>
        <tr>
            <td>글내용</td>
            <td><%= request.getParameter("content")%></td>
        </tr>
    </table>

 
 
</body>
 
</html>