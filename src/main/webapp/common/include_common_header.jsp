<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/shop/user.css">
<!-- Header Area -->
<header class="header_area">
	<script src="js/jquery.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
  	<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script type="text/javascript">
	function loginCheck() {
		var luid = $("#luid").val();
		var luPassword = $("#luPassword").val();
		var form = document.user_login_form;
	
		if ($("#luid").val() == "" || $("#luPassword").val() == "") {
			Toast.fire({
				icon : 'warning',
				title : "ID, 비밀번호를 모두 입력해주세요",
				target : '#toastContainer'
			});
			return;
		}
		if ($("#luid").val() == "admin") {
			Toast.fire({
				icon : 'warning',
				title : "ID, 비밀번호를 모두 입력해주세요",
				target : '#toastContainer'
				return;
			});
			
			$.ajax({
				type : 'POST',
				url : './AdminLogin',
				data : {
					luid : luid,
					luPassword : luPassword
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
					if (result === "1") {
						Toast.fire({
							icon : 'success',
							title : "로그인 성공! \n 관리자님 오늘도 화이팅입니다."
						});
						setTimeout(function() {
							$("#user_login_form").attr("action", "admin_login.do");
							$("#user_login_form").submit();
						}, 1500);
					}
				},
				error : function() {
					Toast.fire({
						icon : 'warning',
						title : "오류가 발생했습니다. 관리자에게 문의해주세요."
					});
				}
			});
			
			
		}
		$.ajax({
			type : 'POST',
			url : './UserLogin',
			data : {
				luid : luid,
				luPassword : luPassword
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
				Toast.fire({
					icon : 'warning',
					title : "오류가 발생했습니다. 관리자에게 문의해주세요."
				});
			}
		});
	}

	function emptySessionUser() {
		ToastConfirm.fire({ icon: 'question', 
				title: "로그인이 필요한 페이지입니다.\n 로그인 하시겠습니까?"}).then((result) => {
				if(result.isConfirmed){
					openLoginModal();
				}
			});
	}
	
	
	// 회원가입 모달 열기
	function openSignUpModal() {
		$('#loginModal').modal('hide');
		$('#signUpModal').modal('show');
		$('#rcancelBtn').off('click').on('click', function() {
			$('#signUpModal').modal('hide');
		});
		$('#rcloseBtn').off('click').on('click', function() {
			$('#signUpModal').modal('hide');
		});
		// 모달 외부 클릭 시 닫기
		window.onclick = function(event) {
			var modal = document.getElementById("signUpModal");
			if (event.target == modal) {
				$('#signUpModal').modal('hide');
			}
		}
	}
	
	function openLoginModal() {
		$('#loginModal').modal('show');
		$('#cancelBtn').off('click').on('click', function() {
			$('#loginModal').modal('hide');
		});
		$('#closeBtn').off('click').on('click', function() {
			$('#loginModal').modal('hide');
		});
	}
	
	// 모달 외부 클릭 시 닫기
	window.onclick = function(event) {
		var modal = document.getElementById("loginModal");
		if (event.target == modal) {
			$('#loginModal').modal('hide');
		}
	};
	
	/* ID 중복 확인 */
	function checkDuplicateId() {
		const ruid = $('#ruid').val();
		const regExpAdmin = /^(?!.*(?:admin|root|insert|update|delete|select)).*$/
		if (!regExpAdmin.test(ruid.toLowerCase())) {
			Toast.fire({
				icon : 'warning',
				title : "해당 아이디는 사용 불가능합니다."
			});
			form.ruid.select();
			return;
		}
		if (ruid.trim().length === 0) {
			Toast.fire({
				icon : 'warning',
				title : "아이디를 입력해주세요."
			});
			return;
		}
		console.log(ruid);
		$.ajax({
			type : 'POST',
			url : './UserCheckDuplicateCommand',
			data : {
				ruid : ruid
			},
			success : function(result) {
				console.log(result);
				if (result === "0") {
					Toast.fire({
						icon : 'warning',
						title : "사용 가능한 아이디입니다."
					});
					
				} else {
					Toast.fire({
						icon : 'warning',
						title : "중복되는 아이디입니다."
					});
				}
			},
			error : function() {
				Toast.fire({
					icon : 'warning',
					title : "오류가 발생했습니다. 다시 시도해주세요."
				});
			}
		});
	}
	/* 회원가입 체크 */
	function registerCheck() {
		const form = document.user_register_form;
		/*  var uid = $('#uid').val(); */
		const ruid = $('#ruid').val();
		const ruPassword = $('#ruPassword').val();
		const ruRePass = $('#ruRePass').val();
		const ruName = $('#ruName').val();
		const ruNickName = $('#ruNickName').val();
		const ruPhone1 = $('#ruPhone1').val();
		const ruPhone2 = $('#ruPhone2').val();
		const ruPhone3 = $('#ruPhone3').val();
		const ruPhone = ruPhone1 + '-' + ruPhone2 + '-' + ruPhone3;
		
		const ruEmail = $('#ruEmail').val();
		const ruAddress = $('#ruAddress').val();
		const ruDetailAddress = $('#ruDetailAddress').val();
		const ruGender = $('input[name="gender"]:checked').val();
		const ruBirthday = $('#ruBirthday').val();
		const ruZipcode = $('#ruZipcode').val();
		const regExpAdmin = /^(?!.*(?:admin|root|insert|update|delete|select)).*$/
		const regExpuid = /^[a-z|A-Z|0-9]*$/;
		const regExpuPass = /^[a-z|A-Z|0-9]*$/;
		const regExpuName = /^[a-z|A-Z|가-힣]*$/;
		const regExpuNickName = /^[a-z|A-Z|가-힣]*$/;
		const regExpuPhone = /^\d{3}-\d{3,4}-\d{4}$/;
		const regExpuPhone2 = /^[0-9]*$/;
		const regExpuEmail = /^\w+@[a-zA-Z_]+?\.(com|co\.kr|net)$/;
		const regExpuAddress = /^[가-힣|0-9|a-z|A-Z|-|\s]*$/;
	
		/* Admin등 아이디 유효성 검사*/
		if (!regExpAdmin.test(ruid.toLowerCase())) {
			Toast.fire({
				icon : 'warning',
				title : "해당 아이디는 사용 불가능합니다."
			});
			form.ruid.select();
			return;
		}
	
		/* ID 입력 확인 */
		if (ruid.trim().length === 0) {
			Toast.fire({
				icon : 'warning',
				title : "아이디를 입력해주세요."
			});
			return;
		}
		if (!regExpuid.test(ruid)) {
			Toast.fire({
				icon : 'warning',
				title : "아이디는 영문&숫자만 사용 가능합니다."
			});
			form.ruid.select();
			return
	
		}
	
		/* 비밀번호 입력 확인 */
		if (ruPassword.trim().length === 0) {
			Toast.fire({
				icon : 'warning',
				title : "비밀번호를 입력해주세요."
			});
			return;
		}
		if (!regExpuPass.test(ruPassword)) {
			Toast.fire({
				icon : 'warning',
				title : "비밀번호는 영문&숫자만 사용 가능합니다."
			});
			form.ruPassword.select();
			return
		}
		if (ruRePass.trim().length === 0) {
			Toast.fire({
				icon : 'warning',
				title : "비밀번호 확인을 입력해주세요."
			});
			return;
		}
		if (!regExpuPass.test(ruRePass)) {
			Toast.fire({
				icon : 'warning',
				title : "비밀번호는 영문&숫자만 사용 가능합니다."
			});
			form.ruRePass.select();
			return
	
		}
		if (ruPassword.trim() !== ruRePass.trim()) {
			Toast.fire({
				icon : 'warning',
				title : "비밀번호가 일치하지 않습니다."
			});
			form.ruRePass.select();
			return
	
		}
	
		/* 이름, 닉네임 입력 확인 */
		if (ruName.trim().length === 0) {
			Toast.fire({icon : 'warning',title : "이름을 입력해주세요."});
			form.ruName.focus();
			return;
		}
		if (ruNickName.trim().length === 0) {
			Toast.fire({icon : 'warning',title : "닉네임을 입력해주세요."});
			form.ruNickName.focus();
			return;
		}
		if (!regExpuName.test(ruName)) {
			Toast.fire({
				icon : 'warning',
				title : "이름은 한글과 영문만 입력 할 수 있습니다."
			});
			form.ruName.select();
			return
		}
		if (!regExpuNickName.test(ruNickName)) {
			Toast.fire({
				icon : 'warning',
				title : "닉네임은 한글과 영문만 입력 할 수 있습니다."
			});
			form.ruNickName.select();
			return
		}
	
		/* 생일 입력 확인 */
		if (ruBirthday.length === 0) {
			Toast.fire({icon : 'warning', title : "생일을 선택해주세요."});
			return;
		}
		/* 전화번호 입력 확인 */
		if (ruPhone2.trim().length === 0) {
			Toast.fire({
				icon : 'warning',
				title : "전화번호를 입력해주세요."
			});
			return;
		}
		if (ruPhone3.trim().length === 0) {
			Toast.fire({
				icon : 'warning',
				title : "전화번호를 입력해주세요."
			});
			return;
		}
		if (!regExpuPhone2.test(ruPhone2)) {
			Toast.fire({icon : 'warning', title : "전화번호는 숫자만 가능합니다."});
			form.ruPhone2.select();
			return
		}
		if (!regExpuPhone2.test(ruPhone3)) {
			Toast.fire({icon : 'warning', title : "전화번호는 숫자만 가능합니다."});
			form.ruPhone3.select();
			return
		}
		if (!regExpuPhone.test(ruPhone)) {
			Toast.fire({icon : 'warning', title : "전화번호를 확인해주세요."});
			form.ruPhone.select();
			return
		}
		
		if (ruEmail.trim().length === 0) {
			Toast.fire({icon : 'warning', title : "이메일을 입력해주세요."});
			return;
		}
		if (!regExpuEmail.test(ruEmail)) {
			Toast.fire({icon : 'warning', title : "이메일 형식을 확인해주세요. \n ex) id@domain.com"});
			ruEmail.select();
			return
		}
		
		if (ruAddress.trim().length === 0) {
			Toast.fire({icon : 'warning', title : "주소를 입력해주세요."});
			return;
		}
		if (ruDetailAddress.trim().length === 0) {
			Toast.fire({icon : 'warning', title : "상세 주소를 입력해주세요."});
			return;
		}
		if (ruZipcode.length === 0) {
			Toast.fire({icon : 'warning', title : "우편번호를 입력해주세요."});
			return;
		}
		if (!regExpuAddress.test(ruDetailAddress)) {
			Toast.fire({icon : 'warning', title : "주소는 영문/한글/숫자/- 만 입력 가능합니다."});
			ruAddress.select();
			return
		}
		console.log(ruid);
		$.ajax({
			type : 'POST',
			url : './UserSignUpCommand',
			data : {
				ruid : ruid,
				ruPassword : ruPassword,
				ruName : ruName,
				ruNickName : ruNickName,
				ruGender : ruGender,
				ruBirthday : ruBirthday,
				ruPhone : ruPhone,
				ruEmail : ruEmail,
				ruAddress : ruAddress,
				ruDetailAddress : ruDetailAddress,
				ruZipcode : ruZipcode
			},
			success : function(result) {
				console.log(result);
				if (result === "1") {
					ToastConfirm.fire({ icon: 'question', 
						title: "회원가입을 축하합니다! \n바로 로그인 하시겠습니까?"}).then((result) => {
						if(result.isConfirmed){
							$('#signUpModal').modal('hide');
							openLoginModal();
						}
					});
				} else {
					Toast.fire({icon : 'warning', title : "회원 가입에 실패했습니다. 중복을 확인해주세요."});
					return;
				}
			},
			error : function() {
					Toast.fire({icon : 'warning', title : "오류가 발생했습니다. 관리자에게 문의해주세요."});
			}
		});
	}
	

	document.addEventListener("DOMContentLoaded", function() {
		  var passwordInput = document.getElementById("ruPassword");
		  var confirmPasswordInput = document.getElementById("ruRePass");

		  confirmPasswordInput.addEventListener("input", confirmPasswordMatch);

		  function confirmPasswordMatch() {
		    var password = document.getElementById("ruPassword").value;
		    var confirmPassword = document.getElementById("ruRePass").value;
		    var passwordMatchEl = document.getElementById("passwordConfirm");

		    if (password === confirmPassword) {
		      passwordMatchEl.textContent = "Password Match";
		      passwordMatchEl.style.color = "green";
		    } else {
		      passwordMatchEl.textContent = "Password Mismatch";
		      passwordMatchEl.style.color = "red";
		    }
		  }
		});



