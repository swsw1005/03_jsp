<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--top.jsp --%>

<%
	String id = (String) session.getAttribute("id");
	String log = "";//변수

	if (id == null) {
		log = "<a href='Login.jsp'>로그인</a>";
	} else {
		log = "<a href='Logout.jsp'>로그아웃</a>";
	}

	String mem = "";//변수
	if (id == null) {
		mem = "<a href='Register.jsp'>회원가입</a>";
	} else {
		mem = "<a href='RegisterUpdate.jsp'>회원정보 수정</a>";
	}
%>

<table width="70%" align="center" border="1">
	<tr bgcolor="#ffcc00">
		<td><%=log%></td>
		<td><%=mem%></td>
		<td><a href="Product.jsp">상품목록표</a></td>
		<td><a href="CartList.jsp">장바구니</a></td>
		<td><a href="OrderList.jsp">구매목록</a></td>

	</tr>
</table>

