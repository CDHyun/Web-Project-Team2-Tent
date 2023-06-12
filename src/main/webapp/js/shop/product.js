/*
quickview modal 보여지기 전 상품데이터 조회
*/
/*
$('#quickview').on('show.bs.modal', function(e){
	console.log(e.relatedTarget);
	let pCode = $(e.relatedTarget).attr("pCode");
	$.ajax({
		url: "/product_detail",
		method: "post",
		data: {"pCode" : pCode},
		dataType: "json",
		success:function(resultObj){
			console.log(resultObj);
			if(resultObj.errorCode > 0){
				let product = resultObj.data;
				$(e.target).find('.badge-new').html(product.p_concept);
				$(e.target).find('.title').html(product.pName);
				$(e.target).find('.price').html("&#8361; " + numberWithCommas(product.pPrice));
				$(e.target).find('.p_desc').html(product.p_desc);
				let scoreBuffer = "";
				for(let i = 0; i < product.pAvgScore; i++){
					scoreBuffer += `<i class="fa fa-star" aria-hidden="true"></i>`;
				}
				if(scoreBuffer == "") scoreBuffer = "등록된 리뷰가 없습니다";
				$(e.target).find('.top_seller_product_rating.mb-15').html(scoreBuffer);
				$(e.target).find('.p_detail_link').on("click", function(e){
					location.href = "product_detail?pCodo=" + pCode;
					e.preventDefault();
				});
				$(e.target).find('#pCode').val(pCode);
				$(e.target).find('.q_view_to_wish_btn').attr("pCode", pCode);
				$(e.target).find(".first_img").attr("src", `images/product/${product.pfRealName}`);
				$(e.target).find(".hover_img").attr("src", `images/product/${product.pfHoverRealName}`);
			} else {
				Toast.fire({ icon: 'error', title: resultObj.errorMsg });
			}
		}
	});
});
*/

/*
list -> Add to Cart 
*/
$(".row.justify-content-center").on("click", ".list_add_to_cart_btn", function(e){
	addToCart({
		"p_no": $(e.target).attr("p_no"),
		"qty": 1
	});
	$(this).blur();
	e.preventDefault();
});

/*
detail -> Add to Cart 
*/
function detail_addToCart(){
	ToastConfirm.fire({ icon: 'question', 
				title: "주문을 진행하시겠습니까?"}).then((result) => {
				if(result.isConfirmed){
					$("#addcart_and_buynow_form").attr("action", "checkout_2");
					$("#addcart_and_buynow_form").submit(); // p_no, qty, buyType(direct)
				}
			});
}

/*
quick view -> Add to Cart 
*/
$("#q_view_cart_add_form").on("submit", function(e){
	let params = $(this).serialize(); // p_no, qty
	addToCart(params);
	$(".cart-submit").blur();
	e.preventDefault();
});

/*
list -> Add to wish
*/
$(".row.justify-content-center").on("click", ".list_to_wish_btn", function(e){
	addToWishList({
		"p_no": $(this).attr("p_no"),
	});
	$(this).blur();
	e.preventDefault();
});

/*
detail -> Add to wish
quick view -> Add to wish
*/
$(".q_view_to_wish_btn, .add_to_wishlist").on("click", function(e){
	addToWishList({
		"p_no": $(this).attr("p_no"),
	});
	$(this).blur();
	e.preventDefault();
});

/*
상품 바로 구매
*/
function buyNowProduct(){
	ToastConfirm.fire({ icon: 'question', 
				title: "주문을 진행하시겠습니까?"}).then((result) => {
				if(result.isConfirmed){
					$("#addcart_and_buynow_form").attr("action", "checkout_2");
					$("#addcart_and_buynow_form").submit(); // p_no, qty, buyType(direct)
				}
			});
}

/*
조건검색 체크방식 변경
*/
let conditionArr = ["p_category", "p_color", "p_brand", "p_score"];
conditionArr.forEach(function(v, i){
	$(`.widget-desc.${v} [type=checkbox]`).on("click", function(e){
		if($(e.target).prop("checked")){
			$(`.widget-desc.${v} [type=checkbox]`).prop("checked", false);
			$(e.target).prop("checked", true);
		}
	});
});
/*
선택 조건값을 저장 
*/
function setCheckCondition(){
	let p_category = $(".widget-desc.p_category [type=checkbox]:checked").attr("cg_no");
	let p_color = $(".widget-desc.p_color [type=checkbox]:checked").next().text().toLowerCase().trim();
	let p_brand = $(".widget-desc.p_brand [type=checkbox]:checked").next().text().toLowerCase().trim();
	let p_score = $(".widget-desc.p_score [type=checkbox]:checked").attr("score");
	let priceRangeArr = $(".range-price").text().split(":")[1].split("-"); 
	let lowPrice = priceRangeArr[0].replace(/[^0-9]/g,"").trim();
	let highPrice = priceRangeArr[1].replace(/[^0-9]/g,"").trim();
	let sortBy = $("#sortBy").val();
	
	let checkJson = {}; 
	checkJson.cg_no = p_category; 
	checkJson.color = p_color; 
	checkJson.brand = p_brand; 
	checkJson.score = p_score; 
	checkJson.lowPrice = lowPrice; 
	checkJson.highPrice = highPrice; 
	checkJson.sortBy = sortBy; 
	checkJson.pageno = $(".page-item.active > a").text() == "" ? "1" : $(".page-item.active > a").text();
	console.log(checkJson); 
	
	return checkJson; 
}

/*
main에서 접근시 선택 카테고리 정보 세팅 
*/
$(() => {
	let cg_no = getParameterByName("cg_no");
	if(cg_no){
		$(`.widget-desc.p_category input:checkbox[id='customCheck${cg_no}']`).prop("checked", true);
	}
});

