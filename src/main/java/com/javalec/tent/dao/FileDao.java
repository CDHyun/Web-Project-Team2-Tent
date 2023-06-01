package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FileDao {
	DataSource dataSource;
	
	
	public FileDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/file");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	//파일업로드메서드
		public void upload(String fileName, String fileRealName, String pCode) {
			Connection connection = null;
			PreparedStatement preparedStatement = null;
			
			
				
			try {
				connection = dataSource.getConnection();
				String query = "INSERT INTO productfile (pfName, pfRealName, pCode) SELECT '?', '?', pCode FROM product WHERE pName = 'qwewqewqewqe' AND pBrandName = 'qwewqewqewqe' AND pPrice = 1112312;";
				preparedStatement = connection.prepareStatement(query);
				preparedStatement.setString(1, fileName);
				preparedStatement.setString(2, fileRealName);
				preparedStatement.executeUpdate(); 
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	
}
