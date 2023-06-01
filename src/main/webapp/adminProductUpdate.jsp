<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 업데이트</title>
</head>
<body>

<form action="adminUpdate.do" method="post">  
		pCode <input type="text" name="pCode" value="${content_view.seq }" readonly="readonly"><br/>
		pBrandName <input type="text" name="pBrandName" value="${content_view.name }"><br/>
		pName <input type="text" name="pName" value="${content_view.tel }"><br/>
		pPrice <input type="text" name="pPrice" value="${content_view.address }" ><br/>
		pColor <input type="text" name="pColor" value="${content_view.relation }"><br/>
		pStock <input type="text" name="pStock" value="${content_view.relation }"><br/>
		파일 : <input type="file" name="file"><br>
				<input type="submit" value="업로드">	<br/>
		
		
		
		
		<input type="submit" value="수정">&nbsp;&nbsp;&nbsp;<a href="adminindex.do">처음으로</a> 
		
	

	</form>

</body>
</html>