package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.command.TentCommand;
import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dto.ProductDto;
import com.javalec.tent.dto.PurchaseDto;

public class PurchaseInsertCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("SUID");
		String pcDm = (String) session.getAttribute("PCDM");
		String pcPay = (String) session.getAttribute("PCPAY");
		int pCode = (int) session.getAttribute("PCODE");
		int pcQty = (int) session.getAttribute("PCQTY");
		String pColor = (String) session.getAttribute("PCOLOR");

		PurchaseDao dao = new PurchaseDao();
		
		
		ArrayList<ProductDto> itemList = (ArrayList<ProductDto>)session.getAttribute("ITEM");
		
		if(itemList.size()==1) {
			
		
		for(int i=0; i<itemList.size(); i++) {
			int wkpCode = itemList.get(i).getpCode();
			int wkpcQty = itemList.get(i).getPcQty();
			String wkpColor = itemList.get(i).getpColor();
			dao.purchaseinsert(uid, wkpCode, wkpcQty, pcDm, wkpColor, pcPay);
		}
		
		}else {
			
			
		

		// 세션에서 값 가져오기
		String cNoArrayString = (String) session.getAttribute("cNoArrayString");
		String[] values = cNoArrayString.substring(3, cNoArrayString.length() - 3).split("\",\"");
		int count = values.length;
		AdminDao daos = new AdminDao();


			for (String value : values) {
				daos.cartInsertAction(uid, value, pcDm, pcPay, count);
			}
		

		}
	
	
	}

}
