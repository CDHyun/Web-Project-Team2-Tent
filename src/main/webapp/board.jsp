<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="toDay" class="java.util.Date" />

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
    <link rel="stylesheet" href="css/shop/board.css">
	<script type="text/javascript">
	
	function openWriteModal() {
		$('#boardWriteModal').modal('show');
	}
	
	function write() {
		var form = document.board_write_form;
		var qContent = form.bContent.value;
		var qTitle = form.bTitle.value;
		if(bContent == "" || bTitle == ""){
			Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
			return;
		}
		if($("#b_title_txt").val() == "" || CKEDITOR.instances.b_content_area.getData() == ""){
			Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
			return;
		}
		/* $("#qna_write_form").attr("action", "qna_write.do");
		$("#qna_write_form").submit(); */
		$('#boardWriteModal').modal('hide');
		form.submit();
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
                    <h5>Board</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item active">Board</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="shortcodes_title mb-30">
                        <h4>Board</h4>
                    </div>
                    <div class="shortcodes_content">
                        <div class="table-responsive">
                            <table class="table mb-0 table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col" class="board_no">번호</th>
                                        <th scope="col" class="board_title">제목</th>
                                        <th scope="col" class="board_writer">작성자</th>
                                        <th scope="col" class="board_date">날짜</th>
                                        <th scope="col" class="board_count">조회수</th>
                                    </tr>
                                </thead>
                                <tbody id="borad_list_tbody">
                                
                                	<!-- board start -->
									<c:forEach var="board" items="${boardList}">
									    <tr>
									        <th scope="row" style="text-align: center;">${board.bNo}</th>
									        <td style="text-align: center;">
									            <a href="board_detail.do?bNo=${board.bNo}">${board.bTitle}</a>
									        </td>
									        <td style="text-align: center;">${board.uNickName}</td>
									        <c:set var="dateString" value="${board.bInsertDate}" />
									        <fmt:parseDate var="date" value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss" />
									        <fmt:formatDate var="formattedDate" value="${date}" type="date" pattern="yyyy년-MM월-dd일" />
									        <td style="text-align: center;">${formattedDate}</td>
									        <td style="text-align: center;">${board.bViewCount}</td>
									    </tr>
									</c:forEach>
                                   <!-- board end -->
                                </tbody>
                            </table>
						
                        </div>
                    </div>
                    <div style="text-align: right;">
						<input type="button" class="btn btn-secondary btn-sm" onclick="openWriteModal()" value="게시글작성"/>
                    </div>
                </div>
            </div>
             
             <div class="shop_pagination_area mt-30">
                <nav aria-label="Page navigation">
                    <ul class="pagination pagination-sm justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">...</a></li>
                        <li class="page-item"><a class="page-link" href="#">8</a></li>
                        <li class="page-item"><a class="page-link" href="#">9</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                        </li>
                    </ul>
                </nav>
            </div>
             
         </div>
    </div>     
    
    <!-- signUpModal Start -->
	<div class="modal" id="boardWriteModal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-fullsize" role="document">
			<div class="modal-content modal-fullsize">
				<div class="row">
	                <div class="col-12">
	                    <div class="shortcodes_title mb-30">
	                        <h4>Board Write</h4>
	                    </div>
	                    <div class="shortcodes_content">
	                        <div class="table-responsive">
	                        	<form action="board_write.do" id="board_write_form" name="board_write_form" method="post">
		                            <table class="table mb-0 table-bordered" style="width: 100%;">
		                                <thead>
		                                    <tr>
		                                        <th scope="col" class="board_title">
		                                        	<input type="text" name="bTitle" id="b_title_txt" placeholder=" title" style="vertical-align: middle;"/>
		                                        </th>
		                                        <th scope="col" class="board_date" style="vertical-align: middle;"><fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' /></th>
		                                        <th scope="col" class="board_writer" style="vertical-align: middle;">${SUNICKNAME}</th>
		                                        <th scope=col class="board_writer" style="vertical-align: middle;">
		                                        	<select name="bCgNo" style="vertical-align: middle;">
		                                        		<option value="1">잡담</option>
		                                        	</select>
		                                        </th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                    <tr>
		                                        <td id="board_content_td" colspan="4">
		                                        	<textarea name="bContent" id="b_content_area" placeholder=" content"></textarea>
		                                        </td>
		                                    </tr>
		                                </tbody>
		                            </table>
	                			</form>
	                      				<input type="hidden" name="pageno" value="${pageno}" />
	                      				<input type="hidden" name="uid" value="${SUID}" />
	                        </div>
	                    </div>
	                    	<div id="qna_btn_container">
								<input class="board_btn new_write" type="button" value="등록"/>
								<input class="board_btn list" type="button" pageno="${pageno}" value="목록" />
	                    	</div>
	                </div>
	            </div>
			</div>
		</div>
	</div>
	<!-- SignUpModal End -->
            
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="js/shop/board.js?after" defer></script>

</body>

</html>