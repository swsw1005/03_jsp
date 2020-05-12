<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session.jsp</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8"); //post 요청시 한글처리 (요청은 클라이언트가 한다.)

//클라이언트가 보내준 데이터 받기
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");

//DB의 id와 비교하여 같으면 인증한다
session.setAttribute("id", id); //*******************
session.setMaxInactiveInterval(60*5); //300초(유효기간 설정)
%>

<form method="post" action="Session2.jsp">
  1. 가장 좋아 하는 계절은 ?<br>
  <input type="radio" name="season" value="봄">봄<br>
  <input type="radio" name="season" value="여름">여름<br>
  <input type="radio" name="season" value="가을">가을<br>
  <input type="radio" name="season" value="겨울">겨울<br>
  <br>
  2. 가장 좋아 하는 과일은 ?<br>
  <input type="radio" name="fruit" value="사과">사과<br>
  <input type="radio" name="fruit" value="수박">수박<br>
  <input type="radio" name="fruit" value="키위">키위<br>
  <input type="radio" name="fruit" value="포도">포도<br>
  <br>
  
  <input type="submit" value="전송">
  
</form>
</body>
</html>