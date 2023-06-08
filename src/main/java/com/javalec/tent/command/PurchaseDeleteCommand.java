package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.PurchaseDao;

public class PurchaseDeleteCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String pcNoString = request.getParameter("pcNo");
		int pcNo = Integer.parseInt(pcNoString);
		
		
		
		PurchaseDao dao  = new PurchaseDao();
		dao.purchaseDelete(pcNo);


	}

}
