package com.javalec.tent.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.UserDao;


/**
 * Servlet implementation class UserLoginCommand
 */
@WebServlet("/UserLoginCommand")
public class UserLoginCommand extends HttpServlet implements TentCommand {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginCommand() {
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
		String uid = request.getParameter("luid");
		String uPassword = request.getParameter("luPassword");
		System.out.println("uid : " + uid);
		System.out.println("uPassword : " + uPassword);
		UserDao userDao = new UserDao();
		HttpSession session = request.getSession();
		int result = userDao.login(uid, uPassword);
		if(result == 1) {
			session.setAttribute("SUID", uid);
			response.getWriter().write(result + "");
		} else {
			response.getWriter().write(result + "");
		}
		
	}

}
