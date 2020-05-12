<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%--Content.jsp --%>
<%!
String DRIVER="com.mysql.jdbc.Driver";
String URL="jdbc:mysql://localhost:3306/mydb1";
String USER="root";
String PWD="12345";
%>
<%
request.setCharacterEncoding("utf-8");
%>

<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
  <style type="text/css">
     h1{text-align:center;}
  </style>
</head>

<body bgcolor="#cccccc">
Content.jsp<br>
num:<%= request.getParameter("num")%>

<h1>글내용 보기</h1>
<%
String num=request.getParameter("num");//List.jsp넘겨준 글번호 
int readcount=0;/*조회수 넣을 변수*/

Class.forName(DRIVER);//드라이버 로딩
Connection con=DriverManager.getConnection(URL,USER,PWD);//DB연결
Statement stmt=con.createStatement();//Statement 생성
String sql="select * from myboard where num="+num;
ResultSet rs=stmt.executeQuery(sql);

while(rs.next()){
	//rs으로 부터 값을 가져온다 
	String writer=rs.getString("writer");
	String subject=rs.getString("subject");
	String email=rs.getString("email");
	String content=rs.getString("content");
	
	String pwd=rs.getString("pwd");
	String wdate=rs.getString("wdate");//*********
	
	readcount=rs.getInt("readcount");//조횟수 
	String ip=rs.getString("ip");
	readcount++;//죄횟수 증가
	%>
	<table width="70%">
	   <tr>
	     <td align="right">
	      <a href="./template.jsp?page=./board/Write.jsp">새글쓰기</a>&nbsp;
	      <a href="./template.jsp?page=./board/Edit.jsp?num=<%=num%>">글수정</a>&nbsp;
	      <a href="./template.jsp?page=./board/Delete.jsp?num=<%=num%>">글삭제</a>&nbsp;
	      <a href="./template.jsp?page=./board/List.jsp?page=1">리스트</a>&nbsp;
	     </td>
	   </tr>
	</table>
	
	<table width="70%" border="1">
	 <tr>
	   <td>이름</td>
	   <td><%=writer %></td>
	 </tr>
	 <tr>
	   <td>글제목</td>
	   <td><%=subject %></td>
	 </tr>
	 <tr>
	   <td>날짜</td>
	   <td><%=wdate %></td>
	 </tr>
	 
	 <tr>
	   <td>비밀번호</td>
	   <td>
	   <%
	   String temp=(String)session.getAttribute("id");
	   temp="";
	   
	   if(temp.equals("admin")){
		   out.println(pwd);
	   }else{
		   out.println("***");
	   }
	   
	   %>
	   
	   </td>
	 </tr>
	 
	 <tr>
	   <td>조횟수</td>
	   <td><%=readcount %></td>
	 </tr>
	 <tr>
	   <td>IP</td>
	   <td><%=ip %></td>
	 </tr>
	 
	 <tr>
	   <td colspan="2">
		   <br>
		   <%=content %>
		   <br>
	   </td>
	 </tr>
	</table>
	<%
}//while end
rs.close();
stmt.close();
//con.close();
//조횟수 증가 쿼리문 수행 
sql="update myboard set readcount=? where num=?";
PreparedStatement pstmt=con.prepareStatement(sql);

pstmt.setInt(1, readcount);
pstmt.setInt(2, Integer.parseInt(num));
pstmt.executeUpdate();//쿼리 실행 

pstmt.close();
con.close();
%>
</body>
</html>