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
                    <h5>Login</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Login</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Login Area -->
	<div id="loginModal">
		<div class="bigshop_reg_log_area section_padding_100_50">
			<div class="container">
				<div class="row">
					<div class="col-12 col-md-6">
						<div class="login_form mb-50">
							<h5 class="mb-3" style="display: inline-block">Login</h5> &nbsp;&nbsp;&nbsp;&nbsp;<span style="color: red">${l_msg}</span>
	
							<form id="user_login_form" method="post" action="login.do">
								<div class="form-group">
									<input type="text" class="form-control" id="uid" name="uid" placeholder="ID">
								</div>
								<div class="form-group">
									<input type="password" class="form-control" id="uPassword" name="uPassword" placeholder="Password">
								</div>
								<div class="form-check">
									<div class="custom-control custom-checkbox mb-3 pl-1">
										<input type="checkbox" class="custom-control-input" id="customChe">
										<label class="custom-control-label" for="customChe">Remember me for this computer</label>
									</div>
								</div>
								<button type="button" id="login_btn" class="btn btn-primary btn-sm" onclick="loginCheck()">Login</button>
								<button type="button" id="modal_test" class="btn btn-primary btn-sm" onclick="openModal()">open</button>
							</form>
							<!-- Forget Password -->
							<div class="forget_pass mt-15">
								<a href="#">Forget Password?</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="sign_up.jsp">아직 회원이 아니신가요?</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Login Area End -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/member.js"></script>
	
	<script type="text/javascript">
		
		/*
		회원가입
		*/
/* 		$('#member_register_form').on('submit',function(e){
			if(!member_valiidation()){
				$(this).find("[type='sub
		mit']").blur();
				e.preventDefault();
			}
		}); */

		function member_valiidation() {
			let validation = $("#m_id").val() == "" || $("#m_password") == ""
					|| $("#m_name").val() == "" || $("#m_email").val() == ""
					|| $("#m_address").val() == "" || $("#m_post").val() == ""
					|| $("#m_phone").val() == "";

			if (validation) {
				Toast.fire({
					icon : 'warning',
					title : "필수 입력값을 입력하지 않았습니다.\n 모든 값을 입력해주세요."
				});
				return false;
			}
			let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			if (!regPhone.test($(".phone_number").val())) {
				Toast.fire({
					icon : 'warning',
					title : "휴대폰 번호 형식이 유효하지 않습니다"
				});
				$(".phone_number").val("");
				return false;
			}
			return true;
		}

		/*
		회원 로그인 
		 */
		$("#user_login_form").on("submit", function(e) {
			if ($("#id").val() == "" || $("#password").val() == "") {
				Toast.fire({
					icon : 'warning',
					title : "ID, 비밀번호를 모두 입력해주세요"
				});
				$(this).find("[type='submit']").blur();
				e.preventDefault();
			}
		});

		function loginCheck() {

			var uid = $("#uid").val();
			var uPassword = $("#uPassword").val();
			var form = document.user_login_form;

			if ($("#uid").val() == "" || $("#uPassword").val() == "") {
				Toast.fire({
					icon : 'warning',
					title : "ID, 비밀번호를 모두 입력해주세요",
					target : '#toastContainer'
				});
				return;
			}
			$.ajax({
				type : 'POST',
				url : './UserLoginCommand',
				data : {
					uid : uid,
					uPassword : uPassword
				},
				success : function(result) {
					console.log(result);
					if (result === "0") {
						Toast.fire({
							icon : 'warning',
							title : "ID 혹은 비밀번호를 확인해주세요."
						});
						return;
					}
					if (result === "-1") {
						Toast.fire({
							icon : 'warning',
							title : "탈퇴한 회원입니다."
						});
						return;
					}
					if (result === "-2") {
						Toast.fire({
							icon : 'warning',
							title : "존재하지 않는 회원입니다."
						});
						return;
					}
					if (result === "1") {
						Toast.fire({
							icon : 'success',
							title : "로그인 성공! \n 환영합니다."
						});
						setTimeout(function() {
							$("#user_login_form").submit();
						}, 1500);
					}
				},
				error : function() {
					showAlert("오류가 발생했습니다. 다시 시도해주세요.");
				}
			});

		}
		
		// 모달 열기
		function openModal() {
		  document.getElementById("loginModal").style.display = "block";
		}

		// 모달 닫기
		function closeModal() {
		  document.getElementById("loginModal").style.display = "none";
		}

		// 모달 외부 클릭 시 닫기
		window.onclick = function(event) {
		  var modal = document.getElementById("loginModal");
		  if (event.target == modal) {
		    closeModal();
		  }
		};
		
		
		
	</script>

</body>

</html>