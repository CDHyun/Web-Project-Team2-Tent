<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="css/shop/comment.css">

<script type="text/javascript">
	
	var globalCmNo;
	

	function openParentModal() {
		$('#parrentCommentWriteModal').modal('show');
	}
	function openChildModal(cmNo) {
		globalCmNo = cmNo;
		$('#childCommentWriteModal').modal('show');
	}
	function openModifyCommentModal(cmNo) {
		globalCmNo = cmNo;
		ToastConfirm.fire({  icon: 'warning',  title: "댓글을 수정하시겠습니까?"  }).then((result) => {
		    if (result.isConfirmed) {
			$('#childCommentModifyModal').modal('show');
		    }
		  });
	}
	
	function childCommentWrite() {
		console.log(globalCmNo);
		var cmNo = globalCmNo;
		var bNo = $("#hidden_bNo").val();
		var cmContent = CKEDITOR.instances.child_content_area.getData();
		/* var cmContent = $("#child_content_area").val(); */
		console.log('bNo : ' + bNo);
		console.log('cmNo : ' + cmNo)
		console.log(cmContent);
		$.ajax({
	        type: 'POST',
	        url: './ChildCommentWrite',
	        data: {
	            cmNo : cmNo,
	            bNo: bNo,
	            cmContent: cmContent
	        },
	        success: function() {
	            window.location.href = "board_detail.do?bNo=" + bNo;
	        }
	    });
		
	}
	
	function deleteComment(cmNo) {
		  var bNo = $("#hidden_bNo").val();
		  var cmNo = cmNo;
		  Swal.fire({
		    icon: 'warning',
		    title: '댓글을 삭제하시겠습니까?',
		    showCancelButton: true,
		    confirmButtonColor: '#ff0000', // Red color
		    cancelButtonColor: '#6c757d', // Default color
		    confirmButtonText: '삭제',
		    cancelButtonText: '취소',
		  }).then((result) => {
		    if (result.isConfirmed) {
		      $.ajax({
		        type: 'POST',
		        url: './DeleteComment',
		        data: {
		          cmNo: cmNo,
		          bNo: bNo
		        },
		        success: function(result) {
		          console.log(result);
		          if (result === "0") {
		            Swal.fire({
		              icon: 'warning',
		              title: '댓글 삭제 중 문제가 발생했습니다.'
		            });
		            return;
		          }

		          if (result === "1") {
		            window.location.href = "board_detail.do?bNo=" + bNo;
		          }
		        },
		        error: function() {
		          Swal.fire({
		            icon: 'warning',
		            title: '오류가 발생했습니다. 관리자에게 문의해주세요.'
		          });
		        }
		      });
		    }
		  });
		}

	
	function modifyComment() {
		console.log(globalCmNo);
		var cmNo = globalCmNo;
		var bNo = $("#hidden_bNo").val();
		var cmContent = CKEDITOR.instances.child_content_modify_area.getData();
		/* var cmContent = $("#child_content_area").val(); */
		console.log('bNo : ' + bNo);
		console.log('cmNo : ' + cmNo)
		console.log(cmContent);
		$.ajax({
	        type: 'POST',
	        url: './ChildModifyComment',
	        data: {
	            cmNo : cmNo,
	            bNo: bNo,
	            cmContent: cmContent
	        },
	        success: function() {
	            window.location.href = "board_detail.do?bNo=" + bNo;
	        }
	    });
		
	}
	
	function deleteBoard() {
		  var bNo = $("#hidden_bNo").val();
		  console.log("삭제 요청 번호 :" + bNo)
		  Swal.fire({
		    icon: 'warning',
		    title: '게시글을 삭제하시겠습니까?',
		    showCancelButton: true,
		    confirmButtonColor: '#ff0000', // Red color
		    cancelButtonColor: '#6c757d', // Default color
		    confirmButtonText: '삭제',
		    cancelButtonText: '취소',
		  }).then((result) => {
		    if (result.isConfirmed) {
		      $.ajax({
		        type: 'POST',
		        url: './DeleteBoardCommand',
		        data: {
		          bNo: bNo
		        },
		        success: function(result) {
		          console.log(result);
		          if (result === "0") {
		            Swal.fire({
		              icon: 'warning',
		              title: '게시글 삭제 중 문제가 발생했습니다.'
		            });
		            return;
		          }
		          if (result === "1") {
		        	  Swal.fire({
		        		  icon: 'success',
		        		  title: "게시글이 삭제되었습니다!",
		        		  showCancelButton: false,
		        		  showConfirmButton: true,
		        		  confirmButtonText: "OK"
		        		}).then((result) => {
		        		  if (result.isConfirmed) {
		        		    window.location.href = 'board_list.do';
		        		  }
		        		});
		          }
		        },
		        error: function() {
		          Swal.fire({
		            icon: 'warning',
		            title: '오류가 발생했습니다. 관리자에게 문의해주세요.'
		          });
		        }
		      });
		    }
		  });
		}

	
	function modifyBoard() {
		  var bNo = $("#hidden_bNo").val();
		  var bTitle = $("#b_title_modify_txt").val();
		  var bContent = CKEDITOR.instances.b_content_modify_area.getData();
		  Swal.fire({
		    icon: 'warning',
		    title: "수정 내용을 저장하시겠습니까?",
		    showCancelButton: true,
		    confirmButtonText: "저장",
		    cancelButtonText: "취소"
		  }).then((result) => {
		    if (result.isConfirmed) {
		      $.ajax({
		        type: 'POST',
		        url: './ModifyBoardCommand',
		        data: {
		          bNo: bNo,
		          bTitle : bTitle,
		          bContent : bContent
		        },
		        success: function (result) {
		          console.log(result);
		          if (result === "0") {
		            Swal.fire({
		              icon: 'warning',
		              title: "게시글 수정 중 문제가 발생했습니다."
		            });
		            return;
		          }

		          if (result === "1") {
		        	  Swal.fire({
		        		  icon: 'success',
		        		  title: "게시글이 수정되었습니다.",
		        		  showCancelButton: false,
		        		  showConfirmButton: true,
		        		  confirmButtonText: "OK"
		        		}).then((result) => {
		        		  if (result.isConfirmed) {
		        		    window.location.href = "board_detail.do?bNo=" + bNo;
		        		  }
		        		});
		          }
		        },
		        error: function () {
		          Swal.fire({
		            icon: 'warning',
		            title: "오류가 발생했습니다. 관리자에게 문의해주세요."
		          });
		        }
		      });
		    }
		  });
		}

	function openModifyModal() {
		  Swal.fire({
		    icon: 'question',
		    title: "수정하시겠습니까?",
		    showCancelButton: true,
		    confirmButtonText: "수정",
		    cancelButtonText: "취소"
		  }).then((result) => {
		    if (result.isConfirmed) {
		      $('#boardModifyModal').modal('show');
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
						<c:set var="bNo" value="${board.bNo}"></c:set>
						<div class="shortcodes_content">
							<div class="table-responsive">
								<table class="table mb-0 table-bordered">
									<thead>
										<tr>
											<th scope="col" class="board_title"
												style="vertical-align: middle;">${board.bTitle}</th>
											<th scope="col" class="board_writer"
												style="vertical-align: middle;">${board.uNickName}</th>
											<c:set var="dateString" value="${board.bInsertDate}" />
											<fmt:parseDate var="date" value="${dateString}"
												pattern="yyyy-MM-dd HH:mm:ss" />
											<fmt:formatDate var="formattedDate" value="${date}"
												type="date" pattern="yyyy년-MM월-dd일" />
											<fmt:formatDate var="formattedDate2" value="${date}"
												type="date" pattern="HH시:mm분" />
											<th scope="col" class="board_date"
												style="vertical-align: middle;">${formattedDate}<br />${formattedDate2}</th>
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
								<input class="btn btn-warning btn-sm" type="button" value="수정" onclick="openModifyModal()" />&nbsp;&nbsp;
							<input class="btn btn-danger btn-sm" type="button" value="삭제" onclick="deleteBoard()" />&nbsp;&nbsp;
                    	</c:if>
							<input class="btn btn-primary btn-sm" type="button" value="댓글 달기"
								onclick="openParentModal()" />&nbsp;&nbsp; <a
								href="board_list.do?pageNo=1"><input
								class="btn btn-secondary btn-sm" type="button" value="목록" /></a>&nbsp;&nbsp;
						</div>
						    <!-- boardModifyModal Start -->
							<div class="modal" id="boardModifyModal" tabindex="-1" role="dialog">
								<div class="modal-dialog modal-xl" role="document">
									<div class="modal-content modal-xl">
										<div class="row">
							                <div class="col-12">
							                    <div class="shortcodes_title mb-30">
							                        <h4>Board Modify</h4>
							                    </div>
							                    <div class="shortcodes_content">
							                        <div class="table-responsive">
							                        	<form action="board_modify.do" id="board_modify_form" name="board_modify_form" method="post">
								                            <table class="table mb-0 table-bordered" style="width: 100%;">
								                                <thead>
								                                    <tr>
								                                        <th scope="col" class="board_title">
								                                        	<input type="text" name="bTitle" id="b_title_modify_txt" placeholder=" title" value="${board.bTitle}" style="vertical-align: middle;"/>
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
								                                        	<textarea name="bContent" id="b_content_modify_area" placeholder=" content">${board.bContent}</textarea>
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
														<input class="btn btn-secondary btn-sm board_btn" type="button" value="수정" onclick="modifyBoard()"/>&nbsp;&nbsp;&nbsp;
														<input class="btn btn-secondary btn-sm board_btn list" type="button" pageno="${pageno}" value="목록" />
							                    	</div>
							                </div>
							            </div>
									</div>
								</div>
							</div>
							<!-- boardModifyModal End -->
						
					</c:forEach>
				</div>
			</div>
			<br/><br/>
	<!-- Comment List -->
	<div class="comment-list-container">
	  <c:set var="cmtCount" value="${commentCount}"></c:set>
	  <h6><i class="fa fa-commenting-o"></i>댓글 : <span style="color: orange;"><c:out value="(${cmtCount})" /></span> </h6>
	  <table class="comment-list">
	    <tbody>
	      <c:forEach items="${commentList}" var="cmt">
	        <tr>
	          <td>
	            <div class="comment-wrapper" style="border: 1px solid black; padding: 10px; margin-left: ${cmt.cmStep * 30}px;">
	              <div class="comment-header">
	              
	              
	              
	                <div class="comment-info">
	                <c:if test="${cmt.cmDeleted == true}">
	                <div>Unknown</div>
	                  <div style="color: gray;">삭제 일자 : ${cmt.cmDeleteDate}</div>
	                </c:if>
	                <c:if test="${cmt.cmDeleted == false}">
	                  <div>${cmt.uNickName}</div>
	                  <div style="color: gray;">${cmt.cmInsertDate}</div>
	                </c:if>
	                </div>
	              </div>
	              <c:if test="${cmt.cmDeleted == true}">
		              <div class="comment-content"><span style="color: red;"> 삭제된 댓글입니다. </span></div>
	              </c:if>
	              <c:if test="${cmt.cmDeleted == false}">
		              <div class="comment-content">${cmt.cmContent}</div>
	              </c:if>
	            </div>
				<c:if test="${cmt.cmDeleted == false}">
		            <div class="comment-actions" style="text-align: right;">
		              <c:if test="${cmt.uid eq SUID}">
		                <input class="btn btn-danger btn-sm" type="button" value="삭제" onclick="deleteComment('${cmt.cmNo}')">
		                <input class="btn btn-warning btn-sm" type="button" value="수정" onclick="openModifyCommentModal('${cmt.cmNo}')">
		              </c:if>
		              <c:if test="${!cmt.uid eq SUID}">
		                <input class="btn btn-secondary btn-sm" type="button" value="추천">
		                <input class="btn btn-secondary btn-sm" type="button" value="비추천">
		              </c:if>
		              <input class="btn btn-secondary btn-sm" type="button" value="답글 달기" onclick="openChildModal('${cmt.cmNo}')">
		            </div>
				</c:if>	            
	          </td>
	        </tr>
	        <!-- childCommentWriteModal Start -->
		<div class="modal" id="childCommentWriteModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="container">
		        <h5 class="mb-3" style="display: inline-block; text-align: center;">Comment</h5>
		        <form id="child_comment_form" action="child_comment_write.do?bNo=${bNo}&cmParentNo=${cmt.cmNo}" method="post">
		        <c:out value="${cmt.cmNo}"></c:out>
		          <div class="form-group">
		            <label for="uid">작성자 : ${SUNICKNAME}</label>
		          </div>
		          <div class="form-group">
		            <label for="uid">작성일자 : <fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' /></label>
		          </div>
		          <div class="form-group">
		            <textarea name="c_cmContent" id="child_content_area" placeholder=" content"></textarea>
		          </div>
		          <div class="button-container">
		            <input type="hidden" name="bNo" value="${bNo}">
		            <button type="button" class="btn btn-primary btn-sm child_btn new_write" onclick="">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <button type="button" class="btn btn-secondary btn-sm" id="cmCancelBtn" data-dismiss="modal">Cancel</button>
		          </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		<!--  -->
	        <!-- childCommentModifyModal Start -->
		<div class="modal" id="childCommentModifyModal" tabindex="-1" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="container">
		        <h5 class="mb-3" style="display: inline-block; text-align: center;">Comment</h5>
		        <form id="child_comment_form" action="child_comment_modify.do?bNo=${bNo}&cmNo=${cmt.cmNo}" method="post">
		        <c:out value="${cmt.cmNo}"></c:out>
		          <div class="form-group">
		            <label for="uid">작성자 : ${SUNICKNAME}</label>
		          </div>
		          <div class="form-group">
		            <label for="uid">작성일자 : <fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' /></label>
		          </div>
		          <div class="form-group">
		            <textarea name="m_cmContent" id="child_content_modify_area" placeholder=" content"></textarea>
		          </div>
		          <div class="button-container">
		            <input type="hidden" name="bNo" value="${bNo}">
		            <button type="button" class="btn btn-primary btn-sm" onclick="modifyComment()">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <button type="button" class="btn btn-secondary btn-sm" id="cmCancelBtn" data-dismiss="modal">Cancel</button>
		          </div>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		<!--  -->
		
		
	      </c:forEach>
	    </tbody>
	  </table>
	</div>





</div>
</div>
<!-- childCommentWriteModal End -->

	<!-- parrentCommentWriteModal Start -->
	<div class="modal" id="parrentCommentWriteModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="container">
				<h5 class="mb-3" style="display: inline-block; text-align: center;">Comment</h5>
				<form id="parent_comment_form" action="parent_comment_write.do?bNo=${bNo}" method="post">
						<div class="form-group">
							<label for="uid">작성자 : ${SUNICKNAME}</label>
						</div>
						<div class="form-group">
							<label for="uid">작성일자 : <fmt:formatDate value='${toDay}'
									pattern='yyyy-MM-dd' /></label>
						</div>
						<div class="form-group">
							<textarea name="cmContent" id="cm_content_area" placeholder=" content"></textarea>
						</div>
					<div class="button-container">
						<input type="hidden" id="hidden_bNo" name="bNo" value="${bNo}">
						<button type="button" class="btn btn-primary btn-sm comment_btn new_write">Confirm</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-secondary btn-sm" id="cmCancelBtn" data-dismiss="modal">Cancle</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
	<!-- parrentCommentWriteModal End -->
	
    <!-- PageMaker -->
			<div class="shop_pagination_area mt-30">
			    <nav aria-label="Page navigation">
			        <ul class="pagination pagination-sm justify-content-center">
			            <c:if test="${pageMaker.page > 1}">
			                <li class="page-item">
			                    <a class="page-link" href="board_detail.do?bNo=${bNo}&pageNo=1"><i class="fa fa-angle-double-left" aria-hidden="true"></i></a>
			                </li>
			                <li class="page-item">
			                    <a class="page-link" href="board_detail.do?bNo=${bNo}&pageNo=${pageMaker.page - 1}"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
			                </li>
			            </c:if>
						<c:set var="halfDisplayPage" value="${Math.floor(pageMaker.displayPage/2)}" />
						<c:set var="startPage" value="${pageMaker.page - halfDisplayPage}" />
						<c:set var="endPage" value="${pageMaker.page + halfDisplayPage}" />
						
						<c:if test="${startPage lt 1}">
						    <c:set var="startPage" value="1" />
						</c:if>
						<c:if test="${endPage gt pageMaker.totalPage}">
						    <c:set var="endPage" value="${pageMaker.totalPage}" />
						</c:if>
						
						<c:forEach var="pageNum" begin="${startPage}" end="${endPage}" step="1">
						    <li class="page-item ${pageNum eq pageMaker.page ? 'active' : ''}">
						        <a class="page-link" href="board_detail.do?bNo=${bNo}&pageNo=${pageNum}">${pageNum}</a>
						    </li>
						</c:forEach>
			
			            <c:if test="${pageMaker.next}">
						    <li class="page-item">
						        <a class="page-link" href="board_detail.do?bNo=${bNo}&pageNo=${pageMaker.page + 1}"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
						    </li>
						    <li class="page-item">
						        <a class="page-link" href="board_detail.do?bNo=${bNo}&pageNo=${pageMaker.totalPage}"><i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
						    </li>
						</c:if>
			        </ul>
			    </nav>
			</div>
			
    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<script src="js/shop/board.js?after"></script>
	<script src="js/shop/comment.js"></script>
	<script type="text/javascript">
		
	</script>

</body>

</html>