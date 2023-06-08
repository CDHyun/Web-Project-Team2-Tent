<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
</head>

<style>
  input[id="menuicon"] {display: none;}
  input[id="menuicon"] + label {
    display: block;
    margin: 30px;
    width: 60px;
    height: 50px;
    position: relative;
    cursor: pointer;
  }
  input[id="menuicon"] + label span {
    display: block;
    position: absolute;
    width: 100%;
    height: 5px;
    border-radius: 30px;
    background: #000;
    transition: all .35s;
  }
  input[id="menuicon"] + label span:nth-child(1) {top: 0;}
  input[id="menuicon"] + label span:nth-child(2) {top: 50%;transform: translateY(-50%);}
  input[id="menuicon"] + label span:nth-child(3) {bottom: 0;}
  input[id="menuicon"]:checked + label {z-index: 2;}
  input[id="menuicon"]:checked + label span {background: #fff;}
  input[id="menuicon"]:checked + label span:nth-child(1) {
    top: 50%;
    transform: translateY(-50%) rotate(45deg);
  }
  input[id="menuicon"]:checked + label span:nth-child(2) {opacity: 0;}
  input[id="menuicon"]:checked + label span:nth-child(3) {
    bottom: 50%;
    transform: translateY(50%) rotate(-45deg);
  }
  div[class="sidebar"] {
    width: 200px;
    height: 100%;
    background: #87CEEB;
    position: fixed;
    top: 0;
    left: -300px;
    z-index: 1;
    transition: all .35s;
  }
  input[id="menuicon"]:checked + label + div {left: 0;}
  .sidebar ul {list-style-type: none; margin: 0; padding: 0;}
  .sidebar li {
    padding: 10px;
    color: black;
    cursor: pointer;
  }
  .sidebar li:hover {background-color: #F5F5DC;}
  .sidebar h2 {
    color: black;
    padding: 10px;
  }
  .sub-menu {display: none; color: #228B22;}
  .sidebar li.active .sub-menu {display: block;}
  
  a {
  text-decoration: none;
  
	}
</style>

<body>
  <input type="checkbox" id="menuicon">
  <label for="menuicon">
    <span></span>
    <span></span>
    <span></span>
  </label>
  <div class="sidebar">
    <br/><br/><br/><br/><br/><br/>
    <ul>
      <li><a href="adminfirst.do" style="color: #000000;">메인</a></li>
      <li class="active"><a href="adminindex.do" style="color: #000000;">상품관리</a>
        <ul class="sub-menu">
          <li><a href="adminProductInsert.jsp" style="color: #000000;">상품추가</a></li>
          <li><a href="adminUpdate.do" style="color: #000000;">상품수정</a></li>
          <li><a href="adminDelete.do" style="color: #000000;">상품삭제</a></li>
        </ul>
      </li>
      <li><a href="adminpurchaseCheck.do" style="color: #000000;">주문처리</a></li>
      <li>리뷰관리</li>
      <li><a href="adminNotice.do" style="color: #000000;">고객관리</a></li>
      <li><a href="index.do" style="color: #000000;">쇼핑몰사이트로 이동</a></li>
    </ul>
  </div>

  <script>
    // 하위 메뉴를 숨기는 함수
    function hideSubMenu() {
      var subMenu = document.querySelector('.sub-menu');
      subMenu.style.display = 'none';
    }

    // 하위 메뉴를 보여주는 함수
    function showSubMenu() {
      var subMenu = document.querySelector('.sub-menu');
      subMenu.style.display = 'block';
    }

    // 초기 로딩 시 하위 메뉴 숨김
    hideSubMenu();

    // 상품관리 메뉴 클릭 시 하위 메뉴 보이거나 숨김
    var productMenu = document.querySelector('.sidebar li.active');
    productMenu.addEventListener('click', function() {
      var subMenu = document.querySelector('.sub-menu');
      if (subMenu.style.display === 'block') {
        hideSubMenu();
      } else {
        showSubMenu();
      }
    });
  </script>
</body>
</html>