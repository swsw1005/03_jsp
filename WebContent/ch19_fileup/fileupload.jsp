<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="upload.*"%>

<%--fileupload.jsp--%>
<jsp:useBean id="fu" class="upload.FileUploadBean" scope="request" />

<% String msg = fu.upload(request);

if(msg == ""){
	out.print("<script> alert('업로드 성공'); </script>");
}else{
	out.print("<script> alert('업로드 실패'); </script>");
}
response.sendRedirect("fileupload.html");
%>

