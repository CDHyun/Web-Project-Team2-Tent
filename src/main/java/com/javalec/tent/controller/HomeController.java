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
import com.javalec.tent.command.IndexCommand;
import com.javalec.tent.command.TentCommand;
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
		case "/product_list.do":
			command = new IndexCommand();
			command.execute(request, response);
			viewPage = "shop_grid_left_sidebar.jsp";
			break;
		case "/index.do":
			command = new IndexCommand();
			command.execute(request, response);
			viewPage = "index.jsp";
			break;
		case "/login_form.do":
			viewPage = "login_form.jsp";
			break;
		case "/login.do":
			viewPage = "index.do";
			break;
		case "/logout.do":
			command = new UserLogoutCommand();
			command.execute(request, response);
			viewPage = "index.do";
			break;
		case "/adminindex.do":
			command = new AdminCommand();
			command.execute(request, response);
			viewPage = "adminProductSelect.jsp";
			break;
		default:
			break;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
