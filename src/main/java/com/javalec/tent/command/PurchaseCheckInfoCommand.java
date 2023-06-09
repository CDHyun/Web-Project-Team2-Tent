package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dto.PurchaseDto;

public class PurchaseCheckInfoCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub


		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		int pCode = (int)session.getAttribute("PCODE");
		int pcQty = (int)session.getAttribute("PCQTY");
		String pColor = (String)session.getAttribute("PCOLOR");
		String pcPay = request.getParameter("o_pay_method");
		session.setAttribute("PCPAY", pcPay);
		
		
	
		PurchaseDao dao = new PurchaseDao();
	
		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
		dtos = dao.purchaseCheckList(pCode);
		request.setAttribute("purchaseCheckList", dtos);
		
	
			
		}
		
		
		
	

}
