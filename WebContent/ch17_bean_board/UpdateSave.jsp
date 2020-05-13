<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="board1.*"%>

<%
	//자바 구문
	request.setCharacterEncoding("UTF-8");
	System.out.println("------UpdateSave.jsp");
%>

<%
	BoardDTO dto = new BoardDTO();
	BoardDAO dao = new BoardDAO();

	int num = Integer.parseInt(request.getParameter("num").trim());

	String a1 = request.getParameter("title");
	String a2 = request.getParameter("content");
	
	System.out.println(a1);
	System.out.println(a2);
	System.out.println(num);
	
	
	dto.setTitle(a1);
	dto.setContent(a2);
	dto.setNum(num);

	dao.updateDB(dto);

	response.sendRedirect("List.jsp");

	// response.sendRedirect("Content.jsp?num=<%=num%>"); 
	///.... 
	%>
