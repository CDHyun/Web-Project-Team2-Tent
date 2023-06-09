package com.javalec.tent.command;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.command.TentCommand;
import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

public class AdminCartSelectCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		
	
		
		
		AdminDao dao = new AdminDao();  //db 연결
		
		
		
		// 카트테이블에서 데이터불러오기
		
		ArrayList<AdminDto> dtos = dao.cartSelect(uid);  // 가져온 데이터를 cart에 넣기
		request.setAttribute("cart", dtos);
		
		
		
		int dtoss =  dao.cCountSum(uid);
		request.setAttribute("cartTotal", dtoss);  // 가져온 총합계금액을 cartTotal에 넣기
		

	}

}
