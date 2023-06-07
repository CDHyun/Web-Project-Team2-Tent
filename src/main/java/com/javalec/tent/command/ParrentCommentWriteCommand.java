package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.CommentDao;

public class ParrentCommentWriteCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		String uNickName = (String)session.getAttribute("SUNICKNAME");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String cmContent = request.getParameter("cmContent");
		
		CommentDao commentDao = new CommentDao();
		
		int result = commentDao.writeParentComment(bNo, uid, uNickName, cmContent);

	}

}
