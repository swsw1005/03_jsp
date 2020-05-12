<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%-- cart.jsp --%>
<%
request.setCharacterEncoding("utf-8"); //post요청시 한글처리
%>
<html>
<body>
<%@ include file="menu.jsp" %>
<%
String item=request.getParameter("item"); //menu.jsp & remove.jsp에서도 넘어온다.
String step=request.getParameter("step"); //menu.jsp & remove.jsp에서도 넘어온다.
Vector vecart=null; //변수는 null로 초기화, 변수선언

if(item != null){ //선택한 item이 있으면
	//장바구니에서 내용을 가져온다.
	vecart=(Vector)session.getAttribute("vecart");
    
    if(vecart == null){ //vecart가 비었을때, 처음물건을 선택했을때
    	vecart=new Vector(); //객체생성
    	vecart.add(item); // item을 장바구니에 넣기
    	session.setAttribute("vecart", vecart); //session 설정
    }else{ //이미 장바구니에 물건이 있을때
    	
    	if(step.equals("add")){ //장바구니에 추가
    		vecart.add(item);
    	}else if(step.equals("remove")){ //장바구니에서 제거
    		vecart.remove(item); 
    	}//else if end
    
    }//else end
	
    out.println("쇼핑 cart에 담기 CD <br>");
    for(int i=0; i<vecart.size(); i++){ //장바구니에 담긴 물건을 출력하기
    	out.println((i+1)+":"+(vecart.get(i).toString())+"<br>");
    }//for end
    %>
    현재 장바구니에 <%=vecart.size() %>개 담겨 있습니다.<br>
    
    
    <%
    if(vecart.size()>0){ //장바구니에 물건이 있으면
    	%>
    	<jsp:include page="remove.jsp" flush="true" />  
    	<%--remove는 처리 결과가 들어온다. --%>
    	<%
    }//if end
}//if end


%>

</body>
</html>