<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
     integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>고객관리</title>
</head>
<script type="text/javascript">
  var preContent;

  function view_content(obj) {
    var nextTable = obj.nextElementSibling;

    if (preContent && nextTable != preContent) {
      nextTable.style.display = "block";
      preContent.style.display = "none";
    } else if (preContent && nextTable == preContent) {
      preContent.style.display = preContent.style.display === "none" ? "block" : "none";
    } else if (preContent == null) {
      nextTable.style.display = "block";
    }

    preContent = nextTable;
  }

  window.onload = function() {
    var elements = document.getElementsByClassName("faq-question");

    for (var i = 0; i < elements.length; i++) {
      elements[i].addEventListener("click", function() {
        view_content(this);
      });
    }

    // 초기출력
    var no = "faq_1";
    var nextTable = document.getElementById(no).nextElementSibling;
    view_content(nextTable);
  };
</script>

<body>
<!-- Header Start -->
  <div class="header">
    <jsp:include page="/adminSidebar.jsp" />
  </div>
  <!-- Header End -->
  	<h3 class="container">공지사항</h3>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">No</th>
						<!--  <th style="background-color: #eeeeee; text-align: center;">번호</th>-->
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
					<c:forEach items="${list}" var="dto" varStatus="st">
    					<tr>
      						<td>${st.index+1}</td>
      						<!--<td>${dto.nNo}</td>-->
      						<td>${dto.nTitle}</td>
     						<td>${dto.aid}</td>
      						<td>${dto.nInsertdate}</td>
    					</tr>
  					</c:forEach>
			</table>	
			<a href="adminWriteNotice.do" class="btn btn-primary ">글쓰기</a>	
		</div>
	</div>
	
	<br/><br/><br/><br/><br/><br/><br/>
	
	
	<h3 class="container">FAQ</h3>
<div class="container">
  <div class="row">
    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
      <thead>
        <tr>
          <th style="background-color: #eeeeee; text-align: left;">No</th>
          <th style="background-color: #eeeeee; text-align: left;">제목</th>
        </tr>
      </thead>
      <c:forEach items="${FAQ}" var="dto1" varStatus="loop">
        <table width="100%" cellpadding="0" cellspacing="0" style="border-bottom-style:solid;border-bottom-color:#E6E6E6;border-bottom-width:1;cursor:pointer;" onclick="view_content(this)">
          <tr height="27" onmouseover="this.style.background='#F7F7F7'" onmouseout="this.style.background=''">
            <td width="50" align="center" class="faq-question"></td>
            <td ><font color="#007FC8">${loop.index+1}</font></td>
            <td style="text-align: center;"><font color="#007FC8">${dto1.nTitle}</font></td>
          </tr>
        </table>
        <table cellpadding="0" cellspacing="0" border="0" style="display:none;">
          <tr valign="top">
            <th style="color:#0000bf;width:40; padding-top:1"></th>
            <td style="text-align: center;">${dto1.nContent}</td>
          </tr>
        </table>
        <br/>
      </c:forEach>
    </table>
  </div>
</div>


	
	
	
	
	
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>