package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.ProductDto;

public class ProductDao {
	
/********* Field ********** /
	
	/* Category */
	int cgNo;				// 카테고리 번호
	String cgName;			// 카테고리 이름
	
	/* Product */
	int pCode;				// 상품 번호
	String pName;			// 상품명
	String pBrandName;		// 브랜드명
	int pPrice;				// 상품 가격
	String pInsertDate;		// 상품 입고 날짜
	String pUpdateDate;		// 상품 정보 수정 날짜
	String pDeleteDate;		// 상품 삭제 처리 날짜
	boolean pDeleted;		// 상품 삭제 여부(Default 0 : false -> 삭제 되지 않음.)
	
	/* ProductFile */
	String pfName;			// 올린 상품 이미지 이름
	String pfRealName;		// 프로젝트에 저장된 실제 파일 이름
	
	/* Search */
	String queryContent;	// 사용자가 검색창에 입력한 내용
	
	DataSource dataSource;
	
	/* Constructor
	 * 기본 생성자가 호출되며 자동으로 Tomcat Server의 DB 정보를 가져옴.
	 * */
	public ProductDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ProductDto> productList(String queryContent){
		ArrayList<ProductDto> products = new ArrayList<ProductDto>();
		
		if(queryContent == null){
			queryContent = "";
		}

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String sql = "select p.pCode, p.cgNo, p.pName, p.pBrandName, p.pPrice, p.pDeleted, pf.pfRealName "
					+ "from product p "
					+ "left join productFile pf ON p.pCode = pf.pCode "
					+ "where p.pName like '%" + queryContent + "%' and p.pDeleted = 0 or p.pBrandName like '%" + queryContent + "%' and p.pDeleted = 0;";
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int wkpCode = rs.getInt(1);
				int wkcgNo = rs.getInt(2);
				String wkpName = rs.getString(3);
				String wkpBrandName = rs.getString(4);
				int wkpPrice = rs.getInt(5);
				boolean wkpDeleted = rs.getBoolean(6);
				String wkpRealName = rs.getString(7);
				
				ProductDto productDto = new ProductDto(wkcgNo, wkpCode, wkpName, wkpBrandName, wkpPrice, wkpDeleted, wkpRealName);
				products.add(productDto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return products;
	}
	
	
	
	

}	// End Class
