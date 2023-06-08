package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dto.AdminDto;
import com.javalec.tent.dto.PurchaseDto;

public class AdminCartCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		int pcQty = Integer.parseInt(request.getParameter("pcQty"));
		String pColor = request.getParameter("pColor");

		
		session.removeAttribute("PCODE");
		session.removeAttribute("PCQTY");
		session.removeAttribute("PCOLOR");
		session.setAttribute("PCODE", pCode);
		session.setAttribute("PCQTY", pcQty);
		session.setAttribute("PCOLOR", pColor);
		
		System.out.println(uid);
		System.out.println(pCode);
		System.out.println(pcQty);
		System.out.println(pColor);
		
		AdminDao dao = new AdminDao();
		dao.cartInsert(uid,pCode,pcQty,pColor);
		
		
		dao.cartSelect(uid);
		
		ArrayList<AdminDto> dtos = dao.cartSelect(uid);
		request.setAttribute("cart", dtos);
		
		
	
		
		
	}

}
