package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.CartDao;

public class CartDeleteCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		String uid =request.getParameter("uid");
		CartDao dao = new CartDao();
		dao.cartDeleteAction(pCode, uid);
	}

}
