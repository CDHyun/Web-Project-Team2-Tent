package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.CartDto;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

public class CartDao {
DataSource dataSource;
	

	//
	public CartDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Tent");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<CartDto> cart(String uid){
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

	
		try {
			connection = dataSource.getConnection();
			String query = " select c.cNo, p.pCode, p.pName, p.pBrandName ,p.pPrice ,c.cQty, po.pColor, pf.pfName  from cart c, user u, product p, productOption po, productFile pf where u.uid = c.uid and c.pCode = p.pCode and po.pCode = p.pCode and pf.pCode = p.pCode and u.uid=? order by p.pCode";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			resultSet = preparedStatement.executeQuery();
		
			
			while(resultSet.next()) {
				int cNo = resultSet.getInt(1);
			String pfName = resultSet.getString(2);
			String pName = resultSet.getString(3);
			String pBrandName =resultSet.getString(4);
			int pCode = resultSet.getInt(5);
			int pPrice = resultSet.getInt(6);
		String pColor = resultSet.getString(7);
		int cQty = resultSet.getInt(8);
				
			
		CartDto dto = new CartDto(cNo, cQty, uid, pCode, pName, pPrice, pfName, pBrandName, pColor);
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
	
	public void cartDeleteAction(int pCode){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

	
		try {
			connection = dataSource.getConnection();
			String query = " delete from cart where pCode =?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, pCode);
			preparedStatement.executeUpdate();
			
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
	}
	public void cartUpdateAction(int cQty, int pStock, int cNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

	
		try {
			connection = dataSource.getConnection();
			String query =" UPDATE cart c JOIN product p ON c.pCode = p.pCode SET c.cQty = ? WHERE c.cNo = ? AND c.cQty <= p.pStock";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, cQty);
			preparedStatement.setInt(2, cNo);
			
			preparedStatement.executeUpdate();
			
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
	}
	
	// 작동 되는지 봐야함
	public double totalPrice(String uid, String pCode){
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    double total = 0;

	    try {
	        connection = dataSource.getConnection();

	        // 선택한 물건 가격 계산
	        String query = "SELECT SUM(p.pPrice * c.cQty) AS total FROM cart c JOIN product p ON c.pCode = p.pCode WHERE c.uid = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, uid);
	        preparedStatement.setString(2, pCode);
	        resultSet = preparedStatement.executeQuery();

	        if(resultSet.next()) {
	            total = resultSet.getDouble("total");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if(resultSet != null) resultSet.close();
	            if(preparedStatement != null) preparedStatement.close();
	            if(connection != null) connection.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return total;
	}
	
	
	
	
}// End

	
	


		

