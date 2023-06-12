package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;

public class AdminWishListCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		String pColor = request.getParameter("pColor");
		
		session.removeAttribute("PCODE");
		session.removeAttribute("PCQTY");
		session.removeAttribute("PCOLOR");
		session.setAttribute("PCODE", pCode);
		session.setAttribute("PCOLOR", pColor);
		
		
	
		AdminDao dao = new AdminDao();  //db 연결
		
		dao.wishlistInsert(uid, pCode, pColor);
	}

}
