<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<table border="" class="content">
  <tr>
    <th>pCode</th>
    <th>pBrandName</th>
    <th>pName</th>
    <th>pColor</th>
    <th>pPrice</th>
    <th>pStock</th>
    <th>pInsertdate</th>
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
</html>
