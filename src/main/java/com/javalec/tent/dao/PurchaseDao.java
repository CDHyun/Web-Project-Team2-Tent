package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.AdminDto;
import com.javalec.tent.dto.PurchaseDto;
import com.javalec.tent.dto.UserDto;

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

//주문자 정보 불러오기//
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

     
     //구매내역 마지막 페이지 데이터 불러오기//
     public ArrayList<PurchaseDto> purchaseList(String uid) {
 		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
 		System.out.println("DAO 호출");
 		Connection connection = null;
 		PreparedStatement preparedStatement = null;
 		ResultSet resultSet = null;

 		try {
 			connection = dataSource.getConnection();
 			String query = "SELECT pc.pcNo, p.pCode, p.pName, p.pPrice, pc.pcQty, pc.pcStatus, pc.pcInsertDate, u.uPhone, pf.pfRealName, pf.pfHoverRealName, pcPay "
 					+"FROM product p, user u, purchase pc, productfile pf "
 					+"WHERE pc.pCode = p.pCode and pf.pCode = p.pCode and u.uid = pc.uid and pc.pcDeleted=0 and u.uid = ?";
 			

 			preparedStatement = connection.prepareStatement(query);
 			preparedStatement.setString(1, uid);
 			resultSet = preparedStatement.executeQuery();

 		while (resultSet.next()) {
 			
 				
 				int pcNo = resultSet.getInt(1);
 				int pCode = resultSet.getInt(2);
 				String pName = resultSet.getString(3);
 				int pPrice = resultSet.getInt(4);
 				int pcQty = resultSet.getInt(5);
 				String pcStatus = resultSet.getString(6);
				String pcInsertDate = resultSet.getString(7);
				String uPhone = resultSet.getString(8);
				String pfRealName = resultSet.getString(9);
				String pfHoverRealName = resultSet.getString(10);
				String pcPay = resultSet.getString(11);
 				
				 
//			    int cQty = getCQtyCart(uid, pCode); // 장바구니에서 cQty 가져오기
//			    int realQty = (pcQty != cQty) ? Math.max(pcQty, cQty) : pcQty
				
				PurchaseDto purchaseDto = new PurchaseDto(uid, uPhone, pcNo, pPrice, pcQty, pName, pcInsertDate, pcStatus, pfRealName, pfHoverRealName, pcPay);
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

     
     //purchase_check에서 order 누르면 db에 데이터 삽입하기//
 	public void purchaseinsert(String uid, int pCode, int pcQty, String pcDM, String pColor, String pcPay) { 
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = dataSource.getConnection();
			String query = "insert into purchase (uid, pCode, pcInsertDate, pcQty, pcDM, pColor, pcPay) values(?, ?, now(), ?, ?, ?, ?);";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, uid);
			preparedStatement.setInt(2, pCode);
			preparedStatement.setInt(3, pcQty);
			preparedStatement.setString(4, pcDM);
			preparedStatement.setString(5, pColor);
			preparedStatement.setString(6, pcPay);
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
 	
 	
	//purchase_complete페이지에서 데이터 불러오기
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
 
 	
 	//주문내역 확인하는 method//
 	  public ArrayList<PurchaseDto> purchaseCheckList(int ppcode) {  // 주문정보 보여주기 메서드 상품디테일에서 넘어오면 수행
 	 		ArrayList<PurchaseDto> dtos = new ArrayList<PurchaseDto>();
 	 		System.out.println("DAO 1호출");
 	 		Connection connection = null;
 	 		PreparedStatement preparedStatement = null;
 	 		ResultSet resultSet = null;
 	 		
 	 		try {
 	 			connection = dataSource.getConnection();
 	 			String query = "SELECT p.pName, p.pPrice, pf.pfRealName, pf.pfHoverRealName "
 	 							+ "FROM product p, productfile pf " 
 	 							+ "WHERE pf.pCode = p.pCode and p.pCode = ? ";
 	 			preparedStatement = connection.prepareStatement(query);
 	 			preparedStatement.setInt(1, ppcode);
 	 			resultSet = preparedStatement.executeQuery();

 	 			if (resultSet.next()) {
 	 				String pName = resultSet.getString(1);
 	 				int pPrice = resultSet.getInt(2);
 	 				String pfRealName = resultSet.getString(3);
 					String pfHoverRealName = resultSet.getString(4);
 	 				PurchaseDto purchaseDto = new PurchaseDto(ppcode, pPrice, pName, pfRealName, pfHoverRealName);
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
 				String query = "update purchase pc set pcDeleteDate=now(), pcDeleted =1 where pc.pcNo =? ";
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
 			
 		
 		public PurchaseDto purchaseDetailView(String uid, int ppcNo) {
 			PurchaseDto dto = null;
 			Connection connection = null;
 			PreparedStatement preparedStatement = null;
 			ResultSet resultSet = null;
 			
 			try {
 				connection = dataSource.getConnection();
 				String query = "select pc.pcNo, pc.pcinsertDate, p.pName ,u.uPhone, pf.pfRealName, pc.pcPay, pc.pcQty, p.pPrice "
 						+ "from product p, purchase pc, productfile pf, user u "
 						+ "where p.pCode = pc.pCode and p.pCode = pf.pCode and u.uid = ? and pcNo = ?";
 				preparedStatement = connection.prepareStatement(query);
 				preparedStatement.setString(1, uid);
 				preparedStatement.setInt(2, ppcNo);
 				resultSet = preparedStatement.executeQuery();
 				
 				if(resultSet.next()) {
 					
 					int pcNo = resultSet.getInt(1);
 					String pcinsertDate = resultSet.getString(2);
 					String pName = resultSet.getString(3);
 					String uPhone = resultSet.getString(4);
 					String pfRealName = resultSet.getString(5);
 					String pcPay = resultSet.getString(6);
 					int pcQty = resultSet.getInt(7);
 					int pPrice = resultSet.getInt(8);
 					
 					
 					dto = new PurchaseDto(uPhone, pName, pcNo, pcQty, pPrice, pcinsertDate, pfRealName, pcPay);
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
 			
 		}
 		
 		public ArrayList<PurchaseDto> userAddressInfo(String uuid) {
 			ArrayList<PurchaseDto> addressList = new ArrayList<PurchaseDto>();
 			Connection con = null;
 			PreparedStatement ps = null;
 			ResultSet rs = null;
 			int result = 0;
 			try {
 				con = dataSource.getConnection();
 				
 				String query = "select u.uid, u.uPhone, ua.uaAddress, ua.uaDetailAddress, ua.uaZipcode "
 						+ "from user u, userAddress ua "
 						+ "where u.uid = ua.uid and u.uid = ?";
 				ps = con.prepareStatement(query);
 				ps.setString(1, uuid);
 				rs = ps.executeQuery();
 				while(rs.next()) {
 					String uid = rs.getString(1);
 					String uPhone = rs.getString(2);
 					String uAddress = rs.getString(3);
 					String uDetailAddress = rs.getString(4);
 					String uZipcode = rs.getString(5);
 					PurchaseDto purchaseDto = new PurchaseDto(uid, uPhone, uZipcode, uAddress, uDetailAddress);
 					addressList.add(purchaseDto);
 					
 				}
 				
 				
 			} catch (Exception e) {
 				e.printStackTrace();
 			} finally {
 				try {
 					if (con != null) con.close();
 					if (ps != null) ps.close();
 				} catch (Exception e) {
 					e.printStackTrace();
 				}
 			}
 			return addressList;
 		}
 		
 		
 		
 		
 		
 		
 		
 		
 		
 		public int userModifyAddress(String uid, String uaAddress, String uaDetailAddress, String uaZipcode) {
 			Connection con = null;
 			PreparedStatement ps = null;
 			int result = 0;
 			try {
 				con = dataSource.getConnection();
 				
 				String query = "update userAddress set uaAddress = ?, uaDetailAddress = ?, uaZipcode = ? where uid = ?";
 				ps = con.prepareStatement(query);
 				ps.setString(1, uaAddress);
 				ps.setString(2, uaDetailAddress);
 				ps.setString(3, uaZipcode);
 				ps.setString(4, uid);
 				result = ps.executeUpdate();
 			} catch (Exception e) {
 				e.printStackTrace();
 			} finally {
 				try {
 					if (con != null) con.close();
 					if (ps != null) ps.close();
 				} catch (Exception e) {
 					e.printStackTrace();
 				}
 			}
 			return result;
 		}

 		

	
}//END
	