<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
     integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>관리자 상품확인</title>
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
    text-align: center;
    border-bottom: 1px solid #dddddd;
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

<form action="adminindex.do" method="get" class="content">
  검색 선택 :
  <select name="query">
    <option value="pBrandName" selected="selected">브랜드명</option>
    <option value="pName">상품명</option>
    <option value="pColor">색상</option>
  </select>
  <input type="text" name="content" size="30">
  <input type="submit" value="검색">
</form>

<table border="" class="content" >
  <tr >
    <th>상품코드</th>
    <th>브랜드명</th>
    <th>상품명</th>
    <th>색상</th>
    <th>가격</th>
    <th>재고</th>
    <th>입고일자</th>
  </tr>
  <c:forEach items="${list}" var="dto">
    <tr>
      <td>${dto.pCode}</td>
      <td>${dto.pBrandName}</td>
      <td>${dto.pName}</td>
      <td>${dto.pColor}</td>
      <td>${dto.pPrice}</td>
      <td>${dto.pStock}</td>
      <td>${dto.pInsertdate}</td>
    </tr>
  </c:forEach>
</table>

<div class="content">
  <%
    int lastpage = (int) request.getAttribute("d_count");
    int itemsPerPage = 7; // 페이지당 항목 개수
    int totalPages = (int) Math.ceil(lastpage / (double) itemsPerPage);
    
    for (int i = 1; i <= totalPages; i++) {
      out.print("<a href='adminindex.do?vpage=" + i + "'>" + i + "</a> ");
    }
  %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
