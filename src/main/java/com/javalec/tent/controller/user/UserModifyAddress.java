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
 * Servlet implementation class UserModifyAddress
 */
@WebServlet("/UserModifyAddress")
public class UserModifyAddress extends HttpServlet implements TentCommand {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserModifyAddress() {
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
		String uaAddress = request.getParameter("uaAddress");
		String uaDetailAddress = request.getParameter("uaDetailAddress");
		String uaZipcode = request.getParameter("uaZipcode");
		String uaContent = request.getParameter("uaContent");
		UserDao userDao = new UserDao();
		int result = userDao.userModifyAddress(uaNo, uid, uaAddress, uaDetailAddress, uaZipcode, uaContent);
		response.getWriter().write(result + "");
	}

}
