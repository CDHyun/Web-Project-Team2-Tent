package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;

public class AdminWishListToCartCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String wNo = request.getParameter("wNo");
		
		AdminDao dao = new AdminDao();  //db 연결
		dao.wishlistToCart(wNo);
	}

}
