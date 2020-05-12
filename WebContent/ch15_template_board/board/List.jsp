<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%!
//선언부 , 전역변수, 사용자 정의 메서드
String DRIVER="com.mysql.jdbc.Driver";
String URL="jdbc:mysql://localhost:3306/mydb1";
String USER="root";
String PWD="12345";
%>
<%
request.setCharacterEncoding("utf-8");//post 요청시 보낸 한글 처리
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

  <center><h2>♠♠♠ 게시판 리스트  ♠♠♠</h2></center>
  
  <table border="1" width="70%" align="center">
    <tr>
      <td align="right">
        <a href="./template.jsp?page=./board/Write.jsp">글쓰기
          <img src="../imgs/a22.gif" alt="새글" border="0">
        </a>
      </td>
    </tr>
   </table>
   
   <%
   Class.forName(DRIVER);//드라이버 로딩
   Connection con=DriverManager.getConnection(URL,USER,PWD);//DB연결
   Statement stmt=con.createStatement();//Statement 생성
   
   String sql="SELECT num,subject,email,writer,wdate,readcount"+ 
   " FROM myboard order by num desc";
   
   ResultSet rs=stmt.executeQuery(sql);//Statement 실행시 인자 들어간다 , 쿼리 수행 
   %>
   <table  border="1" width="70%" align="center">
     <tr height="30" bgColor="margenta">
       <td>글번호</td>
       <td>글제목</td>
       <td>이메일</td>
       <td>작성자</td>
       <td>작성일</td>
       <td>조횟수</td>
     </tr>
     <%
      while(rs.next()){
    	  int num=rs.getInt("num");
    	  String subject=rs.getString("subject");
    	  String email=rs.getString("email");
    	  String writer=rs.getString("writer");
    	  String wdate=rs.getString("wdate");
    	  int readcount=rs.getInt("readcount");
    	  %>
    	  <tr>
    	    <td><%=num %></td>
    	    
    	    <td> 
    	    <a href="./template.jsp?page=./board/Content.jsp?num=<%=num%>">
    	         <%=subject %>
    	    </a>
    	    </td>
    	    
    	    <td><%=email %></td>
    	    <td><%=writer %></td>
    	    <td><%=wdate %></td>
    	    <td><%=readcount %></td>
    	  </tr>
         <%
      }//while end
      rs.close();
      stmt.close();
      con.close();
     %>
   </table>
  
</body>
</html>