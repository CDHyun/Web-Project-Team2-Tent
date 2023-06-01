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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// function   String queryName, String queryContent
	
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
	
	
}
