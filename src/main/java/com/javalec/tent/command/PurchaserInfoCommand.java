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
//			String uid = "donghyun"; //****
			PurchaseDao dao = new PurchaseDao();
			ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
			dtos = dao.selectUser(uid);
		
		
			request.setAttribute("selectUser", dtos);

		}

	}

		
		
