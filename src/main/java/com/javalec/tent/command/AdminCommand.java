package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

public class AdminCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//검색기능에 필요한 변수
		String queryName = request.getParameter("query");
		String queryContent = request.getParameter("content");
		
		
		//업데이트에 필요한 변수
		
		

		AdminDao dao = new AdminDao();   // dB 연결
	
		
		
		
		
		// all product select 
			ArrayList<AdminDto> dtos = dao.searchAction(queryName, queryContent);
			request.setAttribute("list", dtos);
			
			
			
			
		
		
	}

}
