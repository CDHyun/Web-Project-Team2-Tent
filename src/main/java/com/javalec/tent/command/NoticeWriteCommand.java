package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.BoardDao;
import com.javalec.tent.dao.NoticeDao;

public class NoticeWriteCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String aid = (String)session.getAttribute("SUID");
		int nCgNo = Integer.parseInt(request.getParameter("nCgNo"));
		String nTitle = request.getParameter("nTitle");
		String nContent = request.getParameter("nContent");
		NoticeDao noticeDao = new NoticeDao();
		int result = noticeDao.writeNotice(aid, nCgNo, nTitle, nContent);

	}

}
