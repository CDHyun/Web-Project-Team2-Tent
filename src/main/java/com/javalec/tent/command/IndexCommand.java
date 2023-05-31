package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.ProductDao;
import com.javalec.tent.dto.ProductDto;

public class IndexCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String queryContent = request.getParameter("content");
		ArrayList<ProductDto> productList = new ArrayList<ProductDto>();
		ProductDao productDao = new ProductDao();
		productList = productDao.productList(queryContent);
		request.setAttribute("productList", productList);

	}

}	// End Class
