<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.sql.*"%>
<%!
//변수 선언
 
%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------template.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<title> template.jsp  </title>
<style>
 * { margin: 0px;   padding: 0px;  } 
 
 
</style>
<script>
// 스크립트
 
 
</script>
</head>
<body>
<!-- 내용 -->
<h2> template.jsp </h2>

 <%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------template.jsp");
%>

<%
//자바 구문
String control = request.getParameter("control");
String contentPage=request.getParameter("contentPage");//변수
String pageTitle=request.getParameter("pageTitle");//변수

String left = control+"left.jsp";
%>

<h1>MyHome Page</h1>
     
     <table width="90%" height="90%" align="center" bgcolor="margenta" border="1" cellpadding="5" cellspacing="0">
      
       <%--Top메뉴 --%>
       <tr>
         <td colspan="2" height="10%">
          <font size="3">
            <jsp:include page="top.jsp" flush="false"/>
          </font>
          </td>
       </tr>
     
       <tr>
         <%--왼쪽메뉴 --%>
         <td width="10%" valign="top">
            <jsp:include page="<%= left%>" flush="false"/>
         </td>
         
         <%--중앙표시 --%>
         <td width="80%" height="80%" valign="top">
            <jsp:include page="<%=contentPage %>" flush="false"/>
         </td>
       </tr>
     
     
     <%--bottom메뉴 --%>
       <tr>
         <td colspan="2" height="10%">
          <font size="3">
            <jsp:include page="bottom.jsp" flush="false"/>
          </font>
          </td>
       </tr>
     </table>
 
</body>
 
</html>
