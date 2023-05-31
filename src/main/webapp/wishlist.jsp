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
    <link rel="stylesheet" href="css/shop/wishlist.css">

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
                    <h5>Wishlist</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Wishlist</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Wishlist Table Area -->
    <div class="wishlist-table section_padding_100 clearfix">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cart-table wishlist-table">
                        <div class="table-responsive">
                            <table class="table table-bordered mb-30">
                                <thead>
                                    <tr>
                                    	<th scope="col"><input type="checkbox" id="check_all"></th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Add to Cart</th>
                                        <th scope="col" id="wish_all_delete_btn"><i class="icofont-ui-delete"></i></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<!-- wishlist item -->
                                	<c:if test="${wishListList.size() == 0}">
                                		<tr>
                                			<td colspan="6">등록된 위시리스트가 없습니다. 위시리스트를 등록해주세요 🙂</td>
                                		</tr>
                                	</c:if>
                                	<c:forEach var="wishList" items="${wishListList}">
	                                    <tr id="wish_item_${wishList.w_no}">
	                                        <th scope="row">
	                                            <input type="checkbox" id="wish_check_${wishList.w_no}" w_no="${wishList.w_no}" p_no="${wishList.product.p_no}">
	                                        </th>
	                                        <td>
	                                            <img src="img/p_img/${wishList.product.imageList[0].im_name}" alt="Product">
	                                        </td>
	                                        <td>
	                                            <a href="product_detail?p_no=${wishList.product.p_no}">${wishList.product.p_name}</a>
	                                        </td>
	                                        <td>&#8361;<s:eval expression="new java.text.DecimalFormat('#,###').format(wishList.product.p_price)"/></td>
	                                        <td><a href="#" class="btn btn-primary btn-sm wish_add_to_cart_btn" p_no=${wishList.product.p_no}>Add</a></td>
	                                        <th scope="row">
	                                            <a href="" class="wish_item_del_btn" w_no="${wishList.w_no}"><i class="icofont-close"></i></a>
	                                        </th>
	                                    </tr>
                                    </c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="cart-footer text-right">
                        <div class="back-to-shop">
	                        <c:if test="${wishListList.size() != 0}">
	                            <a href="#" class="btn btn-primary wish_item_sel_cart_btn">Add Items</a>
	                            <a href="#" class="btn btn-primary wish_item_sel_del_btn" >Delete Items</a>
	                        </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Wishlist Table Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/wishlist.js"></script>

</body>

</html>