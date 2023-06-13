
<%@page import="com.javalec.tent.dto.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<div class="col-12 col-lg-3" >
				    <div class="my-account-navigation mb-50">
				        <ul>
				            <li><a href="user_my_account.do?uid=${SUID}">My Account</a></li>
				            <li><a href="purchase_list.do">Orders</a></li>
				            <li><a href="logout.do">Logout</a></li>
				        </ul>
				    </div>
				</div>
                <div class="col-12 col-lg-9">
                    <div class="my-account-content mb-50">
					<c:forEach items="${userInfo}" var="user">
                        <h5 class="mb-3">My Account</h5>
						
						<h3>기본 회원정보<span style="color: gray; font-size: 16px">&nbsp; * : 필수</span> </h3>
						
                        <form id="user_account_form" action="" method="post">
                            <div class="row">
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="uid">ID *</label>
                                        <input type="text" class="form-control" id="uid" name="uid" value="${user.uid}" readonly>
                                    </div>
                                </div>
                                
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="uName">Name *</label>
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
													<button type="button" class="btn btn-info btn-sm" onclick="openPasswordCheckModal()" style="margin-left: 15px;">Rename</button>
	                                        	</c:if>
	                                        	<c:if test="${!empty CONFIRM}">
													<button type="button" class="btn btn-info btn-sm" onclick="openUserRenameModal()" style="margin-left: 15px;">Rename</button>
	                                        	</c:if>
											</div>
                                    </div>
                                </div>
                                <div class="col-12">
	                                <div class="form-group">
	                                        <label for="uEmail">Email Address *</label>
		                                        <div class="input-form-group" style="display: flex; align-items: center;">
													<%
													    ArrayList<UserDto> userInfo = (ArrayList<UserDto>) request.getAttribute("userInfo");
													    String userEmail = userInfo.get(0).getuEmail();
													    String[] parts = userEmail.split("@");
													    String username = parts[0];
													    String domain = parts[1];
													    
													    int maskLength = Math.max(3, username.length() - 3);
													    String maskedUsername = username.substring(0, maskLength) + "*".repeat(username.length() - maskLength);
													    
													    int domainMaskStart = Math.max(0, domain.indexOf('.') - 10); // 첫 번째 점 이전부터 마스킹할 위치 계산
													    int domainMaskEnd = domain.indexOf('.'); // 첫 번째 점까지 마스킹할 위치 계산
													    
													    StringBuilder maskedDomainBuilder = new StringBuilder(domain);
													    for (int i = domainMaskStart; i < domainMaskEnd; i++) {
													        maskedDomainBuilder.setCharAt(i, '*'); // 마스킹
													    }
													    String maskedDomain = maskedDomainBuilder.toString();
													    
													    String maskedEmail = maskedUsername + "@" + maskedDomain;
													%>
		                                        	<input type="text" class="form-control" id="uEmail" name="uEmail" placeholder="Email" value="<%=maskedEmail%>" readonly="readonly">
		                                        	<c:if test="${empty CONFIRM}">
														<button type="button" class="btn btn-info btn-sm" onclick="openPasswordCheckModal()" style="margin-left: 15px;">Modify</button>
		                                        	</c:if>
		                                        	<c:if test="${!empty CONFIRM}">
														<button type="button" class="btn btn-info btn-sm" onclick="openUserReEmailModal()" style="margin-left: 15px;">Modify</button>
		                                        	</c:if>
												</div>
	                                    </div>
                                </div>
                                <div class="col-12">
	                                <div class="form-group">
	                                        <label for="uPhone">Phone *</label>
		                                        <div class="input-form-group" style="display: flex; align-items: center;">
													<c:set var="phoneNumber" value="${user.uPhone}" />
													<c:set var="cleanedNumber" value="${phoneNumber.replaceAll('[^0-9]', '')}" />
													<c:set var="maskedNumber" value="${fn:substring(cleanedNumber, 0, 3)}-${fn:substring(cleanedNumber, 3, 5)}**-${fn:substring(cleanedNumber, 7, 9)}**" />
			                                        <input type="text" class="form-control m_u_check phone_number" id="uPhone" name="uPhone" placeholder="전화번호" value="${maskedNumber}" readonly="readonly">
		                                        	<c:if test="${empty CONFIRM}">
														<button type="button" class="btn btn-info btn-sm" onclick="openPasswordCheckModal()" style="margin-left: 15px;">Modify</button>
		                                        	</c:if>
		                                        	<c:if test="${!empty CONFIRM}">
														<button type="button" class="btn btn-info btn-sm" onclick="openUserRePhoneModal()" style="margin-left: 15px;">Modify</button>
		                                        	</c:if>
												</div>
	                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
	                                <div class="form-group">
	                                        <label for="uNickName">Nickname *</label>
		                                        <div class="input-form-group" style="display: flex; align-items: center;">
		                                        	<input type="text" class="form-control" id="uNickName" name="uNickName" placeholder="nickname" value="${user.uNickName}" readonly="readonly">
		                                        	<c:if test="${empty CONFIRM}">
														<button type="button" class="btn btn-info btn-sm" onclick="openPasswordCheckModal()" style="margin-left: 15px;">Modify</button>
		                                        	</c:if>
		                                        	<c:if test="${!empty CONFIRM}">
														<button type="button" class="btn btn-info btn-sm" onclick="openUserChangeNickNameModal()" style="margin-left: 15px;">Modify</button>
		                                        	</c:if>
												</div>
	                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
	                                <div class="form-group">
	                                        <label for="uGender">Gender *</label>
		                                        <div class="input-form-group" style="display: flex; align-items: center;">
		                                        <c:if test="${user.uGender == 1}">
		                                        	<c:set var="gender" value="남자"></c:set>
		                                        </c:if>
		                                        <c:if test="${user.uGender == 2}">
		                                        	<c:set var="gender" value="여자"></c:set>
		                                        </c:if>
		                                        	<input type="text" class="form-control" id="uGender" name="uGender" placeholder="uGender" value="${gender}" readonly="readonly">
												</div>
	                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
	                                <div class="form-group">
	                                        <label for="uBirthday">Birthday</label>
		                                        <div class="input-form-group" style="display: flex; align-items: center;">
		                                        	<input type="text" class="form-control" id="uBirthday" name="uBirthday" placeholder="uBirthday" value="${user.uBirthday}" readonly="readonly">
												</div>
	                                    </div>
                                </div>
                                <div class="col-12 col-lg-6">
	                                <div class="form-group">
	                                        <label for="uInsertDate">Join Date</label>
	                                        <div class="input-form-group" style="display: flex; align-items: center;">
												<c:set var="dateString" value="${user.uInsertDate}" />
												<fmt:parseDate var="date" value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss" />
												<fmt:formatDate var="formattedDate" value="${date}" type="date" pattern="yyyy-MM-dd" />
	                                        	<input type="text" class="form-control" id="uInsertDate" name="uInsertDate" placeholder="join date" value="${formattedDate}" readonly="readonly">
											</div>
	                                    </div>
                                </div>
                               <div class="col-12">
                               <br/>
	                                <div class="form-group">
	                                <div class="button-container">
										<c:if test="${empty CONFIRM}">
											<button type="button" class="btn btn-success btn-sm" onclick="openPasswordCheckModal()">Manage Addresses</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-primary btn-sm" onclick="openUserChangePasswordModal()">Password Change</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-danger btn-sm" onclick="deleteAccountQuestion()">Delete Account</button>
										</c:if>
										<c:if test="${!empty CONFIRM}">
											<br />
											<a href="user_address.do"><button type="button" class="btn btn-success btn-sm">Manage Addresses</button></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-primary btn-sm" onclick="openUserChangePasswordModal()">Change Password</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<button type="button" class="btn btn-danger btn-sm" onclick="deleteAccountQuestion()">Delete Account</button>
										</c:if>
											</div>
	                                </div>
                                </div> 
                            </div>
                        </form>
						</c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- My Account Area -->
    
	<!-- 비밀번호 체크 모달 -->
    <div class="modal" id="passwordCheckModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">Password Confirm</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label for="cPassword">Please enter your password to change the information.</label>
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
	<!-- 이름 변경 모달 -->
    <div class="modal" id="userRenameModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">User Rename</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label>Please enter the name you want to change.</label>
							<input type="text" class="form-control" id="uReName" name="uReName" placeholder="name">
						</div>
						<div class="button-container">
							<button type="button" class="btn btn-primary btn-sm" onclick="userRename()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 이메일 변경 모달 -->
	<div class="modal" id="userReEmailModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">User Email Modify</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label>Please enter the Email you want to change.</label><br/>
							<input type="email" class="form-control" id="uReEmail" name="uReEmail" placeholder="email">
						</div>
						<div class="button-container">
							<button type="button" class="btn btn-primary btn-sm" onclick="userReEmail()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 전화번호 변경 모달 -->
	<div class="modal" id="userRePhoneModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">User Phone Number Modify</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label>Please enter the Phone Number you want to change.</label><br/>
					  <div class="input-form-group" style="display: flex; align-items: center; text-align: center;">
					    <select id="uPhone1" name="uPhone1">
					      <option>010</option>
					      <option>011</option>
					      <option>012</option>
					      <option>014</option>
					      <option>017</option>
					    </select>
					    <span style="margin-left: 20px; font-size: 18px;">-</span>
					    <input type="text" class="form-control" id="uPhone2" name="uPhone2" placeholder="Phone" style="margin-left: 15px;">
					    <span style="margin-left: 20px; font-size: 18px;">-</span>
					    <input type="text" class="form-control" id="uPhone3" name="uPhone3" placeholder="Phone" style="margin-left: 15px;">
					  </div>
					</div>
						<div class="button-container">
							<button type="button" class="btn btn-primary btn-sm" onclick="userRePhone()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 비밀번호 변경 모달 -->
	<div class="modal" id="userChangePasswordModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">User Change Password</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label>Please enter the Password you want to change.</label><br/>
					    <input type="password" class="form-control" id="c_uPassword" name="c_uPassword" placeholder="your password">
					</div>
					<div class="form-group">
				    	<input type="password" class="form-control" id="c_uChangePass" name="c_uChangePass" placeholder="New password">
					</div>
					<div class="form-group">
					    <input type="password" class="form-control" id="c_uConfrimChangePass" name="c_uConfrimChangePass" placeholder="new password">
					    <span id="passwordMatch"></span>
					</div>
						<div class="button-container">
							<button type="button" class="btn btn-primary btn-sm" onclick="userChangePassword()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 닉네임 변경 모달 -->
	<div class="modal" id="userChangeNickNameModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">User Change Nickname</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label>Please enter the Nickname you want to change.</label><br/>
					    <input type="text" class="form-control" id="c_uNickName" name="c_uNickName" placeholder="nickname">
					</div>
						<div class="button-container">
							<button type="button" class="btn btn-primary btn-sm" onclick="userChangeNickName()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 비밀번호 체크 모달 -->
    <div class="modal" id="deletePasswordCheckModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="container">
					<h5 class="mb-3" style="display: inline-block; text-align: center;">Password Confirm</h5>
					<span style="color: red">${l_msg}</span>
						<div class="form-group">
							<label for="dPassword">If you want to secede, please enter your password.</label>
							<input type="password" class="form-control" id="dPassword" name="dPassword" placeholder="your password">
						</div>
						<div class="button-container">
							<button type="button" class="btn btn-primary btn-sm" onclick="deleteAcount()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
					Toast.fire({ icon: 'success', title: "비밀번호가 확인 되었습니다." }).then(() => {
					    $('#passwordCheckModal').modal('hide');
					    window.location.href = "user_my_account.do";
					  });
				}
			},
			error : function() {
				Toast.fire({ icon : 'warning', title : "오류가 발생했습니다. 관리자에게 문의해주세요." });
			}
		});
	}
	/* 
			const regExpPass = /^[a-z|A-Z|0-9]*$/;
		if (!regExpPass.test(uPassword)) {
			Toast.fire({
				icon : 'warning',
				title : "비밀번호는 영문&숫자만 사용 가능합니다."
			});
			form.ruPassword.select();
			return
	
		}
	*/
	
	function openUserRenameModal() {
		  Swal.fire({
		    icon: 'question',
		    title: "이름을 변경하시겠습니까?",
		    showCancelButton: true,
		    confirmButtonText: "확인"
		  }).then((result) => {
		    if (result.isConfirmed) {
		      $('#userRenameModal').modal('show');
		    }
		  });
		}

	
	function userRename() {
		  var uReName = $("#uReName").val();
		  const regExpName = /^[a-z|A-Z|가-힣]*$/;
		  if ($("#uReName").val() == "") {
		    Swal.fire({ icon: 'warning', title: "변경하실 이름을 입력해주세요" });
		    return;
		  }
		  if (!regExpName.test(uReName)) {
		    Swal.fire({ icon: 'warning', title: "이름은 한글과 영문만 입력 가능합니다." });
		    $("#uReName").select();
		    return;
		  }
		  $.ajax({
		    type: 'POST',
		    url: './UserRename',
		    data: {
		      uReName: uReName
		    },
		    success: function(result) {
		      console.log(result);
		      if (result === "0") {
		        Swal.fire({ icon: 'warning', title: "변경 중 문제가 발생했습니다." });
		        return;
		      }
		      if (result === "1") {
		        Swal.fire({ icon: 'success', title: "이름이 변경 되었습니다." }).then(() => {
		          $('#userRenameModal').modal('hide');
		          window.location.href = "user_my_account.do";
		        });
		      }
		    },
		    error: function() {
		      Swal.fire({ icon: 'warning', title: "오류가 발생했습니다. 관리자에게 문의해주세요." });
		    }
		  });
		}

	/* Email*/
	function openUserReEmailModal() {
	  Swal.fire({
	    icon: 'question',
	    title: "이메일을 변경하시겠습니까?",
	    showCancelButton: true,
	    confirmButtonText: "확인",
	    cancelButtonText: "취소",
	  }).then((result) => {
	    if (result.isConfirmed) {
	      $('#userReEmailModal').modal('show');
	    }
	  });
	}
	
	function userReEmail() {
		  var uReEmail = $("#uReEmail").val();
		  const regExpEmail = /^\w+@[a-zA-Z_]+?\.(com|co\.kr|net)$/;
		  if ($("#uReEmail").val() == "") {
		    Swal.fire({
		      icon: 'warning',
		      title: "변경하실 이메일을 입력해주세요",
		      target: '#toastContainer'
		    });
		    return;
		  }
		  if (!regExpEmail.test(uReEmail)) {
		    Swal.fire({
		      icon: 'warning',
		      title: "이메일 형식을 확인해주세요. \n ex) id@domain.com"
		    });
		    $("#uReEmail").select();
		    return;
		  }
		  $.ajax({
		    type: 'POST',
		    url: './UserEmailModify',
		    data: {
		      uReEmail: uReEmail
		    },
		    success: function(result) {
		      console.log(result);
		      if (result === "0") {
		        Swal.fire({
		          icon: 'warning',
		          title: "변경 중 문제가 발생했습니다."
		        });
		        return;
		      }
		      if (result === "1") {
		        Swal.fire({
		          icon: 'success',
		          title: "이메일이 변경 되었습니다."
		        }).then(() => {
		          $('#userReEmailModal').modal('hide');
		          window.location.href = "user_my_account.do";
		        });
		      }
		    },
		    error: function() {
		      Swal.fire({
		        icon: 'warning',
		        title: "오류가 발생했습니다. 관리자에게 문의해주세요."
		      });
		    }
		  });
		}

	
	/* Phone*/
	function openUserRePhoneModal() {
	  Swal.fire({
	    icon: 'question',
	    title: "전화번호를 변경하시겠습니까?",
	    showCancelButton: true,
	    confirmButtonText: "확인",
	    cancelButtonText: "취소",
	  }).then((result) => {
	    if (result.isConfirmed) {
	      $('#userRePhoneModal').modal('show');
	    }
	  });
	}

	
	function userRePhone() {
		const uPhone1 = $('#uPhone1').val();
		const uPhone2 = $('#uPhone2').val();
		const uPhone3 = $('#uPhone3').val();
		const uPhone = uPhone1 + '-' + uPhone2 + '-' + uPhone3;
		
		const regExpuPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		const regExpuPhone2 = /^[0-9]*$/;
		
		if ($("#uPhone2").val() == "") {
			Toast.fire({ icon : 'warning', title : "변경하실 핸드폰 번호를 입력해주세요.", target : '#toastContainer' });
			return;
		}
		if ($("#uPhone3").val() == "") {
			Toast.fire({ icon : 'warning', title : "변경하실 핸드폰 번호를 입력해주세요.", target : '#toastContainer' });
			return;
		}
		
		if (!regExpuPhone2.test(uPhone2)) {
			Toast.fire({icon : 'warning', title : "전화번호는 숫자만 가능합니다."});
			return
		}
		if (!regExpuPhone2.test(uPhone3)) {
			Toast.fire({icon : 'warning', title : "전화번호는 숫자만 가능합니다."});
			return
		}
		if (!regExpuPhone.test(uPhone)) {
			Toast.fire({icon : 'warning', title : "전화번호를 확인해주세요."});
			return
		}
		
		$.ajax({
			type : 'POST',
			url : './UserPhoneModify',
			data : {
				uPhone : uPhone
			},
			success : function(result) {
				console.log(result);
				if (result === "0") {
					Toast.fire({
						icon : 'warning',
						title : "변경 중 문제가 발생했습니다."
					});
					return;
				}
				if (result === "1") {
					Toast.fire({ icon: 'success', title: "핸드폰 번호가 변경 되었습니다." }).then(() => {
						  $('#userRePhoneModal').modal('hide');
						  window.location.href = "user_my_account.do";
						});
				}
			},
			error : function() {
				Toast.fire({ icon : 'warning', title : "오류가 발생했습니다. 관리자에게 문의해주세요." });
			}
		});
	}
	function openUserChangePasswordModal() {
		  Swal.fire({
		    icon: 'question',
		    title: "비밀번호를 변경하시겠습니까?",
		    showCancelButton: true,
		    confirmButtonText: "확인",
		    cancelButtonText: "취소",
		  }).then((result) => {
		    if (result.isConfirmed) {
		      $('#userChangePasswordModal').modal('show');
		    }
		  });
		}

	
	
	var passwordInput = $("#c_uChangePass");
	var confirmPasswordInput = $("#c_uConfrimChangePass");

	/* passwordInput.on("input", checkPasswordMatch); */
	confirmPasswordInput.on("input", checkPasswordMatch);

	function checkPasswordMatch() {
	  var password = $("#c_uPassword").val();
	  var changePassword = $("#c_uChangePass").val();
	  var confirmPassword = $("#c_uConfrimChangePass").val();
	  var passwordMatchElement = document.getElementById("passwordMatch");

	  if (changePassword === confirmPassword) {
	    passwordMatchElement.textContent = "Password Match";
	    passwordMatchElement.style.color = "green";
	  } else {
	    passwordMatchElement.textContent = "Password Mismatch";
	    passwordMatchElement.style.color = "red";
	  }
	}

	function userChangePassword() {
		  var password = $("#c_uPassword").val();
		  var changePassword = $("#c_uChangePass").val();
		  var confirmPassword = $("#c_uConfrimChangePass").val();
		  var regExpuPass = /^[a-z|A-Z|0-9]*$/;

		  if ($("#c_uPassword").length === 0) {
		    Swal.fire({ icon: 'warning', title: "비밀번호를 입력해주세요." });
		    return;
		  }
		  if ($("#c_uChangePass").length === 0) {
		    Swal.fire({ icon: 'warning', title: "새 비밀번호를 입력해주세요." });
		    return;
		  }
		  if ($("#c_uConfrimChangePass").length === 0) {
		    Swal.fire({ icon: 'warning', title: "새 비밀번호 확인을 입력해주세요." });
		    return;
		  }
		  if (!regExpuPass.test(password)) {
		    Swal.fire({ icon: 'warning', title: "비밀번호는 영문&숫자만 사용 가능합니다." });
		    return;
		  }
		  if (!regExpuPass.test(changePassword)) {
		    Swal.fire({ icon: 'warning', title: "비밀번호는 영문&숫자만 사용 가능합니다." });
		    return;
		  }
		  if (!regExpuPass.test(confirmPassword)) {
		    Swal.fire({ icon: 'warning', title: "비밀번호는 영문&숫자만 사용 가능합니다." });
		    return;
		  }

		  if (changePassword !== confirmPassword) {
		    Swal.fire({ icon: 'warning', title: "입력하신 비밀번호와 비밀번호 확인이 일치하지 않습니다." });
		    return;
		  }

		  $.ajax({
		    type: 'POST',
		    url: './UserChangePassword',
		    data: {
		      password: password,
		      changePassword: changePassword
		    },
		    success: function(result) {
		      console.log(result);
		      if (result === "-1") {
		        Swal.fire({ icon: 'warning', title: "비밀번호가 일치하지 않습니다." });
		        return;
		      }
		      if (result === "0") {
		        Swal.fire({ icon: 'warning', title: "변경 중 문제가 발생했습니다." });
		        return;
		      }
		      if (result === "1") {
		        Swal.fire({ icon: 'success', title: "비밀번호가 변경 되었습니다." }).then(() => {
		          $('#userChangePasswordModal').modal('hide');
		          window.location.href = "user_my_account.do";
		        });
		      }
		    },
		    error: function() {
		      Swal.fire({ icon: 'warning', title: "오류가 발생했습니다. 관리자에게 문의해주세요." });
		    }
		  });

		}

	
	/* NickName */
	function openUserChangeNickNameModal() {
	  Swal.fire({ 
	    icon: 'question', 
	    title: "닉네임을 변경하시겠습니까?", 
	    showCancelButton: true, 
	    confirmButtonText: "확인" 
	  }).then((result) => {
	    if (result.isConfirmed) {
	      $('#userChangeNickNameModal').modal('show');
	    }
	  });
	}
	
	function userChangeNickName() {
		  var uNickName = $("#c_uNickName").val();
		  const regExpuNickName = /^[a-z|A-Z|가-힣]*$/;
		  if (!regExpuNickName.test(uNickName)) {
		    Swal.fire({
		      icon: 'warning',
		      title: "닉네임은 영문/숫자/한글만 가능합니다."
		    });
		    return;
		  }
		  
		  $.ajax({
		    type: 'POST',
		    url: './UserChangeNickName',
		    data: {
		      uNickName: uNickName
		    },
		    success: function(result) {
		      console.log(result);
		      if (result === "0") {
		        Swal.fire({ icon: 'warning', title: "변경 중 문제가 발생했습니다." });
		        return;
		      }
		      if (result === "1") {
		        Swal.fire({ icon: 'success', title: "닉네임이 변경 되었습니다." }).then(() => {
		          $('#userChangeNickNameModal').modal('hide');
		          window.location.href = "user_my_account.do";
		        });
		      }
		    },
		    error: function() {
		      Swal.fire({ icon: 'warning', title: "오류가 발생했습니다. 관리자에게 문의해주세요." });
		    }
		  });
		}

	function deleteAccountQuestion() {
		  Swal.fire({
		    icon: 'warning',
		    title: "정말로 탈퇴하시겠습니까?",
		    showCancelButton: true,
		    confirmButtonText: "확인",
		    cancelButtonText: "취소",
		    confirmButtonColor: "#ff0000" // 빨간색
		  }).then((result) => {
		    if (result.isConfirmed) {
		      $('#deletePasswordCheckModal').modal('show');
		    }
		  });
		}




		function deleteAcount() {
		  var password = $("#dPassword").val();
		  if ($("#dPassword").length === 0) {
		    Swal.fire({ icon: 'warning', title: "비밀번호를 입력해주세요." });
		    return;
		  }
		  $.ajax({
		    type: 'POST',
		    url: './UserDeleteAccount',
		    data: {
		      password: password
		    },
		    success: function(result) {
		      console.log(result);
		      if (result === "-1") {
		        Swal.fire({ icon: 'warning', title: "비밀번호가 일치하지 않습니다." });
		        return;
		      }
		      if (result === "0") {
		        Swal.fire({ icon: 'warning', title: "탈퇴 중 문제가 발생했습니다." });
		        return;
		      }
		      if (result === "1") {
		        Swal.fire({ icon: 'success', title: "탈퇴가 완료 되었습니다. 이용해주셔서 감사합니다." }).then(() => {
		          $('#deletePasswordCheckModal').modal('hide');
		          window.location.href = "logout.do";
		        });
		      }
		    },
		    error: function() {
		      Swal.fire({ icon: 'warning', title: "오류가 발생했습니다. 관리자에게 문의해주세요." });
		    }
		  });
		}

</script>
	
</body>

</html>