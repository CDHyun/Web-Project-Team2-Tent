<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    margin-left: 25%;
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
   .content tr.stock-low {
    background-color: lightcoral;
      font-weight: bold;
  }
  
</style>
</head>

<body>
<!-- Header Start -->
<div class="header">
  <jsp:include page="/adminSidebar.jsp" />
</div>
<!-- Header End -->
<h3 class="content">상품조회</h3><br/><br/>
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
    <th>No</th>
    <th>상품코드</th>
    <th>브랜드명</th>
    <th>상품명</th>
    <th>색상</th>
    <th>가격</th>
    <th>재고</th>
    <th>입고일자</th>
    <th></th>
  </tr>
  <c:forEach items="${list}" var="dto" varStatus="st">
  <tr <c:if test="${dto.pStock <= 5}">class="stock-low"</c:if>>
      <td>${st.index+1}</td>
      <td>${dto.pCode}</td>
      <td>${dto.pBrandName}</td>
      <td>${dto.pName}</td>
      <td>${dto.pColor}</td>
      <td>&#8361;&nbsp;<fmt:formatNumber value="${dto.pPrice}" type="number" pattern="#,###"></fmt:formatNumber></td>
      <td>${dto.pStock}</td>
      <td>${dto.pInsertdate}</td>
      <td><!-- Button trigger modal -->
        <button type="button" class="btn btn-secondary" onclick="openModal('${dto.pfRealName}')">보기</button>
      </td>
    </tr>
  </c:forEach>
</table>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">상품확인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <img id="modalImage" alt="no image" src="" width="280" height="350">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



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


<script>
  function openModal(imageUrl) {
    var modalImage = document.getElementById('modalImage');
    modalImage.src = "images/product/" + imageUrl;
    $('#exampleModal').modal('show');
  }
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
