<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--includeTag.jsp--%>
<html>
 <body>
 
 <%--include 액션 태그는 처리 결과가 포함된다  --%>
 <%
 request.setCharacterEncoding("UTF-8");
 %>
 <jsp:include page="includeTop.jsp"/>
 <%
 String name="Korea Football";//변수
 %>
 includeTag.jsp내용<br>
 includeTag.jsp내용<br>
 includeTag.jsp내용<br>
 
 <%=name%><br>
 </body>

 
 

</html>