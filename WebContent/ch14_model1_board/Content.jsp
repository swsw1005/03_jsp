<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<%--Content.jsp --%>
<%!String DRIVER = "com.mysql.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/mydb1";
	String USER = "root";
	String PWD = "12345";%>

<%
	request.setCharacterEncoding("utf-8");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
h1 {
	text-align: center;
}
</style>
</head>

<body bgcolor="#cccccc">
	<h6>Content.jsp</h6>
	<br>
	<h6>num :</h6>
	<h6><%=request.getParameter("num")%></h6>

	<h1>글내용 보기</h1>
	<%
		String num = request.getParameter("num");//List.jsp넘겨준 글번호 

		int num_ = Integer.parseInt(num.trim());

		int readcount = 0;/*조회수 넣을 변수*/

		Class.forName(DRIVER);//드라이버 로딩
		Connection con = DriverManager.getConnection(URL, USER, PWD);//DB연결
		Statement stmt = con.createStatement();//Statement 생성
		String sql = "select * from myboard where num=" + num;
		ResultSet rs = stmt.executeQuery(sql);

		while (rs.next()) {
			String writer = rs.getString("writer");
			String subject = rs.getString("subject");
			String email = rs.getString("email");
			String content = rs.getString("content");

			String pwd = rs.getString("pwd");
			String wdate = rs.getString("wdate");

			readcount = rs.getInt("readcount");

			String ip = rs.getString("ip");
			readcount++;
	%>

	<table>
		<tr>
			<td><a href="Write.jsp">새글 쓰기</a> <a
				href="Edit.jsp?num=<%=num%>"> 글 수정</a> <a
				href="Delete.jsp?num=<%=num%>"> 글 삭제 </a> <a href="list.jsp">
					리스트</a></td>
		</tr>
	</table>
	<hr>

	<table>
		<tr>
			<td>이름</td>
			<td><%=writer%></td>
		</tr>
		<tr>
			<td>글제목</td>
			<td><%=subject%></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=wdate%></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><%=content%></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<%
					//	String temp = "";

						//	try {
						//		temp = (String) session.getAttribute("id");
						//	} catch (Exception ex) {
						//		temp = " ";
						//	}

						//	if (temp.equals("admin")) {
						//		out.println(pwd);
						//	} else {
						//		out.println("****");
						//	}
				%>
			</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td><%=readcount%></td>
		</tr>
		<tr>
			<td>IP</td>
			<td><%=ip%></td>
		</tr>
		<tr>
			<td colspan="2"><%=content%></td>
		</tr>

	</table>
	<%
		}//while end
		rs.close();
		stmt.close();
		//con.close();
		//조횟수 증가 쿼리문 수행 
		sql = "update myboard set readcount=? where num=?";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, readcount);
		pstmt.setInt(2, num_);
		pstmt.executeUpdate();//쿼리 실행 

		pstmt.close();
		con.close();
	%>
</body>
</html>