</script>



	<!-- Top Header Area -->
	<div class="top-header-area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-6">
					<div class="welcome-note">
						<span class="popover--text" data-toggle="popover"
							data-content="Welcome to Bigshop ecommerce template."><i
							class="icofont-info-square"></i></span> <span class="text">Tent
							Shop에 오신 걸 환영합니다.</span>
					</div>
				</div>
				<div class="col-6">
					<div
						class="language-currency-dropdown d-flex align-items-center justify-content-end">
						<!-- <!-- Language Dropdown
						<div class="language-dropdown">
							<div class="dropdown">
								<a class="btn btn-sm dropdown-toggle" href="#" role="button"
									id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> English </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="dropdownMenu1">
									<a class="dropdown-item" href="#">Bangla</a> <a
										class="dropdown-item" href="#">Arabic</a>
								</div>
							</div>
						</div>
						<!-- <!-- Currency Dropdown
						<div class="currency-dropdown">
							<div class="dropdown">
								<a class="btn btn-sm dropdown-toggle" href="#" role="button"
									id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> $ USD </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="dropdownMenu2">
									<a class="dropdown-item" href="#">à§³ BDT</a> <a
										class="dropdown-item" href="#">â¬ Euro</a>
								</div>
							</div>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Menu -->
	<div class="bigshop-main-menu">
		<div class="container">
			<div class="classy-nav-container breakpoint-off">
				<nav class="classy-navbar" id="bigshopNav">

					<!-- Nav Brand -->
					<a href="index.do" class="nav-brand"> <img
						src="img/core-img/logo.png" alt="logo" id="logo_img"
						style="width: 220px; height: 50px;">
					</a>

					<!-- Toggler -->
					<div class="classy-navbar-toggler">
						<span class="navbarToggler"><span></span><span></span><span></span></span>
					</div>

					<!-- Menu -->
					<div class="classy-menu">
						<!-- Close -->
						<div class="classycloseIcon">
							<div class="cross-wrap">
								<span class="top"></span><span class="bottom"></span>
							</div>
						</div>

						<!-- Nav -->
						<div class="classynav">
							<ul>
								<li><a href="index.do">Home</a></li>
								<c:if test="${empty SUID}">
									<li><a href="product_list.do" id="shop_main_menu">Shop</a></li>
									<li><a href="notice.do">Notice</a></li>
									<li><a onclick="emptySessionUser()">Orders</a></li>
									<li><a onclick="emptySessionUser()">QNA</a></li>
									<li><a onclick="emptySessionUser()">Board</a></li>
								</c:if>
								<c:if test="${!empty SUID}">
									<li><a href="product_list.do" id="shop_main_menu">Shop</a></li>
									<li><a href="notice.do">Notice</a></li>
									<li><a href="purchase_list.do">Orders</a></li>
									<li><a href="question_list.do">QNA</a></li>
									<li><a href="board_list.do">Board</a></li>
								</c:if>
							</ul>
						</div>
					</div>

					<!-- Hero Meta -->
					<div class="hero_meta_area ml-auto d-flex align-items-center justify-content-end">
						<!-- Search -->
						<div class="search-area">
							<div class="search-btn">
								<i class="icofont-search"></i>
							</div>
							<!-- Form -->
							<div class="search-form">
								<form action="product_list.do" method="get">
									<input type="search" class="form-control" name="content" placeholder="Search">
									<input type="submit" class="d-none" value="Send">
								</form>
							</div>
						</div>

						<!-- Wishlist -->
						<div class="wishlist-area">
							<c:if test="${empty SUID}">
								<a onclick="emptySessionUser()" class="wishlist-btn"><i
									class="icofont-heart"></i></a>
							</c:if>
							<c:if test="${!empty SUID}">
								<a href="wishlist_view" class="wishlist-btn"><i
									class="icofont-heart"></i></a>
							</c:if>
						</div>

						<!-- Cart -->

						<div class="cart-area">
							<div class="cart--btn">
								<c:if test="${empty SUID}">
									<a onclick="emptySessionUser()"><i class="icofont-cart"></i></a>
								</c:if>
								<c:if test="${!empty SUID}">
									<a href="cart_view"><i class="icofont-cart"></i><span
										class="cart_quantity">${cartList.size()}</span></a>
								</c:if>
							</div>

							<!-- Cart Dropdown Content -->
							<c:if test="${!empty SUID}">
								<div class="cart-dropdown-content">
									<ul class="cart-list">
										<c:set var="tot_price" value="0" />
										<c:forEach var="cart" items="${cartList}">
											<c:set var="tot_price"
												value="${tot_price + cart.product.p_price * cart.c_qty}" />
											<li id="header_cart_item_${cart.c_no}">
												<div class="cart-item-desc">
													<a href="product_detail?p_no=${cart.product.p_no}"
														class="image"> <img
														src="img/p_img/${cart.product.imageList[0].im_name}"
														class="cart-thumb" alt="">
													</a>
													<div>
														<a href="product_detail?p_no=${cart.product.p_no}">${cart.product.p_name}</a>
														<p>
															<c:set var="item_total"
																value="${cart.c_qty * cart.product.p_price}" />
															${cart.c_qty} x - <span class="price">&#8361;<s:eval expression="new java.text.DecimalFormat('#,###').format(item_total)" /></span>
														</p>
													</div>
												</div> <span class="dropdown-product-remove" c_no="${cart.c_no}"><i
													class="icofont-bin"></i></span>
											</li>
										</c:forEach>
									</ul>
									<div class="cart-pricing my-4">
										<ul>
											<li><span>Sub Total:</span> <%-- <span>&#8361;<s:eval expression="new java.text.DecimalFormat('#,##0').format(tot_price)"/></span> --%>
												<span id="header_cart_sub_tot">&#8361;${tot_price}</span></li>
											<li><span>Shipping:</span> <span
												id="header_cart_shipping"> <c:if
														test="${tot_price < 50000 && tot_price > 0}">
			                                        	&#8361;<s:eval expression="new java.text.DecimalFormat('#,##0').format(2500)" />
														<c:set var="shipping_price" value="2500" />
													</c:if> <c:if test="${(tot_price >= 50000) || tot_price == 0}">
			                                        	&#8361;0
			                                        	<c:set var="shipping_price"
															value="0" />
													</c:if>
											</span></li>
											<c:set var="all_total" value="${tot_price + shipping_price}" />
											<li><span>Total:</span> <span id="header_cart_tot">&#8361;<s:eval expression="new java.text.DecimalFormat('#,##0').format(all_total)" /></span></li>
										</ul>
									</div>
									<div class="cart-box">
										<a href="" id="header_checkout_btn"
											class="btn btn-primary d-block" size="${cartList.size()}">Checkout</a>
										<form id="header_order_create_form" method="post">
											<input type="hidden" name="buyType" value="cart" />
										</form>
									</div>
								</div>
							</c:if>
						</div>

						<!-- Account Start -->
						<div class="account-area">
							<div class="user-thumbnail">
								<c:if test="${empty SUID}">
									<a onclick="emptySessionUser()"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-person-fill"
											viewBox="0 0 16 16">
										  <path
												d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z" />
									</svg>
									</a>
								</c:if>
								<c:if test="${!empty SUID}">
									<a href="#"><img src="img/bg-img/bono.jpeg" alt=""></a>
								</c:if>
							</div>
							<c:if test="${!empty SUID}">
								<ul class="user-meta-dropdown">
									<li class="user-title"><span>Hello,&nbsp;</span>${SUNICKNAME}😉</li>
									<li><a href="user_my_account.do">My Account</a></li>
									<li><a href="purchase_list.do">Orders List</a></li>
									<li><a href="wishlist_view">Wishlist</a></li>
									<li><a href="logout.do"><i class="icofont-logout"></i>Logout</a></li>
								</ul>
							</c:if>
						</div>
						<!-- Account End -->

					</div>
				</nav>
			</div>
		</div>
	</div>
