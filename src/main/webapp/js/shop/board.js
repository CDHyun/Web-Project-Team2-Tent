/*
게시물 리스트 변경
*/
function changeQnaList(pageno){
	$.ajax({
		url: "qna_list_rest",
		method: "post",
		data: {"pageno" :pageno},
		dataType: "json",
		success:function(resultObj){
			console.log(resultObj);
			if(resultObj.errorCode > 0){
				let data = resultObj.data;
				let htmlBuffer = ``;
				data.itemList.forEach(function(qna, i){
					let fDate = formatDate(qna.q_date);
					let toDate = formatDate(new Date());
					htmlBuffer += `<tr>
	                                <th scope="row">${qna.q_no}</th>
	                                <td><a href="qna_view?q_no=${qna.q_no}&pageno=${data.pageMaker.curPage}">${qna.q_title}</a>`;
	                if(fDate == toDate){
						htmlBuffer += `&nbsp;&nbsp;<span class="badge badge-danger">new</span>`;
					}
                    htmlBuffer += `</td>
	                                    <td>${qna.m_id}</td>
	                                    <td>${fDate}</td>
	                                    <td>${qna.q_count}</td>
	                                </tr>`;
				});
				$("#qna_list_tbody").html(htmlBuffer);
				let paginationBuffer = ``;
				if(data.pageMaker.prevPage > 0){
					paginationBuffer += `<li class="page-item">
		                                    <button class="page-link" onclick="changeQnaList(${data.pageMaker.prevPage});"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
		                               	 </li>`;
				}
				for(let no = data.pageMaker.blockBegin; no <= data.pageMaker.blockEnd; no++){
					if(data.pageMaker.curPage == no){
						paginationBuffer += `<li class="page-item active"><button class="page-link" href="#">${no}</button></li>`;
					}
					if(data.pageMaker.curPage != no){
						paginationBuffer += `<li class="page-item"><button class="page-link" onclick="changeQnaList(${no});">${no}</button></li>`;
					}
				}
				if(data.pageMaker.curPage < data.pageMaker.totPage){
					paginationBuffer += `<li class="page-item">
					                        <button class="page-link" onclick="changeQnaList(${data.pageMaker.nextPage});"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
				                    	 </li>`;
				}
				$(".pagination.pagination-sm.justify-content-center").html(paginationBuffer);
			}else{
				Toast.fire({ icon: 'error', title: resultObj.errorMsg });
			}
		}
	});
}

/*
게시글 목록 이동
*/
$(".board_btn.list").on("click", function(){
	let pageno = $(this).attr("pageno");
	location.href = `board_list.do?pageno=${pageno}`;
});

/*
게시글 삭제 
*/
$(".board_btn.delete").on("click", function(){
	let pageno = $(this).attr("pageno");
	let q_no = $(this).attr("q_no");
	ToastConfirm.fire({ icon: 'question', 
						title: "게시글을 삭제하시겠습니까?\n 삭제 후 복구가 불가능합니다"}).then((result) => {
						if(result.isConfirmed){
							$.ajax({
								url: "qna_delete_rest",
								method: "post",
								data: {"q_no":q_no},
								dataType: "json",
								success:function(resultObj){
									if(resultObj.errorCode > 0){
										Toast.fire({ icon: 'success', title: resultObj.errorMsg }).then((result) => {
												location.href = "question_list.do?pageno=" + pageno;
											});
									}else{
										Toast.fire({ icon: 'error', title: resultObj.errorMsg });
									}
								}
							});
						}
	});
});

/*
게시글 수정 폼 
*/
$(".board_btn.update_form").on("click", function(){
	let q_no = $(this).attr("q_no");
	let pageno = $(this).attr("pageno");
	location.href = `qna_update_form?q_no=${q_no}&pageno=${pageno}`;
});

/*
게시글 등록
*/

$(".board_btn.new_write").on("click", function(){
	if($("#b_title_txt").val() == "" || CKEDITOR.instances.b_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	$("#board_write_form").attr("action", "board_write.do");
	$('#boardWriteModal').modal('hide');
	$("#board_write_form").submit();
});

/* 
게시글 수정 
$(".board_btn.update").on("click", function(){ 
	if($("#b_title_modify_txt").val() == "" || CKEDITOR.instances.b_content_modify_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
		ToastConfirm.fire({ icon: 'question', 
							title: "게시글을 수정하시겠습니까?"}).then((result) => {
							if(result.isConfirmed){
								let bNo = $(this).attr("bNo"); 
								$("#board_update_form").attr("action", "board_modify.do"); 
								$("#board_update_form").submit(); // bNo, bTitla, bContent 
							}
					});
});
*/ 

/*
새글 등록 폼 
*/
$(".board_btn.write_form, .board_btn.reply").on("click", function(){
	$('#boardWriteModal').modal('show');
});

/*
답글 등록 폼 
*/
$(".board_btn.reply").on("click", function(){
	let pageno = $(this).attr("pageno");
	let q_no = $(this).attr("q_no");
	location.href = `board_reply_form.do?pageno=${pageno}&q_no=${q_no}`;
});


/*
답글 등록
*/
$(".board_btn.reply_write").on("click", function(){
	if($("#q_title_txt").val() == "" || CKEDITOR.instances.b_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	$("#board_reply_write_form").attr("action", "qna_reply_write");
	$("#board_reply_write_form").submit();
});

/*
ckeditor
*/
$(() => {
	if($("#b_content_area").length != 0){
		 CKEDITOR.replace('b_content_area', {
						height: 500                                                  
                 	});
	}
});

$(() => {
	if($("#b_content_modify_area").length != 0){
		 CKEDITOR.replace('b_content_modify_area', {
						height: 500                                                  
                 	});
	}
});



