<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 업데이트</title>
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
	
	
<form action="adminDelete.do" method="post" class="content">  
		상품코드 <input type="text" name="pCode" value="${content_view.pCode }" readonly="readonly"><br/>
		브랜드명 <input type="text" name="pBrandName" value="${content_view.pBrandName }"><br/>
		상품명 <input type="text" name="pName" value="${content_view.pName }"><br/>
		가격 <input type="text" name="pPrice" value="${content_view.pPrice }" ><br/>
		색상 <input type="text" name="pColor" value="${content_view.pColor }"><br/>
		재고 <input type="text" name="pStock" value="${content_view.pStock }"><br/>
		파일 : <input type="text" name="fileName" value="${content_view.pfName }"><br/>
		
				
		
		
		
		
		<input type="submit" value="삭제">
		
	

	</form>

</body>
</html>