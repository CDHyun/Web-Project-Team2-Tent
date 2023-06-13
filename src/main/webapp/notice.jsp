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
    <link rel="stylesheet" href="css/shop/question.css">
	<script type="text/javascript">
	
    var viewedQnas = []; // 조회한 Q&A 번호를 저장할 배열
    
    function toggleNoticeContent(element) {
        var contentDiv = $(element).next('.notice-content');
        contentDiv.slideToggle(function() {
            if (contentDiv.is(':visible')) {
                increaseViewCount($(element).closest('tr'));
            } else {
                decreaseViewCount($(element).closest('tr'));
            }
        });
    }
    
    function increaseViewCount(row) {
        var nNo = row.find('th').text();
        if (viewedQnas.includes(nNo)) return; // 이미 조회한 Q&A인 경우 더 이상 증가하지 않도록 처리
        
        var viewCountCell = row.find('td:last-child');
        var viewCount = parseInt(viewCountCell.text());
        viewCountCell.text(viewCount + 1);
        
        viewedQnas.push(nNo); // 조회한 Q&A 번호를 배열에 추가
        
        // viewCount 증가를 서버에 요청
        $.ajax({
            url: "./IncreaseNoticeViewCount", // 서버의 증가시키는 기능을 처리하는 URL
            method: "POST",
            data: { nNo: nNo }, // 서버에 전달할 데이터 (여기서는 qNo를 전달)
            success: function(response) {
                console.log("View count increased successfully.");
            },
            error: function() {
                console.log("Error occurred while increasing view count.");
            }
        });
    }
    
    function decreaseViewCount(row) {
        var nNo = row.find('th').text();
        var index = viewedQnas.indexOf(nNo);
        if (index > -1) {
            viewedQnas.splice(index, 1); // 조회한 Q&A 번호를 배열에서 제거
        }
    }
    
    function openNoticeWriteModal() {
    	$('#noticeWriteModal').modal('show');
	}
    
    function changeCategory(nCgNo) {
    	  window.location.href = "notice_cg_list.do?nCgNo=" + nCgNo;
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
                <!-- 카테고리 라디오 버튼 -->
      <div class="category-radio-buttons">
          <input type="button" class="btn btn-secondary btn-sm" name="category" id="notice" value="Notice" onclick="changeCategory('1');" checked>
          <input type="button" class="btn btn-secondary btn-sm" name="category" id="faq" value="FAQ" onclick="changeCategory('2');">
      </div>
                <div class="col-12">
                    <div class="shortcodes_title mb-30">
                   <h4> 
					  <c:choose>
					      <c:when test="${nCgNo == 1}">Notice board</c:when>
					      <c:when test="${nCgNo == 2}">FAQ board</c:when>
					      <c:otherwise>Notice</c:otherwise>
					  </c:choose>
					</h4>
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
                                <tbody id="qna_list_tbody">
                                
								    <c:set var="rowNumber" value="1" />
                                	<!-- board start -->
									<c:forEach var="notice" items="${noticeList}">
									    <tr>
									        <%-- <th scope="row">${notice.nNo}</th> --%>
									         <th scope="row">${rowNumber}</th>
									        <td>
									        	<span>
									        	<c:choose>
											      <c:when test="${notice.nCgNo eq '1'}">[Notice]</c:when>
											      <c:when test="${notice.nCgNo eq '2'}">[FAQ]</c:when>
											      <c:otherwise>Notice</c:otherwise>
											  </c:choose>
									        	</span>
									            <a href="#" onclick="toggleNoticeContent(this);">${notice.nTitle}</a>
									            <div class="notice-content" style="display: none;">${notice.nContent}</div>
									        </td>
									        <td style="text-align: center;">관리자</td>
									        <c:set var="dateString" value="${notice.nInsertDate}" />
									        <fmt:parseDate var="date" value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss" />
									        <fmt:formatDate var="formattedDate" value="${date}" type="date" pattern="yyyy년-MM월-dd일" />
									        <td style="text-align: center;">${formattedDate}</td>
									        <td style="text-align: center;">${notice.nViewCount}</td>
									    </tr>
									     <c:set var="rowNumber" value="${rowNumber + 1}" />
									</c:forEach>
                                   <!-- board end -->
                                </tbody>
                            </table>
						
                        </div>
                    </div>
                    <div style="text-align: right;">
                    <c:choose>
					  <c:when test="${SUID == 'admin'}">
					    <input type="button" class="btn btn-secondary btn-sm" value="게시글작성" onclick="openNoticeWriteModal()"/>
					  </c:when>
				  </c:choose>
                    </div>
                </div>
            </div>
              <!-- boardWriteModal Start -->
		<div class="modal" id="noticeWriteModal" tabindex="-1" role="dialog">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content modal-xl">
					<div class="row">
		                <div class="col-12">
		                    <div class="shortcodes_title mb-30">
		                        <h4>Notice Write</h4>
		                    </div>
		                    <div class="shortcodes_content">
		                        <div class="table-responsive">
		                        	<form action="notice_write.do" id="notice_write_form" name="notice_write_form" method="post">
			                            <table class="table mb-0 table-bordered" style="width: 100%;">
			                                <thead>
			                                    <tr>
			                                        <th scope="col" class="board_title">
			                                        	<input type="text" name="nTitle" id="n_title_txt" placeholder=" title" style="vertical-align: middle;"/>
			                                        </th>
			                                        <th scope="col" class="board_date" style="vertical-align: middle;"><fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' /></th>
			                                        <th scope="col" class="board_writer" style="vertical-align: middle;">관리자</th>
			                                        <th scope=col class="board_writer" style="vertical-align: middle;">
			                                        	<select name="nCgNo" style="vertical-align: middle;">
			                                        		<option value="1">공지사항</option>
			                                        		<option value="2">FAQ</option>
			                                        	</select>
			                                        </th>
			                                    </tr>
			                                </thead>
			                                <tbody>
			                                    <tr>
			                                        <td id="notice_content_td" colspan="4">
			                                        	<textarea name="nContent" id="n_content_area" placeholder=" content"></textarea>
			                                        </td>
			                                    </tr>
			                                </tbody>
			                            </table>
		                			</form>
		                      				<input type="hidden" name="pageno" value="${pageno}" />
		                      				<input type="hidden" name="aid" value="${SUID}" />
		                        </div>
		                    </div>
		                    	<div id="notice_btn_container">
									<input class="notice_btn new_write" type="button" value="등록"/>
									<input class="notice_btn list" type="button" pageno="${pageno}" value="목록" />
		                    	</div>
		                </div>
		            </div>
				</div>
			</div>
		</div>
		<!-- boardWriteModal End -->
            
         </div>
    </div>     
            
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="js/shop/notice.js?after" defer></script>

</body>

</html>