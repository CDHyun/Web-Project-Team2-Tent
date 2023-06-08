package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.PurchaseDto;

public class PurchaseDao {

	//Field
	/* User */
	String uid;							// 유저 아이디
	String uPassword;					// 유저 비밀번호
	String uName;						// 유저 이름
	String uPhone;						// 유저 전화번호
	String uEmail;						// 유저 이메일
	
	
	/* UserAddress */
	int uaNo; 							// 유저 주소 번호(1~3까지 둘 생각)
	String uaZipcode;					// 유저 우편 번호
	String uaAddress;					// 유저 주소(API가 주는 값)
	String uaDetailAddress;				// 유저 상세 주소(직접 입력)

	
	/* Product */
	int pcNo;                           //상품 주문 번호
	int pCode;                          //상품 코드
	int pPrice;                         //상품 가격
	int pcQty;                          //상품 수량
	int pStock;                         //상품 재고
	int cgNo;				            //카테고리 번호
	String pColor;						//상품 색
	String pName;						// 상품명
	String pBrandName;                  //상품 브랜드 이름
	String pcInsertDate;             //상품 주문 날짜
	String pcDeleteDate;		        //상품 주문 취소 날짜
	String pcStatus;                    //상품 주문 상태 
	String pcDM;
	
	
	/* ProductFile */
	String pfName;			// 올린 상품 이미지 이름
	String pfRealName;		// 프로젝트에 저장된 실제 파일 이름
	String pfHoverName;		// 올린 호버 이미지 이름
	String pfHoverRealName;	// 프로젝트에 저장되는 실제 호버 이미지 이름

	
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

