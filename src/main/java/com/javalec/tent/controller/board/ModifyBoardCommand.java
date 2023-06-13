package com.javalec.tent.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.BoardDao;

/**
 * Servlet implementation class DeleteBoardComment
 */
@WebServlet("/ModifyBoardCommand")
public class ModifyBoardCommand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyBoardCommand() {
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
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		BoardDao boardDao = new BoardDao();
		int result = boardDao.modifyBoard(bNo, bTitle, bContent);
		response.getWriter().write(result + "");
	}

}
