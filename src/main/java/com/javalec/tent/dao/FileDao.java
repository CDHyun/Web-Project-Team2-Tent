package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.Part;
import javax.sql.DataSource;

public class FileDao {
	DataSource dataSource;
	
	
	public FileDao() {
	    try {
	        Context initContext = new InitialContext();
	        Context envContext = (Context) initContext.lookup("java:comp/env");
	        dataSource = (DataSource) envContext.lookup("jdbc/tent");
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
	
	
	//파일업로드메서드
	public void upload(String fileName, String fileRealName, String pCode) {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = dataSource.getConnection();
	        String query = "INSERT INTO productfile (pfName, pfRealName, pCode) SELECT ?, ?, ? FROM product";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, fileName);
	        preparedStatement.setString(2, fileRealName);
	        preparedStatement.setInt(3, Integer.parseInt(pCode));
	        preparedStatement.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // 사용한 자원을 해제합니다.
	        if (preparedStatement != null) {
	            try {
	                preparedStatement.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}

	
}
