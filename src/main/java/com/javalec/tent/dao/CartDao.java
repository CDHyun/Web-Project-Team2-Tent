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
			String query = " select c.cNo, p.pCode, p.pName, p.pBrandName, p.pPrice, c.cQty, po.pColor, pf.pfName from user u, cart c,  product p , productFile pf , productOption po  where u.uid = c.uid and c.pCode = p.pCode and po.pCode = p.pCode and po.pCode = p.pCode and pf.pCode = p.pCode and  u.uid ='tjsgh' order by p.pCode";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			resultSet = preparedStatement.executeQuery();
		
			
			while(resultSet.next()) {
				int cNo = resultSet.getInt(1);
				int pCode = resultSet.getInt(2);
				String pName = resultSet.getString(3);
				String pBrandName =resultSet.getString(4);
				int pPrice = resultSet.getInt(5);
				int cQty = resultSet.getInt(6);
				String pColor = resultSet.getString(7);
			String pfName = resultSet.getString(8);
				
			
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
	
	public void cartDeleteAction(int pCode, String uid){
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

	
		try {
			connection = dataSource.getConnection();
			String query = " delete from cart where uid =? and pCode =?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			preparedStatement.setInt(2, pCode);
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
	public void cartUpdateAction(int cQty, int pStock, int cNo, String uid, int pCode) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

	
		try {
			connection = dataSource.getConnection();
			String query =" update cart c join product p on p.pCode = c.pCode join productOption po on p.pCode = po.pCode  set c.cQty = c.cQty + ? where c.uid = ? and c.pCode = ? and c.cQty <= po.pStock";
			//String query =" update cart c join product p on c.pCode = p.pCode set c.cQty = c.cQty + 2 where c.uid = 'tjsgh' and c.pCode = 1";
					
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			preparedStatement.setInt(2, pCode);
			
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
	public double totalPrice(String uid, int pCode){
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
	        preparedStatement.setInt(2, pCode);
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

	
	


		

