<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------PostPro.jsp");
%>

<jsp:useBean id="dto" class="boardre.BoardDTO">
	<jsp:setProperty name="dto" property="*" /><%--setter작업 --%>
</jsp:useBean>

<%
	boardre.BoardDAO dao = new boardre.BoardDAO();
	dao.insertBoard(dto);//dao메서드 호출 
	response.sendRedirect("List.jsp");
%>