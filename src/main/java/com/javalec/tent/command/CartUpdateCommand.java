package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.CartDao;

public class CartUpdateCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int cQty =Integer.parseInt(request.getParameter("cQty"));
		int cNo =Integer.parseInt(request.getParameter("cNo"));
		int pStock =Integer.parseInt(request.getParameter("pStock"));
		CartDao dao = new CartDao();
		dao.cartUpdateAction(cQty, cNo, pStock);
		
	}

}
