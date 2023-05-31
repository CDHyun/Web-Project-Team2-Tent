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
    <link rel="stylesheet" href="css/shop/member.css">

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
                    <h5>Login &amp; Register</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item active">Login &amp; Register</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Login Area -->
    <div class="bigshop_reg_log_area section_padding_100_50">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="login_form mb-50">
                        <h5 class="mb-3" style="display:inline-block">Login</h5>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">${l_msg}</span>

                        <form id="member_login_form" method="post" action="member_login_action">
                            <div class="form-group">
                                <input type="text" class="form-control" id="id" name="id" value="${l_id}" placeholder="ID">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                            </div>
                            <div class="form-check">
                                <div class="custom-control custom-checkbox mb-3 pl-1">
                                    <input type="checkbox" class="custom-control-input" id="customChe">
                                    <label class="custom-control-label" for="customChe">Remember me for this computer</label>
                                </div>
                            </div>
                            <button type="submit" id="login_btn" class="btn btn-primary btn-sm">Login</button>
                        </form>
                        <!-- Forget Password -->
                        <div class="forget_pass mt-15">
                            <a href="#">Forget Password?</a>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="login_form mb-50">
                        <h5 class="mb-3" style="display:inline-block">Register</h5>&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:red">${r_msg}</span>

                        <form id="member_register_form" action="member_register_action" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="m_id" name="m_id" value="${fMember.m_id}" placeholder="id">
                            </div>
                              <div class="form-group">
                                <input type="password" class="form-control" id="m_password" name="m_password" value="${fMember.m_password}" placeholder="password">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" id="m_name" name="m_name" value="${fMember.m_name}" placeholder="name">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" id="m_email" name="m_email" value="${fMember.m_email}"  placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control address" id="m_address" name="m_address" value="${fMember.m_address}"  placeholder="address">
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control postcode" id="m_post" name="m_post" value="${fMember.m_post}" placeholder="post">
                            	<button type="button" class="btn btn-outline-primary mb-1 searchAddr">search</button>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control phone_number" id="m_phone" name="m_phone" value="${fMember.m_phone}"  placeholder="phone ( - 제외 입력해주세요) ">
                            </div>
                           
                            <button type="submit" class="btn btn-primary btn-sm" >Register</button>
                        </form>
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
		$("#member_login_form").on("submit", function(e){
			if($("#id").val() == "" || $("#password").val() == ""){
				Toast.fire({ icon: 'warning', title: "ID, 비밀번호를 모두 입력해주세요" });
				$(this).find("[type='submit']").blur();
				e.preventDefault();
			}
		});
	
	</script>

</body>

</html>