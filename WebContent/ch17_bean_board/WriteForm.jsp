<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
<%!
//변수 선언
 
%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------WriteForm.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> WriteForm.jsp  </title>
 <%-- bootstrap 3.4.1 --%>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
 
<style>
 * { margin: 0px;   padding: 0px;  } 
 
 
</style>
<script>
// 스크립트
 
</script>
</head>
<body>
<!-- 내용 -->
<h2> WriteForm.jsp </h2>

 <form method="post" action="WriteSave.jsp">
    <table>
     <tr>
       <td align="center" colspan="2">
         <font size="5">게시판 글쓰기</font>
       </td>
     </tr>
     
     <tr>
       <td>이름</td>
       <td><input type="text" name="name" size="30"></td>
     </tr>
     <tr>
       <td>글제목</td>
       <td><input type="text" name="title" size="50"></td>
     </tr>
     <tr>
       <td>글내용</td>
       <td>
       <textarea name="content" rows="10" cols="60"></textarea>
       </td>
     </tr>
     <tr>
       <td colspan="2" align="center">
         <input type="submit" value="전송">
         <input type="reset" value="취소">
       </td>
       
     </tr>
    
    </table>
  
  </form>
 
 
</body>
 
</html>