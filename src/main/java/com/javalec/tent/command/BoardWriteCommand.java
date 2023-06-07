package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.BoardDao;
import com.javalec.tent.dao.QuestionDao;

public class BoardWriteCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		String uNickName = (String)session.getAttribute("SUNICKNAME");
		int bCgNo = Integer.parseInt(request.getParameter("bCgNo"));
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		BoardDao boardDao = new BoardDao();
		int result = boardDao.writeBoard(uid, uNickName, bCgNo, bTitle, bContent);

	}

}
