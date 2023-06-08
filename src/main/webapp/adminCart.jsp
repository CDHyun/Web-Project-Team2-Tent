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
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
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
                                        <th scope="col"><i class="icofont-ui-delete"></i></th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <i class="icofont-close"></i>
                                        </th>
                                        <td>
                                            <img src="images/product" alt="image">
                                        </td>
                                        <td>
                                            <a href="#">Bluetooth Speaker</a>
                                        </td>
                                        <td>$9</td>
                                        <td>
                                            <div class="quantity">
                                                <input type="number" class="qty-text" id="qty2" step="1" min="1" max="99" name="quantity" value="1">
                                            </div>
                                        </td>
                                        <td>$9</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <i class="icofont-close"></i>
                                        </th>
                                        <td>
                                            <img src="img/product-img/onsale-2.png" alt="Product">
                                        </td>
                                        <td>
                                            <a href="#">Roof Lamp</a>
                                        </td>
                                        <td>$11</td>
                                        <td>
                                            <div class="quantity">
                                                <input type="number" class="qty-text" id="qty3" step="1" min="1" max="99" name="quantity" value="1">
                                            </div>
                                        </td>
                                        <td>$11</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <i class="icofont-close"></i>
                                        </th>
                                        <td>
                                            <img src="img/product-img/onsale-6.png" alt="Product">
                                        </td>
                                        <td>
                                            <a href="#">Cotton T-shirt</a>
                                        </td>
                                        <td>$6</td>
                                        <td>
                                            <div class="quantity">
                                                <input type="number" class="qty-text" id="qty4" step="1" min="1" max="99" name="quantity" value="1">
                                            </div>
                                        </td>
                                        <td>$6</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <i class="icofont-close"></i>
                                        </th>
                                        <td>
                                            <img src="img/product-img/onsale-4.png" alt="Product">
                                        </td>
                                        <td>
                                            <a href="#">Water Bottle</a>
                                        </td>
                                        <td>$17</td>
                                        <td>
                                            <div class="quantity">
                                                <input type="number" class="qty-text" id="qty5" step="1" min="1" max="99" name="quantity" value="1">
                                            </div>
                                        </td>
                                        <td>$17</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <i class="icofont-close"></i>
                                        </th>
                                        <td>
                                            <img src="img/product-img/onsale-5.png" alt="Product">
                                        </td>
                                        <td>
                                            <a href="#">Alka Sliper</a>
                                        </td>
                                        <td>$13</td>
                                        <td>
                                            <div class="quantity">
                                                <input type="number" class="qty-text" id="qty6" step="1" min="1" max="99" name="quantity" value="1">
                                            </div>
                                        </td>
                                        <td>$13</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-lg-6">
                    <div class="cart-apply-coupon mb-30">
                        <h6>Have a Coupon?</h6>
                        <p>Enter your coupon code here &amp; get awesome discounts!</p>
                        <!-- Form -->
                        <div class="coupon-form">
                            <form action="#">
                                <input type="text" class="form-control" placeholder="Enter Your Coupon Code">
                                <button type="submit" class="btn btn-primary">Apply Coupon</button>
                            </form>
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
                                        <td>$56.00</td>
                                    </tr>
                                    <tr>
                                        <td>Shipping</td>
                                        <td>$10.00</td>
                                    </tr>
                                    <tr>
                                        <td>VAT (10%)</td>
                                        <td>$5.60</td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td>$71.60</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <a href="checkout-1.html" class="btn btn-primary d-block">Proceed To Checkout</a>
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