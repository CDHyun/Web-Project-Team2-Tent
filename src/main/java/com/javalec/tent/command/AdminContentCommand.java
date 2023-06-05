package com.javalec.tent.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

public class AdminContentCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pCode =request.getParameter("pCode");
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
		
	
		
		AdminDao dao  = new AdminDao();
		
		
		// count select 
		int daocount = dao.pCount(queryName,queryContent);
		request.setAttribute("d_count", daocount);
		
		
		
		AdminDto dto = dao.contentView(pCode ,index_no);
		request.setAttribute("content_view", dto);

	}

}
