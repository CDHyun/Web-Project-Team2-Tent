<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<link rel="stylesheet" href="css/shop/product.css">
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
    
    <!-- Quick View Modal Area -->
    <jsp:include page="common/include_product_quickview_modal.jsp"/>
    <!-- Quick View Modal Area end -->

    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>Product Details</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Shop</a></li>
                        <li class="breadcrumb-item active">Product Details</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Single Product Details Area -->
    
    <section class="single_product_details_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-6">
                    <div class="single_product_thumb">
                        <div id="product_details_slider" class="carousel slide" data-ride="carousel">
						<c:forEach items="${productInfo}" var="product">
                            <!-- Carousel Inner -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <a class="gallery_img" href="images/product/${product.pfRealName}" title="First Slide">
                                        <img class="d-block w-100" src="images/product/${product.pfHoverRealName}" alt="First slide">
                                    </a>
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <span class="badge-new"></span>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a class="gallery_img" href="images/product/${product.pfHoverRealName}" title="Second Slide">
                                        <img class="d-block w-100" src="images/product/${product.pfHoverRealName}" alt="Second slide">
                                    </a>
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <span class="badge-new">${product.p_concept}</span>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a class="gallery_img" href="img/p_img/${imgList[2].im_name}" title="Third Slide">
                                        <img class="d-block w-100" src="img/p_img/${imgList[2].im_name}" alt="Third slide">
                                    </a>
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <span class="badge-new">${product.p_concept}</span>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a class="gallery_img" href="img/p_img/${imgList[3].im_name}" title="Fourth Slide">
                                        <img class="d-block w-100" src="img/p_img/${imgList[3].im_name}" alt="Fourth slide">
                                    </a>
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <span class="badge-new">${product.p_concept}</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Carosel Indicators -->
                            <ol class="carousel-indicators">
                                <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(img/p_img/${product.imageList[0].im_name});">
                                </li>
                                <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(img/p_img/${product.imageList[1].im_name});">
                                </li>
                                <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(img/p_img/${product.imageList[2].im_name});">
                                </li>
                                <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(img/p_img/${product.imageList[3].im_name});">
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>

                <!-- Single Product Description -->
                <div class="col-12 col-lg-6">
                    <div class="single_product_desc">
                        <h4 class="title mb-2">${product.p_name}</h4>
                        <div class="single_product_ratings mb-2" id="review_avg_score_star">
                        	<c:forEach begin="1" end="${product.p_avg_score}">
	                            <i class="fa fa-star" aria-hidden="true"></i>
	                        </c:forEach>
                            <span class="text-muted">(${product.reviewList.size()}개의 리뷰)</span>
                        </div>
                        <h4 class="price mb-4">&#8361;<s:eval expression="new java.text.DecimalFormat('#,###').format(product.p_price)"/><span></span></h4>

                        <!-- Overview -->
                        <div class="short_overview mb-4">
                            <h6>Overview</h6>
                            <p>${product.p_desc}</p>
                        </div>

                        <!-- Add to Cart and Buy Now Form -->
                        <form id="addcart_and_buynow_form" class="cart clearfix my-5 d-flex flex-wrap align-items-center" method="post">
                            <input type="hidden" name="p_no" value="${product.p_no}">
                            <input type="hidden" name="buyType" value="direct">
                            <div class="quantity">
                                <input type="number" class="qty-text form-control" id="qty2" step="1" min="1" max="12" name="qty" value="1">
                            </div>
                            <button type="button" name="addtocart" id="addcart_btn_pdetail" onclick="detail_addToCart(event)" value="5" class="btn btn-primary mt-1 mt-md-0 ml-1 ml-md-3">Add to cart</button>
                            <button type="button" name="buy_now" id="buynow_btn" onclick="buyNowProduct()" value="6" class="btn btn-primary mt-1 mt-md-0 ml-1 ml-md-3">Buy Now</button>
                        </form>

                        <!-- Others Info -->
                        <div class="others_info_area mb-3 d-flex flex-wrap">
                            <a class="add_to_wishlist" href="" p_no="${product.p_no}"><i class="fa fa-heart" aria-hidden="true"></i> WISHLIST</a>
                          <!--   <a class="add_to_compare" href="compare.html"><i class="fa fa-th" aria-hidden="true"></i> COMPARE</a>
                            <a class="share_with_friend" href="#"><i class="fa fa-share" aria-hidden="true"></i> SHARE WITH FRIEND</a> -->
                        </div>

                        <!-- Size Guide -->
                        <div class="sizeguide">
                            <h6>Size Guide</h6>
                            <div class="size_guide_thumb d-flex">
	                            <c:forEach var="size_image" items="${sizeImgList}">
	                                <a class="size_guide_img" href="img/p_img/${size_image.im_name}" style="background-image: url(img/p_img/${size_image.im_name});">
	                                </a>
	                            </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab section_padding_100_0 clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <a href="#description" class="nav-link active" data-toggle="tab" role="tab">Description</a>
                            </li>
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link" data-toggle="tab" role="tab">Reviews <span class="text-muted" id="review_count_tab">(${product.reviewList.size()})</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">Additional Information</a>
                            </li>
                            <li class="nav-item">
                                <a href="#refund" class="nav-link" data-toggle="tab" role="tab">Return &amp; Cancellation</a>
                            </li>
                        </ul>
                        
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="description">
                                <div class="description_area">
                                    <h5>Description</h5>
                                    <c:forEach var="desc_image" items="${descImgList}">
	                                    <img alt="" src="img/p_img/${desc_image.im_name}">  
                                    </c:forEach>
                                </div>
                            </div>
						</c:forEach>
							<!-- Review area -->

                            <div role="tabpanel" class="tab-pane fade" id="reviews">
                                <div class="reviews_area">
                                    <ul id="review_list">
                                    	<c:forEach var="review" items="${product.reviewList}">
	                                        <li id="review_li_${review.r_no}">
	                                            <div class="single_user_review mb-15">
	                                                <div class="review-rating">
	                                                	<c:forEach begin="1" end="${review.r_score}">
		                                                    <i class="fa fa-star" aria-hidden="true"></i>
	                                                	</c:forEach>
	                                                	&nbsp;
	                                                    <span>${review.r_title}</span> &nbsp;
	                                                    <c:if test="${review.m_id eq sM_id}">
		                                                    <input type="button" value="수정" class="review_btn update_form" r_no="${review.r_no}" >&nbsp;
		                                            		<input type="button" value="삭제" class="review_btn delete" r_no="${review.r_no}" p_no="${review.p_no}">
	                                                    </c:if>
	                                                </div>
	                                                <div class="review-details">
	                                                    <p>by ${review.m_id} on <span><fmt:formatDate value="${review.r_date}" pattern="yyyy-MM-dd"/> </span></p>
	                                                </div>
	                                                <div class="review-details">
	                                                    <p>${review.r_content}</p>
	                                                </div>
	                                            </div>
	                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>

                                <div class="submit_a_review_area mt-50">
                                    <h4>Submit A Review</h4>
                                    <form action="" method="post" id="review_form" name="review_form">
                                    	<input type="hidden" name="p_no" value="${product.p_no}" >
                                        <div class="form-group">
                                            <span>Your Ratings</span>
                                            <div class="stars" id="submit_stars">
                                                <input type="radio" name="star" class="star-1" id="star-1" value="1">
                                                <label class="star-1" for="star-1">1</label>
                                                <input type="radio" name="star" class="star-2" id="star-2" value="2">
                                                <label class="star-2" for="star-2">2</label>
                                                <input type="radio" name="star" class="star-3" id="star-3" value="3">
                                                <label class="star-3" for="star-3">3</label>
                                                <input type="radio" name="star" class="star-4" id="star-4" value="4">
                                                <label class="star-4" for="star-4">4</label>
                                                <input type="radio" name="star" class="star-5" id="star-5" value="5">
                                                <label class="star-5" for="star-5">5</label>
                                                <span></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="m_id">Member ID</label>
                                            <input type="text" class="form-control" name="m_id" value="${sM_id}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="title">Title</label>
                                            <input type="text" class="form-control" name="title">
                                        </div>
                                        <div class="form-group">
                                            <label for="comments">Comments</label>
                                            <textarea class="form-control" name="content" id="comments" rows="5" data-max-length="150"></textarea>
                                        </div>
                                        <button type="submit" id="review_write_btn" class="btn btn-primary">Submit Review</button>
                                    </form>
                                </div>
                            </div>
                            
                            <div role="tabpanel" class="tab-pane fade" id="addi-info">
                                <div class="additional_info_area">
                                    <h5>Additional Info</h5>
                                    <p>What should I do if I receive a damaged parcel?
                                        <br> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit impedit similique qui, itaque delectus labore.</span></p>
                                    <p>I have received my order but the wrong item was delivered to me.
                                        <br> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis quam voluptatum beatae harum tempore, ab?</span></p>
                                    <p>Product Receipt and Acceptance Confirmation Process
                                        <br> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum ducimus, temporibus soluta impedit minus rerum?</span></p>
                                    <p class="mb-0">How do I cancel my order?
                                        <br> <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum eius eum, minima!</span></p>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="refund">
                                <div class="refund_area">
                                    <h6>Return Policy</h6>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Culpa quidem, eos eius laboriosam voluptates totam mollitia repellat rem voluptate obcaecati quas fuga similique impedit cupiditate vitae repudiandae. Rem, tenetur placeat!</p>

                                    <h6>Return Criteria</h6>
                                    <ul class="mb-30 ml-30">
                                        <li><i class="icofont-check"></i> Package broken</li>
                                        <li><i class="icofont-check"></i> Physical damage in the product</li>
                                        <li><i class="icofont-check"></i> Software/hardware problem</li>
                                        <li><i class="icofont-check"></i> Accessories missing or damaged etc.</li>
                                    </ul>

                                    <h6>Q. What should I do if I receive a damaged parcel?</h6>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit impedit similique qui, itaque delectus labore.</p>

                                    <h6>Q. I have received my order but the wrong item was delivered to me.</h6>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facilis quam voluptatum beatae harum tempore, ab?</p>

                                    <h6>Q. Product Receipt and Acceptance Confirmation Process</h6>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolorum ducimus, temporibus soluta impedit minus rerum?</p>

                                    <h6>Q. How do I cancel my order?</h6>
                                    <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum eius eum, minima!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Single Product Details Area End -->

    <!-- Related Products Area -->
	<jsp:include page="common/include_related_product_list.jsp"/>
    <!-- Related Products Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/product.js"></script>
	<script src="js/shop/review.js"></script>

</body>

</html>