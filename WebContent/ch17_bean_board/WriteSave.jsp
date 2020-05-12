<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="board1.*"%>

<%--WriteSave.jsp--%>
<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="board1.BoardDTO">
	<jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<%
	BoardDAO dao = new BoardDAO();
	dao.insertDB(dto);//dao메서드 호출 , insert가 되는 것이디
	response.sendRedirect("List.jsp");
%>