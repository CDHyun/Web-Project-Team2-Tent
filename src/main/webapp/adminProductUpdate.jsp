<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 업데이트</title>
</head>
<body>


<!-- Header Start -->
	<div class="header">
		<jsp:include page="/adminSidebar.jsp" />
	</div>
	<!-- Header End -->
	
	
<form action="adminUpdate.do" method="post">  
		pCode <input type="text" name="pCode" value="${content_view.pCode }" readonly="readonly"><br/>
		pBrandName <input type="text" name="pBrandName" value="${content_view.pBrandName }"><br/>
		pName <input type="text" name="pName" value="${content_view.pName }"><br/>
		pPrice <input type="text" name="pPrice" value="${content_view.pPrice }" ><br/>
		pColor <input type="text" name="pColor" value="${content_view.pColor }"><br/>
		pStock <input type="text" name="pStock" value="${content_view.pStock }"><br/>
		파일 : <input type="file" name="file"><br>
				<input type="submit" value="업로드">	<br/>
		
		
		
		
		<input type="submit" value="수정">
		
	

	</form>

</body>
</html>