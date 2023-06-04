package com.javalec.tent.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.javalec.tent.dao.ProductDao;
import com.javalec.tent.dto.ProductDto;

public class ProductDetailCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		ArrayList<ProductDto> productInfo = new ArrayList<ProductDto>();
		ProductDao productDao = new ProductDao();
		productInfo = productDao.productDetail(pCode);
		request.setAttribute("productInfo", productInfo);
		
		Gson gson = new Gson();
		String json = gson.toJson(productInfo);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	

}
