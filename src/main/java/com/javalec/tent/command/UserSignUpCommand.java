package com.javalec.tent.command;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.UserDao;

/**
 * Servlet implementation class UserSignUpCommand
 */
@WebServlet("/UserSignUpCommand")
public class UserSignUpCommand extends HttpServlet implements TentCommand {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSignUpCommand() {
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
		String uid = request.getParameter("ruid");
		String uPassword = request.getParameter("ruPassword");
		String uName = request.getParameter("ruName");
		String uNickName = request.getParameter("ruNickName");
		String uPhone = request.getParameter("ruPhone");
		String uEmail = request.getParameter("ruEmail");
		int uGender = Integer.parseInt(request.getParameter("ruGender"));
		String uBirthday = request.getParameter("ruBirthday");
		String uAddress = request.getParameter("ruAddress");
		String uDetailAddress = request.getParameter("ruDetailAddress");
		String uZipcode = request.getParameter("ruZipcode");
		
		UserDao userDao = new UserDao();
		
		int result = userDao.signUp(uid, uPassword, uName, uNickName, uPhone, uEmail, uGender, uBirthday, uAddress, uDetailAddress, uZipcode);
		response.getWriter().write(result + "");
		
	}

}
