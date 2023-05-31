<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <!-- Search Question Area -->
    <section class="faq_quesition_search_area section_padding_100 bg-img bg-overlay" style="background-image: url(img/bg-img/1.jpg);">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-9 col-lg-6">
                    <div class="faq_quesition_search_form">
                        <h2>Frequently Asked Questions</h2>
                        <p style="text-align:center">❔</p>
                       <!--  <form action="#" method="get" class="faq_form">
                            <input type="search" class="form-control" name="search" id="search-question" placeholder="Ask a Question">
                            <button type="button" class="btn"><i class="icofont-search-2"></i></button>
                        </form> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Search Question Area -->

    <!-- FAQ Area -->
    <section class="faq--area section_padding_100_70">
        <div class="container">
            <div class="row">
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>What should I do if I receive a damaged parcel?</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>I have received my order but the wrong item was delivered to me.</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>How can I contact for support?</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>Product Receipt and Acceptance Confirmation Process</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>How do I cancel my order?</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>How do I refund my order?</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>What should I do if I receive a damaged parcel?</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>I have received my order but the wrong item was delivered to me.</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>How can I contact for support?</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>Product Receipt and Acceptance Confirmation Process</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>How do I cancel my order?</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
                <!-- Single FAQ Area -->
                <div class="col-12 col-md-6">
                    <div class="single-faq mb-30">
                        <h6>How do I refund my order?</h6>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia velit magnam cum consequuntur ad ipsum!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- FAQ Area End -->

    <section class="cannot_find_answer section_padding_100 bg-gray">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="cannot_find_text text-center">
                        <h3 class="mb-3">Cann't find answer? Submit a Request.</h3>
                        <i class="icofont-live-support"></i>
                        <a href="#" class="btn btn-primary" id="qna_board_link">QnA Board</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer Area -->
 	<jsp:include page="common/include_common_bottom.jsp"/>
    <!-- Footer Area -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
	<jsp:include page="common/include_common_script.jsp"/>
	<script type="text/javascript">
		$("#qna_board_link").on("click", function(e){
			if(!check_session()){
				ToastConfirm.fire({ icon: 'question', 
						title: "로그인이 필요한 페이지입니다.\n 로그인 하시겠습니까?"}).then((result) => {
						if(result.isConfirmed){
							location.href = "login_form";
						}
						e.preventDefault();
						$(this).blur();
					});
				return;
			}else{
				location.href = "qna_list";
				e.preventDefault();
			}
		});
	</script>
</body>

</html>