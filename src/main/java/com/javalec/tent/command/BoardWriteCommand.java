package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.BoardDao;

public class BoardWriteCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		String uNickName = (String)session.getAttribute("SUNICKNAME");
		int qCgNo = Integer.parseInt(request.getParameter("qCgNo"));
		String qTitle = request.getParameter("qTitle");
		String qContent = request.getParameter("qContent");
		BoardDao boardDao = new BoardDao();
		int result = boardDao.writeQnA(uid, uNickName, qCgNo, qTitle, qContent);

	}

}
