<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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

    <style>
        .table-bordered th,
        .table-bordered td {
            vertical-align: middle;
        }

        .table-bordered th {
            text-align: center;
        }

       /*  .pagination .page-link {
            color: #007bff;
            border: 1px solid #007bff;
            background-color: #fff;
            border-radius: 20px; /* 둥근 테두리 반지름 값 */
            padding: 5px 10px; /* 숫자 간격과 여백을 조정할 수 있습니다. */
        }

        .pagination .page-link:hover,
        .pagination .page-link:focus {
            color: #fff;
            background-color: #007bff;
            border-color: #007bff;
        }

        .pagination .page-item.active .page-link {
            background-color: #007bff;
            border-color: #007bff;
        } */
    </style>

</head>

<body>

<!-- Preloader -->
<div id="preloader">
    <div class="spinner-grow" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>

<!-- Header Area -->
<jsp:include page="common/include_common_header.jsp" />
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
                        <li class="active"><a href="purchase_list.do">Orders</a></li>
                        <li><a href="member_logout">Logout</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-12 col-lg-9">
                <div class="my-account-content mb-50">
                    <div class="cart-table">
                        <div class="table-responsive">
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
                                            <td><span class="bigshop-label bigshop-label-info">배송
													준비중</span></td>
                                        </c:if>
                                        <c:if test="${purchase.pcStatus == -1}">
                                            <td><span class="bigshop-label bigshop-label-danger">주문
													취소</span></td>
                                        </c:if>
                                        <c:if test="${purchase.pcStatus == 1}">
                                            <td><span class="bigshop-label bigshop-label-warning">배송중</span>
                                            </td>
                                        </c:if>
                                        <c:if test="${purchase.pcStatus == 2}">
                                            <td><span class="bigshop-label bigshop-label-success">배송
													완료</span></td>
                                        </c:if>
                                        <td><fmt:formatNumber
                                                value="${purchase.pcQty * purchase.pPrice}" type="number"
                                                pattern="#,###"></fmt:formatNumber></td>
                                        <td>
                                            <form action="purchaseDetailView.do" method="post">
                                                <input type="hidden" name="pcNo" value="${purchase.pcNo}">
                                                <input type="submit" name="view"
                                                       class="btn btn-secondary btn-sm view-btn" value="view">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="shop_pagination_area mt-30">
                    <nav aria-label="Page navigation">
                        <ul class="pagination pagination-sm justify-content-center">
                            <%-- Get the current page from request parameter --%>
                            <% int currentPage = 1;
                            String currentPageParam = request.getParameter("vpage");
                            if (currentPageParam != null && !currentPageParam.isEmpty()) {
                                currentPage = Integer.parseInt(currentPageParam);
                            }

                            int lastpage = (int) request.getAttribute("d_count");
                            int itemsPerPage = 7; // 페이지당 항목 개수
                            int totalPages = (int) Math.ceil(lastpage / (double) itemsPerPage);

                            for (int i = 1; i <= totalPages; i++) {
                                if (i == currentPage) {
                                    out.print("<li class='page-item active'><a class='page-link' href='purchase_list.do?vpage=" + i + "'>" + i + "</a></li>");
                                } else {
                                    out.print("<li class='page-item'><a class='page-link' href='purchase_list.do?vpage=" + i + "'>" + i + "</a></li>");
                                }
                            }
                            %>
                       </ul>
                    </nav>
                </div>
    
                <c:if test="${purchaseList.size() != 0}">
                    <button type="button" class="btn btn-outline-primary mb-1" id="order_all_delete_btn">
                        <a href="index.do">Check</a>
                    </button>
                </c:if>
            </div>
        </div>
    </div>
</section>

<!-- My Account Area -->

<!-- Footer Area -->
<jsp:include page="common/include_common_bottom.jsp" />
<!-- Footer Area -->

<!-- jQuery (Necessary for All JavaScript Plugins) -->
<jsp:include page="common/include_common_script.jsp" />
<script src="js/shop/order.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
