<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- menu.jsp --%>
<h2>구매CD를 고르시오</h2>
<form method="post">
  <select name="item">
    <option value="백아연CD" selected>백아연CD</option>
    <option value="임영웅CD">임영웅CD</option>
    <option value="송가인CD">송가인CD</option>
    <option value="김필CD">김필CD</option>
    <option value="로이킴CD">로이킴CD</option>
    <option value="허각CD">허각CD</option>
    <option value="허각CD">허각CD</option>
    <option value="아이유CD">아이유CD</option>    
  </select>
  
  <!-- 장바구니에 추가하기 -->
  <input type="hidden" name="step" value="add">
  <input type="submit" value="선택">
  
</form>