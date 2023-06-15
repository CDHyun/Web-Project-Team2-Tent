package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;

public class AdminPurchaseCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		
		String cNo = request.getParameter("cNo");
		
		AdminDao dao = new AdminDao();
		
		//dao.cartTopurchase();
		
		

	}

}
