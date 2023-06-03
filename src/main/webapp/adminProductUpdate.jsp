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
	
	
<form action="adminUpdateAction.do" method="post" class="content" >
 				<img alt="image" src="images/product/${content_view.pfName}" width="250" height="250"><br/>
		pCode <input type="text" name="pCode" id="pCode" value="${content_view.pCode }" readonly="readonly"><br/>
		pBrandName <input type="text" name="pBrandName" id="pBrandName" value="${content_view.pBrandName }"><br/>
		pName <input type="text" name="pName" id="pName" value="${content_view.pName }"><br/>
		pPrice <input type="text" name="pPrice" id="pPrice" value="${content_view.pPrice }" ><br/>
		pColor <input type="text" name="pColor" id="pColor" value="${content_view.pColor }"><br/>
		pStock <input type="text" name="pStock" id="pStock" value="${content_view.pStock }"><br/>
		파일명 : <input type="text" name="fileName" id="fileName" value="${file }"><br/>
		<input type="file" name="file"><br/>
		
			
		
		
		
		
		<input type="submit" value="수정" class="update" >&nbsp;&nbsp;&nbsp;
		<a href="adminDeleteAction.do?pCode=${content_view.pCode }&pColor=${content_view.pColor}">삭제</a>
		
		
	

	</form>

</body>
</html>