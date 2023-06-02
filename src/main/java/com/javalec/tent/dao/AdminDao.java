package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.AdminDto;

public class AdminDao {
	DataSource dataSource;
	
	public AdminDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// function   
	
	public ArrayList<AdminDto> searchAction(String queryName, String queryContent) {
		if(queryName == null){ // 첫화면인 경우
			queryName = "p.pBrandName";
			queryContent = "";
		}
		
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String WhereDefault = "select p.pCode, p.pBrandName, p.pName ,po.pColor, p.pPrice, po.pStock, p.pinsertdate, pf.pfName, pf.pfRealName  from product p, productoption po, productfile pf ";
			String WhereDefault2 = " where p.pCode = po.pCode and p.pCode = pf.pCode and " + queryName + " like '%" +queryContent + "%'";
			preparedStatement = connection.prepareStatement(WhereDefault+WhereDefault2);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int pCode = resultSet.getInt(1);
				String pBrandName = resultSet.getString(2);
				String pName = resultSet.getString(3);
				String pColor = resultSet.getString(4);
				int pPrice = resultSet.getInt(5);
				int pStock = resultSet.getInt(6);
				Timestamp pInsertdate = resultSet.getTimestamp(7);
				String pfName = resultSet.getString(8);
				String pfRealName = resultSet.getString(9);
				
		
				AdminDto dto = new AdminDto(pCode, pBrandName, pName, pColor, pPrice, pStock, pInsertdate, pfName, pfRealName);
				dtos.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null){ // 무언가 들어가 있으면close
					resultSet.close();
				}
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return dtos;
	
	
	}
	
	//수정, 삭제하기위해 데이터보여주는 메서드
	public AdminDto contentView(String ppCode) {
		AdminDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select p.pCode, p.pBrandName, p.pName ,po.pColor, p.pPrice, po.pStock, p.pupdatedate,pf.pfName, pf.pfRealName  from product p, productoption po, productfile pf where p.pCode = po.pCode and p.pCode = pf.pCode and p.pCode=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, Integer.parseInt(ppCode));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int pCode = resultSet.getInt(1);
				String pBrandName = resultSet.getString(2);
				String pName = resultSet.getString(3);
				String pColor = resultSet.getString(4);
				int pPrice = resultSet.getInt(5);
				int pStock = resultSet.getInt(6);
				Timestamp pUpdatedate = resultSet.getTimestamp(7);
				String pfName = resultSet.getString(8);
				String pfRealName = resultSet.getString(9);
				
				dto = new AdminDto(pCode, pBrandName, pName, pColor, pPrice, pStock, pUpdatedate, pfName, pfRealName);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(resultSet != null){ // 무언가 들어가 있으면close
					resultSet.close();
				}
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dto;
		
	}// contentView
	
	
	
	// 데이터수정메서드
	public void updateAction(String pCode, String pBrandName,String pName, String pPrice, String pColor, String pStock, String pfName, String pfRealName) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			String query = "update product p,productoption po, productfile pf set p.pBrandName= ? ,p.pName=?, p.pPrice =? , po.pStock=?, pf.pfName=?, pf.pfRealName=? where p.pCode = po.pCode and p.pCode = pf.pCode and p.pCode =? and po.pcolor=?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, pBrandName);
			preparedStatement.setString(2, pName);
			preparedStatement.setString(3, pPrice);
			preparedStatement.setString(4, pStock);
			preparedStatement.setString(5, pfName);
			preparedStatement.setString(6, pfRealName);
			preparedStatement.setString(7, pCode);
			preparedStatement.setString(8, pColor);
			
			
			preparedStatement.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	
	
	
	
	// 데이터 삭제일자 업데이트 메서드 == 삭제 
	public void deleteAction(String pCode, String pColor) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update product p, productoption po set p.pDeletedate =now() and p.pDeleted=1 where p.pCode= po.pCode and p.pCode =? and po.pColor =?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1 ,pCode );
			preparedStatement.setString(2 ,pColor );
			
			
			preparedStatement.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}	
		
	
	
	//데이터 입력메서드

	public void insert(String pName, String pBrandName, String pPrice, String cgNo,String pfName, String pfRealName, String pCode, String pStock,String pColor, String pfNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedStatement1 = null;
		PreparedStatement preparedStatement2 = null;
		try {
	        connection = dataSource.getConnection();
	        String query = "INSERT INTO product (pName, pBrandName, pPrice, pInsertDate, cgNo) VALUES (?, ?, ?, NOW(), ?)";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, pName);
	        preparedStatement.setString(2, pBrandName);
	        preparedStatement.setInt(3, Integer.parseInt(pPrice));
	        preparedStatement.setInt(4, Integer.parseInt(cgNo));
	        preparedStatement.executeUpdate();

	        String query2 = "INSERT INTO productfile (pfNo, pfName, pfRealName, pCode) SELECT ?, ?, ?, ? FROM product WHERE pName=?";
	        preparedStatement1 = connection.prepareStatement(query2);
	        preparedStatement1.setInt(1, Integer.parseInt(pfNo));
	        preparedStatement1.setString(2, pfName);
	        preparedStatement1.setString(3, pfRealName);
	        preparedStatement1.setInt(4, Integer.parseInt(pCode));
	        preparedStatement1.setString(5, pName);

	        preparedStatement1.executeUpdate();

	        String query3 = "INSERT INTO productoption (pStock, pColor, pCode) SELECT ?, ?, ? FROM product WHERE pName=?";
	        preparedStatement2 = connection.prepareStatement(query3);
	        preparedStatement2.setInt(1,Integer.parseInt(pStock));
	        preparedStatement2.setString(2, pColor);
	        preparedStatement2.setInt(3, Integer.parseInt(pCode));
	        preparedStatement2.setString(4, pName);

	        preparedStatement2.executeUpdate();

		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
				if(preparedStatement != null) {
					preparedStatement.close();
				}
				if(connection != null) {
					connection.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	
	
}
