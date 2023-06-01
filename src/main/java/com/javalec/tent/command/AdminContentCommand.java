package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

public class AdminContentCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		
		AdminDao dao  = new AdminDao();
		
		AdminDto dto = dao.contentView(pCode);
		request.setAttribute("content_view", dto);

	}

}
