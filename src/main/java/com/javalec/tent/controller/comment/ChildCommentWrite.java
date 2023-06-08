package com.javalec.tent.controller.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.CommentDao;

/**
 * Servlet implementation class ChildCommentWrite
 */
@WebServlet("/ChildCommentWrite")
public class ChildCommentWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChildCommentWrite() {
        super();
        // TODO Auto-generated constructor stub
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
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String uid = (String)session.getAttribute("SUID");
		String uNickName = (String)session.getAttribute("SUNICKNAME");
		String cmContent = request.getParameter("cmContent");
		int cmParentNo = Integer.parseInt(request.getParameter("cmNo"));
		
		CommentDao commentDao = new CommentDao();
		commentDao.saveReply(bNo, uid, uNickName, cmContent, cmParentNo); 
		
		System.out.println("bNo : "+bNo);
		System.out.println("cmParentNo : "+cmParentNo);
		System.out.println("cmContent : "+cmContent);
	}

}
