package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dto.AdminDto;

public class AdminSummaryCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		AdminDao dao = new AdminDao();   // dB 연결
		
		// 막대차트데이터가져오기
		ArrayList<AdminDto> dtos = dao.chart();
		request.setAttribute("summary", dtos);
		
		 // JSP 페이지로 전달되는 데이터를 JavaScript 배열로 변환
        StringBuilder data = new StringBuilder();
        for (AdminDto dto : dtos) {
            data.append(dto.getDaySum()).append(",");
        }
        request.setAttribute("data", data.toString());
     
        
      
        
        //도넛차트데이터가져오기
        ArrayList<AdminDto> dtos1 = dao.donut();
        request.setAttribute("donut", dtos1);
     
        
        StringBuilder data1 = new StringBuilder();
        for (AdminDto dto : dtos1) {
            data1.append(dto.getColorSum()).append(",");
        }
        request.setAttribute("datas", data1.toString()); 
        
       
        
        // 날짜별 매출
        ArrayList<AdminDto> dtos2 = dao.dailySale(startDate,endDate);
        request.setAttribute("SALES", dtos2);
       
       
        //매출액 보여주기
        AdminDto lastDto = dtos2.get(dtos2.size() - 1);
        request.setAttribute("TOTAL", lastDto.getTotal());
        

	}

}
