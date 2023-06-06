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
	
	public int pCount(String queryName, String queryContent) {
	    Connection connection = null;
	    PreparedStatement preparedStatement = null;
	    ResultSet resultSet = null;
	    int p_count = 0; // p_count 변수를 try 블록 외부에서 선언하여 나중에 접근할 수 있도록 합니다.
	    
	    
	    if(queryName == null){ // 첫화면인 경우
			queryName = "p.pBrandName";
			queryContent = "";
		}
	    
	    try {
	        connection = dataSource.getConnection();
	        String query = "SELECT COUNT(*) AS row_count\r\n"
	        		+ "FROM product p, productoption po, productfile pf\r\n"
	        		+ "WHERE p.pCode = po.pCode AND p.pCode = pf.pCode and " + queryName + " like '%" +queryContent + "%'";
	        preparedStatement = connection.prepareStatement(query);
	        resultSet = preparedStatement.executeQuery();
	        
	        if (resultSet.next()) {
	            p_count = resultSet.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (resultSet != null) {
	                resultSet.close();
	            }
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	    return p_count; // p_count의 값을 메서드의 끝에서 반환합니다.
	}

	
	
	public ArrayList<AdminDto> searchAction(String queryName, String queryContent, int index_no) {
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
			String WhereDefault2 = " where p.pCode = po.pCode and p.pCode = pf.pCode and p.pDeleted=0 and  " + queryName + " like '%" +queryContent + "%'";
			String WhereDefault3 = " LIMIT " + index_no + ",7";
				
			preparedStatement = connection.prepareStatement(WhereDefault+WhereDefault2+WhereDefault3);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int pCode = resultSet.getInt(1);
				String pBrandName = resultSet.getString(2);
				String pName = resultSet.getString(3);
				String pColor = resultSet.getString(4);
				int pPrice = resultSet.getInt(5);
				int pStock = resultSet.getInt(6);
				Date pInsertdate = resultSet.getDate(7);
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
	public AdminDto contentView(String ppCode, int index_no) {
		AdminDto dto = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "select p.pCode, p.pBrandName, p.pName ,po.pColor, p.pPrice, po.pStock, p.pupdatedate,pf.pfName, pf.pfRealName  from product p, productoption po, productfile pf where p.pCode = po.pCode and p.pCode = pf.pCode and p.pCode=?";
			String query1 = " LIMIT " + index_no + ",7";
			preparedStatement = connection.prepareStatement(query+query1);
			preparedStatement.setInt(1, Integer.parseInt(ppCode));
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				int pCode = resultSet.getInt(1);
				String pBrandName = resultSet.getString(2);
				String pName = resultSet.getString(3);
				String pColor = resultSet.getString(4);
				int pPrice = resultSet.getInt(5);
				int pStock = resultSet.getInt(6);
				Date pUpdatedate = resultSet.getDate(7);
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
	
	
	
	// 데이터수정메서드  이미지를 변경하지 않을때,,
	public void updateAction(String pCode, String pBrandName,String pName, String pPrice, String pColor, String pStock, String lastfile) {
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
			preparedStatement.setString(5, lastfile);
			preparedStatement.setString(6, lastfile);
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
			String query = "update product p, productoption po set pDeleteDate=now() ,pDeleted =1 where p.pCode = ? and po.pColor =?";
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

	public void insert(String pName, String pBrandName, String pPrice, String cgNo, String pCode, String pStock,String pColor, String pfNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		//PreparedStatement preparedStatement1 = null;
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

	      //  String query2 = "INSERT INTO productfile (pfNo, pfName, pfRealName, pCode) SELECT ?, ?, ?, ? FROM product WHERE pName=?";
	      //  preparedStatement1 = connection.prepareStatement(query2);
	      //  preparedStatement1.setInt(1, Integer.parseInt(pfNo));
	      //  preparedStatement1.setString(2, pfName);
	      //  preparedStatement1.setString(3, pfRealName);
	      //  preparedStatement1.setInt(4, Integer.parseInt(pCode));
	      //  preparedStatement1.setString(5, pName);

	      //  preparedStatement1.executeUpdate();

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
	
	
	// 주문처리에 사용되는 주문내역불러오기
	public ArrayList<AdminDto> purchaseCheck() {
		
		
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String WhereDefault = "select pc.pcNo, pc.uid, pc.pCode, po.pColor, pc.pcQty, pc.pcInsertDate, pc.pcStatus from purchase pc, product p, productoption po";
			String WhereDefault2 = " where p.pCode = pc.pCode and p.pCode = po.pCode and po.pCode = pc.pCode";
			
			preparedStatement = connection.prepareStatement(WhereDefault+WhereDefault2);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int pcNo = resultSet.getInt(1);
				String uid = resultSet.getString(2);
				int pCode = resultSet.getInt(3);
				String pColor = resultSet.getString(4);
				int pcQty = resultSet.getInt(5);
				Date pcInsertdate = resultSet.getDate(6);
				int pcStatus = resultSet.getInt(7);
				
				
		
				AdminDto dto = new AdminDto(pcNo, uid, pCode, pColor, pcQty, pcStatus, pcInsertdate);
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
	
	
	//주문 상태 변경 메서드
	public void statusUpdate(String pcStatus, String pcNo) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = dataSource.getConnection();
			//String query = "update purchase pc, user u set pc.pcStatus =? where u.uid = pc.uid and pc.pcNo = ?";
			String query = "update purchase  set pcStatus =? where pcNo = ?";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, pcStatus);
			preparedStatement.setString(2, pcNo);
			
			
			
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
	
	
	
	
	
	// 공지가져오기 메서드
	public ArrayList<AdminDto> noticeSearch(String aaid) {
		
		
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String WhereDefault = "select n.nNo, n.aid, n.nTitle, n.nInsertDate from notice n,admin a where n.aid = a.aid";
			
			
			preparedStatement = connection.prepareStatement(WhereDefault);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				int nNo = resultSet.getInt(1);
				String aid = resultSet.getString(2);
				String nTitle = resultSet.getString(3);
				Date nInsertDate = resultSet.getDate(4);
				
		
				AdminDto dto = new AdminDto(nNo, aid, nTitle, nInsertDate);
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
	
	
	// 공지글 작성메서드
	public void noticeInsert(String aid, String nTitle, String nContent) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
	        connection = dataSource.getConnection();
	        String query = "INSERT INTO notice (aid, nTitle, nContent, nInsertDate) SELECT ?,  ?, ?, NOW() FROM admin a WHERE a.aid = ?";
	        preparedStatement = connection.prepareStatement(query);
	        preparedStatement.setString(1, aid);
	        preparedStatement.setString(2, nTitle);
	        preparedStatement.setString(3, nContent);
	        preparedStatement.setString(4, aid);
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
	
	
	
	
	//막대차트 데이터 가져오기
	public ArrayList<AdminDto> chart() {
		
		
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String WhereDefault = "SELECT DAYNAME(pc.pcInsertDate), SUM(p.pPrice * pc.pcQty) FROM purchase pc, product p GROUP BY DAYNAME(pc.pcInsertDate)";
			
			
			preparedStatement = connection.prepareStatement(WhereDefault);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String dayName = resultSet.getString(1);
				int daySum = resultSet.getInt(2);
				
		
				AdminDto dto = new AdminDto(dayName, daySum);
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
	//도넛차트 데이터 가져오기
	public ArrayList<AdminDto> donut() {
		
		
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String WhereDefault = "select pc.pColor, SUM(p.pPrice * pc.pcQty) FROM purchase pc, product p,productoption po where p.pCode = pc.pCode and po.pCode = pc.pCode GROUP BY pc.pColor";
			
			
			preparedStatement = connection.prepareStatement(WhereDefault);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				String pColor = resultSet.getString(1);
				int colorSum = resultSet.getInt(2);
				
				
				AdminDto dto = new AdminDto(pColor, colorSum);
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
	
	
	// 날짜별 매출 계산하기 위한 메서드
	public ArrayList<AdminDto> dailySale(String startDate, String endDate) {
		int total= 0;
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			
			if((startDate != null && !startDate.equals(null))&& !startDate.equals("")) {
			connection = dataSource.getConnection();
			
			String WhereDefault = "select pc.pcInsertDate, p.pBrandName, p.pName, pc.pcQty, pc.pcQty*p.pPrice from product p, purchase pc where p.pCode = pc.pCode and pc.pcInsertDate between ? and ?";
			
			
			preparedStatement = connection.prepareStatement(WhereDefault);
			preparedStatement.setString(1, startDate);
			preparedStatement.setString(2, endDate);

			
			
			}else {
				connection = dataSource.getConnection();
				
				String WhereDefault = "select pc.pcInsertDate, p.pBrandName, p.pName, pc.pcQty, pc.pcQty*p.pPrice from product p, purchase pc where p.pCode = pc.pCode";
				
				preparedStatement = connection.prepareStatement(WhereDefault);
				
			}
			
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				Date pcInsertdate = resultSet.getDate(1);
				String pBrandName= resultSet.getString(2);
				String pName= resultSet.getString(3);
				int pcQty = resultSet.getInt(4);
				int sum = resultSet.getInt(5);

				total +=sum;
				
				AdminDto dto = new AdminDto(pcInsertdate, pBrandName, pName, pcQty, sum,total);
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
