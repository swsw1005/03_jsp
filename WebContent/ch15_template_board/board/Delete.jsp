<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--Delete.jsp --%>
<%
String num=request.getParameter("num");
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
	function check(){
		if(document.delForm.pwd.value==''){
			alert("암호를 입력 하시요");
			document.delForm.pwd.focus();
			return;
		}//if
		//document.delForm.action="DeleteSave.jsp?num="+num;
		document.delForm.action="./board/DeleteSave.jsp?num=<%=num%>";
		document.delForm.submit();//서버로 전송 
	}//check() end
	</script>
</head>
<body>
 <h2>글 삭제 폼</h2>
 <form name="delForm" method="post">
   <table border="1" width="50%" align="center">
     
     <tr>
       <td align="center">
        <b>
          <font face="바탕" size="4" color="#0000A0">
                       글 삭제을 원하다면 암호를 입력 하시요
          </font>
        </b>
       </td>
     </tr>
     
     <tr>
      <td height="30">
               비밀번호:<input type="password" name="pwd" size="16">
       <p>
       <input type="button" value="글삭제" onclick="javaScript:check()">
       <input type="button" value="이전으로 돌아가기" onClick="history.go(-1)">
      </td>
     </tr>
   </table>
 </form>
 
</body>
</html>