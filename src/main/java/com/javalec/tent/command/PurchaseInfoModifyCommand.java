package com.javalec.tent.command;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.command.TentCommand;
import com.javalec.tent.dao.UserDao;
import com.javalec.tent.dto.UserDto;

public class PurchaseInfoModifyCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		UserDao userDao = new UserDao();
		ArrayList<UserDto> addressList = new ArrayList<UserDto>();
		addressList = userDao.userAddressInfo(uid);
		request.setAttribute("addressList", addressList);
	}

}
