<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품입력</title>
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

<form action="adminInsert.do" method="get" enctype="multipart/form-data" class="content">
	 			
				pCode <input type="text" name="pCode" size="30"><br/>
				pBrandName <input type="text" name="pBrandName" size="30"><br/>
				pName<input type="text" name="pName" size="30"><br/>
				pPrice<input type="text" name="pPrice" size="30"><br/>
				pStock<input type="text" name="pStock" size="30"><br/>
				cgNo<input type="text" name="cgNo" size="30"><br/>
				pfNo<input type="text" name="pfNo" size="30"><br/>
				pColor<input type="text" name="pColor" size="30"><br/>
				파일 : <input type="file" name="file"><br>
				
				
				<input type="submit" value="입력"> 
				
</form>
</body>
</html>