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
                    <h5>Register</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Register</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Sign_Up Area -->
    <div class="bigshop_reg_log_area section_padding_100_50">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="login_form mb-50">
                        <h5 class="mb-3" style="display:inline-block">Register</h5>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">${r_msg}</span>

                        <form id="user_register_form" action="member_register_action" method="post">
                            <div class="form-group">
                            	<div class="input-form-group">
	                                <input type="text" class="form-control" id="uid" name="uid" placeholder="id">
		                            <button type="button" class="btn btn-primary btn-sm" onclick="checkDuplicateId()">중복확인</button>
                            	</div>
                            </div>
                              <div class="form-group">
                                <input type="password" class="form-control" id="uPassword" name="uPassword"  placeholder="password">
                            </div>
                              <div class="form-group">
                                <input type="password" class="form-control" id="uRePass" name="uRePass"  placeholder="password">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="uName" name="uName" placeholder="name">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" id="uEmail" name="uEmail"  placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control address" id="uAddress" name="uAddress"  placeholder="address">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control postcode" id="uZipCode" name="uZipCode" placeholder="ZipCode">
                            	<button type="button" class="btn btn-outline-primary mb-1 searchAddr">search</button>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control phone_number" id="uPhone" name="uPhone"  placeholder="phone(ex: 010-1234-5678) ">
                            </div>
                           
                            <button type="button" class="btn btn-primary btn-sm" onclick="registerCheck()">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Sign_Up Area End -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/user.js"></script>
	
	<script type="text/javascript">
		
		/*
		회원가입
		*/
		$('#member_register_form').on('submit',function(e){
			if(!member_valiidation()){
				$(this).find("[type='submit']").blur();
				e.preventDefault();
			}
		});
		
		function member_valiidation(){
			let validation = $("#m_id").val() == "" || $("#m_password") == "" || $("#m_name").val() == "" 
				|| $("#m_email").val() == "" || $("#m_address").val() == "" 
				|| $("#m_post").val() == "" || $("#m_phone").val() == "";
			
			if(validation){
				Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 모든 값을 입력해주세요." });
				return false;
			}
			let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; 
			if(!regPhone.test($(".phone_number").val())){
				Toast.fire({ icon: 'warning', title: "휴대폰 번호 형식이 유효하지 않습니다" });
				$(".phone_number").val("");
				return false;
			}
			return true;
		}
		
		/*
		회원 로그인 
		*/
		$("#user_login_form").on("submit", function(e){
			if($("#id").val() == "" || $("#password").val() == ""){
				Toast.fire({ icon: 'warning', title: "ID, 비밀번호를 모두 입력해주세요" });
				$(this).find("[type='submit']").blur();
				e.preventDefault();
			}
		});
		
		function loginCheck() {
		   
			var uid = $("#uid").val();
		    var uPassword = $("#uPassword").val();
			var form = document.user_login_form;
		    
		    
			if($("#uid").val() == "" || $("#uPassword").val() == ""){
				Toast.fire({ icon: 'warning', title: "ID, 비밀번호를 모두 입력해주세요", target: '#toastContainer' });
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
						Toast.fire({ icon: 'warning', title: "ID 혹은 비밀번호를 확인해주세요." });
						return;
					}
					if (result === "-1") {
						Toast.fire({ icon: 'warning', title: "탈퇴한 회원입니다." });
						return;
					}
					if (result === "-2") {
						Toast.fire({ icon: 'warning', title: "존재하지 않는 회원입니다." });
						return;
					}
					if (result === "1") {
						Toast.fire({ icon: 'success', title: "로그인 성공! \n 환영합니다." });
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
		
		/* ID 중복 확인 */
		function checkDuplicateId() {
			const uid = $('#uid').val();
			const regExpAdmin = /^(?!.*(?:admin|root|insert|update|delete|select)).*$/
			if (!regExpAdmin.test(uid.toLowerCase())) {
				Toast.fire({ icon: 'warning', title: "해당 아이디는 사용 불가능합니다." });
				form.uid.select();
				return;
			}
			if (uid.trim().length === 0) {
				Toast.fire({ icon: 'warning', title: "아이디를 입력해주세요." });
				return;
			}
			console.log(uid);
			$.ajax({
				type : 'POST',
				url : './UserCheckDuplicateCommand',
				data : {
					uid : uid
				},
				success : function(result) {
					console.log(result);
					if (result === "0") {
						Toast.fire({ icon: 'warning', title: "사용 가능한 아이디입니다." });
						
					} else {
						Toast.fire({ icon: 'warning', title: "중복되는 아이디입니다." });
					}
				},
				error : function() {
						Toast.fire({ icon: 'warning', title: "오류가 발생했습니다. 다시 시도해주세요." });
				}
			});
		}
		
		
		function registerCheck() {
			/*  var uid = $('#uid').val(); */
			const uid = $('#uid').val();
			const form = document.register;
			const uPassword = form.uPassword.value
			const uRePass = form.uRePass.value
			const uName = form.uName.value
			const uPhone = form.uPhone.value
			const uEmail = form.uEmail.value
			const uAddress = form.uAddress.value
			const regExpAdmin = /^(?!.*(?:admin|root|insert|update|delete|select)).*$/
			if (!regExpAdmin.test(uid.toLowerCase())) {
				showAlert("Java Fundmental 규약에 어긋나는 아이디는 사용 불가능합니다.");
				form.uid.select();
				return;
			}

			const regExpuid = /^[a-z|A-Z|0-9]*$/;
			const regExpuPass = /^[a-z|A-Z|0-9]*$/;
			const regExpuName = /^[a-z|A-Z|가-힣]*$/;
			const regExpuPhone = /^\d{3}-\d{3,4}-\d{4}$/;
			const regExpuEmail = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
			const regExpuAddress = /^[가-힣|0-9|a-z|A-Z|-|\s]*$/;

			if (!regExpAdmin.test(uid.toLowerCase())) {
				Toast.fire({ icon: 'warning', title: "해당 아이디는 사용 불가능합니다." });
				form.uid.select();
				return;
			}

			if (uid.trim().length === 0) {
				Toast.fire({ icon: 'warning', title: "아이디를 입력해주세요." });
				return;
			}

			if (!regExpuid.test(uid)) {
				Toast.fire({ icon: 'warning', title: "아이디는 영문&숫자만 사용 가능합니다." });
				form.uid.select();
				return
			}

			if (uPassword.trim().length === 0) {
				Toast.fire({ icon: 'warning', title: "비밀번호를 입력해주세요." });
				return;
			}
			if (!regExpuPass.test(uPassword)) {
				Toast.fire({ icon: 'warning', title: "비밀번호는 영문&숫자만 사용 가능합니다." });
				form.uPassword.select();
				return
			}

			if (uRePass.trim().length === 0) {
				Toast.fire({ icon: 'warning', title: "비밀번호 확인을 입력해주세요." });
				return;
			}
			if (!regExpuPass.test(uRePass)) {
				Toast.fire({ icon: 'warning', title: "비밀번호는 영문&숫자만 사용 가능합니다." });
				form.uRePass.select();
				return
			}
			if (uPassword.trim() !== uRePass.trim()) {
				Toast.fire({ icon: 'warning', title: "비밀번호가 일치하지 않습니다." });
				form.uRePass.select();
				return
			}

			if (uName.trim().length === 0) {
				Toast.fire({ icon: 'warning', title: "이름을 입력해주세요." });
				return;
			}
			if (!regExpuName.test(uName)) {
				Toast.fire({ icon: 'warning', title: "이름은 한글과 영문만 입력 할 수 있습니다." });
				form.uName.select();
				return
			}

			if (uPhone.trim().length === 0) {
				Toast.fire({ icon: 'warning', title: "전화번호를 입력해주세요." });
				return;
			}
			
			if (!regExpuPhone.test(uPhone)) {
				Toast.fire({ icon: 'warning', title: "전화번호를 확인해주세요.\n ex)010-1234-5678" });
				form.uPhone.select();
				return
			}

			if (uEmail.trim().length === 0) {
				Toast.fire({ icon: 'warning', title: "이메일을 입력해주세요." });
				showAlert("이메일을 입력해주세요.");
				return;
			}
			if (!regExpuEmail.test(uEmail)) {
				Toast.fire({ icon: 'warning', title: "이메일 형식을 확인해주세요. \n ex) id@domain.com" });
				form.uEmail.select();
				return

			}

			if (uAddress.trim().length === 0) {
				Toast.fire({ icon: 'warning', title: "주소를 입력해주세요." });
				return;
			}
			if (!regExpuAddress.test(uAddress)) {
				Toast.fire({ icon: 'warning', title: "주소는 영문/한글/숫자/- 만 입력 가능합니다." });
				form.uAddress.select();
				return

			}

			console.log(uid);
			$.ajax({
				type : 'POST',
				url : '/JazzUserRegisterCommand',
				data : {
					uid : uid,
					uPassword : uPassword,
					uName : uName,
					uPhone : uPhone,
					uEmail : uEmail,
					uAddress : uAddress
				},
				success : function(result) {
					console.log(result);
					if (result === "1") {
						showAlert("회원 가입을 축하합니다!");
						setTimeout(function() {
							form.submit();
						}, 2000);
					} else {
						showAlert("회원 가입에 실패했습니다. 중복을 확인해주세요.");
						return;
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