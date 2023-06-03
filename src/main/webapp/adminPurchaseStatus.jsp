<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문처리</title>
<style>
  .header {
    display: flex;
  }

 

  .content {
   margin-left: 350px;
  }
  
  table {
    margin-top: 20px;
    border-collapse: collapse;
    width: 50%;
  }
  
  th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  
  th {
    background-color: #f2f2f2;
  }
</style>
</head>




<body>


<!-- Header Start -->
	<div class="header">
		<jsp:include page="/adminSidebar.jsp" />
	</div>
	<!-- Header End -->
	
	
	
	<table border="" class="content">
  <tr>
    <th>구매번호</th>
    <th>구매자</th>
    <th>제품번호</th>
    <th>색상</th>
    <th>수량</th>
    <th>상태</th>
    <th>주문날짜</th>
    <th>콤보</th>
  </tr>
  <c:forEach items="${check}" var="dto">
    <tr>
      <td>${dto.pcNo}</td>
      <td>${dto.uid}</td>
      <td>${dto.pCode}</td>
      <td>${dto.pColor}</td>
      <td>${dto.pcQty}</td>
      <td>${dto.pcStatus}</td>
      <td>${dto.pcInsertdate}</td>
     <td>
  <select name="status">
    <option value="-1">주문취소</option>
    <option value="0">상품준비중</option>
    <option value="1">배송중</option>
    <option value="2">배송완료</option>
  </select>
</td>
    </tr>
  </c:forEach>
</table>
	
	
	
	
	
	
	
	

</body>
</html>