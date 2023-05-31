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

    <!-- Welcome Slides Area -->
    <section class="welcome_area">
        <div class="welcome_slides modern-slides owl-carousel">
            <!-- Single Slide -->
            <div class="single_slide bg-img bg-overlay" style="background-image: url(img/bg-img/1.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text text-center">
                                <p class="text-white" data-animation="fadeInUp" data-delay="100ms">Trendy Interior </p>
                                <h2 class="text-white" data-animation="fadeInUp" data-delay="300ms">Interior Goods</h2>
                                <a href="product_list?pageno=1" class="btn btn-primary mt-4" data-animation="fadeInUp" data-delay="500ms">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide -->
            <div class="single_slide bg-img bg-overlay" style="background-image: url(img/bg-img/2.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text text-center">
                                <p class="text-white" data-animation="fadeInUp" data-delay="100ms">eco friendly Space</p>
                                <h2 class="text-white" data-animation="fadeInUp" data-delay="300ms">plants Collection</h2>
                                <a href="product_list?cg_no=1&pageno=1" class="btn btn-primary mt-4" data-animation="fadeInUp" data-delay="500ms">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide -->
            <div class="single_slide bg-img bg-overlay" style="background-image: url(img/bg-img/3.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text text-center">
                                <p class="text-white" data-animation="fadeInUp" data-delay="100ms">emotional atmosphere</p>
                                <h2 class="text-white" data-animation="fadeInUp" data-delay="300ms">light Collection</h2>
                                <a href="product_list?cg_no=2&pageno=1" class="btn btn-primary mt-4" data-animation="fadeInUp" data-delay="500ms">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Welcome Slides Area -->

    <!-- Catagories Area -->
    <section class="catagories_area home-3 section_padding_100_70">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory mb-30">
                        <img src="img/product-img/cata-1.jpg" alt="">
                        <div class="single_cata_desc d-flex align-items-center justify-content-center">
                            <div class="single_cata_desc_text">
                                <h5>Props Collection</h5>
                                <a href="product_list?cg_no=3&pageno=1">Shop Now <i class="icofont-rounded-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory mb-30">
                        <img src="img/product-img/cata-2.jpg" alt="">
                        <div class="single_cata_desc d-flex align-items-center justify-content-center">
                            <div class="single_cata_desc_text">
                                <h5>Light Collection</h5>
                                <a href="product_list?cg_no=2&pageno=1">Shop Now <i class="icofont-rounded-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory mb-30">
                        <img src="img/product-img/cata-3.jpg" alt="">
                        <div class="single_cata_desc d-flex align-items-center justify-content-center">
                            <div class="single_cata_desc_text">
                                <h5>Plants Collection</h5>
                                <a href="product_list?cg_no=1&pageno=1">Shop Now <i class="icofont-rounded-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Catagories Area -->

    <!-- Popular Items Area -->
    
    <div class="popular_items_area home-3 section_padding_0_70">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="popular_section_heading mb-50 text-center">
                        <h5>Popular This Week</h5>
                        <p>A collection of the most popular items</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="popular_items_slides owl-carousel">
                    
                        <!-- Single Popular Item start -->
                        
                        <c:forEach var="p_product" items="${popularList}">
	                        <div class="single_popular_item">
	                            <div class="product_image">
	                                <!-- Product Image -->
	                                <img class="first_img" src="img/p_img/${p_product.imageList[0].im_name}" alt="">
	                                <img class="hover_img" src="img/p_img/${p_product.imageList[1].im_name}" alt="">
	
	                                <!-- Badge -->
	                                <div class="product_badge">
	                                    <span class="badge-offer">Most Popular</span>
	                                </div>
	                                <!-- Wishlist -->
	                                <div class="product_wishlist">
	                                    <a href=""class="main_add_to_wish" p_no="${p_product.p_no}"><i class="icofont-heart"></i></a>
	                                </div>
	                                <!-- Add to cart -->
	                                <div class="product_add_to_cart">
	                                    <a href="" class="main_add_to_cart" p_no="${p_product.p_no}"><i class="icofont-cart"></i> Add to Cart</a>
	                                </div>
	                            </div>
	                            <!-- Product Description -->
	                            <div class="product_description">
	                                <h5><a href="product_detail?p_no=${p_product.p_no}">${p_product.p_name}</a></h5>
	                                <h6>&#8361;<s:eval expression="new java.text.DecimalFormat('#,###').format(p_product.p_price)"/><span></span></h6>
	                            </div>
	                        </div>
                       </c:forEach>
                       
                       <!-- Single Popular Item end -->

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Popular Items Area -->

    <!-- Weekly Deals Area -->
    <section class="weekly_deals_area home-3 section_padding_100 jarallax bg-overlay" style="background-image: url(img/bg-img/deals.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="weekly_deals_content text-center">
                        <h3>Enjoy your Shopping time !</h3>
                        <p>I enjoy spending time with you  : )</p>
                        <div class="weekly_deals_timer mt-30">
                            <ul class="main_time">
                                <!-- Please use event time this format: YYYY/MM/DD hh:mm:ss -->
                                <li><span class="month">00</span>month</li>
                                <li><span class="day">00</span>day</li>
                                <li><span class="hours">00</span>hours</li>
                                <li><span class="minutes">00</span>min</li>
                                <li><span class="seconds">00</span>sec</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Weekly Deals Area end -->

    <!-- suggestion Item Area -->
    
    <div class="new_arrival home-3 section_padding_100_70">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="popular_section_heading mb-50 text-center">
                        <h5>Suggestion Item</h5>
                        <p>A collection of recommended products just for you</p>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
   
                <!-- suggestion Item start -->
                
            	<c:forEach var="s_product" items="${suggestionList}">
	                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
	                    <div class="single_popular_item">
	                        <div class="product_image">
	                            <!-- Product Image -->
	                            <img class="first_img" src="img/p_img/${s_product.imageList[0].im_name}" alt="">
	                            <img class="hover_img" src="img/p_img/${s_product.imageList[1].im_name}" alt="">
	                            <!-- Wishlist -->
	                            <div class="product_wishlist">
	                                <a href="#" class="main_add_to_wish" p_no="${s_product.p_no}"><i class="icofont-heart"></i></a>
	                            </div>
	                            <!-- Add to cart -->
	                            <div class="product_add_to_cart">
	                                <a href="#" class="main_add_to_cart" p_no="${s_product.p_no}"><i class="icofont-cart"></i> Add to Cart</a>
	                            </div>
	                        </div>
	                        <!-- Product Description -->
	                        <div class="product_description">
	                            <h5><a href="product_detail?p_no=${s_product.p_no}">${s_product.p_name}</a></h5>
	                            <h6>&#8361;<s:eval expression="new java.text.DecimalFormat('#,###').format(s_product.p_price)"/><span></span></h6>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
                
                <!-- suggestion Item end -->

    <!-- suggestion Item Area end -->

    <!-- Special Featured Area -->
    <section class="special_feature_area pt-5">
        <div class="container">
            <div class="row">
                <!-- Single Feature Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single_feature_area mb-5 d-flex align-items-center">
                        <div class="feature_icon">
                            <i class="icofont-ship"></i>
                        </div>
                        <div class="feature_content">
                            <h6>Free Shipping</h6>
                            <p>For orders above $100</p>
                        </div>
                    </div>
                </div>

                <!-- Single Feature Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single_feature_area mb-5 d-flex align-items-center">
                        <div class="feature_icon">
                            <i class="icofont-box"></i>
                        </div>
                        <div class="feature_content">
                            <h6>Happy Returns</h6>
                            <p>7 Days free Returns</p>
                        </div>
                    </div>
                </div>

                <!-- Single Feature Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single_feature_area mb-5 d-flex align-items-center">
                        <div class="feature_icon">
                            <i class="icofont-money"></i>
                        </div>
                        <div class="feature_content">
                            <h6>100% Money Back</h6>
                            <p>If product is damaged</p>
                        </div>
                    </div>
                </div>

                <!-- Single Feature Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single_feature_area mb-5 d-flex align-items-center">
                        <div class="feature_icon">
                            <i class="icofont-live-support"></i>
                        </div>
                        <div class="feature_content">
                            <h6>Dedicated Support</h6>
                            <p>We provide support 24/7</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Special Featured Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/main.js"></script>

</body>

</html>