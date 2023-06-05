package com.javalec.tent.command;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.command.TentCommand;
import com.javalec.tent.dao.PurchaseDao;

public class PurchaseInsertCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub


		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		String sdm = (String)session.getAttribute("pcDM");
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		int pcQty = Integer.parseInt(request.getParameter("pcQty"));
		
		
		PurchaseDao dao = new PurchaseDao();
		dao.purchaseinsert(uid, pCode, pcQty, sdm);
		
	
		
	}

}
