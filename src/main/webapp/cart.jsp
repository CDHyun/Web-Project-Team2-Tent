<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
    <link rel="stylesheet" href="css/shop/cart.css">
             <script>
        function selectAll(selectAll)  {
  		const checkboxes= document.querySelectorAll('input[type="checkbox"]');
  		checkboxes.forEach((checkbox) => {checkbox.checked = selectAll.checked })
		}
                             </script>

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
                    <h5>Cart</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index">Home</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Cart Area -->
    <div class="cart_area section_padding_100_70 clearfix">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12">
                    <div class="cart-table">
                        <div class="table-responsive">
                            <table class="table table-bordered mb-30">
                                <thead>                                
           								<tr>
                                        <th scope="col"><input type="checkbox" id="check_all" onclick='selectAll(this)'/> <b>Select All</b></th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                        <th scope="col"><i class="icofont-ui-delete"></i></th>	
                                       </tr>
									</thead>
                                <tbody id="cart_item_tbody">
                                	
                                <!-- cart item -->
                                <c:if test="${cart.size() == 0}">
                               		<tr>
                               			<td colspan="7">카트에 등록된 상품이 없습니다. 상품을 등록해주세요 🙂</td>
                               		</tr>
                               	</c:if>
                                <c:set var="tot_price" value="0" />
                                <c:forEach var="cart" items="${cart}">
                                <c:set var="tot_price" value="${total + cart.product.pPrice * cart.cQty}" />
                                    <tr id="cart_item_${cart.cNo}">
                                        <th scope="row">
                                            <input type="checkbox" cNo="${cart.cNo}">
                                        </th>
                                        <td>
                                            <img src="img/p_img/${cart.product.imageList[0].pfName}" alt="Product">
                                        </td>
                                        <td>${cart.product.pName}&nbsp;${cart.product.pBrandName}&nbsp;${cart.product.pCode}&nbsp;${cart.productOption.pColor}</td>
                                        <td>&#8361;<s:eval expression="new java.text.DecimalFormat('#,##0').format(cart.product.pPrice)"/></td>
                                        <td>
                                            <div class="quantity">
				<form action="CartUpdate.do"><button type="submit" class="btn btn-primary" id="cart_sel_selet_btn">+</button></form> <input type="number" class="qty-text" step="1" min="1" max="99" name="quantity" value="${cart.cQty}" c_no='${cart.cNo}'>
					<form action="CartDelete.do"><button type="submit" class="btn btn-primary" id="cart_sel_selet_btn">-</button></form>
                                            </div>
                                        </td>
                                        <td class="item_total" id="item_total_${cart.cNo}">&#8361;<s:eval expression="new java.text.DecimalFormat('#,##0').format(cart.product.pPrice * cart.cQty)"/></td>
                                        <th scope="row">
                                           <button type="submit" class="btn btn-primary" id="cart_sel_selet_btn">Delete Items</button> <i class="icofont-close"  c_no='${cart.cNo}'></i>
                                        </th>
                                    </tr>
                                </c:forEach>
                                <!-- cart item end -->
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
	                <div class="col-12 col-lg-5">
	                    <div class="cart-total-area mb-30">
	                        <h5 class="mb-3">Cart Totals</h5>
	                        <div class="table-responsive">
	                            <table class="table mb-3">
	                                <tbody>
	                                    <tr>
	                                        <td>Sub Total</td>
	                                        <td id="sub_total">&#8361; ${total}</td> 
	                                    </tr> 
	                                    <tr>
	                                        <td>Shipping</td>
	                                        <td id="shipping_pay">
	                                        <c:if test="${shopping_price < 50000 and total > 0}">
	                                        	&#8361;2500/>
	                                        	<c:set var="shipping_price" value="2500" />
	                                        </c:if>
	                                        <c:if test="${shopping_price >= 50000 or total == 0}">
	                                        	&#8361;0
	                                        	<c:set var="shipping_price" value="0" />
	                                        </c:if>
	                                        </td>
	                                    </tr>
	                                    <tr>
	                                        <td>Total</td>
	                                        <c:set var="all_total" value="${total + shipping_price}" />
	                                        <td id="cart_total">&#8361;${total}</td>
	                                    </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                       	<a href="" class="btn btn-primary d-block" id="cart_checkout_btn">Proceed To Checkout</a>
	                    	<form id="cart_checkout_form" method="post"></form>
	                    </div>
	                </div>
                
            </div>
        </div>
    </div>
  
    <!-- Cart Area End -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/cart.js"></script>

</body>

</html>