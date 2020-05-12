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

	PreparedStatement pstmt = null;//생성시 인자 들어같다

	if (!rs.next()) {
		out.println("해당 자료가 없습니다");
	} else {//수정 가능한 상태
		String dbpwd = rs.getString("pwd");

		//입력한 암호와 DB의 암호가 일치하면 수정한다 
		if (dbpwd.equals(request.getParameter("pwd"))) {

			String writer = request.getParameter("writer");
			String subject = request.getParameter("subject");
			String email = request.getParameter("email");
			String content = request.getParameter("content");

			sql = "update myboard set writer=?,subject=?,email=?,content=? where num="
					+ num;

			pstmt = con.prepareStatement(sql);//생성시 인자 들어간다 

			pstmt.setString(1, writer);
			pstmt.setString(2, subject);
			pstmt.setString(3, email);
			pstmt.setString(4, content);

			pstmt.executeUpdate();//쿼리 수행 
			response.sendRedirect("List.jsp?page=1");//********

			rs.close();
			pstmt.close();
			stmt.close();

		} else {//암호가 일치하지 않을때
%>
<script>
	alert("암호가 일치 하지 않습니다")
	history.back();
</script>

<%
	}//else end
		con.close();
	}//else end
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	EditSave.jsp
	<br> num:<%=request.getParameter("num")%>
</body>
</html>