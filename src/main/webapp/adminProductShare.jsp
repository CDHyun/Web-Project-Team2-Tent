<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>수정&삭제</title>
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
<!-- 이 페이지는 상품 수정, 삭제를 하기위한 공유페이지입니다.     사이드바에서 수정이나 삭제를 누를 시  이페이지가 보여지며 이페이지에서 pcode하이퍼링크를 누를시 adminPD가 나와서 admincontentcommand를 통해 pcode해당되는 데이터를 가져와서 adminproductupdate.jsp가 보여진다. -->
 <h3 class="content">상품 정보 수정 & 삭제</h3><br/><br/>
 <form action="adminindex.do" method="get" class="content">
		검색 선택 : 
			<select name="query">
				<option value="pBrandName" selected="selected">브랜드명</option>
				<option value="pName">상품명</option>
				<option value="pColor" >색상</option>  
				
				
			
			</select>
			<input type="text" name="content" size="30">
			<input type="submit" value="검색">
	</form>
	
	<table border="" class="content">
		<tr>
			<th>No</th><th>상품코드</th><th>브랜드명</th><th>상품명</th><th>색상</th><th>가격</th><th>재고</th><th>입고일자</th>
		</tr>
		<c:forEach items="${list}" var="dto" varStatus="st">
			<tr>
				<td>${st.index+1}</td>
				<td><a href="adminProductDetail.do?pCode=${dto.pCode}"> ${dto.pCode}</a></td>
				<td>${dto.pBrandName}</td>
				<td>${dto.pName}</td>
				<td>${dto.pColor}</td>
				<td>&#8361;&nbsp;<fmt:formatNumber value="${dto.pPrice}" type="number" pattern="#,###"></fmt:formatNumber></td>
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
      out.print("<a href='adminUpdate.do?vpage=" + i + "'>" + i + "</a> ");
    }
  %>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>