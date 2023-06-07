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
    <link rel="stylesheet" href="css/shop/board.css">

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
                        <li class="breadcrumb-item active">Board Detail</li>
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
                        <h4>Board View</h4>
                    </div>
                    <c:forEach items="${boardDetail}" var="board">
                    <div class="shortcodes_content">
                        <div class="table-responsive">
                            <table class="table mb-0 table-bordered">
                                <thead>
                                    <tr>
                                        <th scope="col" class="board_title">${board.bTitle}</th>
                                        <th scope="col" class="board_writer">${board.uNickName}</th>
                                        	<c:set var="dateString" value="${board.bInsertDate}" />
									        <fmt:parseDate var="date" value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss" />
									        <fmt:formatDate var="formattedDate" value="${date}" type="date" pattern="yyyy년-MM월-dd일 HH시:mm분" />
                                        <th scope="col" class="board_date">${formattedDate}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td id="board_content_td" colspan="3">${board.bContent}</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    	<div id="qna_btn_container">
                    	<c:if test="${board.uid eq SUID}">
							<input class="board_btn update_form" type="button" pageno="${pageno}" q_no="${qna.q_no}" value="수정"/>&nbsp;&nbsp;
							<input class="board_btn delete" type="button" pageno="${pageno}" q_no="${qna.q_no}" value="삭제"/>&nbsp;&nbsp;
                    	</c:if>
							<input class="board_btn reply" type="button" pageno="${pageno}" q_no="${qna.q_no}" value="답글"/>&nbsp;&nbsp;
							<input class="board_btn list" type="button" pageno="${pageno}" value="목록"/>&nbsp;&nbsp;
                   	</div>
                </c:forEach>
                </div>
            </div>
            
         </div>
    </div>     
                      
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="js/shop/board.js"></script>
	<script type="text/javascript">
		
	</script>

</body>

</html>