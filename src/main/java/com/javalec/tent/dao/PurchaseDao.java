package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.PurchaseDto;

public class PurchaseDao {

	//Field

	
	DataSource dataSource;
	
public PurchaseDao() {
	// TODO Auto-generated constructor stub
	try {
		Context context = new InitialContext();
		dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
	} catch (Exception e) {
		e.printStackTrace();
	}
}


     public ArrayList<PurchaseDto> selectUser(String uid) {
 		ArrayList<PurchaseDto> beanList = new ArrayList<PurchaseDto>();
 		Connection connection = null;
 		PreparedStatement preparedStatement = null;
 		ResultSet resultSet = null;

 		try {
 			connection = dataSource.getConnection();
 			String query = "select uName, uPhone, uEmail, uaAddress, uaDetailAddress, uaZipcode "
 					+ "from user u, userAddress ua "
 					+ "where u.uid = ua.uid and u.uid = ?";
 			preparedStatement = connection.prepareStatement(query); 
 			preparedStatement.setString(1, uid);
 			resultSet = preparedStatement.executeQuery();
 			
 			if(resultSet.next()) {
 				String uName = resultSet.getString(1);
 				String uPhone = resultSet.getString(2);
 				String uEmail = resultSet.getString(3);
 				String uaAddress = resultSet.getString(4);
 				String uaDetailAddress = resultSet.getString(5);
 				String uaZipcode = resultSet.getString(6);
 				
 				PurchaseDto dto = new PurchaseDto(uid, uName, uPhone, uEmail, uaZipcode, uaAddress, uaDetailAddress);
 				beanList.add(dto);
 			}

 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			try {
 				if (resultSet != null)
 					resultSet.close();
 				if (preparedStatement != null)
 					preparedStatement.close();
 				if (connection != null)
 					connection.close();
 			} catch (Exception e) {
 				e.printStackTrace();
 			}
 		}
 		return beanList;
 	}

     public ArrayList<PurchaseDto> purchaseList(String uid) {
 		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
 		System.out.println("DAO 호출");
 		Connection connection = null;
 		PreparedStatement preparedStatement = null;
 		ResultSet resultSet = null;

 		try {
 			connection = dataSource.getConnection();
 			String query = "SELECT u.uid, pc.pcNo, p.pCode, p.pName, p.pPrice, pc.pcQty, pf.pfRealName, pf.pfHoverRealName "
 							+ "FROM purchase pc, product p, user u, productfile pf " 
 							+ "WHERE pc.pCode = p.pCode and pf.pCode = p.pCode and u.uid = pc.uid and u.uid = ?";
 			preparedStatement = connection.prepareStatement(query);
 			preparedStatement.setString(1, uid);
 			resultSet = preparedStatement.executeQuery();

 			while (resultSet.next()) {
 				int pcNo = resultSet.getInt(1);
 				int pCode = resultSet.getInt(2);
 				String pName = resultSet.getString(3);
 				int pPrice = resultSet.getInt(4);
 				int pcQty = resultSet.getInt(5);
 				String pfRealName = resultSet.getString(6);
				String pfHoverRealName = resultSet.getString(7);
 				PurchaseDto purchaseDto = new PurchaseDto(uid, pcNo, pCode, pPrice, pcQty, pName, pfRealName, pfHoverRealName);
 				dtos.add(purchaseDto);
 			}

 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			try {
 				if (resultSet != null)
 					resultSet.close();
 				if (preparedStatement != null)
 					preparedStatement.close();
 				if (connection != null)
 					connection.close();
 			} catch (Exception e) {
 				e.printStackTrace();
 			}
 		}

 		return dtos;

 	}

 	public void purchaseinsert(String uid, int pCode, int pcQty, String pcDM) { 
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = dataSource.getConnection();
			String query = "insert into purchase (uid, pCode, pcInsertDate, pcQty, pcDM) values(?, ?, now(), ?, ?);";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			preparedStatement.setInt(2, pCode);
			preparedStatement.setInt(3, pcQty);
			preparedStatement.setString(4, pcDM);
			preparedStatement.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
				if (connection != null)
					connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
 	public ArrayList<PurchaseDto> completeList(String uid) {
 		ArrayList<PurchaseDto> beanList = new ArrayList<PurchaseDto>();
 		Connection connection = null;
 		PreparedStatement preparedStatement = null;
 		ResultSet resultSet = null;

 		try {
 			connection = dataSource.getConnection();
 			String query = "select u.uid pc.pcstatus "
 					+ "from user u, purchase pc "
 					+ "where u.uid = pc.uid and u.uid = ?";
 			preparedStatement = connection.prepareStatement(query); 
 			preparedStatement.setString(1, uid);
 			resultSet = preparedStatement.executeQuery();
 			
 			while (resultSet.next()) {
 				String pcStatus = resultSet.getString(6);
 				PurchaseDto dto = new PurchaseDto(uid, pcStatus);
 				beanList.add(dto);
 			}

 		} catch (Exception e) {
 			e.printStackTrace();
 		} finally {
 			try {
 				if (resultSet != null)
 					resultSet.close();
 				if (preparedStatement != null)
 					preparedStatement.close();
 				if (connection != null)
 					connection.close();
 			} catch (Exception e) {
 				e.printStackTrace();
 			}
 		}
 		return beanList;
 	}
  
 	 public ArrayList<PurchaseDto> orderList(String uid) {
  		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
  		Connection connection = null;
  		PreparedStatement preparedStatement = null;
  		ResultSet resultSet = null;

  		try {
  			connection = dataSource.getConnection();
  			String query = "SELECT u.uid, p.pCode, p.pName, p.pPrice, pc.pcQty, pf.pfRealName, pf.pfHoverRealName, pc.pcInsertDate "
  							+ "FROM purchase pc, product p, user u, productfile pf " 
  							+ "WHERE pc.pCode = p.pCode and pf.pCode = p.pCode and u.uid = pc.uid and u.uid = ?";
  			preparedStatement = connection.prepareStatement(query);
  			preparedStatement.setString(1, uid);
  			resultSet = preparedStatement.executeQuery();

  			while (resultSet.next()) {
  				int pCode = resultSet.getInt(1);
  				String pName = resultSet.getString(2);
  				int pPrice = resultSet.getInt(3);
  				int pcQty = resultSet.getInt(4);
  				String pfRealName = resultSet.getString(5);
 				String pfHoverRealName = resultSet.getString(6);
 				Timestamp insertDate = resultSet.getTimestamp(7);
 				
  				PurchaseDto purchaseDto = new PurchaseDto(uid, pCode, pPrice, pcQty, pName, insertDate, pfRealName, pfHoverRealName);
  				dtos.add(purchaseDto);
  			}

  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {
  			try {
  				if (resultSet != null)
  					resultSet.close();
  				if (preparedStatement != null)
  					preparedStatement.close();
  				if (connection != null)
  					connection.close();
  			} catch (Exception e) {
  				e.printStackTrace();
  			}
  		}

  		return dtos;

  	}



	
}//END
	