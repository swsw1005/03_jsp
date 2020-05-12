<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%!String DRIVER = "com.mysql.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/mydb1";
	String USER = "root";
	String PWD = "12345";%>
<%
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");

	Class.forName(DRIVER);//드라이버 로딩
	Connection con = DriverManager.getConnection(URL, USER, PWD);//DB연결

	String sql = "select * from myboard where num=" + num;
	Statement stmt = con.createStatement();//Statement 생성
	ResultSet rs = stmt.executeQuery(sql);//실행시 인자 들어간다 Statement는 

	if (!rs.next()) {
		out.println("해당 자료가 없습니다");
	} else {//수정 가능한 상태
		String dbpwd = rs.getString("pwd");

		//입력한 암호와 DB의 암호가 일치하면 수정한다 
		if (dbpwd.equals(request.getParameter("pwd"))) {

			sql = "delete from myboard where num=" + num;
			stmt.executeUpdate(sql);

			rs.close();
			stmt.close();
			con.close();

			response.sendRedirect("List.jsp?page=1");//********
		} else {//암호가 일치하지 않을때
%>
<script>
	alert("암호가 일치 하지 않습니다")
	history.back();
</script>

<%
	}//else end

	}//(!rs.next()) else end
%>