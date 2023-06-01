<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <link rel="stylesheet" href="css/shop/user.css">
	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/user.js"></script>
	<script type="text/javascript">
		/*
		회원정보 수정 
		*/
		$("#member_update_btn").on("click", function(e){
			if(!member_update_valiidation()){
				return false;
			}
			ToastConfirm.fire({ icon: 'question', 
				title: "회원정보를 변경 하시겠습니까?"}).then((result) => {
				if(result.isConfirmed){
					$("#member_accountDetail_form").submit();
				}
			});
		});
		
		function member_update_valiidation(){
			let result = true;
			$(".m_u_check").each(function(i, v){
				if($(v).val() == ""){
					Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다." });
					result = false;
					return false;
				}
			});
			if(!result){
				return result;
			}
			let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; 
			if(!regPhone.test($(".phone_number").val())){
				Toast.fire({ icon: 'warning', title: "휴대폰번호 형식이 유효하지 않습니다" });
				$(".phone_number").val("");
				return false;
			}
			let currentPass = $("#currentPass").val();
			if($("#currentPass").val() != ){
				Toast.fire({ icon: 'warning', title: "비밀번호가 일치하지 않습니다.\n 비밀번호를 확인해주세요" });
				$("#currentPass").focus();
				return false;
			}
			// 비밀번호 변경
			let newPass = $("#newPass").val();
			let confirmPass = $("#confirmPass").val();
			if(newPass != "" || confirmPass != ""){
				if(newPass == ""){
					Toast.fire({ icon: 'warning', title: "변경할 비밀번호를 입력해주세요" });
					$("#newPass").focus();
					return false;
				}
				if(confirmPass == ""){
					Toast.fire({ icon: 'warning', title:"비밀번호 확인을 입력해주세요" });
					$("#confirmPass").focus();
					return false;
				}
				if(newPass != confirmPass){
					Toast.fire({ icon: 'warning', title:"새 비밀번호와 비밀번호 확인이 일치하지 않습니다" });
					$("#confirmPass").focus();
					return false;
				}
			}
			return result;
		}
		
		/*
		회원탈퇴
		*/
		$("#withdrawal_btn").on("click", function(){
			ToastConfirm.fire({ icon: 'question', 
				title: "회원을 탈퇴하시겠습니까?"}).then((result) => {
				if(result.isConfirmed){
					$("#member_withdrawal_form").submit();
				}
			});
		});
		
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
				            <li><a href="user_my_account.do">My Account</a></li>
				            <li class="active"><a href="#">Account Details</a></li>
				            <li><a href="order_list">Orders</a></li>
				            <li><a href="member_logout">Logout</a></li>
				        </ul>
				    </div>
				</div>
                <div class="col-12 col-lg-9">
                    <div class="my-account-content mb-50">
                        <h5 class="mb-3">Account Details</h5>


                        <form id="member_accountDetail_form" action="member_account_update_action" method="post">
                            <div class="row">
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="m_id">ID *</label>
                                        <input type="text" class="form-control" id="m_id" name="m_id" value="" readonly>
                                    </div>
                                </div>
                                
                                <div class="col-12 col-lg-6">
                                    <div class="form-group">
                                        <label for="firstName">Name *</label>
                                        <input type="text" class="form-control" id="m_name" name="m_name" placeholder="이름" value="">
                                    </div>
                                </div>
                              
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="emailAddress">Email Address *</label>
                                        <input type="email" class="form-control m_u_check" id="m_email" name="m_email" placeholder="이메일" value="">
                                    </div>
                                </div>
                                
                                 <div class="col-12">
                                    <div class="form-group">
                                        <label for="Address">Address *</label>
                                        <input type="text" class="form-control address m_u_check" id="m_address" name="m_address"  placeholder="주소" value="">
                                    </div>
                                </div>
                                
                                 <div class="col-12">
                                    <div class="form-group">
                                        <label for="Post">Post *</label><br>
                                        <input type="text" class="form-control postcode m_u_check" id="m_post" name="m_post" placeholder="우편번호" value="">
                                    	<button type="button" class="btn btn-outline-primary mb-1 searchAddr">search</button>
                                    </div>
                                </div>
                                
                                 <div class="col-12">
                                    <div class="form-group">
                                        <label for="Phone">Phone *</label>
                                        <input type="text" class="form-control m_u_check phone_number" id="m_phone" name="m_phone" placeholder="전화번호 ( - 제외 입력해주세요)" value="">
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

                        <form id="member_withdrawal_form" action="member_account_delete_action" method="post">

                        	<input type="hidden" name="m_id" value="" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- My Account Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

</body>

</html>