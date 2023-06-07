package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.BoardDto;
import com.javalec.tent.dto.QuestionDto;

public class BoardDao {

	
	int bNo;						// 게시글 번호
	String uid;						// 작성자 ID
	String uNickName;				// 작성자 닉네임
	int bCgNo;						// 작성글 카테고리 번호 1:잡담
	String bTitle;					// 작성글 제목
	String bContent;				// 작성글 내용
	String bInsertDate;				// 작성 일자
	String bUpdateDate;				// 수정 일자
	String bDeleteDate;				// 삭제 일자
	boolean bDeleted;				// 삭제 여부 false : 삭제 되지 않음. true : 삭제 됨.
	int bViewCount;					// 작성글 조회수
	
	DataSource dataSource;
	
	public BoardDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int boardCount(String queryContent){
		ArrayList<BoardDto> boradList = new ArrayList<BoardDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int boardCount = 0;
		
		if(queryContent == null){ // 첫화면인 경우
			queryContent = "";
		}
		
		try {
			con = dataSource.getConnection();
			
			String sql = "select count(*) from board where bDeleted = 0 and bTitle like ? and bContent like ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + queryContent + "%");
			ps.setString(2, "%" + queryContent + "%");
			rs = ps.executeQuery();
			while(rs.next()) {
				boardCount = rs.getInt(1);
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
		return boardCount;
	}	// boardList
	
	public ArrayList<BoardDto> boardList(String queryContent, int pageNo){
		ArrayList<BoardDto> boradList = new ArrayList<BoardDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		if(queryContent == null){ // 첫화면인 경우
			queryContent = "";
		}

		try {
			con = dataSource.getConnection();
			
			String sql = "select bNo, uid, uNickName, bCgNo, bTitle, bContent, bInsertDate, bViewCount from board where bDeleted = 0 and bTitle like ? and bContent like ? limit ?,10";
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + queryContent + "%");
			ps.setString(2, "%" + queryContent + "%");
			ps.setInt(3, (pageNo - 1) * 10); // 페이징 계산 수정
			rs = ps.executeQuery();
			while(rs.next()) {
				int bNo = rs.getInt(1);
				String uid = rs.getString(2);
				String uNickName = rs.getString(3);
				int bCgNo = rs.getInt(4);
				String bTitle = rs.getString(5);
				String bContent = rs.getString(6);
				String bInsertDate = rs.getString(7);
				int bViewCount = rs.getInt(8);
				BoardDto boardDto = new BoardDto(bNo, uid, uNickName, bCgNo, bTitle, bContent, bInsertDate, bViewCount);
				boradList.add(boardDto);
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
		return boradList;
	}	// boardList
	
	public int writeBoard(String uid, String uNickName, int bCgNo, String bTitle, String bContent) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = dataSource.getConnection();

			String query = "insert into board(uid, uNickName, bCgNo, bTitle, bContent, bInsertDate) values(?, ?, ?, ?, ?, now())";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			ps.setString(2, uNickName);
			ps.setInt(3, bCgNo);
			ps.setString(4, bTitle);
			ps.setString(5, bContent);
			ps.executeUpdate();

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
	}
	
	public int IncreaseViewCount(int bNo) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = dataSource.getConnection();

			String query = "update board set bViewCount = bViewCount +1 where bNo = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, bNo);
			ps.executeUpdate();

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
	}
	
	public ArrayList<BoardDto> boardDetail(int bNo) {
		ArrayList<BoardDto> boardDetail = new ArrayList<BoardDto>();
		Connection con = null;
		PreparedStatement increasePs = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = dataSource.getConnection();
			String sql1 = "update board set bViewCount = bViewCount + 1 where bNo = ?";
			increasePs = con.prepareStatement(sql1);
			increasePs.setInt(1, bNo);
			increasePs.executeUpdate();
			String sql2 = "select bNo, uid, uNickName, bCgNo, bTitle, bContent, bInsertDate, bViewCount from board where bNo = ?";
			ps = con.prepareStatement(sql2);
			ps.setInt(1, bNo);
			rs = ps.executeQuery();
			while(rs.next()) {
				int wkbNo = rs.getInt(1);
				String uid = rs.getString(2);
				String uNickName = rs.getString(3);
				int bCgNo = rs.getInt(4);
				String bTitle = rs.getString(5);
				String bContent = rs.getString(6);
				String bInsertDate = rs.getString(7);
				int bViewCount = rs.getInt(8);
				BoardDto boardDto = new BoardDto(wkbNo, uid, uNickName, bCgNo, bTitle, bContent, bInsertDate, bViewCount);
				boardDetail.add(boardDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(ps != null) ps.close();
				if(rs != null) rs.close();
				if(increasePs != null) increasePs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return boardDetail;
	}
	
	
	
	
	
	

	
	
	
	
	
}	// End Class
