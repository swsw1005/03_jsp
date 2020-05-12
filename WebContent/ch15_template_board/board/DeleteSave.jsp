<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%!
String DRIVER="com.mysql.jdbc.Driver";
String URL="jdbc:mysql://localhost:3306/mydb1";
String USER="root";
String PWD="12345";
%>
<%
request.setCharacterEncoding("utf-8");
String num=request.getParameter("num");

try{
	Class.forName(DRIVER);//드라이버 로딩
	Connection con=DriverManager.getConnection(URL,USER,PWD);//db연결
	
	String sql="select * from myboard where num="+num;
	
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery(sql);//실행시 인자 들어간다 
	PreparedStatement pstmt=null;
	
	if(!rs.next()){
		out.println("해당 자료가 없습니다");
	}else{//해당 자료가 있을때 
		String dbpwd=rs.getString("pwd");
	    
		if(dbpwd.equals(request.getParameter("pwd"))){
	    	//암호가 일치하면 글삭제 
	    	sql="delete from myboard where num="+num;
	    	pstmt=con.prepareStatement(sql);//생성시 인자 들어간다 
	    	pstmt.executeUpdate();//쿼리 실행
	    	
	    	rs.close();
	    	stmt.close();
	    	pstmt.close();
	    	con.close();
	    	
	    	response.sendRedirect("../template.jsp?page=./board/List.jsp?page=1");
	    	//response.sendRedirect("./template.jsp?page=./board/List.jsp?page=1");//********
	    	
	    }else{//암호 일치하지 않으면
	    	%>
	    	 <script>
	    	 alert("암호가 틀립니다")
	    	 history.back();
	    	 </script>
	    	<%
	    }//else end
	}//else end
	
	
}catch(Exception ex){
	
}
%>