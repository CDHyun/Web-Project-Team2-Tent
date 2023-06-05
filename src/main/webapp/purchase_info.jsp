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
    <link rel="stylesheet" href="css/shop/order.css">

</head>

<body>


		<%-- <% request.setCharacterEncoding("utf-8"); 
		String pcDM = request.getParameter(“pcDM”); 
		session.setAttribute(“SDM”, “pcDM”);
		%> 
 --%>

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
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Checkout</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Checkout Step Area -->
    <div class="checkout_steps_area">
        <a class="active" href="checkout-2.html"><i class="icofont-check-circled"></i> Orderer</a>
        <a><i class="icofont-check-circled"></i> Receiver</a>
        <a><i class="icofont-check-circled"></i> Payment</a>
        <a><i class="icofont-check-circled"></i> Confirm</a>
        <a><i class="icofont-check-circled"></i> Complete</a>
    </div>

    <!-- Checkout Area -->
    <div class="checkout_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="checkout_details_area clearfix">
                        <h5 class="mb-4">Orderer Info</h5>
                        <%-- <c:set var="user" value="${selectUser}"/> --%>
                        <c:forEach items="${selectUser}" var="user">
                        <form id="orderer_info_form" method="post">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="first_name">ID</label>
                                    <input type="text" class="form-control o_check" id="puid" name="puid" value="${user.uid}" readonly="readonly">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="last_name">Name</label>
                                    <input type="text" class="form-control o_check" id="puName" name="puName" placeholder="Name" value="${user.uName}" >
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email_address">Email</label>
                                    <input type="email" class="form-control o_check" name="pEmail" id="puEmail" placeholder="Email Address" value="${user.uEmail}" >
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="phone_number">Phone Number</label>
                                    <input type="text" class="form-control o_check phone_number" name="puPhone" id="puPhone" min="0" value="${user.uPhone}" placeholder="- 제외 입력해주세요">
                                </div>
                                <div class="col-md-12 mb-3">
									<label for="street_address">Address</label> <input type="text" class="form-control address o_check" id="puaAddress" name="puAddress" placeholder="Address" value="${user.uaAddress}">
								</div>
                                <div class="col-md-12 mb-3">
									<label for="street_address">Detail Address</label> <input type="text" class="form-control address o_check" name="puaDetailAddress" placeholder="Address" value="${user.uaDetailAddress}">
								</div>
								<div class="col-md-6 mb-3">
									<label for="postcode">Postcode</label> <input type="text"
										class="form-control postcode o_check" id="puZipcode" name="puZipcode"
										placeholder="Postcode" value="${user.uaZipcode}">
								</div>
								<div class="col-md-6 mb-3 search">
									<button type="button"
										class="btn btn-outline-primary mb-1 searchAddr">search</button>
								</div>
								<div class="col-md-12">
									<label for="order-notes">Message</label>
									<textarea class="form-control" name="o_message"
										id="order-notes" cols="30" rows="10"
										placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
											</div>
										</div>
									</form>
								</div>
							</div>
                        
                        </c:forEach>
                        
                               
                                
                                
                            
<!-- 
                <div class="col-12">

           <!--      <div class="col-12">
                    <div class="checkout_pagination d-flex justify-content-end mt-50">
                        <a href="" id="orderer_next_btn" class="btn btn-primary mt-2 ml-2 order_next">Continue</a>
                    </div>
                </div>
            </div>
        </div>
    </div> -->


							<div class="col-12">
								<div class="checkout_pagination mt-3 d-flex justify-content-end align-items-center clearfix">
									<form id="back_Receiver" action="product_detail.do" method="post" name="Go Back">
										<input type="submit" class="btn btn-primary ml-2" value="Go Back">
									</form>
									<form id="Receiver_next_btn" action="payment.do" method="post" name="Continue">
										<input type="submit" class="btn btn-primary ml-2" value="Continue">
									</form>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- 
                <div class="col-12">
                    <div class="checkout_pagination mt-3 d-flex justify-content-end clearfix">
                        <a href="" class="btn btn-primary mt-2 ml-2 order_back_btn order_back"  id="back_receiver">Go Back</a>
                        <a href="" id="receiver_next_btn" class="btn btn-primary mt-2 ml-2 order_next">Continue</a>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
  
    <!-- Checkout Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/order.js"></script>

</body>

</html>