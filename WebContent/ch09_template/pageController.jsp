<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------pageController.jsp");
%>

<%
//자바 구문
 String product = request.getParameter("product");
String control = null;

String contentPage = null;
String pageTitle = null;
%>

<%
//자바 구문
 if(product.equals("d")){
     control = "dc";
     contentPage = "dc.jsp";
     pageTitle="디지털카메라";
 }else if(product.equals("p")){
     control = "pmp";
     contentPage = "pmp.jsp";
     pageTitle="pmp";
 }
 %>

 <jsp:forward page="template.jsp">
  <jsp:param name="control" value="<%= control%>"/> 
  <jsp:param name="contentPage" value="<%= contentPage%>"/> 
  <jsp:param name="pageTitle" value="<%= pageTitle%>"/> 
</jsp:forward>
