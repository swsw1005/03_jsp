<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>bloodType.jsp</title>
</head>
<body>
<h2>bloodType.jsp</h2>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
String name="임성우";
String bloodType=request.getParameter("bloodType");

bloodType=bloodType+".jsp";//A.jsp  B.jsp O.jsp AB.jsp 
%>

<jsp:forward page="<%=bloodType %>">
   <jsp:param name="name" value="<%=name %>" />  
</jsp:forward>


<script>
console.log("<%= name %>");
</script>



</body>
</html>