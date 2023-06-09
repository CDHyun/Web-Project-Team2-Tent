<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!doctype html>

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
    
       	function selectAll(selectAll)  {
  			const checkboxes= document.querySelectorAll('input[type="checkbox"]');
  			checkboxes.forEach((checkbox) => {checkbox.checked = selectAll.checked })
		}
        
       
       	function deletecartcontent() {
			var cNo = $("#cNo").val();
			var pCode = $("#pCode").val();
		    
		   
		   
			var url = "adminCartDelete.do?cNo=" + encodeURIComponent(cNo) + "&pCode=" + encodeURIComponent(pCode);
			window.location.href = url;
			
		  }
		
       	function btnClick() {
			var form = document.adminCartForm;
			form.submit();
 		}
	
       	

		function increaseQuantity(cmNo) {
		    var quantityInput = document.getElementById("quantity_"+cmNo);
		    var currentQuantity = parseInt(quantityInput.value);
		    quantityInput.value = currentQuantity + 1;
		  }

		  function decreaseQuantity(cmNo) {
		    var quantityInput = document.getElementById("quantity_"+cmNo);
		    var currentQuantity = parseInt(quantityInput.value);
		    if (currentQuantity > 0) {
		      quantityInput.value = currentQuantity - 1;
		    }
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
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item active"><a href="product_list.do"> Product</a></li>
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
                                    <tr>
                                        <th scope="col">Image</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                        <th scope="col"><i class="icofont-ui-delete"></i></th>
                                    </tr>
                                
                                
                                    
                                    
                                     <c:forEach items="${cart}" var="dto">
                           				<form name="adminCartForm" action="adminCartDelete.do" method="post">
                                     
										    <tr>
										      <td>
										      <input type="hidden" name="cNo" id="cNo" value="${dto.cNo}">
										      <input type="hidden" name="pCode" id="pCode" value="${dto.pCode}">
										      <img alt="no" src="images/product/${dto.pfRealName }"> </td>
										      <td>${dto.pName}</td>
										      <td>${dto.pPrice}</td>
										      <td>
										      <div class="input-form-group" style="display: flex; align-items: center;">
	                            					<button type="button" id="plusQtyBtn_${dto.cNo}" class="btn btn-dark btn-sm" onclick="decreaseQuantity('${dto.cNo}')">-</button>&nbsp;&nbsp;
	                            					<input type="text" id="quantity_${dto.cNo}" name="quantity" class="form-control" style="width: 45px" value="${dto.cQty}" min="1" max="10" readonly="readonly">&nbsp;&nbsp;
	                            					<button type="button" id="minusQtyBtn_${dto.cNo}" class="btn btn-dark btn-sm" onclick="increaseQuantity('${dto.cNo}')">+</button>
                            				</div>
										      
										      
										      </td>
										      <td>${dto.ctotal}</td>
										      <td>
										      
                                           		  <input type="submit" value="x" class="fa fa-close" size="4"> 
                                           		 <!--   <i class="fa fa-close" onclick="btnClick()"></i>-->
                                        	 </td>
										     </tr> 
										    
                           </form>
  									</c:forEach>
                                    
                                    
                            </table>
                            
                            
                        </div>
                    </div>
                </div>

                

                <div class="col-12 col-lg-5">
                    <div class="cart-total-area mb-30 ">
                        <h5 class="mb-3">Cart Totals</h5>
                        <div class="table-responsive">
                            <table class="table mb-3">
                                <tbody>
                                    <tr>
                                        <td>Sub Total</td>
                                        <td>₩ ${cartTotal }</td>
                                    </tr>
                                    <tr>
                                        <td>Shipping</td>
                                        <td>₩ 3000</td>
                                    </tr>
                                    <tr>
                                        <td>VAT (10%)</td>
                                        <td>₩ ${cartTotal*0.1 }</td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td>₩ ${(cartTotal*1.1)+3000 }</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <a href="cart_to_purchase.do" class="btn btn-primary d-block">Proceed To Checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart Area End -->
    <!-- Cart Area End -->
	    <section class="you_may_cart_area section_padding_0_100 clearfix">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="section_heading new_arrivals">
					<h5>Customer recommended</h5>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div class="you_cart_slider owl-carousel">

					<!-- Single Product -->
					<c:forEach var="recommendedProduct" items="${RANDOM}">
						<div class="single-product-area">
							<div class="product_image">
								<!-- Product Image -->
								<img class="normal_img" src="images/product/${recommendedProduct.pfRealName}"
									alt=""> <img class="hover_img"
									src="images/product/${recommendedProduct.pfHoverRealName}" alt="">


							<!-- Product Description -->
							<div class="product_description">
								<!-- Add to cart -->
								<div class="product_add_to_cart">
									<a href="" class="related_product_add_cart" p_no="${recommendedProduct.product.pCode}"><i class="icofont-shopping-cart"></i> Add to
										Cart</a>
								</div>

								<!-- Quick View -->
								<div class="product_quick_view">
									<a href="#" data-toggle="modal" data-target="#quickview" p_no="${recommendedProduct.product.pCode}"><i
										class="icofont-eye-alt"></i> Quick View</a>
								</div>

								<p class="brand_name">${recommendedProduct.product.pBrandName }</p>
								<a href="product_detail?p_no=${recommendedProduct.product.pCode}" p_no="${recommendedProduct.product.pCode}">${recommendedProduct.product.pName}</a>
								<h6 class="product-price">&#8361;<s:eval expression="new java.text.DecimalFormat('#,###').format(recommendedProduct.product_pPrice)"/></h6>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- Single Product end -->

				</div>
			</div>
		</div>
	</div>
</section>
	
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/cart.js"></script>

</body>

</html>