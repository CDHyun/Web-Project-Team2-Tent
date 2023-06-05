package com.javalec.tent.controller.user;

import com.javalec.tent.command.TentCommand;
import com.javalec.tent.dao.UserDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserDeleteAddress
 */
@WebServlet("/UserDeleteAddress")
public class UserDeleteAddress extends HttpServlet implements TentCommand {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDeleteAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
     * @see TentCommand#execute(HttpServletRequest, HttpServletResponse)
     */
    public void execute(HttpServletRequest request, HttpServletResponse response)  { 
         // TODO Auto-generated method stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		int uaNo = Integer.parseInt(request.getParameter("uaNo"));
		UserDao userDao = new UserDao();
		int result = userDao.userDeleteAddress(uaNo, uid);
		response.getWriter().write(result + "");
	}

}
