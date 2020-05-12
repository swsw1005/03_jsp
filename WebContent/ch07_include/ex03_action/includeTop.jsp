<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<body>
  <%--includeTop.jsp --%>
  
  <%
  String name=request.getParameter("name");
  %>
  <hr color="blue">
  includeTop.jsp 입니다<br>
  <b><%=name %>님 Fighting!!!!!!!</b>
  <hr color="blue">
</body>
</html>
