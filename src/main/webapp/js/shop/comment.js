
/*
댓글 등록
*/
$(".comment_btn.new_write").on("click", function(){
	
	if(CKEDITOR.instances.cm_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	$('#parrentCommentWriteModal').modal('hide');
	/*$("#parent_comment_form").attr("action", "parent_comment_write.do"); */
	$("#parent_comment_form").submit();
});

/* 대댓글 등록 */
$(".child_btn.new_write").on("click", function(){
	if(CKEDITOR.instances.child_content_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	childCommentWrite();
	/*
	$('#childCommentWriteModal').modal('hide');
	$("#parent_comment_form").attr("action", "parent_comment_write.do");
	$("#child_comment_form").submit();
	*/
});
$(".child_btn.modify").on("click", function(){
	if(CKEDITOR.instances.child_content_modify_area.getData() == ""){
		Toast.fire({ icon: 'warning', title: "필수 입력값을 입력하지 않았습니다.\n 제목과 내용을 모두 입력해주세요" });
		return;
	}
	/*
	$('#childCommentWriteModal').modal('hide');
	$("#parent_comment_form").attr("action", "parent_comment_write.do");
	$("#child_comment_form").submit();
	*/
});


/*
ckeditor
*/
$(() => {
	if($("#cm_content_area").length != 0){
		 CKEDITOR.replace('cm_content_area', {
						height: 500                                                  
                 	});
	}
});


$(() => {
	if($("#child_content_area").length != 0){
		 CKEDITOR.replace('child_content_area', {
						height: 500                                                  
                 	});
	}
});
$(() => {
	if($("#child_content_modify_area").length != 0){
		 CKEDITOR.replace('child_content_modify_area', {
						height: 500                                                  
                 	});
	}
});

