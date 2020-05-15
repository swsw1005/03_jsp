<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="boardre.*"%>



<%
	System.out.println("------ Update.jsp --- ");
	request.setCharacterEncoding("UTF-8"); // 한글 처리

	//  Update 작업
	// 1. request 데이터 받기
	String num_ = request.getParameter("num");
	int num = Integer.parseInt(num_.trim());
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String name = request.getParameter("name");
	
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));

	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");

	// 2. DTO CREATE + SETTER
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setName(name);

	System.out.println("dto.toString()");
	System.out.println(dto.toString());

	// 3. DAO work
	BoardDAO dao = new BoardDAO();
	dao.update(dto);

	// 글보기로 자동 이동시킨다.
	response.sendRedirect("View.jsp?no=" + num);
%>

<%--readForm  자바스크립트를 함께 사용 --%>
	<form name="readForm" method="post">
		<!-- num값은 javascript 에서 넣었음 -->
		<input type="hidden" name="num" value="">
		<!--  -->
		<input type="hidden" name="page" value="<%=nowPage%>">
		<!--  -->
		<input type="hidden" name="keyField" value="<%=keyField%>">
		<!--  -->
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
		<!--  -->
	</form>

