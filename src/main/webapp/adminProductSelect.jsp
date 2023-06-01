<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품확인</title>
</head>
<body>
<h3>searchAction</h3>

	   <form action="adminindex.do" method="get">
		검색 선택 : 
			<select name="query">
				<option value="pBrandName" selected="selected">브랜드명</option>
				<option value="pName">상품명</option>
				<option value="pColor" >색상</option>  
				
				
			
			</select>
			<input type="text" name="content" size="30">
			<input type="submit" value="검색">
	</form>
	
	<table border="">
		<tr>
			<th>pCode</th><th>pBrandName</th><th>pName</th><th>pColor</th><th>pPrice</th><th>pStock</th><th>pInsertdate</th>
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
	
</body>
</html>