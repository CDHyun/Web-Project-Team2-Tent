package com.javalec.tent.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.command.AdminCommand;
import com.javalec.tent.command.AdminContentCommand;
import com.javalec.tent.command.AdminDeleteCommand;
import com.javalec.tent.command.AdminInputCommand;
import com.javalec.tent.command.AdminNoticeInsert;
import com.javalec.tent.command.AdminNoticeSelect;
import com.javalec.tent.command.AdminPurchaseStatusCommand;
import com.javalec.tent.command.AdminStatusChangeCommand;
import com.javalec.tent.command.AdminSummaryCommand;
import com.javalec.tent.command.AdminUpdateCommand;
import com.javalec.tent.command.BoardDetailCommand;
import com.javalec.tent.command.BoardListCommand;
import com.javalec.tent.command.BoardWriteCommand;
import com.javalec.tent.command.QuestionListCommand;
import com.javalec.tent.command.QuestionWriteCommand;
import com.javalec.tent.command.CartCommand;
import com.javalec.tent.command.CartDeleteCommand;
import com.javalec.tent.command.CartUpdateCommand;
import com.javalec.tent.command.CommentListCommand;
import com.javalec.tent.command.IndexCommand;
import com.javalec.tent.command.ParrentCommentWriteCommand;
import com.javalec.tent.command.ProductDetailCommand;
import com.javalec.tent.command.PurchaseCheckInfoCommand;
import com.javalec.tent.command.PurchaseCompleteCommand;
import com.javalec.tent.command.PurchaseInsertCommand;
import com.javalec.tent.command.PurchaseListCommand;
import com.javalec.tent.command.PurchaserInfoCommand;
import com.javalec.tent.command.TentCommand;
import com.javalec.tent.command.UserAddressListCommand;
import com.javalec.tent.command.UserInfoCommand;
import com.javalec.tent.command.UserLogoutCommand;
import com.javalec.tent.command.WishdeleteActionCommand;
import com.javalec.tent.command.WishlistCommand;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("*.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	public void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		TentCommand command = null;
		TentCommand command2 = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		switch (com) {
		/* 상품 페이지로 이동 */
		case "/product_list.do":
			command = new IndexCommand();
			command.execute(request, response);
			viewPage = "shop_grid_left_sidebar.jsp";
			break;
		/* 메인 페이지로 이동 */
		case "/index.do":
			command = new IndexCommand();
			command.execute(request, response);
			viewPage = "index.jsp";
			break;
		/* 로그인 페이지로 이동 */
		case "/login_form.do":
			viewPage = "login_form.jsp";
			break;
		/* 로그인 후 메인 페이지로 이동 */
		case "/login.do":
			viewPage = "index.do";
			break;
		/* 로그아웃 후 메인 페이지로 이동 */
		case "/logout.do":
			command = new UserLogoutCommand();
			command.execute(request, response);
			viewPage = "index.do";
			break;
		/* 마이 페이지로 이동 */
		case "/user_my_account.do":
			command = new UserInfoCommand();
			command.execute(request, response);
			viewPage = "my_account.jsp";
			break;
			/* 마이 페이지로 이동 */
		case "/user_address.do":
			command = new UserAddressListCommand();
			command.execute(request, response);
			viewPage = "my_address.jsp";
			break;
		case "/product_detail.do":
			command = new ProductDetailCommand();
			command.execute(request, response);
			viewPage = "product_detail.jsp";
			break;
		case "/question_list.do":
			command = new QuestionListCommand();
			command.execute(request, response);
			viewPage = "question.jsp";
			break;
		case "/question_write_form.do":
			viewPage = "question_write_form.jsp";
			break;
		case "/question_write.do":
			command = new QuestionWriteCommand();
			command.execute(request, response);
			viewPage = "question_list.do";
			break;
		case "/board_list.do":
			command = new BoardListCommand();
			command.execute(request, response);
			viewPage = "board.jsp";
			break;
		case "/board_write_form.do":
			viewPage = "board_write_form.jsp";
			break;
		case "/board_write.do":
			command = new BoardWriteCommand();
			command.execute(request, response);
			viewPage = "board_list.do";
			break;
		case "/board_detail.do":
			command = new BoardDetailCommand();
			command.execute(request, response);
			command2 = new CommentListCommand();
			command2.execute(request, response);
			viewPage = "board_detail.jsp";
			break;
		case "/parent_comment_write.do":
			command = new ParrentCommentWriteCommand();
			command.execute(request, response);
			viewPage = "board_detail.do";
			break;
		case "/adminindex.do":  // 상품보여주기
			command = new AdminCommand();
			command.execute(request, response);
			viewPage = "adminProductSelect.jsp";
			break;
		case "/adminProductDetail.do": // 상품정보보여주기 메커니즘
			command = new AdminContentCommand();
			command.execute(request, response);
			viewPage = "adminProductUpdate.jsp";
			break;
		case "/adminUpdate.do": //상품수정 메커니즘
			command = new AdminCommand();
			command.execute(request, response);
			viewPage = "adminProductShare.jsp";
			break;
		case "/adminDelete.do": //상품삭제 메커니즘
			command = new AdminCommand();
			command.execute(request, response);
			viewPage = "adminProductShare.jsp";
			break;
		case("/purchase_info.do"):
			command = new PurchaserInfoCommand();
			command.execute(request, response);
			viewPage = "purchase_info.jsp";
			break;
		case "/cart.do":
			command = new CartCommand();
			command.execute(request, response);
			viewPage = "cart.jsp";
			break;
		case "/CartUpdate.do":
			command = new CartUpdateCommand();
			command.execute(request, response);
			viewPage = "cart.jsp";
			break;
		case "/CartDelete.do":
			command = new CartDeleteCommand();
			command.execute(request, response);
			viewPage = "cart.jsp";
			break;
		case "/adminInsert.do":
			command = new AdminInputCommand();
			command.execute(request, response);
			viewPage = "adminindex.do";
			break;	
		case "/adminUpdateAction.do": //상품수정 메커니즘
			command = new AdminUpdateCommand();
			command.execute(request, response);
			viewPage = "adminindex.do";
			break;
		case "/adminDeleteAction.do": //상품삭제 메커니즘
			command = new AdminDeleteCommand();
			command.execute(request, response);
			viewPage = "adminindex.do";
			break;
		case "/adminpurchaseCheck.do": //주문처리 메커니즘
			command = new AdminPurchaseStatusCommand();
			command.execute(request, response);
			viewPage = "adminPurchaseStatus.jsp";
			break;
		case "/adminStatusChange.do": //주문상태 변경 메커니즘
			command = new AdminStatusChangeCommand();
			command.execute(request, response);
			viewPage = "adminpurchaseCheck.do";
			break;
		case "/adminNotice.do": //고객관리열기
			command = new AdminNoticeSelect();
			command.execute(request, response);
			viewPage = "adminNoticeBoard.jsp";
			break;
		case "/adminWriteNotice.do": //공지작성페이지이동
			viewPage = "adminWriteNotice.jsp";
			break;
		case "/adminNoticeEnd.do": //작성한 공지를 db에 넣음
			command = new AdminNoticeInsert();
			command.execute(request, response);
			viewPage = "adminNotice.do";
			break;
			/* 결제수단 페이지로 이동 */
		case("/payment.do"):
			viewPage = "payment.jsp";
			break;
		/* 주문확인, 총구매액 페이지로 이동 */
		case("/purchase_check_info.do"):
			command = new PurchaseCheckInfoCommand();
			command.execute(request, response);
			viewPage = "purchase_check.jsp";
			break;
			/*주문자 정보 입력*/
		case("/purchaseinsert.do"):
			command = new PurchaseInsertCommand();
			command.execute(request, response);
			viewPage = "purchase_complete.jsp";
			break;
		case("/adminfirst.do"):
			command = new AdminSummaryCommand();
			command.execute(request, response);
			viewPage = "adminSummary.jsp";
			break;
			/* 주문접수 완료 페이지로 이동 */
		case("/purchase_complete.do"):
			command = new PurchaseCompleteCommand();
			command.execute(request, response);
			viewPage = "purchase_complete.jsp";
			break;
	/* 주문내역 페이지로 이동 */
		case("/purchase_list.do"):
			command = new PurchaseListCommand();
			command.execute(request, response);
			viewPage = "purchase_list.jsp";
			break;
		case "/wishlist.do":
			command = new WishlistCommand();
			command.execute(request, response);
			viewPage = "Wishlist.jsp";
			break;
		case "/wishlistDelete.do":
			command = new WishdeleteActionCommand();
			command.execute(request, response);
			viewPage = "wishlist.jsp";
			break;
		default:
			break;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
