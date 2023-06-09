package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.PurchaseDao;

public class PurchaseDetailViewCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		
		String pcNoString = request.getParameter("pcNo");
		int pcNo = Integer.parseInt(pcNoString);
		
		
		PurchaseDao dao = new PurchaseDao();
		dao.purchaseDetailView(uid, pcNo);
	}

}
