package com.javalec.tent.command;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.UserDao;
import com.javalec.tent.dto.UserDto;

public class UserInfoCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
//		String uid = request.getParameter("uid");
		UserDao userDao = new UserDao();
		ArrayList<UserDto> userinfo = new ArrayList<UserDto>();
		userinfo = userDao.userinfo(uid);
		request.setAttribute("userInfo", userinfo);

	}

}
