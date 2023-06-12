package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.NoticeDto;
import com.javalec.tent.dto.QuestionDto;

public class NoticeDao {

	int nNo;
	String aid;
	int nCgNo;
	String nTitle;
	String nContent;
	String nInsertDate;
	String nUpdateDate;
	String nDeleteDate;
	boolean nDeleted;
	
	DataSource dataSource;
	
	public NoticeDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<NoticeDto> noticeList(){
		ArrayList<NoticeDto> noticeList = new ArrayList<NoticeDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();
			//nNo, aid, nCgNo, nTitle, nContent, nInsertDate, nUpdateDate, nDeleteDate, nDeleted
			String query = "select nNo, aid, nCgNo, nTitle, nContent, nInsertDate, nUpdateDate, nDeleteDate, nViewCount, nDeleted from notice where nDeleted = 0";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				int nNo = rs.getInt(1);
				String aid = rs.getString(2);
				int nCgNo = rs.getInt(3);
				String nTitle = rs.getString(4);
				String nContent = rs.getString(5);
				String nInsertDate = rs.getString(6);
				String nUpdateDate = rs.getString(7);
				String nDeleteDate = rs.getString(8);
				int nViewCount = rs.getInt(9);
				boolean nDeleted = rs.getBoolean(10);
				NoticeDto noticeDto = new NoticeDto(nNo, aid, nCgNo, nTitle, nContent, nInsertDate, nUpdateDate, nDeleteDate, nDeleted, nViewCount);
				noticeList.add(noticeDto);
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
		return noticeList;
	}
	
	public ArrayList<NoticeDto> noticeCgNoList(int nCgNo){
		ArrayList<NoticeDto> noticeList = new ArrayList<NoticeDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			//nNo, aid, nCgNo, nTitle, nContent, nInsertDate, nUpdateDate, nDeleteDate, nDeleted
			String query = "select nNo, aid, nCgNo, nTitle, nContent, nInsertDate, nUpdateDate, nDeleteDate, nViewCount, nDeleted from notice where nDeleted = 0 and nCgNo = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, nCgNo);
			rs = ps.executeQuery();
			while(rs.next()) {
				int nNo = rs.getInt(1);
				String aid = rs.getString(2);
				int wknCgNo = rs.getInt(3);
				String nTitle = rs.getString(4);
				String nContent = rs.getString(5);
				String nInsertDate = rs.getString(6);
				String nUpdateDate = rs.getString(7);
				String nDeleteDate = rs.getString(8);
				int nViewCount = rs.getInt(9);
				boolean nDeleted = rs.getBoolean(10);
				NoticeDto noticeDto = new NoticeDto(nNo, aid, wknCgNo, nTitle, nContent, nInsertDate, nUpdateDate, nDeleteDate, nDeleted, nViewCount);
				noticeList.add(noticeDto);
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
		return noticeList;
	}
	
	public int writeNotice(String aid, int nCgNo, String nTitle, String nContent) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = dataSource.getConnection();

			String query = "insert into notice(aid, nCgNo, nTitle, nContent, nInsertDate) values(?, ?, ?, ?, now())";
			ps = con.prepareStatement(query);
			ps.setString(1, aid);
			ps.setInt(2, nCgNo);
			ps.setString(3, nTitle);
			ps.setString(4, nContent);
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
	
	public int IncreaseNoticeViewCount(int nNo) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = dataSource.getConnection();

			String query = "update notice set nViewCount = nViewCount +1 where nNo = ?";
			ps = con.prepareStatement(query);
			ps.setInt(1, nNo);
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
	
	
	
	
}	// End Class
