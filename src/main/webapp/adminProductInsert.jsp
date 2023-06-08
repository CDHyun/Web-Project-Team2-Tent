<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
     integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <title>관리자 상품입력</title>
  <style>
    /* 스타일 시트 */
    .header {
      display: flex;
    }

    .content {
      margin-left: 25%;
    }
    .content2 {
      margin-left: 35%;
    }
    .content3 {
  		margin-left: 70%;
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
  
  <h3 class="content2">상품등록</h3><br/><br/>
<div class="card content2" style="width: 40rem;" >
	<img alt="no image" src="./img/core-img/logo.png" class="content"><br/><br/>
  <form action="adminInsert.do" method="post" enctype="multipart/form-data" class="content">
    <!-- 입력 폼 -->
    <label for="pCode">상품코드:</label>
    <input type="text" name="pCode" id="pCode" size="30"><br/>
    
    <label for="pBrandName">브랜드명:</label>
    <input type="text" name="pBrandName" id="pBrandName" size="30"><br/>
    
    <label for="pName">상품명:</label>
    <input type="text" name="pName" id="pName" size="30"><br/>
    
    <label for="pPrice">가격:</label>
    <input type="text" name="pPrice" id="pPrice" size="30"><br/>
    
    <label for="pStock">재고:</label>
    <input type="text" name="pStock" id="pStock" size="30"><br/>
    
    <label for="pStock">카테고리번호:</label>
    <input type="text" name="cgNo" id="cgNo" size="30"><br/>
    
    <label for="pfNo">파일번호:</label>
    <input type="text" name="pfNo" id="pfNo" size="30"><br/>
    
    <label for="pColor">색상:</label>
    <input type="text" name="pColor" id="pColor" size="30"><br/>
    
    <label for="file">파일:</label>
    <input type="file" name="file" id="file"><br>
    <label for="file1">호버파일:</label>
    <input type="file" name="file1" id="file1"><br>
    
    <input type="submit" value="입력" class="content3"> 
  </form>
  </div>
  
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>
