<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>

<style>
  input[id="menuicon"] {display:none;}
  input[id="menuicon"] + label {display:block;margin:30px;width:60px;height:50px;position:relative;cursor:pointer;}
  input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:5px;border-radius:30px;background:#000;transition:all .35s;}
  input[id="menuicon"] + label span:nth-child(1) {top:0;}
  input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);}
  input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
  input[id="menuicon"]:checked + label {z-index:2;}
  input[id="menuicon"]:checked + label span {background:#fff;}
  input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
  input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
  input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
  div[class="sidebar"] {width:200px;height:100%;background:#228B22;position:fixed;top:0;left:-300px;z-index:1;transition:all .35s;}
  input[id="menuicon"]:checked + label + div {left:0;}
  .sidebar ul {list-style-type: none; margin: 0; padding: 0;}
  .sidebar li {padding: 10px; color: #000; cursor: pointer;}
  .sidebar li:hover {background-color: #228B22;} /* 변경된 부분: 메뉴에 마우스를 올렸을 때 색상 변경 */
  .sidebar h2 {color: #000; padding: 10px;}
  .sub-menu {display: none; color:#228B22; }
  .sidebar li.active .sub-menu {display: block;}
  
</style>
<body>
	<input type="checkbox" id="menuicon">
<label for="menuicon">
	<span></span>
	<span></span>
	<span></span>
</label>
<div class="sidebar">
  <br/><br/><br/><br/><br/><br/><ul>
    <li class="active"><a href="adminindex.do">상품관리</a>
      <ul class="sub-menu">
        <li><a href="adminProductInsert.jsp">상품추가</a></li>
        <li><a href="adminUpdate.do">상품수정</a></li>
        <li><a href="adminDelete.do">상품삭제</a></li>
       
      </ul>
    </li>
    <li><a href="adminpurchaseCheck.do">주문처리</a></li>
    <li>리뷰관리</li>
    <li>고객관리</li>
  </ul>
</div>
</body>
</html>
