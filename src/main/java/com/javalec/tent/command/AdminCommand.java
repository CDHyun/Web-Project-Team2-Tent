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

		AdminDao dao = new AdminDao();   // dB 연결
	
		
		
		
		
		// all product select 
		//	ArrayList<AdminDto> dtos = dao.searchAction();
		//	request.setAttribute("list", dtos);
		
		
	}

}
