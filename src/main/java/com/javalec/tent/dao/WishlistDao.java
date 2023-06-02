package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.CartDto;
import com.javalec.tent.dto.WishlistDto;

public class WishlistDao {
	DataSource dataSource;
	
	
	public WishlistDao() {
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Tent");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<WishlistDto> wishlist(String uid){
		ArrayList<WishlistDto> dtos = new ArrayList<WishlistDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

	
		try {
			connection = dataSource.getConnection();
			String query = " select  p.pCode, p.pName, p.pBrandName ,p.pPrice , po.pColor, pf.pfName  from cart c, user u, product p, productOption po, productFile pf where u.uid = c.uid and c.pCode = p.pCode and po.pCode = p.pCode and pf.pCode = p.pCode and u.uid=? order by p.pCode";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			resultSet = preparedStatement.executeQuery();
		
			
			while(resultSet.next()) {
			String pfName = resultSet.getString(1);
			String pName = resultSet.getString(2);
			String pBrandName =resultSet.getString(3);
			int pCode = resultSet.getInt(4);
			int pPrice = resultSet.getInt(5);
		String pColor = resultSet.getString(6);
	
				
			
		WishlistDto dto = new WishlistDto(uid, pCode, pName, pPrice, pfName, pBrandName, pColor);
			dtos.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			}catch(Exception e) 	{
				e.printStackTrace();
			}
		}
		return dtos;
	}
	}
