<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ page import = "board2.*"%>
 
<%
//자바 구문
request.setCharacterEncoding("UTF-8");
System.out.println("------WriteSave.jsp");
%>

<% 
Board2DAO dao = new Board2DAO();
Board2DTO dto = new Board2DTO();

dto.setName(request.getParameter("name"));
dto.setTitle(request.getParameter("title"));
dto.setContent(request.getParameter("content"));

dao.insert(dto);

response.sendRedirect("List.jsp");

%>