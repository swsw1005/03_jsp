<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--template.jsp--%>
<html>
  <body>
    <table align="center" width="90%" height="90%" border="1">
      <%--상단메누 --%>
      <tr>
        <td align="right" colspan="2" bgcolor="margenta" height="10%">
           <jsp:include page="top.jsp" flush="false"/>
           <%--flush는 출력버퍼 비우지 않는다--%>
        </td>
      </tr>
    
      <%--왼쪽메뉴, 가운데내용 출력 --%>
      <tr>
        <td width="10%" valign="top" bgcolor="pink">
          <jsp:include page="left.jsp" flush="false"/>
        </td><!-- 왼쪽메뉴 -->
        
        
        <td width="80%" valign="top" align="center">
          <jsp:include page="content.jsp" flush="false"/>
        </td><!-- 중앙에 내용 표시 -->
      </tr>
      
      <tr>
       <td colspan="2" align="center" height="10%" bgcolor="lightGray">
         <jsp:include page="bottom.jsp"/>
       </td>
      </tr>
      
      
    </table>
  </body>
</html>

