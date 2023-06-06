package com.javalec.tent.util;

import com.javalec.tent.dao.ProductDao;

public class ProductPageMaker {

	private int page = 1; // 시작 페이지
	// 페이지당 상품 수
    private int pageScale = 9;
    // 화면당 페이지 수
    private int blockScale = 5;
    
    ProductDao productDao = new ProductDao();
    int totalCount = productDao.productCount();
	int totalPage = (int) Math.ceil(totalCount / (double) pageScale);

	
	
	
    
    
    
}
