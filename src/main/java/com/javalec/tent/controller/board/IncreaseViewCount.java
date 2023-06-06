package com.javalec.tent.controller.board;

import com.javalec.tent.command.TentCommand;
import com.javalec.tent.dao.BoardDao;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IncreaseViewCount
 */
@WebServlet("/increaseViewCount")
public class IncreaseViewCount extends HttpServlet implements TentCommand {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncreaseViewCount() {
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
		// TODO Auto-generated method stub
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		BoardDao boardDao = new BoardDao();
		int result = boardDao.IncreaseViewCount(qNo);
	}

}
