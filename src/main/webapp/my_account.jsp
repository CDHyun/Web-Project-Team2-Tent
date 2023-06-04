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
                    <h5>My Account</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item active">My Account</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- My Account Area -->
    <section class="my-account-area section_padding_100_50">
        <div class="container">
            <div class="row">
				<div class="col-12 col-lg-3">
				    <div class="my-account-navigation mb-50">
				        <ul>
				            <li><a href="user_my_account.do$uid=${SUID}">My Account</a></li>
				            <li><a href="purchase_list.do">Orders</a></li>
				            <li><a href="logout.do">Logout</a></li>
				        </ul>
				    </div>
				</div>
                <div class="col-12 col-lg-9">
                    <div class="my-account-content mb-50">
                        <h5 class="mb-3">My Account</h5>
						
						<c:forEach items="${userInfo}" var="user">
						<h3>${user.uid}</h3>
						
                        <form id="user_account_form" action="member_account_update_action" method="post">
                            <div class="row">
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="uid">ID *</label>
                                        <input type="text" class="form-control" id="uid" name="uid" value="${user.uid}" readonly>
                                    </div>
                                </div>
                                
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="Name">Name *</label>
	                                        <div class="input-form-group" style="display: flex; align-items: center;">
	                                        	<c:set var="name" value="${user.uName}" />
												<c:set var="length" value="${fn:length(name)}" />
												<c:set var="firstChar" value="${fn:substring(name, 0, 1)}" />
												<c:set var="lastChar" value="${fn:substring(name, length - 1, length)}" />
												<c:set var="middleMask" value="" />
												<c:forEach var="i" begin="1" end="${length - 2}">
												  <c:set var="middleMask" value="${middleMask}*"/>
												</c:forEach>
												<c:set var="maskedName" value="${firstChar}${middleMask}${lastChar}" />
	                                        	<input type="text" class="form-control" id="uName" name="uName" placeholder="이름" value="${maskedName}" readonly="readonly">
	                                        	<c:if test="${empty CONFIRM}">
													<button type="button" class="btn btn-primary btn-sm" onclick="openPasswordCheckModal()" style="margin-left: 15px;">Rename</button>
	                                        	</c:if>
	                                        	<c:if test="${!empty CONFIRM}">
													<button type="button" class="btn btn-primary btn-sm" onclick="openUserRenameModal()" style="margin-left: 15px;">Rename</button>
	                                        	</c:if>
											</div>
                                    </div>
                                </div>
                              
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="emailAddress">Email Address *</label>
                                        <input type="email" class="form-control m_u_check" id="uEmail" name="uEmail" placeholder="이메일" value="${user.uEmail}">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="Phone">Phone *</label>
                                        <input type="text" class="form-control m_u_check phone_number" id="uPhone" name="uPhone" placeholder="전화번호" value="${user.uPhone}">
                                    </div>
                                </div>
                                
                                 <div class="col-12">
                                    <div class="form-group">
                                        <label for="Address">Address *</label>
                                        <input type="text" class="form-control address m_u_check" id="uaAddress" name="uaAddress"  placeholder="주소" value="${user.uaAddress}">
                                    </div>
                                </div>
                                 <div class="col-12">
                                    <div class="form-group">
                                        <label for="Address">DetailAddress *</label>
                                        <input type="text" class="form-control address m_u_check" id="uaDetailAddress" name="uaDetailAddress"  placeholder="주소" value="${user.uaDetailAddress}">
                                    </div>
                                </div>
                                
                                 <div class="col-12">
                                    <div class="form-group">
                                        <label for="Post">Post *</label><br>
                                        <input type="text" class="form-control postcode m_u_check" id="uaZipcode" name="uaZipcode" placeholder="우편번호" value="${user.uaZipcode}">
                                    	<button type="button" class="btn btn-outline-primary mb-1 searchAddr">search</button>
                                    </div>
                                </div>

                                
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="currentPass">Password *</label>
                                        <input type="password" class="form-control m_u_check" name="m_password" id="currentPass" value="">
                                    </div>
                                </div>
                                
                                &nbsp;&nbsp;&nbsp; <span style="color:red"> ✔️ 비밀번호 변경을 원할 시 작성해주세요</span>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="newPass">New Password</label>
                                        <input type="password" class="form-control" name="new_password" id="newPass" value="">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="confirmPass">Confirm New Password</label>
                                        <input type="password" class="form-control" id="confirmPass" value="">
                                    </div>
                                </div>
                                
                                <div class="col-12">
                                    <button type="button" class="btn btn-primary" id="member_update_btn">Save Changes</button>
                                    <button type="button" class="btn btn-outline-primary mb-1" id="withdrawal_btn" style="float:right">Withdrawal</button>
                                </div>
                            </div>
                        </form>
						</c:forEach>
                        <form id="member_withdrawal_form" action="member_account_delete_action" method="post">

                        	<input type="hidden" name="m_id" value="" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- My Account Area -->
    
    <div class="modal" id="passwordCheckModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">Password Confirm</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label for="Password">Please enter your password to change the information.</label>
							<input type="password" class="form-control" id="cPassword" name="cPassword" placeholder="your password">
						</div>
						<div class="button-container">
							<button type="button" class="btn btn-primary btn-sm" onclick="passwordCheck()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
						</div>
				</div>
			</div>
		</div>
	</div>
    <div class="modal" id="userRenameModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">User Rename</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label for="Password">Please enter the name you want to change.</label>
							<input type="text" class="form-control postcode" id="uReName" name="uReName" placeholder="name">
						</div>
						<div class="button-container">
							<button type="button" class="btn btn-primary btn-sm" onclick="userRename()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
						</div>
				</div>
			</div>
		</div>
	</div>

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->
	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	
