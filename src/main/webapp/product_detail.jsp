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
	<script type="text/javascript">
		/* 가격 포맷 변환
		var price = parseInt("<c:out value="'${product.pPrice}'"/>");
		var formattedPrice = price.toLocaleString();
		console.log(price);
		console.log(formattedPrice);
		*/
		
		// 라디오 버튼에 클릭 이벤트 리스너 추가
		  var radioButtons = document.querySelectorAll('input[name="customRadio"]');
		  
		  for (var i = 0; i < radioButtons.length; i++) {
		    radioButtons[i].addEventListener('click', getSelectedValue);
		}
		
		  function addToCart() {
			  var pCode = $("#pCode").val();
			  var pcQty = $("#quantity").val();
			  var radios = document.getElementsByName('customRadio');
			  var selectedValue = '';

			  for (var i = 0; i < radios.length; i++) {
			    if (radios[i].checked) {
			      selectedValue = radios[i].value;
			      break;
			    }
			  }
			  // 선택된 값 확인
			  console.log(selectedValue);
			  var pColor = selectedValue;
			  if (pColor == "") {
			    Swal.fire({ icon: 'warning', title: "색상을 선택해주세요." });
			    return;
			  }
			  
			  Swal.fire({
				  icon: 'question',
				  title: "장바구니에 담으시겠습니까?",
				  showCancelButton: true,
				  showConfirmButton: true,
				  confirmButtonText: "OK",
				  cancelButtonText: "Cancel"
				  }).then((result) => {
			    if (result.isConfirmed) {
			      if (result.isConfirmed) {
			        var url = "cart.do?pCode=" + encodeURIComponent(pCode) + "&pcQty=" + encodeURIComponent(pcQty) + "&pColor=" + encodeURIComponent(pColor);
			        window.location.href = url;
			      }
			    }
			  });
			}

			function toWishlist() {
			  var pCode = $("#pCode").val();
			  var radios = document.getElementsByName('customRadio');
			  var selectedValue = '';

			  for (var i = 0; i < radios.length; i++) {
			    if (radios[i].checked) {
			      selectedValue = radios[i].value;
			      break;
			    }
			  }
			  // 선택된 값 확인
			  console.log(selectedValue);
			  var pColor = selectedValue;

			  Swal.fire({
				  icon: 'question',
				  title: "위시리스트에 담으시겠습니까?",
				  showCancelButton: true,
				  showConfirmButton: true,
				  confirmButtonText: "OK",
				  cancelButtonText: "Cancel"
					  }).then((result) => {
			    if (result.isConfirmed) {
			      if (result.isConfirmed) {
			        var url = "wishlists.do?pCode=" + encodeURIComponent(pCode) + "&pColor=" + encodeURIComponent(pColor);
			        window.location.href = url;
			      }
			    }
			  });
			}

			function buy() {
			  var pCode = $("#pCode").val();
			  var pcQty = $("#quantity").val();
			  var radios = document.getElementsByName('customRadio');
			  var selectedValue = '';

			  for (var i = 0; i < radios.length; i++) {
			    if (radios[i].checked) {
			      selectedValue = radios[i].value;
			      break;
			    }
			  }
			  // 선택된 값 확인
			  console.log(selectedValue);
			  console.log(pcQty);
			  var pColor = selectedValue;
			  if (pColor == "") {
			    Swal.fire({ icon: 'warning', title: "색상을 선택해주세요." });
			    return;
			  }
			  Swal.fire({
				  icon: 'question',
				  title: "바로 구매하시겠습니까?",
				  showCancelButton: true,
				  showConfirmButton: true,
				  confirmButtonText: "OK",
				  cancelButtonText: "Cancel"
				}).then((result) => {
				  if (result.isConfirmed) {
				    var url = "purchase_info.do?pCode=" + encodeURIComponent(pCode) + "&pcQty=" + encodeURIComponent(pcQty) + "&pColor=" + encodeURIComponent(pColor);
				    window.location.href = url;
				  } else if (result.dismiss === Swal.DismissReason.cancel) {
				    // Handle cancel button action here
				  }
				});

			}

		
		function increaseQuantity() {
		    var quantityInput = document.getElementById("quantity");
		    var currentQuantity = parseInt(quantityInput.value);
		    quantityInput.value = currentQuantity + 1;
		  }

		  function decreaseQuantity() {
		    var quantityInput = document.getElementById("quantity");
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
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
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
                                <input type="hidden" id="pCode" name="pCode" value="${product.pCode}">
                                    <a class="gallery_img" href="images/product/${product.pfRealName}" title="First Slide">
                                        <img class="d-block w-100" src="images/product/${product.pfRealName}" alt="First slide">
                                    </a>
                                    <!-- Product Badge -->
                                   <!--  <div class="product_badge">
                                        <span class="badge-new">New</span>
                                    </div> -->
                                </div>
                                <div class="carousel-item">
                                    <a class="gallery_img" href="images/product/${product.pfHoverRealName}" title="Second Slide">
                                        <img class="d-block w-100" src="images/product/${product.pfHoverRealName}" alt="Second slide">
                                    </a>
                                    <!-- Product Badge -->
                                   <!--  <div class="product_badge">
                                        <span class="badge-new">Sale</span>
                                    </div> -->
                                </div>
                                <!-- <div class="carousel-item">
                                    <a class="gallery_img" href="img/product-img/pd-big-thumb-3.png" title="Third Slide">
                                        <img class="d-block w-100" src="img/product-img/pd-big-thumb-3.png" alt="Third slide">
                                    </a>
                                    Product Badge
                                    <div class="product_badge">
                                        <span class="badge-new">-20%</span>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <a class="gallery_img" href="img/product-img/pd-big-thumb-4.png" title="Fourth Slide">
                                        <img class="d-block w-100" src="img/product-img/pd-big-thumb-4.png" alt="Fourth slide">
                                    </a>
                                    Product Badge
                                    <div class="product_badge">
                                        <span class="badge-new">Hot</span>
                                    </div>
                                </div> -->
                            </div>

                            <!-- Carosel Indicators -->
                            <ol class="carousel-indicators">
                                <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(images/product/${product.pfRealName});">
                                </li>
                                <li data-target="#product_details_slider" data-slide-to="1" style="background-image: url(images/product/${product.pfHoverRealName});">
                                </li>
                                <!-- <li data-target="#product_details_slider" data-slide-to="2" style="background-image: url(img/product-img/pd-big-thumb-3.png);">
                                </li>
                                <li data-target="#product_details_slider" data-slide-to="3" style="background-image: url(img/product-img/pd-big-thumb-4.png);">
                                </li> -->
                            </ol>
                        </div>
                    </div>
                </div>

                <!-- Single Product Description -->
                <div class="col-12 col-lg-6">
                    <div class="single_product_desc">
                        <h4 class="title mb-2">${product.pName}</h4>
                        <div class="single_product_ratings mb-2">
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <span class="text-muted">(8 Reviews)</span>
                        </div>
                        <h4 class="price mb-4">&#8361;${product.pPrice} <span>$190</span></h4>

                        <!-- Overview -->
                        <div class="short_overview mb-4">
                            <h6>Overview</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum dolores natus laboriosam accusantium, suscipit saepe eum deleniti mollitia at, odio, facere nisi aspernatur doloribus aperiam atque deserunt minima vitae rerum laudantium. Sapiente distinctio ipsam vitae dolorum odit, suscipit, aliquid.</p>
                        </div>
                        <!-- Color List -->
					<%-- 	<c:forEach items="${colorList}" var="color">
						    <div class="custom-control custom-radio">
						        <input type="radio" id="customRadio${status.index + 1}" name="customRadio" class="custom-control-input" value="${color.pColor}">
						        <label class="custom-control-label ${color.pColor}" for="customRadio${status.index + 1}"></label>
						        <input type="button" style="color: ${color.pColor};">
						    </div>
						    <div class="custom-control custom-radio">
						        <input type="radio" id="customRadio${status.index + 1}" name="customRadio" class="custom-control-input" value="${color.pColor}">
						        <label class="custom-control-label black" for="customRadio${status.index + 1}"></label>
						    </div>
						    <div class="custom-control custom-radio">
						        <input type="radio" id="customRadio${status.index + 1}" name="customRadio" class="custom-control-input" value="${color.pColor}">
						        <label class="custom-control-label red" for="customRadio${status.index + 1}"></label>
						    </div>
						    <div class="custom-control custom-radio">
						        <input type="radio" id="customRadio${status.index + 1}" name="customRadio" class="custom-control-input" value="${color.pColor}">
						        <label class="custom-control-label khaki" for="customRadio${status.index + 1}"></label>
						    </div>
						</c:forEach> --%>
						<div class="widget p-0 color mb-3">
                            <h6 class="widget-title">Color</h6>
                            <div class="widget-desc d-flex">
									<c:forEach items="${colorList}" var="color">
                                <div class="custom-control custom-radio">
                                    	<input type="radio" id="${color.pColor}" name="customRadio" class="custom-control-input" value="${color.pColor}">
                                    	<label class="custom-control-label ${color.pColor}" for="${color.pColor}"></label>
                                </div>
									</c:forEach>
                            </div>
                        </div>

						<!-- Add to Cart/Buy Form -->
                            <div class="form-group">
                            	<div class="input-form-group" style="display: flex; align-items: center;">
	                            	<button type="button" id="plusQtyBtn" class="btn btn-dark btn-sm" onclick="decreaseQuantity()">-</button>&nbsp;&nbsp;
	                            	<input type="text" id="quantity" name="quantity" class="form-control" style="width: 45px" value="1" min="1" max="10" readonly="readonly">&nbsp;&nbsp;
	                            	<button type="button" id="minusQtyBtn" class="btn btn-dark btn-sm" onclick="increaseQuantity()">+</button>
                            	</div>
                            	<br/>
                            	<c:if test="${empty SUID}">
	                            	<button type="button" id="addToCart" name="cartBtn" value="5" class="btn btn-primary btn-sm" onclick="emptySessionUser()">Add to cart</button>&nbsp;&nbsp;&nbsp;
	                            	<button type="button" id="buyBtn" name="buyBtn" value="5" class="btn btn-primary btn-sm" onclick="emptySessionUser()">Buy</button>
                            	</c:if>
                            	<c:if test="${!empty SUID}">
	                            	<button type="button" id="addToCart" name="cartBtn" value="5" class="btn btn-primary btn-sm" onclick="addToCart()">Add to cart</button>&nbsp;&nbsp;&nbsp;
	                            	<button type="button" id="buyBtn" name="buyBtn" value="5" class="btn btn-primary btn-sm" onclick="buy()">Buy</button>
                            	</c:if>
                            </div>

                        <!-- Others Info -->
                        <div class="others_info_area mb-3 d-flex flex-wrap">
                           <a class="add_to_wishlist"><i class="fa fa-heart" aria-hidden="true" onclick="toWishlist()"></i> WISHLIST</a> 
                            <a class="add_to_compare" href="compare.html"><i class="fa fa-th" aria-hidden="true"></i> COMPARE</a>
                            <a class="share_with_friend" href="#"><i class="fa fa-share" aria-hidden="true"></i> SHARE WITH FRIEND</a>
                        </div>

                        <!-- Size Guide -->
                       <!--  <div class="sizeguide">
                            <h6>Size Guide</h6>
                            <div class="size_guide_thumb d-flex">
                                <a class="size_guide_img" href="img/bg-img/size-1.png" style="background-image: url(img/bg-img/size-1.png);">
                                </a>
                                <a class="size_guide_img" href="img/bg-img/size-2.png" style="background-image: url(img/bg-img/size-2.png);">
                                </a>
                                <a class="size_guide_img" href="img/bg-img/size-3.png" style="background-image: url(img/bg-img/size-3.png);">
                                </a>
                            </div>
                        </div> -->
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
                                <a href="#reviews" class="nav-link" data-toggle="tab" role="tab">Reviews <span class="text-muted">(3)</span></a>
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
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur nulla similique deserunt nemo ea eum expedita, et repellat repudiandae unde quia molestias deleniti incidunt, ad cupiditate. Corporis ipsam minus officiis neque magni harum accusantium nobis labore veritatis, consectetur ab rerum.</p>

                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex cum dolore, adipisci vitae quidem. Quaerat tenetur explicabo tempore beatae dolor. Quo ipsa labore, itaque ea ratione. Ratione labore quae corporis.</p>

                                    <div class="embed-responsive embed-responsive-16by9 mb-3">
                                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tjvOOKx7Ytw?ecver=1" allowfullscreen></iframe>
                                    </div>

                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic facere quos repudiandae ratione maiores accusantium suscipit, quod fugiat. Fugit quod laborum quidem, quos adipisci harum aspernatur, repudiandae, beatae expedita rerum ipsam dicta molestias et quis sapiente maiores amet laudantium minus nostrum. Nobis amet veritatis autem illo neque voluptas culpa vero iusto distinctio perspiciatis.</p>

                                    <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima animi ab, quis atque, sed nulla veniam quisquam amet perspiciatis, aliquam dolore tempora, consequuntur beatae quae dolor rem repellendus! Vitae architecto sequi quo eaque iusto impedit suscipit non maxime sint totam, nesciunt necessitatibus iste nulla ab, veritatis assumenda.</p>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="reviews">
                                <div class="reviews_area">
                                    <ul>
                                        <li>
                                            <div class="single_user_review mb-15">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Quality</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Designing World</a> on <span>12 Sep 2019</span></p>
                                                </div>
                                            </div>
                                            <div class="single_user_review mb-15">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Design</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Designing World</a> on <span>12 Sep 2019</span></p>
                                                </div>
                                            </div>
                                            <div class="single_user_review">
                                                <div class="review-rating">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <span>for Value</span>
                                                </div>
                                                <div class="review-details">
                                                    <p>by <a href="#">Designing World</a> on <span>12 Sep 2019</span></p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>

                                <div class="submit_a_review_area mt-50">
                                    <h4>Submit A Review</h4>
                                    <form action="#" method="post">
                                        <div class="form-group">
                                            <span>Your Ratings</span>
                                            <div class="stars">
                                                <input type="radio" name="star" class="star-1" id="star-1">
                                                <label class="star-1" for="star-1">1</label>
                                                <input type="radio" name="star" class="star-2" id="star-2">
                                                <label class="star-2" for="star-2">2</label>
                                                <input type="radio" name="star" class="star-3" id="star-3">
                                                <label class="star-3" for="star-3">3</label>
                                                <input type="radio" name="star" class="star-4" id="star-4">
                                                <label class="star-4" for="star-4">4</label>
                                                <input type="radio" name="star" class="star-5" id="star-5">
                                                <label class="star-5" for="star-5">5</label>
                                                <span></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Nickname</label>
                                            <input type="email" class="form-control" id="name" placeholder="Nazrul">
                                        </div>
                                        <div class="form-group">
                                            <label for="options">Reason for your rating</label>
                                            <select class="form-control small right py-0 w-100" id="options">
                                                <option>Quality</option>
                                                <option>Value</option>
                                                <option>Design</option>
                                                <option>Price</option>
                                                <option>Others</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="comments">Comments</label>
                                            <textarea class="form-control" id="comments" rows="5" data-max-length="150"></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit Review</button>
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
    </c:forEach>
    <!-- Single Product Details Area End -->
    
    

    <!-- Related Products Area -->
	<jsp:include page="common/include_related_product_list.jsp"/>
    <!-- Related Products Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/product.js?after"></script>
	<script src="js/shop/review.js?after"></script>

</body>

</html>