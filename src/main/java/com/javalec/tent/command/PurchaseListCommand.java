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
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("SUID");

		String vpage = request.getParameter("vpage");
		int v_page;
		try {
			v_page = Integer.parseInt(vpage);
		} catch (NumberFormatException e) {
			v_page = 1; // 기본 페이지 번호 설정
		}

		int index_no = (v_page - 1) * 7;

		PurchaseDao dao = new PurchaseDao();

		int daocount = dao.pCount(uid);
		request.setAttribute("d_count", daocount);

		ArrayList<PurchaseDto> dtos = dao.purchaseList(uid, index_no);
		request.setAttribute("purchaseList", dtos);
	}
}
