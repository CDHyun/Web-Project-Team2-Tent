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
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	
	
	
	//파일업로드메서드
	public void upload(String fileName, String fileRealName,String hoverName,String hoverRealName, String pCode) {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;

	    try {
	        connection = dataSource.getConnection();
	        String query = "INSERT INTO productfile (pfName, pfRealName,pfHoverName,pfHoverRealName, pCode) SELECT ?, ?, ?,?,? FROM product limit 1";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, fileName);
	        preparedStatement.setString(2, fileRealName);
	        preparedStatement.setString(3, hoverName);
	        preparedStatement.setString(4, hoverRealName);
	        preparedStatement.setInt(5, Integer.parseInt(pCode));
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
	//파일업로드 수정
	public void uploading(String fileName, String fileRealName, String pCode) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "update productfile pf, product p set pf.pfName=?, pf.pfRealName=? where p.pCode = pf.pCode and p.pCode=?";	  
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, fileName);
			preparedStatement.setString(2, fileRealName);
			preparedStatement.setString(3, pCode);
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
