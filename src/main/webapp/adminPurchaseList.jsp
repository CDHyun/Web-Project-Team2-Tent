<%@page import="com.javalec.tent.dto.AdminDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.ArrayList" %>

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
                    <h5>Checkout</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index">Home</a></li>
                        <li class="breadcrumb-item active">Checkout</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Checkout Step Area -->
    <div class="checkout_steps_area">
        <a class="Completed"><i class="icofont-check-circled"></i> Orderer</a>
        <a class="Completed"><i class="icofont-check-circled"></i> Receiver</a>
        <a class="Completed"><i class="icofont-check-circled"></i> Payment</a>
        <a class="active"><i class="icofont-check-circled"></i> Confirm</a>
        <a><i class="icofont-check-circled"></i> Complete</a>
    </div>
    <!-- Checkout Step Area -->

    <!-- Checkout Area -->
    <div class="checkout_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="checkout_details_area clearfix">
                        <h5 class="mb-30">Confirm Your Order</h5>

                        <div class="cart-table">
                            <div class="table-responsive">
                                <table class="table table-bordered mb-30">
                                    <thead>
                                        <tr>
                                            <th scope="col">Image</th>
                                            <th scope="col">Product</th>
                                            <th scope="col">Unit Price</th>
                                            <th scope="col">Color</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                  
                 
                                    
                                    <!-- order item start -->
                                    <c:set var="tot_price" value="0" />
                                    <tbody>
                                    <c:forEach var="dto" items="${cart}">
                                    <c:set var="item_tot_price" value="${dto.cQty * dto.pPrice}" />
                                      <c:set var="tot_price" value="${tot_price + item_tot_price}" />
                                        <tr>
                                            <td>
                                            <input type="hidden" name="cNo" id="cNo" value="${dto.cNo}">
										      <input type="hidden" name="pCode" id="pCode" value="${dto.pCode}">
                                                <img src="images/product/${dto.pfRealName}" alt="Product">
                                            </td>
                                            <td>
                                                <a href="#">${dto.pName}</a>
                                            </td>
                                            <c:set var="item_tot_price" value="${PCQTY * dto.pPrice}"></c:set>
                                            
                                             <td><fmt:formatNumber value="${dto.pPrice}" type="number" pattern="#,###"></fmt:formatNumber></td>
                                         <%--    <td>${purchase.pPrice}</td> --%>
                                            <td>${dto.pColor}</td>
                                            <td>${dto.cQty}</td>
                                            <td><fmt:formatNumber value="${dto.ctotal}" type="number" pattern="#,###"></fmt:formatNumber></td>
                                            <%-- <td>${item_tot_price}</td> --%>
                                        </tr>
                                    </c:forEach> 
                                    </tbody>
                              
                                    <!-- order item end -->
                                        
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-7 ml-auto">
                    <div class="cart-total-area">
                        <h5 class="mb-3">Cart Totals</h5>
                        <div class="table-responsive">
                            <table class="table mb-0">
                                <tbody>
                                    <tr>
                                        <td> Total</td>
                                        <c:set var="shipping" value="${cartTotal >= 500000 ? 0 : 3000}" />
                                        <td>&#8361;&nbsp;<fmt:formatNumber value="${(cartTotal*1.1)+shipping }" type="number" pattern="#,###"></fmt:formatNumber></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="checkout_pagination d-flex justify-content-end mt-3">
                        	<a href="payment.do"><button type="button" class="btn btn-primary mt-2 ml-2" id="back_payment" >Go Back</button></a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="adminPurchase.do"><button type="button" class="btn btn-primary mt-2 ml-2" id="purchase_complete_btn">Order</button></a>
          
                        </div>     
                        <form id="order_create_form" method="post">
                        	<input type="hidden" name="total_price" value="${PCQTY * purchaseCheck.pPrice}">
                        </form> 
                    </div>
                </div>
                <h6 class="col-12 col-lg-7 ml-auto">Add  VAT (10%), Shipping fee</h6>
            </div>
        </div>
    </div>
    
    
    
    	
    
    
    
    
    
    
    <!-- Checkout Area End -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/order.js"></script>

</body>

</html>