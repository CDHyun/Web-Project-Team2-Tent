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
            <div class="single_slide" style="background-image: url(img/bg-img/bg-tent.png);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text text-center">
                                <p class="text-white" data-animation="fadeInUp" data-delay="100ms">Trendy Interior </p>
                                <h2 class="text-white" data-animation="fadeInUp" data-delay="300ms">Tent Goods</h2>
                                <a href="product_list.do?pageno=1&content=텐트" class="btn btn-primary mt-4" data-animation="fadeInUp" data-delay="500ms">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide bg-img bg-overlay -->
            <div class="single_slide" style="background-image: url(img/bg-img/bg_2.png);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text text-center">
                                <p class="text-white" data-animation="fadeInUp" data-delay="100ms">eco friendly Space</p>
                                <h2 class="text-white" data-animation="fadeInUp" data-delay="300ms">Sleeping-Bag Collection</h2>
                                <a href="product_list.do?pageno=1&content=침낭" class="btn btn-primary mt-4" data-animation="fadeInUp" data-delay="500ms">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide -->
            <div class="single_slide" style="background-image: url(img/bg-img/bg-light.png);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <div class="welcome_slide_text text-center">
                                <p class="text-white" data-animation="fadeInUp" data-delay="100ms">emotional atmosphere</p>
                                <h2 class="text-white" data-animation="fadeInUp" data-delay="300ms">Light Collection</h2>
                                <a href="product_list.do?pageno=1&content=랜턴" class="btn btn-primary mt-4" data-animation="fadeInUp" data-delay="500ms">Shop Now</a>
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
                        <img src="img/bg-img/cg_1.jpeg" alt="">
                        <div class="single_cata_desc d-flex align-items-center justify-content-center">
                            <div class="single_cata_desc_text">
                                <h5>Tent Collection</h5>
                                <a href="product_list.do?pageno=1&content=텐트">Shop Now <i class="icofont-rounded-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory mb-30">
                        <img src="img/bg-img/cg_2.png" alt="">
                        <div class="single_cata_desc d-flex align-items-center justify-content-center">
                            <div class="single_cata_desc_text">
                                <h5>Sleeping-Bag Collection</h5>
                                <a href="product_list.do?pageno=1&content=침낭">Shop Now <i class="icofont-rounded-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory mb-30">
                        <img src="img/bg-img/cg_3.jpeg" alt="">
                        <div class="single_cata_desc d-flex align-items-center justify-content-center">
                            <div class="single_cata_desc_text">
                                <h5>Light Collection</h5>
                                <a href="product_list.do?pageno=1&content=랜턴">Shop Now <i class="icofont-rounded-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Catagories Area -->




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