package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.BoardDto;
import com.javalec.tent.dto.CommentDto;
import com.javalec.tent.util.BoardPageMaker;

public class CommentDao {

	/* Field */
	int cmNo;							// 댓글 번호
	int bNo;							// 게시글 번호
	String uid;							// 작성자 ID
	String uNickName;					// 작성자 닉네임
	int cmRef;							// 댓글의 그룹
	int cmStep;							// 댓글의 계층
	int cmRefOrder;						// 댓글 그룹의 순서
	int cmAnswerCount;					// 댓글에 달린 대댓글의 카운트
	int cmParentNo;						// 댓글의 부모글 번호
	String cmContent;					// 댓글의 내용
	String cmInsertDate;				// 댓글의 작성 시간
	String cmUpdateDate;				// 댓글의 수정 시간
	String cmDeleteDate;				// 댓글의 삭제 시간
	boolean cmDeleted;					// 댓글의 삭제 여부
	int cmRec;							// 댓글의 추천수
	int cmUnrec;
	
	DataSource dataSource;
	
	public CommentDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int commentCount(int bNo){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int commentCount = 0;
		
		try {
			con = dataSource.getConnection();
			
			String sql = "select count(*) from comment where cmDeleted = 0 and bNo = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bNo);
			rs = ps.executeQuery();
			while(rs.next()) {
				commentCount = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return commentCount;
	}	// commentCount
	
	public ArrayList<CommentDto> commentList(int pageNo, int bNo){
		ArrayList<CommentDto> commentList = new ArrayList<CommentDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		BoardPageMaker boardPageMaker = new BoardPageMaker();
		//1번 페이지 1~10
        //2번 페이지 11~20        
        int startNum = (pageNo-1)*boardPageMaker.getDisplayRow()+1;
        int endNum = pageNo*boardPageMaker.getDisplayRow();
		
		
		try {
			con = dataSource.getConnection();
			String sql = "SELECT * FROM ("
	                + "SELECT derivedTable.*, ROW_NUMBER() OVER () AS row_num FROM ("
	                + "SELECT cmNo, bNo, uid, uNickName, cmRef, cmStep, cmRefOrder, cmAnswerCount, cmParentNo, cmContent, cmInsertDate, cmUpdateDate, cmDeleteDate, cmRec, cmUnrec, cmDeleted "
	                + "FROM comment "
	                + "WHERE bNo = ? "
	                + ") AS derivedTable"
	                + ") AS finalResult "
	                + "WHERE row_num >= ? AND row_num <= ? "
	                + "order by cmRef asc, cmRefOrder asc";
			ps = con.prepareStatement(sql);
			ps.setInt(1, bNo);
			ps.setInt(2, startNum);
            ps.setInt(3, endNum);
			rs = ps.executeQuery();
			while(rs.next()) {
				int cmNo = rs.getInt(1);
				int wkbNo = rs.getInt(2);
				String uid = rs.getString(3);
				String uNickName = rs.getString(4);
				int cmRef = rs.getInt(5);
				int cmStep = rs.getInt(6);
				int cmRefOrder = rs.getInt(7);
				int cmAnswerCount = rs.getInt(8);
				int cmParentNo = rs.getInt(9);
				String cmContent = rs.getString(10);
				String cmInsertDate = rs.getString(11);
				String cmUpdateDate = rs.getString(12);
				String cmDeleteDate = rs.getString(13);
				int cmRec = rs.getInt(14);
				int cmUnrec = rs.getInt(15);
				boolean cmDeleted = rs.getBoolean(16);
				CommentDto commentDto = new CommentDto(cmNo, wkbNo, uid, uNickName, cmRef, cmStep, cmRefOrder, cmAnswerCount, cmParentNo, cmContent, cmInsertDate, cmUpdateDate, cmDeleteDate, cmDeleted, cmRec, cmUnrec);
				commentList.add(commentDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return commentList;
	}	// commentList
	
	
	public int writeParentComment(int bNo, String uid, String uNickName, String cmContent){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int result = 0;
		
		try {
			con = dataSource.getConnection();
			String sql = "INSERT INTO comment (bNo, uid, uNickName, cmContent, cmRef, cmInsertDate) " +
		             "SELECT ?, ?, ?, ?, COALESCE(MAX(cmRef), 0) + 1, NOW() " +
		             "FROM comment " +
		             "WHERE bNo = ?";
			
			
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, bNo);
			ps.setString(2, uid);
			ps.setString(3, uNickName);
			ps.setString(4, cmContent);
			ps.setInt(5, bNo);
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}	// commentList
	
	



}	// End Class
