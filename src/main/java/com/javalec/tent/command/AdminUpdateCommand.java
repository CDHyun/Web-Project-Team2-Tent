package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;

public class AdminUpdateCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pCode =request.getParameter("pCode");
		String pBrandName =request.getParameter("pBrandName");
		String pName =request.getParameter("pName");
		int pPrice = Integer.parseInt(request.getParameter("pPrice"));
		String pColor =request.getParameter("pColor");
		int pStock =Integer.parseInt(request.getParameter("pStock"));
		String pfName =request.getParameter("file");
		String pfRealName =request.getParameter("file");
		
		AdminDao dao  = new AdminDao();
		dao.updateAction(pCode, pBrandName, pName, pPrice, pColor, pStock, pfName, pfRealName);
		
		
	
		
	}

}
