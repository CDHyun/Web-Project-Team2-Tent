<%@page import="com.javalec.tent.dto.AdminDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- include_common_top -->
	<jsp:include page="common/include_common_top.jsp"/>
    <!-- include_common_top -->
    <link rel="stylesheet" href="css/shop/cart.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
    // form을 서버로 제출하는 함수
    function submitForm() {
    // JSP 코드에서 생성된 값을 JavaScript 배열로 변환하여 변수에 할당
    var cart = [
      <c:forEach items="${cart}" var="dto" varStatus="st">
        '${dto.cNo}'${st.last ? '' : ','}
      </c:forEach>
    ];

    // 변수의 값을 문자열로 변환하여 hidden input에 설정
    document.getElementById('cNoArrayInput').value = JSON.stringify(cart);


      document.getElementById('myForm').submit();
    }
    
    
       	function selectAll(selectAll)  {
  			const checkboxes= document.querySelectorAll('input[type="checkbox"]');
  			checkboxes.forEach((checkbox) => {checkbox.checked = selectAll.checked })
		}
        
       
       	function deletecartcontent() {
			var cNo = $("#cNo").val();
			var pCode = $("#pCode").val();
		    
		   
		   
			var url = "adminCartDelete.do?cNo=" + encodeURIComponent(cNo) + "&pCode=" + encodeURIComponent(pCode);
			window.location.href = url;
			
		  }
		
       	function btnClick() {
			var form = document.adminCartForm;
			form.submit();
 		}
	
       	
       	
		function increaseQuantity(cmNo) {
		    var quantityInput = document.getElementById("quantity_"+cmNo);
		    var currentQuantity = parseInt(quantityInput.value);
		    quantityInput.value = currentQuantity + 1;
		  }

		  function decreaseQuantity(cmNo) {
		    var quantityInput = document.getElementById("quantity_"+cmNo);
		    var currentQuantity = parseInt(quantityInput.value);
		    if (currentQuantity > 1) {
		      quantityInput.value = currentQuantity - 1;
		    }
		  }
		  
		  function buyProduct(ppCode) {
				var pCode = ppCode;
				
			   
				var url = "product_detail.do?pCode=" + encodeURIComponent(pCode);
				window.location.href = url;
			   
			  
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
                    <h5>Cart</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item active"><a href="product_list.do"> Product</a></li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Cart Area -->
    <div class="cart_area section_padding_100_70 clearfix">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12">
                    <div class="cart-table">
                        <div class="table-responsive">
                           
                           
                           
                           
                            <table class="table table-bordered mb-30">
                            <c:if test="${cart.size() == 0}">
                                		<tr>
                                			<td colspan="6">등록된 장바구니물품이 없습니다. 장바구니를 등록해주세요 🙂</td>
                                		</tr>
                                	</c:if>
                            
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">Image</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Color</th>
                                        <th scope="col">Unit Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">Total</th>
                                        <th scope="col"><i class="icofont-ui-delete"></i></th>
                                    </tr>
                                
                                
                                    <%
                                    	ArrayList<String> cNoList = new ArrayList<String>();
                                    	AdminDto dto = new AdminDto();
                                    %>
                                    
                                     <c:forEach items="${cart}" var="dto" varStatus="st">
                           				<form name="adminCartForm" action="adminCartDelete.do" method="post">	
                                     
										    <tr>   
										    	<th scope="row">${st.index+1}</th>   <!--${dto.cNo} 이값을 대신해서 index로 해줌  -->
										      <td>
										      <input type="hidden" name="cNo" id="cNo" value="${dto.cNo}">
										      <input type="hidden" name="pCode" id="pCode" value="${dto.pCode}">
										      <img alt="no" src="images/product/${dto.pfRealName }"> </td>
										      <td>${dto.pName}</td>
										      <td>${dto.pColor}</td>
										      <td>&#8361;&nbsp;<fmt:formatNumber value="${dto.pPrice}" type="number" pattern="#,###"></fmt:formatNumber></td>
										      <td>
										      <div class="input-form-group" style="display: flex; align-items: center;">
	                            					<button type="button" id="plusQtyBtn_${dto.cNo}" class="btn btn-dark btn-sm" onclick="decreaseQuantity('${dto.cNo}')">-</button>&nbsp;&nbsp;
	                            					<input type="text" id="quantity_${dto.cNo}" name="quantity_${dto.cNo}" class="form-control" style="width: 45px" value="${dto.pcQty}" min="1" max="10" >&nbsp;&nbsp;
	                            					<button type="button" id="minusQtyBtn_${dto.cNo}" class="btn btn-dark btn-sm" onclick="increaseQuantity('${dto.cNo}')">+</button>
                            					</div>
										      </td>
										      
										       <td>&#8361;&nbsp;<fmt:formatNumber value="${dto.ctotal}" type="number" pattern="#,###"></fmt:formatNumber></td>
										     
										     
										      <td>
										      
                                           		  <input type="submit" value="x" class="fa fa-close" size="4"> 
                                           		 <!--   <i class="fa fa-close" onclick="btnClick()"></i>-->
                                        	 </td>
										    </tr> 
										  
                          			
                          			
                           				</form>
  									</c:forEach>
                                    
                            </table>
                            
                        </div>
                    </div>
                </div>

                

                <div class="col-12 col-lg-5" style="margin-left: 60%;">
                    <div class="cart-total-area mb-30 ">
                        <h5 class="mb-3">Cart Totals</h5>
                        <div class="table-responsive">
                            <table class="table mb-3">
                                 <tbody>
                                <tr>
                                        <td>Sub Total</td>
                                        <td>&#8361;&nbsp;<fmt:formatNumber value="${ITEMTOTAL }" type="number" pattern="#,###"></fmt:formatNumber></td>
                                    </tr>
                                    <tr>
                                        <td><c:set var="shipping" value="${ITEMTOTAL >= 500000 ? 0 : 3000}" />Shipping</td>
									   <td>&#8361;&nbsp;<fmt:formatNumber value="${shipping}" type="number"></fmt:formatNumber></td>
                                    </tr>
                                    <tr>
                                        <td>VAT (10%)</td>
                                        <td>&#8361;&nbsp;<fmt:formatNumber value="${ITEMTOTAL*0.1 }" type="number" pattern="#,###"></fmt:formatNumber></td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                         <td>&#8361;&nbsp;<fmt:formatNumber value="${ITEMTOTAL*1.1 +shipping}" type="number" pattern="#,###"></fmt:formatNumber></td>
                                    </tr>
                                   
                                </tbody>
                            </table>
                        </div>
                       
                        <form id="myForm" action="cart_to_purchase.do" method="post">
  						<input type="hidden" id="cNoArrayInput" name="cNoArrayInput" value="">
						<input type="submit" class="btn btn-primary d-block" onclick="submitForm()" value="Proceed To Checkout">
						</form>
                   
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cart Area End -->
    <!-- Cart Area End -->
	
<div class="col-12 col-lg-5" style="margin-left: 50%;">
	
	<div class="row">
			<div class="col-12">
				<div class="section_heading new_arrivals">
					<h5>Today's Product!</h5>
				</div>
			</div>
	</div>
	 

			<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel" data-interval="3000">
			  <div class="carousel-inner">
			    <c:forEach items="${recommend}" var="dto" varStatus="st">
			      <div class="carousel-item ${st.first ? 'active' : ''}">
			        <div class="card" style="width: 18rem;">
			          <img alt="no" src="images/product/${dto.pfRealName}" width="250" height="250">
			          <div class="card-body">
			            Brand: <h5 class="card-title">${dto.pBrandName}</h5>
			            Product: <p class="card-text">${dto.pName}</p>
			            Color: <p class="card-text">${dto.pColor}</p>
			            <button type="button" class="btn btn-primary" onclick="buyProduct(${dto.pCode})">Buy Now</button>
			          </div>
			        </div>
			      </div>
			    </c:forEach>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>



</div>	



	
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/cart.js"></script>

</body>

</html>