package com.javalec.tent.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dao.UserDao;
import com.javalec.tent.dto.PurchaseDto;
import com.javalec.tent.dto.UserDto;

public class AdminCartUserInfoCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		String uid = (String)session.getAttribute("SUID");
		
		  String[] cNoArray = request.getParameterValues("cNoArrayInput");
		  String cNoArrayString = Arrays.toString(cNoArray);
		  
		  
		  session.removeAttribute("cNoArrayString");
		  session.setAttribute("cNoArrayString", cNoArrayString);
		  System.out.println(cNoArrayString);
	    

		 
		  
		  PurchaseDao dao = new PurchaseDao();
			ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
			UserDao userDao = new UserDao();
			ArrayList<UserDto> userInfo = new ArrayList<UserDto>();
			userInfo = userDao.userAddressInfo(uid);
			dtos = dao.selectUser(uid);
		
		
			request.setAttribute("selectUser", dtos);
			request.setAttribute("address", userInfo);
		
	  
	}

}
