package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

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
		
	
		AdminDao dao = new AdminDao();  //db 연결
		
		
		
		dao.cartInsert(uid,pCode,pcQty,pColor); // 카트테이블에 데이터 넣기
		
		
	 
	
	}

}
