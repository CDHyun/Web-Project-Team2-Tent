package com.javalec.tent.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.javalec.tent.dao.ProductDao;
import com.javalec.tent.dto.ProductDto;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/product_detail")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int pCode = Integer.parseInt(request.getParameter("pCode"));
		ArrayList<ProductDto> productInfo = new ArrayList<ProductDto>();
		ArrayList<ProductDto> colorList = new ArrayList<ProductDto>();
		ProductDao productDao = new ProductDao();
		productInfo = productDao.productDetail(pCode);
		colorList = productDao.productColorList(pCode);
		request.setAttribute("productInfo", productInfo);
		request.setAttribute("colorList", colorList);
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
