<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet" href="css/shop/wishlist.css">



<script type="text/javascript">
function wishlistDeleteAction(wwNo) {
	var wNo = wwNo;
	
	Swal.fire({
	    text: "상품을 위시리스트에서 삭제하시겠습니까?",
	    icon: "question",
	    showCancelButton: true,
	    confirmButtonText: "확인",
	    cancelButtonText: "취소",
	  }).then((result) => {
	    if (result.isConfirmed) {
	    	var url = "wishlistDeletes.do?wNo=" + encodeURIComponent(wNo);
	    	window.location.href = url;
	    }
	  });
   

   
  
  }

function wishlistInsetTocart(wwNo) {
	var wNo = wwNo;
	
	
	Swal.fire({
	    text: "상품을 장바구니에 추가하시겠습니까?",
	    icon: "question",
	    showCancelButton: true,
	    confirmButtonText: "확인",
	    cancelButtonText: "취소",
	  }).then((result) => {
	    if (result.isConfirmed) {
	    	var url = "wishlistInsertToCart.do?wNo=" + encodeURIComponent(wNo);
	    	window.location.href = url;
	       
	    }
	  });
   
   
	
   
  
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
                                        <th scope="col">Image</th>
                                        <th scope="col">Brand</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Add to Cart</th>
                                        <th scope="col" id="wish_all_delete_btn"><i class="icofont-ui-delete"></i></th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<!-- wishlist item -->
                                	<c:if test="${wishlist.size() == 0}">
                                		<tr>
                                			<td colspan="6">등록된 위시리스트가 없습니다. 위시리스트를 등록해주세요 🙂</td>
                                		</tr>
                                	</c:if>
                                	<c:forEach var="dto" items="${wishlist}">
	                                    <tr >
	                                        <td>
	                                            <img src="images/product/${dto.pfRealName }" alt="Product">
	                                        </td>
	                                        <td>
	                                          ${dto.pBrandName}
	                                        </td>
	                                        <td>
	                                          ${dto.pName}
	                                        </td>
	                                       <td>&#8361;&nbsp;<fmt:formatNumber value="${dto.pPrice}" type="number" pattern="#,###"></fmt:formatNumber></td>
	                                        <td><a class="btn btn-primary btn-sm wish_add_to_cart_btn" onclick="wishlistInsetTocart(${dto.wNo})" style="color: white;" >Add</a></td>
	                                        <th scope="row">
	                                         <input type="hidden" id="wNo" name="wNo" value="${dto.wNo}">
	                                            <a class="wish_item_del_btn" ><i class="icofont-close" onclick="wishlistDeleteAction(${dto.wNo})"></i></a>
	                                        </th>
	                                    </tr>
                                    </c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="cart-footer text-right">
                        <div class="back-to-shop">
	                        <c:if test="${wishlist.size() != 0}">
	                           <!--  <a href="#" class="btn btn-primary wish_item_sel_cart_btn">Add Items</a>
	                            <a href="#" class="btn btn-primary wish_item_sel_del_btn" >Delete Items</a> -->
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