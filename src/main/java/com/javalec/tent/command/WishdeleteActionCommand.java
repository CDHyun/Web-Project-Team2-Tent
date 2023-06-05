package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.javalec.tent.dao.WishlistDao;

public class WishdeleteActionCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		String uid = request.getParameter("uid");
		WishlistDao dao = new WishlistDao();
		dao.wishDeleteAction(pCode,uid);
	}

}
