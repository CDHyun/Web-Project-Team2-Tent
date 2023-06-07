package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

public class AdminNoticeSelect implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String aid = (String)session.getAttribute("aid");
		
		
		AdminDao dao = new AdminDao();   // dB 연결
		
		// all product select 
		ArrayList<AdminDto> dtos = dao.noticeSearch(aid);
		request.setAttribute("list", dtos);
		
		
		
		// FAQ Select
		ArrayList<AdminDto> dtos1 = dao.faqSearch(aid);
		request.setAttribute("FAQ", dtos1);
		
	}

}
