package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.BoardDto;

public class BoardDao {

	/* Field */
	int qNo;						// QNA 작성 번호
	String uid;						// 작성한 유저
	String uNickName;				// 작성한 유저의 닉네임
	int qCgNo;						// QNA 카테고리 번호. 1: , 2:
	String qTitle;					// QNA 제목
	String qContent;				// QNA 내용
	String qInsertDate;				// QNA 작성 일자
	String qUpdateDate;				// QNA 수정 일자
	String qDeleteDate;				// QNA 삭제 일자
	boolean qDeleted;				// QNA 삭제 여부 ( 0 : false 삭제되지 않음, 1 : true 삭제됨. )
	
	DataSource dataSource;
	
	public BoardDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDto> qnaList(){
		ArrayList<BoardDto> qnaList = new ArrayList<BoardDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = dataSource.getConnection();

			String query = "select qNo, uid, uNickName, qCgNo, qTitle, qContent, qInsertDate from qna where qDeleted = 0";
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				int qNo = rs.getInt(1);
				String uid = rs.getString(2);
				String uNickName = rs.getString(3);
				int qCgNo = rs.getInt(4);
				String qTitle = rs.getString(5);
				String qContent = rs.getString(6);
				String qInsertDate = rs.getString(7);
				BoardDto boardDto = new BoardDto(qNo, uid, uNickName, qCgNo, qTitle, qContent, qInsertDate);
				qnaList.add(boardDto);
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
		
		return qnaList;
	}
	
	
	public int writeQnA(String uid, String uNickName, int qCgNo, String qTitle, String qContent) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = dataSource.getConnection();

			String query = "insert into qna(uid, uNickName, qCgNo, qTitle, qContent, qInsertDate) values(?, ?, ?, ?, ?, now())";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			ps.setString(2, uNickName);
			ps.setInt(3, qCgNo);
			ps.setString(4, qTitle);
			ps.setString(5, qContent);
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
