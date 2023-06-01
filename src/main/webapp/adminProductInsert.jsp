<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품입력</title>
</head>
<body>

<form action="adminindex.do" method="post" enctype="multipart/form-data">
	 
				pBrandName <input type="text" name="name" size="30"><br/>
				pName<input type="text" name="tel" size="30"><br/>
				pPrice<input type="text" name="address" size="30"><br/>
				pStock<input type="text" name="address" size="30"><br/>
				파일 : <input type="file" name="file"><br>
				<input type="submit" value="업로드">	<br/>
				pColor<input type="text" name="relation" size="30"><br/>
				
				
				<input type="submit" value="입력"> 
				
</form>
</body>
</html>