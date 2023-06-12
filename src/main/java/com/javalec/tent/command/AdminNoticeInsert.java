package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;

public class AdminNoticeInsert implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String aid = (String)session.getAttribute("SUID");
		String nTitle= request.getParameter("title");
		String nContent = request.getParameter("content");
		
		
		
		AdminDao dao = new AdminDao();
		dao.noticeInsert(aid, nTitle, nContent);
	}

}
