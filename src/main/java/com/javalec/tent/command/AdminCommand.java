package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

public class AdminCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		//검색기능에 필요한 변수
		String queryName = request.getParameter("query");
		String queryContent = request.getParameter("content");
		
		
		
		//페이징 처리
		 String vpage = request.getParameter("vpage");
		    if(vpage==null){
		    	vpage = "1";
		    }
		int v_page = Integer.parseInt(vpage);
		int index_no = (v_page-1)*7;
		
	
		
		

		AdminDao dao = new AdminDao();   // dB 연결
	
		
		
		// count select 
		int daocount = dao.pCount(queryName, queryContent);
		request.setAttribute("d_count", daocount);
		
		
		// all product select 
			ArrayList<AdminDto> dtos = dao.searchAction(queryName, queryContent,index_no);
			request.setAttribute("list", dtos);
			
			
	}		

}
