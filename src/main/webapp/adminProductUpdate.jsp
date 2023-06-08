<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
     integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>관리자 상품 업데이트</title>
<style>
  .header {
    display: flex;
  }

 

  .content {
   margin-left: 40%;
  }
  
  .content2 {
   margin-left: 15%;
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
  label {
    display: inline-block;
    width: 100px;
  }
</style>
</head>


<body>


<!-- Header Start -->
	<div class="header">
		<jsp:include page="/adminSidebar.jsp" />
	</div>
	<!-- Header End -->
	
	<div class="card content" style="width: 25rem;" >
<form action="adminUpdateAction.do" method="post" class="content2" enctype="multipart/form-data" >
 				<img alt="image" src="images/product/${content_view.pfName}" width="250" height="250"><br/>
		 <br/>
		 <label for="pCode">상품코드:</label>
		 <input type="text" name="pCode" id="pCode" value="${content_view.pCode }" readonly="readonly"><br/>
		
		 <label for="pBrandName">브랜드명:</label>
		 <input type="text" name="pBrandName" id="pBrandName" value="${content_view.pBrandName }"><br/>
		
		 <label for="pName">상품명:</label>
		 <input type="text" name="pName" id="pName" value="${content_view.pName }"><br/>
		
		 <label for="pPrice">가격:</label>
		 <input type="text" name="pPrice" id="pPrice" value="${content_view.pPrice }" ><br/>
		 
		 <label for="pColor">색상:</label>
		 <input type="text" name="pColor" id="pColor" value="${content_view.pColor }"><br/>
		
		 <label for="pStock">재고:</label>
		 <input type="text" name="pStock" id="pStock" value="${content_view.pStock }"><br/>
		
		 <label for="file">파일명:</label> 
		 <input type="file" name="file" ><br/>
		 <input type="hidden" name="lastfile" id="lastfile" value="${content_view.pfRealName }" >
		
			
		
		
		
		<br/>
		<input type="submit" value="수정" class="update" >&nbsp;&nbsp;&nbsp;
		<a href="adminDeleteAction.do?pCode=${content_view.pCode }&pColor=${content_view.pColor}">삭제</a>
		
		
	

	</form>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>