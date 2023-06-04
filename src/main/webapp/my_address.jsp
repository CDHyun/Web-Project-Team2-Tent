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
    <!-- include_common_top -->
	<jsp:include page="common/include_common_top.jsp"/>
    <link rel="stylesheet" href="css/shop/user.css">

	<script src="js/shop/user.js"></script>
	<script type="text/javascript">
	function addModalOpen() {
		var form = document.getElementById('insert_address_form');
		$('#userAddressAddModal').modal('show');
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
				showAlert("오류가 발생했습니다. 다시 시도해주세요.");
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
                        <h4>My Addresses</h4>
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
										      <button type="button" class="btn btn-primary btn-sm" onclick="openPasswordCheckModal()">Modify</button>
									   		</c:if>
									   		<c:if test="${address.uaNo > 1}">
										      <button type="button" class="btn btn-primary btn-sm" onclick="openPasswordCheckModal()">Modify</button>
									      	<button type="button" class="btn btn-primary btn-sm delete-button">Delete</button>
									   		</c:if>
									    </td>
									  </tr>
									</c:forEach>


                                   <!-- board end -->
                                </tbody>
                            </table>
						
                        </div>
                    </div>
                    <br/>
					<button type="button" class="btn btn-primary btn-sm" onclick="addModalOpen()">배송지 추가</button>
                </div>
            </div>
            
            	<!-- 배송지 추가 모달 -->
				<div class="modal" id="userAddressAddModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="container">
								<h5 class="mb-3" style="display: inline-block; text-align: center;">User Add Address</h5>
								<span style="color: red">${l_msg}</span>
								<form id="insert_address_form">
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
				            		<button type="button" class="btn btn-primary btn-sm" onclick="userAddressAdd()">Add</button>
						        </form>
							</div>
						</div>
					</div>
				</div>
				<!-- 이메일 변경 모달 -->
            
            
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="js/shop/board.js" defer></script>

</body>

</html>