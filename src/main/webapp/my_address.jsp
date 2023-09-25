<%@page import="com.javalec.tent.dto.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- 
    	06/15 : 배송지 추가 오류 수정
     -->
    <!-- include_common_top -->
	<jsp:include page="common/include_common_top.jsp"/>
    <link rel="stylesheet" href="css/shop/user.css">

	<script src="js/shop/user.js"></script>
	<script type="text/javascript">
	var globalUaNo;
	function addModalOpen() {
		$('#userAddressAddModal').modal('show');
		}
	function modifyModalOpen(uaNo) {
		globalUaNo = uaNo;
		$('#userModifyAddressModal').modal('show');
		}
	  
	function userAddressAdd() {
		var uaAddress = $('#uaAddress').val();
		var uaDetailAddress = $('#uaDetailAddress').val();
		var uaZipcode = $('#uaZipcode').val();
		var uaContent = $('#uaContent').val();
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
			url : './UserAddressAdd',
			data : {
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
						title : "배송지 입력 중 문제가 발생했습니다."
					});
					return;
				}
				if (result === "1") {
					Toast.fire({ icon: 'success', title: "배송지가 추가 되었습니다." }).then(() => {
						  $('#userAddressAddModal').modal('hide');
						  window.location.href = "user_address.do";
						});
				}
			},
			error : function() {
				Toast.fire({ icon : 'warning', title : "오류가 발생했습니다. 관리자에게 문의해주세요." });
			}
		});
		
		  
	}
	
	function userModifyAddress() {
		/* var uaNo = $('#m_uaNo').val(); */
		var uaNo = globalUaNo;
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
						  window.location.href = "user_address.do";
						});
				}
			},
			error : function() {
				Toast.fire({ icon : 'warning', title : "오류가 발생했습니다. 관리자에게 문의해주세요." });
			}
		});
	}
	
	
	function userDeleteAddress(uaNo) {
		/* var uaNo = $('#d_uaNo').val(); */
		var uaNo = globalUaNo;
		ToastConfirm.fire({ icon: 'question', title: "배송지를 삭제 하시겠습니까?" }).then((result) => {
			if(result.isConfirmed){
				$.ajax({
					type : 'POST',
					url : './UserDeleteAddress',
					data : {
						uaNo : uaNo,
					},
					success : function(result) {
						console.log(result);
						if (result === "0") {
							Toast.fire({ icon : 'warning', title : "배송지 정보 삭제 중 문제가 발생했습니다." });
							return;
						}
						if (result === "1") {
							Toast.fire({ icon: 'success', title: "배송지 삭제 되었습니다." }).then(() => {
								  window.location.href = "user_address.do";
								});
						}
					},
					error : function() {
						Toast.fire({ icon : 'warning', title : "오류가 발생했습니다. 관리자에게 문의해주세요." });
					 }
			    });
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
                    <h5>My Addresses</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item active">My Addresses</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="shortcodes_title mb-30">
                        <h5 class="mb-3">My Account</h5>
                    </div>
                    <div class="shortcodes_content">
                        <div class="table-responsive">
                            <table class="table mb-0 table-bordered" style="vertical-align: middle; text-align: center;">
                                <thead>
                                    <tr>
                                        <th scope="col" class="board_title no-border">배송지</th>
                                        <th scope="col" class="board_title no-border">주소</th>
                                        <th scope="col" class="board_title no-border">전화 번호</th>
                                        <th scope="col" class="board_title no-border"></th>
                                    </tr>
                                </thead>
                                <tbody id="qna_list_tbody">
                                	<!-- board start -->
                                	<c:forEach var="address" items="${addressList}" varStatus="loop">
									  <tr>
									    <td>${SUNICKNAME}님의 배송지<br/><span style="color: gray;">${address.uaContent}</span></td>
									    <td style="vertical-align: middle;">${address.uaAddress}&nbsp;${address.uaDetailAddress}</td>
									    <td style="vertical-align: middle;">${address.uPhone}</td>
									    <td style="vertical-align: middle;">
									   		<c:if test="${address.uaNo == 1}">
										      <button type="button" class="btn btn-primary btn-sm" onclick="modifyModalOpen('${address.uaNo}')">Modify</button>
									   		</c:if>
									   		<c:if test="${address.uaNo > 1}">
										    	<button type="button" class="btn btn-primary btn-sm" onclick="modifyModalOpen('${address.uaNo}')">Modify</button>
										    	<input type="hidden" id="d_uaNo" name="d_uaNo" value="${address.uaNo}">
									      		<button type="button" class="btn btn-danger btn-sm delete-button" onclick="userDeleteAddress('${address.uaNo}')">Delete</button>
									   		</c:if>
									    </td>
									  </tr>
									  <!-- 배송지 수정 모달 -->
										<div class="modal" id="userModifyAddressModal" tabindex="-1" role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="container">
														<h5 class="mb-3" style="display: inline-block; text-align: center;">User Add Address</h5>
														<span style="color: red">${l_msg}</span>
												            <div class="col-12">
													            <div class="form-group">
													                <label for="Address">Address *</label>
													                <input type="hidden" id="m_uaNo" name="m_uaNo" value="${address.uaNo}">
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
											                <div class="col-12">
													            <div class="form-group">
													                <label for="Address">Shipping address<span style="color: gray; font-size: 14px">&nbsp;Optional</span></label>
													                <input type="text" class="form-control" id="m_uaContent" name="m_uaContent" value="${address.uaContent}" placeholder="Shipping address">
													            </div>
													        </div>
													        <div class="button-container">
											            		<button type="button" class="btn btn-primary btn-sm" onclick="userModifyAddress()">Modify</button>&nbsp;&nbsp;&nbsp;&nbsp;
																<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
															</div>
													</div>
												</div>
											</div>
										</div>
										<!-- 배송지 수정 모달 -->
									</c:forEach>
									</div>

                                   <!-- board end -->
                                </tbody>
                            </table>
						
                        </div>
                    </div>
                    <br/>
                    <!-- 배송지 추가 버튼 -->
					<button type="button" class="btn btn-primary btn-sm" onclick="addModalOpen()">배송지 추가</button>
					<a href="user_my_account.do"><button type="button" class="btn btn-secondary btn-sm" onclick="">뒤로 가기</button></a>
                </div>
            </div>
            
            	<!-- 배송지 추가 모달 -->
				<div class="modal" id="userAddressAddModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="container">
								<h5 class="mb-3" style="display: inline-block; text-align: center;">User Add Address</h5>
								<span style="color: red">${l_msg}</span>
						            <div class="col-12">
							            <div class="form-group">
							                <label for="Address">Address *</label>
							                <input type="text" class="form-control address m_u_check" id="uaAddress" name="uaAddress"  placeholder="Address" readonly="readonly">
							            </div>
							        </div>
							         <div class="col-12">
							            <div class="form-group">
							                <label for="Address">DetailAddress *</label>
							                <input type="text" class="form-control" id="uaDetailAddress" name="uaDetailAddress"  placeholder="Detailed Address">
							            </div>
							        </div>
							         <div class="col-12">
							             <div class="form-group">
								                <label for="Post">Post *</label><br>
								             <div class="input-form-group" style="display: flex; align-items: center;">
							                	<input type="text" class="form-control postcode m_u_check" id="uaZipcode" name="uaZipcode" placeholder="Zipcode" readonly="readonly">
												<button type="button" class="btn btn-outline-primary btn-sm searchAddr" style="margin-left: 15px;">search</button>
											</div>
					                	</div>
					                </div>
					                <div class="col-12">
							            <div class="form-group">
							                <label for="Address">Shipping address<span style="color: gray; font-size: 14px">&nbsp;Optional</span></label>
							                <input type="text" class="form-control" id="uaContent" name="uaContent"  placeholder="Shipping address">
							            </div>
							        </div>
							        <div class="button-container">
					            		<button type="button" class="btn btn-primary btn-sm" onclick="userAddressAdd()">Add</button>&nbsp;&nbsp;&nbsp;&nbsp;
										<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
									</div>
							</div>
						</div>
					</div>
				</div>
            	<!-- 배송지 추가 모달 -->
			</div>
		</div>
            
            
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="js/shop/board.js" defer></script>

</body>

</html>