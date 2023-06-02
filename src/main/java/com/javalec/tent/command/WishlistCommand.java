package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.CartDao;
import com.javalec.tent.dao.WishlistDao;
import com.javalec.tent.dto.CartDto;
import com.javalec.tent.dto.WishlistDto;

public class WishlistCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		WishlistDao dao = new WishlistDao();
		ArrayList<WishlistDto> dtos= dao.wishlist("uid");
		request.setAttribute("wishlist", dtos);
	}

}
