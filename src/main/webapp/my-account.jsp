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
                    <h5>My Account</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index">Home</a></li>
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
				            <li class="active"><a href="#">My Account</a></li>
				            <li><a href="account_details">Account Details</a></li>
				            <li><a href="order_list">Orders</a></li>
				            <li><a href="member_logout">Logout</a></li>
				        </ul>  
				    </div> 
				</div>
                <div class="col-12 col-lg-9">
                    <div class="my-account-content mb-50">
                        <%-- <p>Hello <strong><%=loginMember.getM_name() %>&nbsp;😄 </strong> (not <strong><%=loginMember.getM_name() %></strong> --%>? <a href="member_logout">Log out</a>)<!-- </p> -->
                        <p>Thank you for visiting again.<br> You can check your information here. </p>
                    </div>
                </div>
            </div>  
        </div>
    </section>
    <!-- My Account Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/member.js"></script>
	
	
	
</body>

</html>