     public ArrayList<PurchaseDto> purchaseList(String uuid) {
 		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
 		System.out.println("DAO 호출");
 		Connection connection = null;
 		PreparedStatement preparedStatement = null;
 		ResultSet resultSet = null;

 		try {
 			connection = dataSource.getConnection();
 			String query = "SELECT u.uid, pc.pcNo, pc.pColor, p.pCode, p.pName, p.pPrice, pc.pcQty, pf.pfRealName, pf.pfHoverRealName, pc.pcStatus, pc.pcInsertDate, u.uName, u.uPhone, ua.uaAddress "
 							+ "FROM product p, user u, productfile pf, purchase pc, productOption po, userAddress ua " 
 							+ "WHERE pc.pCode = p.pCode and pf.pCode = p.pCode and po.pCode = p.pCode and u.uid = pc.uid and u.uid = ua.uid and u.uid = ? ";
 			

 			preparedStatement = connection.prepareStatement(query);
 			preparedStatement.setString(1, uuid);
 			resultSet = preparedStatement.executeQuery();

 		if (resultSet.next()) {
 			
 				String uid = resultSet.getString(1);
 				int pcNo = resultSet.getInt(2);
 				String pColor = resultSet.getString(3);
 				int pCode = resultSet.getInt(4);
 				String pName = resultSet.getString(5);
 				int pPrice = resultSet.getInt(6);
 				int pcQty = resultSet.getInt(7);
 				String pfRealName = resultSet.getString(8);
				String pfHoverRealName = resultSet.getString(9);
				String pcStatus = resultSet.getString(10);
				String pcInsertDate = resultSet.getString(11);
				String uName = resultSet.getString(12);
				String uPhone = resultSet.getString(13);
				String uaAddress = resultSet.getString(14);
 				
				
				PurchaseDto purchaseDto = new PurchaseDto(uid, uName, uPhone, uaAddress, pcNo, pCode, pPrice, pcQty, pColor, pName, pcInsertDate, pfRealName, pfHoverRealName, pcStatus);
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

 	public void purchaseinsert(String uid, int pCode, int pcQty, String pcDM, String pColor) { 
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = dataSource.getConnection();
			String query = "insert into purchase (uid, pCode, pcInsertDate, pcQty, pcDM, pColor) values(?, ?, now(), ?, ?, ?);";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			preparedStatement.setInt(2, pCode);
			preparedStatement.setInt(3, pcQty);
			preparedStatement.setString(4, pcDM);
			preparedStatement.setString(5, pColor);
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
 				String pcStatus = resultSet.getString(2);
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
  
// 	 public ArrayList<PurchaseDto> orderList(String uid) {
//  		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
//  		Connection connection = null;
//  		PreparedStatement preparedStatement = null;
//  		ResultSet resultSet = null;
//
//  		try {
//  			connection = dataSource.getConnection();
//  			String query = "SELECT u.uid, pc.pcNo, pc.pColor, p.pCode, p.pName, p.pPrice, pc.pcQty, pf.pfRealName, pf.pfHoverRealName, pc.pcInsertDate, u.uName, u.uPhone, ua.uaAddress, pc.pcStatus " 
//  					+ "FROM purchase pc, product p, user u, productfile pf, productOption po, userAddress ua "
//  					+ "WHERE pc.pCode = p.pCode and pf.pCode = p.pCode and po.pCode = p.pCode and u.uid = pc.uid and u.uid = ua.uid and u.uid = ?";
//  			
//  			preparedStatement = connection.prepareStatement(query);
//  			preparedStatement.setString(1, uid);
//  			resultSet = preparedStatement.executeQuery();
//
//  			while (resultSet.next()) {
//  				String wkuid = resultSet.getString(1);
//  				int pcNo = resultSet.getInt(2);
//  				String pColor = resultSet.getString(3);
//  				int pCode = resultSet.getInt(4);
//  				String pName = resultSet.getString(5);
//  				int pPrice = resultSet.getInt(6);
//  				int pcQty = resultSet.getInt(7);
//  				String pfRealName = resultSet.getString(8);
// 				String pfHoverRealName = resultSet.getString(9);
// 				String pcInsertDate = resultSet.getString(10);
// 				String uName = resultSet.getString(11);
// 				String uPhone = resultSet.getString(12);
// 				String uaAddress = resultSet.getString(13);
// 				String pcStatus = resultSet.getString(14);
// 				
//  				PurchaseDto purchaseDto = new PurchaseDto(wkuid, uName, uPhone, uaAddress, pcNo, pCode, pPrice, pcQty, pColor, pName, pcInsertDate, pfRealName, pfHoverRealName, pcStatus);
//  				dtos.add(purchaseDto);
//  			}
//
//  		} catch (Exception e) {
//  			e.printStackTrace();
//  		} finally {
//  			try {
//  				if (resultSet != null)
//  					resultSet.close();
//  				if (preparedStatement != null)
//  					preparedStatement.close();
//  				if (connection != null)
//  					connection.close();
//  			} catch (Exception e) {
//  				e.printStackTrace();
//  			}
//  		}
//
//  		return dtos;
//
//  	}
//
// 	 
 	  public ArrayList<PurchaseDto> purchaseCheckList(String uuid, int ppcode) {  // 주문정보 보여주기 메서드 상품디테일에서 넘어오면 수행
 	 		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
 	 		System.out.println("DAO 호출");
 	 		Connection connection = null;
 	 		PreparedStatement preparedStatement = null;
 	 		ResultSet resultSet = null;

 	 		try {
 	 			connection = dataSource.getConnection();
 	 			String query = "SELECT u.uid, p.pCode, p.pName, p.pPrice, pf.pfRealName, pf.pfHoverRealName, pc.pcStatus "
 	 							+ "FROM product p, user u, productfile pf, purchase pc " 
 	 							+ "WHERE pc.pCode = p.pCode and pc.uid = u.uid and pf.pCode = p.pCode and p.pCode = ? and u.uid = ?";
 	 			preparedStatement = connection.prepareStatement(query);
 	 			preparedStatement.setInt(1, ppcode);
 	 			preparedStatement.setString(2, uuid);
 	 			
 	 			resultSet = preparedStatement.executeQuery();

 	 		if (resultSet.next()) {
 	 			
 	 				String uid = resultSet.getString(1);
 	 				int pCode = resultSet.getInt(2);
 	 				String pName = resultSet.getString(3);
 	 				int pPrice = resultSet.getInt(4);
 	 				String pfRealName = resultSet.getString(5);
 					String pfHoverRealName = resultSet.getString(6);
 					String pcStatus = resultSet.getString(7);
 	 				PurchaseDto purchaseDto = new PurchaseDto(uid, pCode, pPrice, pName, pcStatus, pfRealName, pfHoverRealName);
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
 	 

 	    // 주문 취소
 	    public void cancelPurchase(int pcNo) {
 	    	Connection connection = null;
 	 		PreparedStatement preparedStatement = null;
 	 		ResultSet resultSet = null;

 	 		try {
 	 			connection = dataSource.getConnection();
 	 			String query = "select pCode, pcQty from purchase where pcNo = ? and pcStatus -1";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, pcNo);
			resultSet = preparedStatement.executeQuery();

 	            // 주문된 상품 정보 조회
 	            if (resultSet.next()) {
 	            	int pCode = resultSet.getInt(1);
 	            	int pStock = resultSet.getInt(2);
 	            	
 	                // 재고 수량 증가
 	                increaseStockQuantity(pCode, pStock);
 	            }
 	        }catch (Exception e) {
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
						// TODO: handle exception
					}
				}
	 		}
 	    
 	    
 	    // 재고 수량 차감
 	    private boolean decreaseStockQuantity(int pCode, int pStock) {
 	    	Connection connection = null;
 	 		PreparedStatement preparedStatement = null;
 	 		ResultSet resultSet = null;
 	 		boolean result = false;

 	 		try {
 	 			connection = dataSource.getConnection();
 	 			String query = "update productOption set pStock = pStock - ? WHERE pCode = ?";
 	 			preparedStatement = connection.prepareStatement(query);
 	 			preparedStatement.setInt(1, pStock);
 	 			preparedStatement.setInt(2, pCode);
 	            
 	            int affectedRows = preparedStatement.executeUpdate();
 	            if(affectedRows > 0) {
 	            	result = true;
 	            }
 	        } catch (Exception e) {
 	            e.printStackTrace();
 	            // 예외 처리
 	            return false;
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
 	 		return result;
 	    }
 	    
 	    // 재고 수량 증가
 	    private void increaseStockQuantity(int pCode, int pStock) {
 	    	Connection connection = null;
 	 		PreparedStatement preparedStatement = null;
 	 		ResultSet resultSet = null;
 	 		
 	        try  {
 	 			connection = dataSource.getConnection();
 	 			String query = "update productOption set pStock = pStock + ? WHERE pCode = ?";
 	 			preparedStatement = connection.prepareStatement(query);
 				preparedStatement.setInt(1, pStock);
 				preparedStatement.setInt(2, pCode);
 				preparedStatement.executeUpdate();
 	            
 	        } catch (Exception e) {
 	            e.printStackTrace();
 	            // 예외 처리
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
 	    }
 	    
 	    
 		public void purchaseDelete(int pcNo) {
 			Connection connection = null;
 			PreparedStatement preparedStatement = null;
 			
 			try {
 				connection = dataSource.getConnection();
 				String query = "update purchase pc set pcDeleteDate=now() ,pcDeleted =1 where pc.pcNo =?";
 				preparedStatement = connection.prepareStatement(query);
 				preparedStatement.setInt(1, pcNo);
 				
 				
 				
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
 			
 	 


	
}//END
	