<%@page import="boardre.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	System.out.println("------ Delete.jsp --- ");
	request.setCharacterEncoding("UTF-8"); // 한글 처리

	BoardDAO dao = new BoardDAO();

	
	
	//  Delete 작업
	// 1. request 데이터 받기
	int num = Integer.parseInt(request.getParameter("num").trim());
	int nowPage = Integer.parseInt(request.getParameter("nowPage")
			.trim());

	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");

	if (keyField == null)
		keyField = "";
	if (keyWord == null)
		keyWord = "";
	
 String inputPass = request.getParameter("pass").trim();
 String dbPass = dao.getPass(num).trim();
 
 System.out.println("inputPass="+inputPass);
 System.out.println("dbPass="+dbPass);

	// 3. DAO work
	
	if(inputPass.equals(dbPass)){
	dao.delete(num);
	}
	
	
	//response.sendRedirect("List.jsp");
%>



<script>
	window.onload = function() {
		var form = document.readForm;
		form.submit();
	}
</script>

<%--readForm  자바스크립트를 함께 사용 --%>
<form name="readForm" method="post" action="List.jsp">
	<!-- num값은 javascript 에서 넣었음 -->
	<input type="hidden" name="num" value="<%=num%>">
	<!--  -->
	<input type="hidden" name="nowPage" value="<%=nowPage%>">
	<!--  -->
	<input type="hidden" name="keyField" value="<%=keyField%>">
	<!--  -->
	<input type="hidden" name="keyWord" value="<%=keyWord%>">
	<!--  -->
</form>


