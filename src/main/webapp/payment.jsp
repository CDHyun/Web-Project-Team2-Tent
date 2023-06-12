<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
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

    <div class="checkout_steps_area">
        <a class="Completed"><i class="icofont-check-circled"></i> Orderer</a>
        <a class="Completed"><i class="icofont-check-circled"></i> Receiver</a>
        <a class="active"><i class="icofont-check-circled"></i> Payment</a>
        <a><i class="icofont-check-circled"></i> Confirm</a>
        <a><i class="icofont-check-circled"></i> Complete</a>
    </div>

    <!-- Checkout Area -->
    <div class="checkout_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="checkout_details_area clearfix">
                        <div class="payment_method">
                            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                <!-- Single Payment Method -->
                                <form id="payment_info_form" method="post" action="purchase_check_info.do">
	                                <div class="panel panel-default">
	                                    <div class="panel-heading" role="tab" id="one">
	                                        <h6 class="panel-title">
	                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_one" aria-expanded="false" aria-controls="collapse_one"><i class="icofont-mastercard-alt"></i> Pay with Credit Card</a>
	                                        </h6>
	                                    </div>
	                                    <div aria-expanded="false" id="collapse_one" class="panel-collapse collapse show" role="tabpanel" aria-labelledby="one">
	                                        <div class="panel-body">
	                                            <div class="pay_with_creadit_card">
	                                                    <div class="row">
	                                                        <div class="col-12 mb-3">
	                                                            <div class="custom-control custom-checkbox">
	                                                                <input type="checkbox" name="o_pay_method" value="Credit Card" class="custom-control-input" id="customCheck1">
	                                                                <label class="custom-control-label" for="customCheck1">Credit Card</label>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	
	                                <!-- Single Payment Method -->
	                                <div class="panel panel-default">
	                                    <div class="panel-heading" role="tab" id="two">
	                                        <h6 class="panel-title">
	                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_two" aria-expanded="false" aria-controls="collapse_two"><i class="icofont-paypal-alt"></i> Pay with PayPal</a>
	                                        </h6>
	                                    </div>
	                                    <div aria-expanded="false" id="collapse_two" class="panel-collapse collapse" role="tabpanel" aria-labelledby="two">
	                                        <div class="panel-body">
	                                            <div class="pay_with_paypal">
	                                                    <div class="row">
	                                                        <div class="col-12 mb-3">
	                                                            <div class="custom-control custom-checkbox">
	                                                                <input type="checkbox" name="o_pay_method" value="PayPal" class="custom-control-input" id="customCheck2">
	                                                                <label class="custom-control-label" for="customCheck2">PayPal</label>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	
	                                <!-- Single Payment Method -->
	                                <div class="panel panel-default">
	                                    <div class="panel-heading" role="tab" id="three">
	                                        <h6 class="panel-title">
	                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_three" aria-expanded="false" aria-controls="collapse_three"><i class="icofont-bank-transfer-alt"></i> Direct Bank Transfer</a>
	                                        </h6>
	                                    </div>
	                                    <div aria-expanded="false" id="collapse_three" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="three">
	                                        <div class="panel-body">
	                                               <div class="row">
	                                                   <div class="col-12 mb-3">
	                                                       <div class="custom-control custom-checkbox">
	                                                           <input type="checkbox" name="o_pay_method" value="BankTransfer" class="custom-control-input" id="customCheck3">
	                                                           <label class="custom-control-label" for="customCheck3">Bank Transfer</label>
	                                                       </div>
	                                                   </div>
	                                               </div>
	                                        </div>
	                                    </div>
	                                </div>
	
	                                <!-- Single Payment Method -->
	                                <div class="panel panel-default">
	                                    <div class="panel-heading" role="tab" id="five">
	                                        <h6 class="panel-title">
	                                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse_five" aria-expanded="false" aria-controls="collapse_five"><i class="icofont-cash-on-delivery-alt"></i> Cash on Delivery
	                                            </a>
	                                        </h6>
	                                    </div>
	                                    <div aria-expanded="false" id="collapse_five" class="panel-collapse collapse" role="tabpanel" aria-labelledby="five">
	                                        <div class="panel-body">
	                                               <div class="row">
	                                                   <div class="col-12 mb-3">
	                                                       <div class="custom-control custom-checkbox">
	                                                           <input type="checkbox" name="o_pay_method" value="Cash on Delivery" class="custom-control-input" id="customCheck5">
	                                                           <label class="custom-control-label" for="customCheck5">Cash on Delivery</label>
	                                                       </div>
	                                                   </div>
	                                               </div>
		                                        </div>
		                                    </div>
		                                </div>
									<div class="col-12">
										<div
											class="checkout_pagination d-flex justify-content-end mt-30">

											<a href="payment.do"><button type="button" class="btn btn-primary mt-2 ml-2" id="payment_before_btn">Go Back</button></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="submit" class="btn btn-primary mt-2 ml-2" id="payment_next_btn">Final Step</button>
										</div>
									</div>
								</form>		
		                         </div>
		                     </div>
		                 </div>
		             </div>
			</div>
    </div>
    <!-- Checkout Area End -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/order.js"></script>

</body>

</html>