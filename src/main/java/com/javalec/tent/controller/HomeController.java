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
import com.javalec.tent.command.AdminUpdateCommand;
import com.javalec.tent.command.CartCommand;
import com.javalec.tent.command.IndexCommand;
import com.javalec.tent.command.ProductDetailCommand;
import com.javalec.tent.command.PurchaserInfoCommand;
import com.javalec.tent.command.TentCommand;
import com.javalec.tent.command.UserInfoCommand;
import com.javalec.tent.command.UserLogoutCommand;

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
		case "/product_detail.do":
			command = new ProductDetailCommand();
			command.execute(request, response);
			viewPage = "shop_grid_left_sidebar.jsp";
			break;
		case "/adminindex.do":
			command = new AdminCommand();
			command.execute(request, response);
			viewPage = "adminProductSelect.jsp";
			break;
		case "/adminProductDetail.do":
			command = new AdminContentCommand();
			command.execute(request, response);
			viewPage = "adminProductUpdate.jsp";
			break;
		case "/adminUpdate.do":
			command = new AdminUpdateCommand();
			command.execute(request, response);
			viewPage = "adminProductSelect.jsp";
			break;
		case "/adminDelete.do":
			command = new AdminDeleteCommand();
			command.execute(request, response);
			viewPage = "adminProductSelect.jsp";
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
		default:
			break;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