<script type="text/javascript">

	function openPasswordCheckModal() {
		$('#passwordCheckModal').modal('show');
	}
	
	function passwordCheck() {
		var uid = $("#uid").val();
		var uPassword = $("#cPassword").val();

		if ($("#cPassword").val() == "") {
			Toast.fire({
				icon : 'warning',
				title : "비밀번호를 입력해주세요",
				target : '#toastContainer'
			});
			return;
		}
		$.ajax({
			type : 'POST',
			url : './UserPasswordCheck',
			data : {
				uid : uid,
				uPassword : uPassword
			},
			success : function(result) {
				console.log(result);
				if (result === "0") {
					Toast.fire({
						icon : 'warning',
						title : "비밀번호를 확인해주세요."
					});
					return;
				}
				if (result === "1") {
					Toast.fire({
						icon : 'success',
						title : "비밀번호가 확인 되었습니다."
					});
					$('#passwordCheckModal').modal('hide');
					window.location.href = "user_my_account.do";
				}
			},
			error : function() {
				showAlert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
	}
	
	function openUserRenameModal() {
		$('#userRenameModal').modal('show');
	}
	
	function userRename() {
		var uReName = $("#uReName").val();
		if ($("#cPassword").val() == "") {
			Toast.fire({ icon : 'warning', title : "변경하실 이름을 입력해주세요", target : '#toastContainer' });
			return;
		}
		$.ajax({
			type : 'POST',
			url : './UserRename',
			data : {
				uid : uid,
				uPassword : uPassword
			},
			success : function(result) {
				console.log(result);
				if (result === "0") {
					Toast.fire({
						icon : 'warning',
						title : "비밀번호를 확인해주세요."
					});
					return;
				}
				if (result === "1") {
					Toast.fire({
						icon : 'success',
						title : "비밀번호가 확인 되었습니다."
					});
					$('#passwordCheckModal').modal('hide');
					window.location.href = "user_my_account.do";
				}
			},
			error : function() {
				showAlert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		});
		
		
	}
	
</script>
	
</body>

</html>