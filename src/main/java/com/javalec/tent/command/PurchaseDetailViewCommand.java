package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dto.PurchaseDto;

public class PurchaseDetailViewCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		String pcNoString = request.getParameter("pcNo");
		System.out.println("****************************");
		System.out.println("******" + pcNoString);
        int pcNo = Integer.parseInt(pcNoString); ///
//        try {
//            pcNo = Integer.parseInt(pcNoString);
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//            return; 
//        }
        PurchaseDao dao = new PurchaseDao();
        PurchaseDto dto = dao.purchaseDetailView(uid, pcNo);

        request.setAttribute("purchaseDetail", dto);
		
	}

}
