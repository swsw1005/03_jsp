<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--template.jsp--%>

<%
String pageFile=request.getParameter("page");

if(pageFile==null){
	pageFile="newItem.jsp";//신상품
}
%>

<html>
 <body bgcolor="ivory">
   <table width="90%" height="90%" border="1" align="center" bgcolor="#cccccc">
   
   <%--상단메뉴 --%>
    <tr>
      <td height="10%" colspan="2" align="right">
        <jsp:include page="top.jsp"/>
      </td>
    </tr>
    
    <tr>
    <%--왼쪽메뉴 --%>
      <td width="10%" align="right" valign="top">
       <br>
       <jsp:include page="left.jsp"/>
      </td>
      
     <%--중앙표시 --%>
      <td align="center">
        <jsp:include page="<%=pageFile %>"/>
      </td>
    </tr>
   
   <%--하단메뉴 --%>
    <tr>
      <td height="10%" colspan="2">
        <jsp:include page="bottom.jsp"/>
      </td>
    </tr>
    
   </table>
 </body>
</html>