<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--index2.jsp--%>
<html>
<body bgcolor="cyan">
	<%@ include file="top.jsp"%>

	<table width="70%" align="center" height="90%" bgcolor="#ffff99">
		<%
			if (id != null) {//로그인 상태 이면
		%>
		<tr>
			<td align="center"><%=id%>님 방문해 주셔서 갑사합니다</td>
		</tr>
		<%
			} else {//로그인 상태가 아니면
		%>
		<tr>
			<td align="center">로그인 한 후에 방문해 주세요</td>
		</tr>

		<%
			}//else end
		%>
	</table>
	<%@ include file="bottom.jsp"%>
</body>
</html>