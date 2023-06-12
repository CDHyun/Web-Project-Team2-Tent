package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.AdminDto;
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
	String pfHoverName;		// 올린 호버 이미지 이름
	String pfHoverRealName;	// 프로젝트에 저장되는 실제 호버 이미지 이름
	
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
			
			String sql = "select p.pCode, p.cgNo, p.pName, p.pBrandName, p.pPrice, p.pDeleted, pf.pfRealName, pf.pfHoverRealName, c.cgName "
					+ "from product p "
					+ "left join productFile pf ON p.pCode = pf.pCode "
					+ "left join category c ON p.cgNo = c.cgNo "
					+ "where p.pName like '%" + queryContent + "%' and p.pDeleted = 0 or p.pBrandName like '%" + queryContent + "%' or c.cgName like '%" + queryContent + "%' and p.pDeleted = 0;";
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int wkpCode = rs.getInt(1);
				int wkcgNo = rs.getInt(2);
				String wkpName = rs.getString(3);
				String wkpBrandName = rs.getString(4);
				int wkpPrice = rs.getInt(5);
				boolean wkpDeleted = rs.getBoolean(6);
				String wkpfRealName = rs.getString(7);
				String wkpfHoverRealName = rs.getString(8);
				
				ProductDto productDto = new ProductDto(wkcgNo, wkpCode, wkpName, wkpBrandName, wkpPrice, wkpDeleted, wkpfRealName, wkpfHoverRealName);
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
	
	
	
	public ArrayList<ProductDto> productDetail(int pCode){
		ArrayList<ProductDto> productInfo = new ArrayList<ProductDto>();
		
		if(queryContent == null){
			queryContent = "";
		}

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String sql = "select p.pCode, cg.cgName, p.pName, p.pBrandName, p.pPrice, po.pColor, pf.pfRealName, pf.pfHoverRealName"
					+ " from product p"
					+ " left join productFile pf on p.pCode = pf.pCode"
					+ " left join productOption po on p.pCode = po.pCode"
					+ " left join category cg on p.cgNo = cg.cgNo"
					+ " where p.pCode = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, pCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int wkpCode = rs.getInt(1);
				String wkcgName = rs.getString(2);
				String wkpName = rs.getString(3);
				String wkpBrandName = rs.getString(4);
				int wkpPrice = rs.getInt(5);
				String wkpColor = rs.getString(6);
				String wkpfRealName = rs.getString(7);
				String wkpfHoverRealName = rs.getString(8);
				
				ProductDto productDto = new ProductDto(wkcgName, wkpCode, wkpName, wkpBrandName, wkpPrice, wkpfRealName, wkpfHoverRealName, wkpColor);
				productInfo.add(productDto);
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
		return productInfo;
	}
	
	public ArrayList<ProductDto> productColorList(int pCode){
		ArrayList<ProductDto> colorList = new ArrayList<ProductDto>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			
			String sql = "select pColor from productOption where pCode = ?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, pCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String pColor = rs.getString(1);
				ProductDto productDto = new ProductDto(pColor);
				colorList.add(productDto);
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
		return colorList;
	}
	
	/* Page */
	public int productCount() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int productCount = 0;
		try {
			con = dataSource.getConnection();
			
			String sql = "select count(*) from product";
			
			ps = con.prepareStatement(sql);
//			ps.setInt(1, pCode);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				productCount = rs.getInt(1);
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
		return productCount;
	}
	
//	public ArrayList<ProductDto> getProductList(String queryContent, int page, int pageSize) {
//	    ArrayList<ProductDto> products = new ArrayList<>();
//
//	    if (queryContent == null) {
//	        queryContent = "";
//	    }
//
//	    Connection con = null;
//	    PreparedStatement ps = null;
//	    ResultSet rs = null;
//
//	    try {
//	        con = dataSource.getConnection();
//
//	        // 검색어와 페이징을 적용한 SQL 쿼리문
//	        String sql = "SELECT p.pCode, p.cgNo, p.pName, p.pBrandName, p.pPrice, p.pDeleted, pf.pfRealName, pf.pfHoverRealName "
//	                + "FROM product p "
//	                + "LEFT JOIN productFile pf ON p.pCode = pf.pCode "
//	                + "WHERE (p.pName LIKE ? OR p.pBrandName LIKE ?) AND p.pDeleted = 0 "
//	                + "ORDER BY p.pCode ASC LIMIT ? OFFSET ?";
//
//	        ps = con.prepareStatement(sql);
//	        ps.setString(1, "%" + queryContent + "%");
//	        ps.setString(2, "%" + queryContent + "%");
//	        ps.setInt(3, pageSize);
//	        ps.setInt(4, (page - 1) * pageSize);
//	        rs = ps.executeQuery();
//
//	        while (rs.next()) {
//	            int wkpCode = rs.getInt(1);
//	            int wkcgNo = rs.getInt(2);
//	            String wkpName = rs.getString(3);
//	            String wkpBrandName = rs.getString(4);
//	            int wkpPrice = rs.getInt(5);
//	            boolean wkpDeleted = rs.getBoolean(6);
//	            String wkpfRealName = rs.getString(7);
//	            String wkpfHoverRealName = rs.getString(8);
//
//	            ProductDto productDto = new ProductDto(wkcgNo, wkpCode, wkpName, wkpBrandName, wkpPrice, wkpDeleted, wkpfRealName, wkpfHoverRealName);
//	            products.add(productDto);
//	        }
//
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    } finally {
//	        try {
//	            if (rs != null) rs.close();
//	            if (ps != null) ps.close();
//	            if (con != null) con.close();
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	    }
//	    return products;
//	}

	/* 구매 페이지에 보내주기 전에 데이터 조회 */
	public ArrayList<ProductDto> productInfo(int pCode) {
		ArrayList<ProductDto> productInfo = new ArrayList<ProductDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = dataSource.getConnection();
			
			String sql = "select p.pName, pf.pfRealName, p.pPrice from product p, productOption po, productFile pf where p.pCode = ? and p.pCode = po.pCode and p.pCode = pf.pCode";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, pCode);
			rs = ps.executeQuery();
			// pColor, pCode, pName, pfRealName, pPrice, pcQty
			while(rs.next()) {
				String pName = rs.getString(1);
				String pfRealName = rs.getString(2);
				int pPrice = rs.getInt(3);
				ProductDto productDto = new ProductDto(pName, pPrice, pfRealName);
				productInfo.add(productDto);
				
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
		return productInfo;
	}
	
	

}	// End Class
