package com.javalec.tent.controller.comment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.CommentDao;

/**
 * Servlet implementation class DeleteComment
 */
@WebServlet("/ChildModifyComment")
public class ModifyComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyComment() {
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
		int cmNo = Integer.parseInt(request.getParameter("cmNo"));
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String cmContent = request.getParameter("cmContent");
		System.out.println("넘어온 cmNo : " + cmNo);
		System.out.println("넘어온 bNo : " + bNo);
		System.out.println("넘어온 수정 내용 : " + cmContent);
		CommentDao commentDao = new CommentDao();
		int result = commentDao.modifyComment(bNo, cmNo, cmContent);
		response.getWriter().write(result + "");
		
	}

}
