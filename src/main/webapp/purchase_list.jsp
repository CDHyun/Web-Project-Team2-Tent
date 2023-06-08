<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="css/shop/order.css">
<script type="text/javascript">

	
	function DeletePurchase() {
		var pcNo = $('#d_pcNo').val();
		ToastConfirm.fire({ icon: 'question', title: "해당 상품을 주문취소 하시겠습니까?" }).then((result) => {
			if(result.isConfirmed){
				$.ajax({
					type : 'POST',
					url : './DeletePurchase',
					data : {
						pcNo : pcNo,
					},
					success : function(result) {
						console.log(result);
						if (result === "0") {
							Toast.fire({ icon : 'warning', title : "주문취소 중 문제가 발생했습니다." });
							return;
						}
						if (result === "1") {
							Toast.fire({ icon: 'success', title: "주문이 취소 되었습니다." }).then(() => {
								  window.location.href = "purchase_delete.do";
								});
						}
					},
					error : function() {
						Toast.fire({ icon : 'warning', title : "오류가 발생했습니다. 관리자에게 문의해주세요." });
					 }
			    });
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
                    <h5>My Account</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
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
				            <li><a href="my_account.do">My Account</a></li>
				            <li class="active"><a href="order_list">Orders</a></li>
				            <li><a href="member_logout">Logout</a></li>
				        </ul>  
				    </div> 
				</div>
                <div class="col-12 col-lg-9">
                    <div class="my-account-content mb-50">
                        <div class="cart-table">
                            <div class="table-responsive">
                        <!--         <table class="table table-bordered mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">Order</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Total</th>
                                            <th scope="col">Detail</th>
                                        </tr>
                                    </thead> -->
                                <table class="table table-bordered mb-0">
    <colgroup>
        <col style="width: 10%">
        <col style="width: 15%">
        <col style="width: 20%">
        <col style="width: 15%">
        <col style="width: 20%">
    </colgroup>
    <thead>
        <tr>
            <th scope="col">Order</th>
            <th scope="col">Date</th>
            <th scope="col">Status</th>
            <th scope="col">Total</th>
            <th scope="col">Detail</th>
        </tr>
    </thead>
    <tbody id="order_list_tbody">
        <c:if test="${purchaseList.size() == 0}">
            <tr>
                <td colspan="5">등록된 주문목록이 없습니다 🙂</td>
            </tr>
        </c:if>
        <c:forEach items="${purchaseList}" var="purchase">
        <tr>
                <td>${purchase.pcNo}</td>
                <td>${purchase.pcInsertDate}</td>
                <c:if test="${purchase.pcStatus == 0}">
                    <td>
                        <span class="bigshop-label bigshop-label-info">배송 준비중</span>
                    </td>
                </c:if>
                <c:if test="${purchase.pcStatus == -1}">
                    <td>
                        <span class="bigshop-label bigshop-label-danger">취소됨</span>
                    </td>
                </c:if>
                 <c:if test="${purchase.pcStatus == 1}">
                    <td>
                        <span class="bigshop-label bigshop-label-warning">배송중</span>
                    </td>
                </c:if>
                 <c:if test="${purchase.pcStatus == 2}">
                    <td>
                        <span class="bigshop-label bigshop-label-success">배송완료</span>
                    </td>
                </c:if>
                <td><fmt:formatNumber value="${purchase.pPrice}" type="number" pattern="#,###"></fmt:formatNumber></td>
                <td>
                    <button type="button" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#order_detail_modal">View</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<!-- ... -->
                            </div>
                        </div>
                    </div>
                    <c:if test="${purchaseList.size() != 0}">
                     	<button type="button" class="btn btn-outline-primary mb-1" id="order_all_delete_btn"><a href="index.do">Check</a></button>
                	</c:if>
               	</div>
            </div>
        </div>
   	</section>
   	
	   	<!-- 오더상세보기 모달 시작 -->        
	    <div class="shortcodes_content mb-100">
	        <div class="modal fade" id="order_detail_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	            <div class="modal-dialog" role="document" style="max-width: 100%; width: auto; display: table;">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <h5 class="modal-title" id="exampleModalLabel">Order detail</h5>
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                            <span aria-hidden="true">&times;</span>
	                        </button>
	                    </div>
	                    <div class="modal-body">
	                        <p class="mb-0">
	                        <!-- order detail data -->
						    <div class="shortcodes_area section_padding_40">
						        <div class="container">
						            <div class="row">
						                <div class="col-12">
						                    <div class="shortcodes_title mb-30">
						                        <h6>Orderer Info</h6>
						                    </div>
						                    <div class="shortcodes_content">
						                        <div class="table-responsive">
						                            <table class="table mb-0 table-bordered">
						                                <thead>
						                                    <tr>
						                                        <th scope="col">No</th>
						                                        <th scope="col">Date</th>
						                                        <th scope="col">Name</th>
						                                        <th scope="col">Phone</th>
						                                    </tr>
						                                </thead>
						                                <tbody id="orderer_info_body">
						                                 <c:forEach items="${purchaseList}" var="purchase"> <tr>
						                                        <th scope="row">${purchase[0].pcNo}</th>
						                                        <td>${purchase[0].pcInsertDate}</td>
						                                        <td>${purchase[0].pName}</td>
						                                        <td>${purchase[0].uPhone}</td>
						                                        <td>${purchase[0].uaAddress}</td>
						                                    </tr>
						                                    </c:forEach>
						                                </tbody>
						                            </table>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div>
						    <div class="shortcodes_area section_padding_40">
						        <div class="container">
						            <div class="row">
						                <div class="col-12">
						                    <div class="shortcodes_title mb-30">
						                        <h6>Item Info</h6>
						                    </div>
						                    <div class="shortcodes_content">
						                        <div class="table-responsive">
						                            <table class="table mb-0 table-bordered">
						                                <thead>
						                                    <tr>
						                                        <th scope="col">No</th>
						                                        <th scope="col">Item</th>
						                                        <th scope="col">Quantity</th>
						                                        <th scope="col">price</th>
						                                    </tr>
						                                </thead>
						                                <tbody id="item_info_body">
						                                   <c:forEach items="${purchaseList}" var="purchase">
						                                    <tr>
						                                        <th scope="row">${purchase.pcNo}</th>
						                                        <td>${purchase.pName}</td>
						                                        <td>${PCQTY}</td>
						                                        <td>${purchase.pPrice}</td>
						                                    </tr>
						                                    <tr>
						                                        <th scope="row" colspan="4">total</th>
						                                    </tr>
						                                      </c:forEach>
						                                </tbody>
						                            </table>
						                        </div>
						                    </div>
						                </div>
						            </div>
						        </div>
						    </div>
						<!-- order detail data -->

						</p>
	                    </div>
	                    <div class="modal-footer">
	                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                     <button type="submit" class="btn btn-danger" id="order_delete_btn"><a href="purchasse_list.do">Delete</a></button>
	                 <!--   <input type="submit" value="DELETE" class="btn btn-danger" id="order_delete_btn"><a href="purchase_list.do"></a> -->
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	  
	<!-- 오더상세보기 모달 끝 -->        
    
    <!-- My Account Area -->

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script src="js/shop/order.js?after"></script>
	<script type = "text/javascript">
	/********개별주문 삭제***********/
	$('#order_delete_btn').on('click',function(e){
		console.log($(e.target).attr('o_no'));
		var params={'o_no':$(e.target).attr('o_no')}
    	order_item_delete_action_rest(params);
	});
	/*******주문 전체 삭제 메뉴 이벤트**********/
/* 	$('#order_all_delete_btn').on('click',function(e){
		order_all_delete_action_rest();
	}); */
	</script>
</body>

</html>