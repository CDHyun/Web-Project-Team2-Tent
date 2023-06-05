package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dto.PurchaseDto;

public class PurchaseCheckInfoCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub


		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		PurchaseDao dao = new PurchaseDao();
	
		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
		dtos = dao.purchaseList(uid);
		request.setAttribute("purchaseList", dtos);
		
		
		
	}

}