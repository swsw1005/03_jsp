<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");

String season=request.getParameter("season");
String fruit=request.getParameter("fruit");

String id=(String)session.getAttribute("id"); //id에 해당하는 값을 얻는다.
String sessionID=session.getId(); //session Id얻기, sessionID는 자동 부여된다.

int intervalTime=session.getMaxInactiveInterval(); //세션유지 시간 얻기

%>

<%
if(id != null){ //로그인 상태이면,
%>
<b><%=id %></b>님이 좋아하는 계절과 과일은<br>
<b><%=season %></b>, <b><%=fruit %></b> 입니다.
<br>
sessionID : <%=sessionID %> <br>
세션유지시간 : <%=intervalTime %> <br>
 
<%	
session.invalidate(); //세션 무효화(로그아웃)

}else{ //비로그인 상태이면,
	out.println("세션시간이 경과하였거나, 다른이유로 연결할 수 없습니다.<br>");
	out.println("로그인을 하세요.<br>");    
	out.println("<a href='Session.html'>로그인</a>");    
}
%>