<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board1.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------Delete.jsp");
%>

<%
	//자바 구문
	int num = Integer.parseInt(request.getParameter("num").trim());

	System.out.println("num : " + num);

	BoardDAO dao = new BoardDAO();

	dao.deleteDB(num);

	response.sendRedirect("List.jsp");
%>