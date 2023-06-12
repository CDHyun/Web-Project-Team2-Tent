package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.PurchaseDao;

public class PurchaseDeleteCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String pcNoString = request.getParameter("pcNo");
		int pcNo = Integer.parseInt(pcNoString);
		System.out.println(pcNo);
		
		PurchaseDao dao  = new PurchaseDao();
//		dao.purchaseDelete(pcNo);
		dao.cancelPurchase(pcNo);


	}

}
