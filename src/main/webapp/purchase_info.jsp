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
    
    
    	<script src="js/shop/user.js"></script>
    	
    	
	<script type="text/javascript">
	
	
	function modifyModalOpen() {
		$('#userModifyAddressModal').modal('show');
		}
	
	function userModifyAddress() {
		var uaNo = $('#m_uaNo').val();
		var uaAddress = $('#m_uaAddress').val();
		var uaDetailAddress = $('#m_uaDetailAddress').val();
		var uaZipcode = $('#m_uaZipcode').val();
		var uaContent = $('#m_uaContent').val();
		var regExpuAddress = /^[가-힣|0-9|a-z|A-Z|-|\s]*$/;
		
		if (uaAddress.trim().length === 0) {
			Toast.fire({icon : 'warning', title : "주소를 입력해주세요."});
			return;
		}
		if (uaDetailAddress.trim().length === 0) {
			Toast.fire({icon : 'warning', title : "상세 주소를 입력해주세요."});
			return;
		}
		if (uaZipcode.length === 0) {
			Toast.fire({icon : 'warning', title : "우편번호를 입력해주세요."});
			return;
		}
		
		if (!regExpuAddress.test(uaDetailAddress)) {
			Toast.fire({icon : 'warning', title : "주소는 영문/한글/숫자/- 만 입력 가능합니다."});
			ruAddress.select();
			return
		}
		
		$.ajax({
			type : 'POST',
			url : './UserModifyAddress',
			data : {
				uaNo : uaNo,
				uaAddress : uaAddress,
				uaDetailAddress : uaDetailAddress,
				uaZipcode : uaZipcode,
				uaContent : uaContent
			},
			success : function(result) {
				console.log(result);
				if (result === "0") {
					Toast.fire({
						icon : 'warning',
						title : "배송지 정보 변경 중 문제가 발생했습니다."
					});
					return;
				}
				if (result === "1") {
					Toast.fire({ icon: 'success', title: "배송지 정보가 변경 되었습니다." }).then(() => {
						  $('#userModifyAddressModal').modal('hide');
						  var pCode = "${PCODE}";
						  var pcQty = "${PCQTY}";
						  var pColor = "${PCOLOR}";

						  var url = "purchase_info.do?pCode=" + encodeURIComponent(pCode) +
						            "&pcQty=" + encodeURIComponent(pcQty) +
						            "&pColor=" + encodeURIComponent(pColor);

						  window.location.href = url;
						});
				}
			},
			error : function() {
				Toast.fire({ icon : 'warning', title : "오류가 발생했습니다. 관리자에게 문의해주세요." });
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
                        <form id="orderer_info_form" method="post" action="payment.do">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="first_name">ID</label>
                                    <input type="text" class="form-control o_check" id="puid" name="puid" value="${user.uid}" readonly="readonly">
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="last_name">Name</label>
                                    <input type="text" class="form-control o_check" id="puName" name="puName" placeholder="Name" value="${user.uName}" readonly="readonly" >
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="email_address">Email</label>
                                    <input type="email" class="form-control o_check" name="pEmail" id="puEmail" placeholder="Email Address" value="${user.uEmail}" readonly="readonly" >
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="phone_number">Phone Number</label>
                                    <input type="text" class="form-control o_check phone_number" name="puPhone" id="puPhone" min="0" value="${user.uPhone}" placeholder="- 제외 입력해주세요" readonly="readonly">
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
									<button type="button" class="btn btn-outline-primary mb-1" onclick="modifyModalOpen()">Modify</button>
								</div>
								<div class="col-md-12">
								<label for="order-notes">Message</label>
                                <textarea class="form-control" name="pcDM" id="order-notes" cols="30" rows="10" placeholder="Notes about your order, e.g. special notes for delivery.">부재시 문앞에 놔주세요</textarea>
									<!-- <label for="order-notes">Message</label>
									<textarea class="form-control" name="pcDM"
										id="order-notes" cols="30" rows="10"
										placeholder="Notes about your order, e.g. special notes for delivery."></textarea> -->
											</div>
										</div>
										<div class="col-12">
									<div class="checkout_pagination mt-3 d-flex justify-content-end align-items-center clearfix">
										<a href="product_list.do"><input type="button" class="btn btn-primary ml-2" value="Go Back"></a>
										<input type="submit" class="btn btn-primary ml-2" value="Continue">
									</div>
								</div>
									</form>
								</div>
							</div>
                        </c:forEach>
                        
					</div>

				</div>
			</div>
    
    <!-- *************************************************  -->
 
							  	  <!-- 배송지 수정 모달 -->
								  	  <c:forEach var="address" items="${address}" varStatus="loop">
										<div class="modal" id="userModifyAddressModal" tabindex="-1" role="dialog">
									  	  <input type="hidden" id="m_uaNo" value="${address.uaNo}">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="container">
														<h5 class="mb-3" style="display: inline-block; text-align: center;">User Add Address</h5>
														<span style="color: red">${l_msg}</span>
												            <div class="col-12">
													            <div class="form-group">
													                <label for="Address">Address *</label>
													                <input type="text" class="form-control address m_u_check" id="m_uaAddress" name="m_uaAddress" value="${address.uaAddress}" placeholder="Address" readonly="readonly">
													            </div>
													        </div>
													         <div class="col-12">
													            <div class="form-group">
													                <label for="Address">DetailAddress *</label>
													                <input type="text" class="form-control" id="m_uaDetailAddress" name="m_uaDetailAddress" value="${address.uaDetailAddress}" placeholder="Detailed Address">
													            </div>
													        </div>
													         <div class="col-12">
													             <div class="form-group">
														                <label for="Post">Post *</label><br>
														             <div class="input-form-group" style="display: flex; align-items: center;">
													                	<input type="text" class="form-control postcode m_u_check" id="m_uaZipcode" name="m_uaZipcode" value="${address.uaZipcode}" placeholder="Zipcode" readonly="readonly">
																		<button type="button" class="btn btn-outline-primary btn-sm searchAddr" style="margin-left: 15px;">search</button>
																	</div>
											                	</div>
											                </div>
													        </div>
													        <div class="button-container">
											            		<button type="button" class="btn btn-primary btn-sm" onclick="userModifyAddress()">Modify</button>&nbsp;&nbsp;&nbsp;&nbsp;
																<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancel</button>
															</div>
													</div>
												</div>
											</div>
										</div>
										</c:forEach>
										<!-- 배송지 수정 모달 -->
									</div>











    <!-- Checkout Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/order.js"></script>

</body>

</html>