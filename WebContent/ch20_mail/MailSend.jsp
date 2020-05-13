<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="mail.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------MailSend.jsp");
%>

<jsp:useBean id="mailBean" class="mail.MailSender">
	<jsp:setProperty name="mailBean" property="*" />
</jsp:useBean>

<%=mailBean.send()%>