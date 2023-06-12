<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- include_common_top -->
	<jsp:include page="common/include_common_top.jsp"/>
    <!-- include_common_top -->
    <link rel="stylesheet" href="css/shop/order.css">
    
 
<title>purchase_detailview</title>
</head>
<body>

  <!-- Preloader -->
    <div id="preloader">
        <div class="spinner-grow" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <!-- Header Area -->
  	<jsp:include page="common/include_common_header.jsp"/>
    <!-- Header Area End -->
    
    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>My Account</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">My Account</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->
    
    <!-- My Account Area -->
    <section class="my-account-area section_padding_100_50">
        <div class="container">
            <div class="row">
				<div class="col-12 col-lg-3">
				    <div class="my-account-navigation mb-50">
				        <ul>
				            <li><a href="my_account.do">My Account</a></li>
				            <li class="active"><a href="order_list">Orders</a></li>
				            <li><a href="member_logout">Logout</a></li>
				        </ul>  
				    </div> 
				</div>


<div class="shortcodes_content">
    <div class="table-responsive">
        <table class="table mb-0 table-bordered">
            <colgroup>
                <col style="width: 5%">
                <col style="width: 30%">
                <col style="width: 25%">
                <col style="width: 30%">
                <col style="width: 10%">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Date</th>
                    <th scope="col">Name</th>
                    <th scope="col">Phone</th>
                    <th scope="col">Pay</th>
                </tr>
            </thead>
            <tbody id="orderer_info_body">
                <c:forEach items="${purchaseList}" var="purchase">
                    <tr>
                            <th scope="row">${purchase.pcNo}</th>
                            <td>${purchase.pcInsertDate}</td>
                            <td>${purchase.pName}</td>
                            <td>${purchase.uPhone}</td>
                            <td>${purchase.pcPay}</td>
                       
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<br/>
<br/>
<br/>
<br/>




<div class="shortcodes_content">
    <div class="table-responsive">
        <table class="table mb-0 table-bordered">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Item</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Total</th>
                </tr>
            </thead>
            <tbody id="item_info_body">
                <c:forEach items="${purchaseList}" var="purchase">
                        <tr>
                            <th scope="row">${purchase.pcNo}</th>
                            <td><img src="images/product/${purchase.pfRealName}" alt="Product"></td>
                            <td>${purchase.pcQty}</td>
                            <td><fmt:formatNumber value="${purchase.pPrice}" type="number" pattern="#,###"></fmt:formatNumber></td>
                            <td><fmt:formatNumber value="${purchase.pcQty * purchase.pPrice}" type="number" pattern="#,###"></fmt:formatNumber></td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>



    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/order.js"></script>
	<script type = "text/javascript"></script>


</body>
</html>