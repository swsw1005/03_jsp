<%@page import="boardre.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	System.out.println("------ Reply.jsp --- ");
	request.setCharacterEncoding("UTF-8"); // 한글 처리

	//  Reply 작업
	// 1. request 데이터 받기
	int num = Integer.parseInt(request.getParameter("num").trim());
	int nowPage = Integer.parseInt(request.getParameter("nowPage")
			.trim());
	int depth = Integer.parseInt(request.getParameter("depth").trim());
	int pos = Integer.parseInt(request.getParameter("pos").trim());
	String keyField = "";
	String keyWord = "";
	String ip = request.getRemoteAddr();
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String pass = request.getParameter("pass");

	if (request.getParameter("keyWord") != null) {
		//검색어가 있을때
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}

	System.out.println("num " + num);
	System.out.println("nowPage " + nowPage);
	System.out.println("keyField " + keyField);
	System.out.println("keyWord " + keyWord);
	System.out.println("depth " + depth);
	System.out.println("ip " + ip);
	System.out.println("pass " + pass);

	// 2. DTO CREATE + SETTER
	BoardDTO dto = new BoardDTO();
	dto.setNum(num);
	dto.setName(name);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setDepth(depth);
	dto.setEmail(email);
	dto.setIp(ip);
	dto.setPos(pos);
	dto.setPass(pass);

	// 3. DAO work
	BoardDAO dao = new BoardDAO();
	dao.reply(dto);
	// 글보기로 자동 이동시킨다.
%>

<script>
	window.onload = function() {
		var form = document.replyForm;
		form.action = "List.jsp";
		form.submit();
	}
</script>


<%
	if (keyWord == null || keyWord.equals("")) {//전체List
%>
<form name="replyForm" id="replyForm" method="post" action="">
	<input type="text" name="num" value="<%=num%>">
	<!-- .............................................................................. -->
	<input type="text" name="nowPage" value="<%=nowPage%>">
</form>
<%
	} else {
		//검색한 경우
%>
<form name="replyForm" id="replyForm" method="post" action="">
	<input type="text" name="num" value="<%=num%>">
	<!-- .............................................................................. -->
	<input type="text" name="nowPage" value="<%=nowPage%>">
	<!-- .............................................................................. -->
	<input type="text" name="keyWord" value="<%=keyWord%>">
	<!-- .............................................................................. -->
	<input type="text" name="keyField" value="<%=keyField%>">
</form>
<%
	}//else end
%>
