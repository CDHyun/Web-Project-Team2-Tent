/* 
멤버 로그인 
*/
/*
$("#member_login_form").on("submit", function(e){
	let id = $("#username").val();
	let password = $("#password").val();
	if(id == "" || password == ""){
		alert("ID, 비밀번호를 모두 입력해주세요"); 
		return; 
	}
	console.log(id);
	console.log(password);
	$.ajax({ 
		url: "member_login_rest", 
		method: "post", 
		data: $("#member_login_form").serialize(), 
		dataType: "json", 
		success:function(resultObj){ 
			console.log(resultObj); 
			if(resultObj.errorCode > 0){ 
				alert(resultObj.errorMsg);
				location.href = "index";
			} else {
				alert(resultObj.errorMsg);
			}
		}
	});
	e.preventDefault();
});
*/
