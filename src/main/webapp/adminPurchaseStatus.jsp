<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.min.css">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>주문처리</title>
    
   
    <style>
        .header {
            display: flex;
        }

        .content {
            margin-left: 25%;
        }

        .content2 {
            margin-left: 700px;
        }

        table {
            margin-top: 20px;
            border-collapse: collapse;
            width: 50%;
        }

        th,
        td {
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.18/dist/sweetalert2.all.min.js"></script>
<script>
function changeStatus() {
	  Swal.fire({
	    title: "주문 상태 변경",
	    text: "주문 상태가 변경되었습니다.",
	    icon: "success",
	    showConfirmButton: false,
	    timer: 2000
	  });
	}
</script>



    <!-- Header Start -->
    <div class="header">
        <jsp:include page="/adminSidebar.jsp" />
    </div>
    <!-- Header End -->
<h2 class="content">주문 처리 시스템</h2>
        <table border="" class="content">
        <tr>
            <th>구매번호</th>
            <th>구매자</th>
            <th>제품번호</th>
            <th>색상</th>
            <th>수량</th>
            <th>주문날짜</th>
            <th>상태</th>
            <th></th>
        </tr>
        <c:forEach items="${check}" var="dto">
    <form id="adminstatusform" name="adminstatusform" action="adminStatusChange.do" method="post"  class="content">
   			 <tr>
       			 <td>
    				<input type="hidden" name="pcNo" value="${dto.pcNo}">
    				${dto.pcNo}
				</td>
        		<td>${dto.uid}</td>
        		<td>${dto.pCode}</td>
        		<td>${dto.pColor}</td>
        		<td>${dto.pcQty}</td>
        		<td>${dto.pcInsertdate}</td>
        		<td>
           		 <select name="status">
               		 <option value="-1" ${dto.pcStatus == -1 ? 'selected' : ''}>주문취소</option>
              		  <option value="0" ${dto.pcStatus == 0 ? 'selected' : ''}>상품준비중</option>
            		  <option value="1" ${dto.pcStatus == 1 ? 'selected' : ''}>배송중</option>
           		      <option value="2" ${dto.pcStatus == 2 ? 'selected' : ''}>배송완료</option>
            		</select>
        		</td>
        		<td><input type="submit" value="확인" class="btn btn-info" size="5" onclick="changeStatus()"></td>
    		</tr>
    </form>
		</c:forEach>

    </table>
        <br /><br />
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
