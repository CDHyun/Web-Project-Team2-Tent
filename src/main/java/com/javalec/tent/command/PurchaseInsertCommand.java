package com.javalec.tent.command;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.command.TentCommand;
import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.PurchaseDao;

public class PurchaseInsertCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub


		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		String pcDm = (String)session.getAttribute("PCDM");
		String pcPay = (String)session.getAttribute("PCPAY");
		int pCode = (int)session.getAttribute("PCODE");
		int pcQty = (int)session.getAttribute("PCQTY");
		String pColor = (String)session.getAttribute("PCOLOR");
		
		
		PurchaseDao dao = new PurchaseDao();
		dao.purchaseinsert(uid, pCode, pcQty, pcDm, pColor, pcPay);
		
		
	

//				  세션에서 값 가져오기
				 String cNoArrayString = (String) session.getAttribute("cNoArrayString");
				String[] values = cNoArrayString.substring(3, cNoArrayString.length() - 3).split("\",\"");
				int count = values.length;
				AdminDao daos = new AdminDao();
				
				 for (String value : values) {
				      daos.cartInsertAction(uid, value,pcDm,pcPay,count);
				  }
	
		
	}

}
