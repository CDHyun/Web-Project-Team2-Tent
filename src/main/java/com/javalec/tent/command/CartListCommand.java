package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

public class CartListCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		AdminDao adminDao = new AdminDao();
		ArrayList<AdminDto> cart = new ArrayList<AdminDto>();
		cart = adminDao.cartSelect(uid);
		
		request.setAttribute("cart", cart);
		
	}

}
