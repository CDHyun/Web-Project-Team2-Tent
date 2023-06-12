package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dto.PurchaseDto;

public class PurchaseListCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
//		int pcNo = Integer.parseInt(request.getParameter("PCNO"));
//		session.setAttribute("PCNO", pcNo);
		
		//페이징 처리
		 String vpage = request.getParameter("vpage");
		    if(vpage==null){
		    	vpage = "1";
		    }
		int v_page = Integer.parseInt(vpage);
		int index_no = (v_page-1)*7;
		
		
		
	
		PurchaseDao dao = new PurchaseDao();
	
		// count select 
		int daocount = dao.pCount(uid);
		request.setAttribute("d_count", daocount);
		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
		dtos = dao.purchaseList(uid, index_no);
		request.setAttribute("purchaseList", dtos);
		
		
		
	}

}
