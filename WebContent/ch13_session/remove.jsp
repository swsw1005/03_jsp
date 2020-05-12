<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%-- remove.jsp --%>
<%
Vector vecart=(Vector)session.getAttribute("vecart");
%>
<h2>삭제할 CD를 고르세요</h2>
<form method="post" action="cart.jsp"> 
  <select name="item">
    <%
    for(int i=0; i<vecart.size(); i++){
    	%>
        <option value="<%=vecart.get(i) %>"><%=vecart.get(i) %></option>
    	<%
    }//for end
    %>
  </select>
  <input type="hidden" name="step" value="remove">
  <input type="submit" value="삭제">
</form>
