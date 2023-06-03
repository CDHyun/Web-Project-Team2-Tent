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
		String pPrice = request.getParameter("pPrice");
		String pColor =request.getParameter("pColor");
		String pStock =request.getParameter("pStock");
		String pfName =request.getParameter("file");
		String pfRealName =request.getParameter("file");
		String fileName = request.getParameter("fileName");
		
		System.out.println(pCode);
		System.out.println(pBrandName);
		System.out.println(pName);
		System.out.println(pPrice);
		System.out.println(pColor);
		System.out.println(pStock);
		System.out.println(pfName);
		System.out.println(pfRealName);
		System.out.println(fileName);
		
		AdminDao dao  = new AdminDao();
		dao.updateAction(pCode, pBrandName, pName, pPrice, pColor, pStock, pfName, pfRealName);
		
		
	
		
	}

}
