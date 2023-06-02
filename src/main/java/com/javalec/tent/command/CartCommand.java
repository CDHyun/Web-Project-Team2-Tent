package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.CartDao;
import com.javalec.tent.dto.CartDto;

public class CartCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		CartDao dao = new CartDao();
		ArrayList<CartDto> dtos= dao.cart("uid");
		double totalPrice = dao.totalPrice("uid");
		request.setAttribute("cart", dtos);
		request.setAttribute("TOTALPRICE", totalPrice);
	}

}
