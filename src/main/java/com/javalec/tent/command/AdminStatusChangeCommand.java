package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.AdminDao;

public class AdminStatusChangeCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int pcStatus = Integer.parseInt( request.getParameter("status"));
		int pcNo = Integer.parseInt( request.getParameter("pcNo"));
		
		//pcNo를 받는법을 모르겠다.
		
		
		System.out.println("pcStatus : "+pcStatus);
		System.out.println("pcNo : "+pcNo);  //1고정 ?
		
		
		
		
		AdminDao dao = new AdminDao();
		dao.statusUpdate(pcStatus,pcNo);
		

	}

}