</header>
<!-- Header Area End -->

<!-- Login Modal -->
<div class="modal" id="loginModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="container">
				<h5 class="mb-3" style="display: inline-block">Login</h5>
				<span style="color: red">${l_msg}</span>
				<form id="user_login_form" method="post" action="login.do">
					<div class="form-group">
						<input type="text" class="form-control" id="luid" name="luid"
							placeholder="ID">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="luPassword" name="luPassword" placeholder="Password">
					</div>
					<div class="form-check">
						<div class="custom-control custom-checkbox mb-3 pl-1">
							<input type="checkbox" class="custom-control-input"
								id="customChe"> <label class="custom-control-label"
								for="customChe">Remember me for this computer</label>
						</div>
					</div>
					<div class="button-container">
						<button type="button" class="btn btn-primary btn-sm"
							onclick="loginCheck()">Login</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary btn-sm" id="cancelBtn" data-dismiss="modal">취소</button>
					</div>
				</form>
				<!-- Forget Password -->
				<div class="forget_pass mt-15" style="text-align: center;"><a href="#">비밀번호를 잊으셨나요?</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" onclick="openSignUpModal()">아직 회원이 아니신가요?</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Login Modal End -->

<!-- signUpModal Start -->
<div class="modal" id="signUpModal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="container">
				<h5 class="mb-3" style="display: inline-block; text-align: center;">SingUp</h5>
				<span style="color: red">${l_msg}</span>
				<form id="user_singUp_form" action="" method="post">
					<div class="form-group">
						  <div class="input-form-group" style="display: flex; align-items: center;">
						  	<input type="text" class="form-control" id="ruid" name="ruid" placeholder="ID">
						    <button type="button" class="btn btn-primary btn-sm" onclick="checkDuplicateId()" style="margin-left: 15px;">Check</button>
						  </div>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="ruPassword" name="ruPassword" placeholder="Password">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="ruRePass" name="ruRePass" placeholder="RePassword">
						<span id="passwordConfirm"></span>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="ruName" name="ruName" placeholder="Name">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="ruNickName" name="ruNickName" placeholder="Nickname">
					</div>
						<input type="radio" name="gender" id="gender-male" value="1" checked="checked"> <label for="gender-male">Male</label>
						<input type="radio" name="gender" id="gender-female" value="2"> <label for="gender-female">Female</label>
					<div class="form-group">
						<input type="date" class="form-control" id="ruBirthday" name="ruBirthday" placeholder="Birthday" min="1900-01-01" max="2010-01-01">
					</div>
					<div class="form-group">
					  <div class="input-form-group" style="display: flex; align-items: center; text-align: center;">
					    <select id="ruPhone1" name="ruPhone1">
					      <option>010</option>
					      <option>011</option>
					      <option>012</option>
					      <option>014</option>
					      <option>017</option>
					    </select>
					    <span style="margin-left: 20px; font-size: 18px;">-</span>
					    <input type="text" class="form-control" id="ruPhone2" name="ruPhone2" placeholder="Phone" style="margin-left: 15px;">
					    <span style="margin-left: 20px; font-size: 18px;">-</span>
					    <input type="text" class="form-control" id="ruPhone3" name="ruPhone3" placeholder="Phone" style="margin-left: 15px;">
					  </div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="ruEmail" name="ruEmail" placeholder="ex) Email@domain.com">
					</div>
					<div class="form-group">
						<div class="input-form-group" style="display: flex; align-items: center;">
							<input type="text" class="form-control address" id="ruAddress" name="ruAddress" placeholder="Address">
							<button type="button" class="btn btn-outline-primary mb-1 searchAddr" style="margin-left: 15px;">search</button>
						</div>
					</div>
					<div class="form-group">
						<input type="text" class="form-control" id="ruDetailAddress" name="ruDetailAddress" placeholder="Detailed Address">
					</div>
					<div class="form-group">
						<input type="text" class="form-control postcode" id="ruZipcode" name="ruZipcode" placeholder="Zipcode" readonly="readonly">
					</div>
					<div class="button-container">
						<button type="button" class="btn btn-primary btn-sm" onclick="registerCheck()">Register</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary btn-sm" id="rcancelBtn" data-dismiss="modal">Cancle</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- SignUpModal End -->
