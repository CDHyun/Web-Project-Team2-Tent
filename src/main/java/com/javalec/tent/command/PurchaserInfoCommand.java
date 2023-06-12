package com.javalec.tent.command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javalec.tent.dao.ProductDao;
import com.javalec.tent.dao.PurchaseDao;
import com.javalec.tent.dao.UserDao;
import com.javalec.tent.dto.ProductDto;
import com.javalec.tent.dto.PurchaseDto;
import com.javalec.tent.dto.UserDto;

public class PurchaserInfoCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("PurchaserInfo 호출 완료");

			// TODO Auto-generated method stub
			HttpSession session = request.getSession();
			String uid = (String)session.getAttribute("SUID");
			
			int pCode = Integer.parseInt(request.getParameter("pCode"));
			int pcQty = Integer.parseInt(request.getParameter("pcQty"));
			String pColor = request.getParameter("pColor");
			
			System.out.println(pCode + "" + pcQty + "" + pColor + "도착");
			session.removeAttribute("PCODE");
			session.removeAttribute("PCQTY");
			session.removeAttribute("PCOLOR");
			session.setAttribute("PCODE", pCode);
			session.setAttribute("PCQTY", pcQty);
			session.setAttribute("PCOLOR", pColor);
			
			ProductDao productDao = new ProductDao();
			ArrayList<ProductDto> productInfo = new ArrayList<ProductDto>();
			productInfo = productDao.productInfo(pCode);
			String pName = productInfo.get(0).getpName();
			String pfRealName = productInfo.get(0).getPfRealName();
			int pPrice = productInfo.get(0).getpPrice();
			ArrayList<ProductDto> productInfo2 = new ArrayList<ProductDto>();
			ProductDto productDto = new ProductDto(pCode, pName, pPrice, pcQty, pfRealName, pColor);
			productInfo2.add(productDto);
			session.removeAttribute("ITEM");
			session.setAttribute("ITEM", productInfo2);
			
			
			
			
			String cNoArrayString = "[[]]";
			session.removeAttribute("cNoArrayString");
			  session.setAttribute("cNoArrayString", cNoArrayString);
			
			
//			String uid = "donghyun"; //****
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

		
		