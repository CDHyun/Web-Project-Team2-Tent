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
		System.out.println("@@");
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

	public void insert(String pName, String pBrandName, String pPrice, String cgNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "INSERT INTO product (pName, pBrandName, pPrice, pInsertDate, cgNo) SELECT '?', '?', ?, NOW(), ? FROM category;";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, pName);
			preparedStatement.setString(2, pBrandName);
			preparedStatement.setString(3, pPrice);
			preparedStatement.setString(4, cgNo);
			
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
	
	
	
	
	
}
