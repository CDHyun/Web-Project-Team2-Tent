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
    
    
<!--     <script src="js/shop/user.js"></script> -->
	<script type="text/javascript"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
                        <form id="orderer_info_form" method="post">
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
									<label for="street_address">Address</label> <input type="text" class="form-control address o_check" id="sample6_address" name="puAddress" placeholder="Address" value="${user.uaAddress}">
								</div>
                                <div class="col-md-12 mb-3">
									<label for="street_address">Detail Address</label> <input type="text" class="form-control address" id="sample6_detailAddress" name="puDetailAddress" placeholder="Detail Address" value="${user.uaDetailAddress}">
								</div>
                                <div class="col-md-12 mb-3">
									<label for="street_address">Extra Address</label> <input type="text" class="form-control address " id="sample6_extraAddress" placeholder="Extra Address" value="">
								</div>
								
								<div class="col-md-6 mb-3">
									<label for="postcode">Postcode</label> <input type="text"
										class="form-control postcode o_check" id="sample6_postcode" name="puZipcode"
										placeholder="Postcode" value="${user.uaZipcode}">
								</div>
								<div class="col-md-6 mb-3 search">
									<button type="button"
										class="btn btn-outline-primary mb-1" onclick="sample6_execDaumPostcode()">search</button>
										  &nbsp;&nbsp;&nbsp;&nbsp;
									<form action="purchaseAddressModify.do" method="post">
									<input type="submit" class="btn btn-primary mb-1" value="Modify"></form>	  
										 
								</div>
								<div class="col-md-12">
									<label for="order-notes">Message</label>
									<textarea class="form-control" name="o_message"
										id="order-notes" cols="30" rows="10"
										placeholder="Notes about your order, e.g. special notes for delivery."></textarea>
											</div>
										</div>
 							&nbsp;&nbsp;<caption>*Press the modify button to modify it*</caption>
									</form>
								</div>
							</div>
                        </c:forEach>
                        
                               
                                
                              

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
    
    <!-- *************************************************  -->
 
 
                                
									</div>

                                   <!-- board end -->
                                </tbody>
                            </table>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  
    <!-- Checkout Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>


</body>

</html>