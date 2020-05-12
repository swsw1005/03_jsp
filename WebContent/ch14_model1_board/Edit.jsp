<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%!
String DRIVER="com.mysql.jdbc.Driver";
String URL="jdbc:mysql://localhost:3306/mydb1";
String USER="root";
String PWD="12345";
%>
<%
request.setCharacterEncoding("utf-8");
String num=request.getParameter("num");//p.k
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
	  tr{line-height:25px;}
	  table{margin:auto;}
	</style>
	
	<script>
	function check(){
		if(document.editForm.pwd.value==''){
			alert("암호를 입력 하시요");
			document.editForm.pwd.focus();
			return;
		}//if
		document.editForm.action="EditSave.jsp?num=<%=num%>";
		document.editForm.submit();//서버로 전송 
	}//check() end
	</script>
</head>
 
<body>
 
<%
Class.forName(DRIVER);//드라이버 로딩
Connection con=DriverManager.getConnection(URL,USER,PWD);//DB연결
Statement stmt=con.createStatement();//Statement생성

String sql="select * from myboard where num="+num;
ResultSet rs=stmt.executeQuery(sql);//실행시 인자 들어간다 Statement는 

while(rs.next()){
	String writer=rs.getString("writer");
	String subject=rs.getString("subject");
	String email=rs.getString("email");
	
	String content=rs.getString("content");
	String pwd=rs.getString("pwd");
	String wdate=rs.getString("wdate");
	
	int readcount=rs.getInt("readcount");
	String ip=rs.getString("ip");
	%>
	 <h1>글 수정 폼</h1>
	 <form name="editForm" method="post">
	   <table border="1">
	   
	      <tr>
	        <td>글쓴이</td>
	        <td><input type="text" name="writer" size="30" value="<%=writer%>"></td>
	      </tr>
	      
	      <tr>
	        <td>글제목</td>
	        <td><input type="text" name="subject" size="50" value="<%=subject%>"></td>
	      </tr>
	      
	      <tr>
	        <td>이메일</td>
	        <td><input type="text" name="email" size="50" value="<%=email%>"></td>
	      </tr>
	      
	      <tr>
	        <td>글내용</td>
	        <td>
	         <textArea name="content" rows="10" cols="60"><%=content %></textArea>
	        </td>
	      </tr>
	      
	      <tr>
	        <td>암호</td>
	        <td><input type="password" name="pwd" size="20"></td>
	      </tr>
	      
	      <tr>
	        <td colspan="2" align="center">
	          <input type="button" value="수정" onClick="javascript:check()">
	          &nbsp;
	          <input type="button" value="이전으로 돌아가기" onClick="history.back()">
	        </td>
 	      </tr>
 	   </table>
	 </form>
	<%
}//while end
rs.close();
stmt.close();
con.close();

%>

</body>
</html>