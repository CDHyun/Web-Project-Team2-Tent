package com.javalec.tent.command;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dto.PurchaseDto;

public class PurchaserInfoCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("PurchaserInfo 호출 완료");

			// TODO Auto-generated method stub
			HttpSession session = request.getSession();
			String uid = (String)session.getAttribute("SUID");
			
			int pCode = Integer.parseInt(request.getParameter("pCode"));
			int pcQty = Integer.parseInt(request.getParameter("pcQty"));
			String pColor = request.getParameter("pColor");
			
			System.out.println(pCode + "" + pcQty + "" + pColor + "도착");
			session.removeAttribute("PCODE");
			session.removeAttribute("PCQTY");
			session.removeAttribute("PCOLOR");
			session.setAttribute("PCODE", pCode);
			session.setAttribute("PCQTY", pcQty);
			session.setAttribute("PCOLOR", pColor);
					
			
//			String uid = "donghyun"; //****
			PurchaseDao dao = new PurchaseDao();
			ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
			dtos = dao.selectUser(uid);
		
		
			request.setAttribute("selectUser", dtos);

		}

	}

		
		