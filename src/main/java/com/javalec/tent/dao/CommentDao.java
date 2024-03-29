package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.BoardDto;
import com.javalec.tent.dto.CommentDto;
import com.javalec.tent.util.BoardPageMaker;
import com.javalec.tent.util.CommentPageMaker;

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
		CommentPageMaker commentPageMaker = new CommentPageMaker();
		//1번 페이지 1~10
        //2번 페이지 11~20        
        int startNum = (pageNo-1)*commentPageMaker.getDisplayRow()+1;
        int endNum = pageNo*commentPageMaker.getDisplayRow();
		
		
		try {
			con = dataSource.getConnection();
			String sql = "SELECT * FROM ("
		            + "SELECT derivedTable.*, ROW_NUMBER() OVER () AS row_num FROM ("
		            + "SELECT cmNo, bNo, uid, uNickName, cmRef, cmStep, cmRefOrder, cmAnswerCount, cmParentNo, cmContent, cmInsertDate, cmUpdateDate, cmDeleteDate, cmRec, cmUnrec, cmDeleted "
		            + "FROM comment "
		            + "WHERE bNo = ? "
		            + "ORDER BY cmRef ASC, cmRefOrder ASC" // Include the ORDER BY clause here
		            + ") AS derivedTable"
		            + ") AS finalResult "
		            + "WHERE row_num >= ? AND row_num <= ? "
		            + "ORDER BY cmRef ASC, cmRefOrder ASC"; // Adjust the ORDER BY clause here if necessary

//			String sql = "SELECT * FROM ("
//					+ "SELECT derivedTable.*, ROW_NUMBER() OVER () AS row_num FROM ("
//					+ "SELECT cmNo, bNo, uid, uNickName, cmRef, cmStep, cmRefOrder, cmAnswerCount, cmParentNo, cmContent, cmInsertDate, cmUpdateDate, cmDeleteDate, cmRec, cmUnrec, cmDeleted "
//					+ "FROM comment "
//					+ "WHERE bNo = ? "
//					+ ") AS derivedTable"
//					+ ") AS finalResult "
//					+ "WHERE row_num >= ? AND row_num <= ? "
//					+ "order by cmRef asc, cmRefOrder asc";
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
	
	

	private int getMaxCmRef(int bNo) throws SQLException {
	    int maxCmRef = 0;
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        con = dataSource.getConnection();
	        // SQL query execution and result processing
	        String sql = "SELECT MAX(cmRef) FROM comment WHERE bNo = ?";
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, bNo);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            maxCmRef = rs.getInt(1);
	            if (rs.wasNull()) {
	                // Handle null value
	                maxCmRef = 0; // or assign a default value
	            }
	        }
	    } finally {
	        // Resource release
	        if (rs != null) {
	            rs.close();
	        }
	        if (ps != null) {
	            ps.close();
	        }
	        if (con != null) {
	            con.close();
	        }
	    }

	    return maxCmRef;
	}


	
	// 댓글 번호에 해당하는 댓글을 가져오는 메서드
	public CommentDto getCommentByCmNo(Connection con, int cmNo) throws SQLException {
	    CommentDto comment = null;
	    
	    // 적절한 SQL 쿼리를 작성하여 댓글을 가져옵니다.
	    String query = "SELECT * FROM comment WHERE cmNo = ?";
	    
	    try (PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setInt(1, cmNo);
	        
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                // CommentDto 객체를 생성하고 결과를 설정합니다.
	                comment = new CommentDto();
	                comment.setCmNo(rs.getInt("cmNo"));
	                comment.setbNo(rs.getInt("bNo"));
	                comment.setUid(rs.getString("uid"));
	                comment.setuNickName(rs.getString("uNickName"));
	                comment.setCmRef(rs.getInt("cmRef"));
	                comment.setCmStep(rs.getInt("cmStep"));
	                comment.setCmRefOrder(rs.getInt("cmRefOrder"));
	                comment.setCmAnswerCount(rs.getInt("cmAnswerCount"));
	                comment.setCmParentNo(rs.getInt("cmParentNo"));
	                comment.setCmContent(rs.getString("cmContent"));
	                comment.setCmInsertDate(rs.getString("cmInsertDate"));
	                comment.setCmUpdateDate(rs.getString("cmUpdateDate"));
	                comment.setCmDeleteDate(rs.getString("cmDeleteDate"));
	                comment.setCmDeleted(rs.getBoolean("cmDeleted"));
	                comment.setCmRec(rs.getInt("cmRec"));
	                comment.setCmUnrec(rs.getInt("cmUnrec"));
	            }
	        }
	    }
	    
	    return comment;
	}
	
	public int getAnswerCount(int bNo, int cmNo) {
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    int answerCount = 0;

	    try {
	        con = dataSource.getConnection();
	        String sql = "SELECT cmAnswerCount FROM comment WHERE bNo = ? and cmNo = ?";
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, bNo);
	        ps.setInt(2, cmNo);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	        	answerCount = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	            if (ps != null) ps.close();
	            if (rs != null) rs.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }

	    return answerCount;
	}

	public int getMaxStep(int cmRef, int bNo) {
	    Connection con = null;
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    int maxStep = 0;

	    try {
	        con = dataSource.getConnection();
	        String sql = "SELECT MAX(cmStep) FROM comment WHERE cmRef = ? and bNo = ?";
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, cmRef);
	        ps.setInt(2, bNo);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            maxStep = rs.getInt(1);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	            if (ps != null) ps.close();
	            if (rs != null) rs.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }

	    return maxStep;
	}

	private void updateRefOrderGreaterThan(int cmRef, long refOrder, int bNo) {
	    Connection con = null;
	    PreparedStatement ps = null;

	    try {
	        con = dataSource.getConnection();
	        String query = "UPDATE comment SET cmRefOrder = cmRefOrder + 1 WHERE cmRef = ? AND bNo = ? AND cmRefOrder >= ?";
	        ps = con.prepareStatement(query);
	        ps.setInt(1, cmRef);
	        ps.setInt(2, bNo);
	        ps.setLong(3, refOrder);
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {            
	        try {
	            if(con != null) con.close();
	            if(ps != null) ps.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}


	
	
	public void saveComment(int bNo, String uid, String uNickName, int cmRef, int cmStep, long refOrder, int cmParentNo, String cmContent) {
	    Connection con = null;
	    PreparedStatement iPs = null;
	    PreparedStatement ps = null;
	    
	    try {
	    	con = dataSource.getConnection();
	        String sql = "INSERT INTO comment (bNo, uid, uNickName, cmRef, cmStep, cmRefOrder, cmParentNo, cmContent, cmInsertDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, now())";
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, bNo);
	        ps.setString(2, uid);
	        ps.setString(3, uNickName);
	        ps.setInt(4, cmRef);
	        ps.setInt(5, cmStep);
	        ps.setLong(6, refOrder);
	        ps.setInt(7, cmParentNo);
	        ps.setString(8, cmContent);
	        ps.executeUpdate();
	        String increaseCount = "update comment set cmAnswerCount = cmAnswerCount + 1 where cmNo = ?";
	        iPs = con.prepareStatement(increaseCount);
	        iPs.setInt(1, cmParentNo);
	        iPs.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	        	if(con != null) con.close();
				if(ps != null) ps.close();
				if(iPs != null) iPs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
	    }
	}
	
	// 최댓값을 가져오는 메서드
	public int getMaxCmRef(Connection con, int bNo) throws SQLException {
	    int maxRef = 0;
	    
	    // 적절한 SQL 쿼리를 작성하여 최댓값을 가져옵니다.
	    String query = "SELECT MAX(cmRef) FROM comment WHERE bNo = ?";
	    
	    try (PreparedStatement ps = con.prepareStatement(query)) {
	        ps.setInt(1, bNo);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                maxRef = rs.getInt(1);
	            }
	        }
	    }
	    return maxRef;
	}



	// 대댓글 저장 이전에 참조 순서를 결정하는 메서드
	public long getRefOrder(Connection con, int cmNo, int bNo) throws SQLException {
	    long refOrder = 0L;

	    String sql = "SELECT cmRefOrder FROM comment WHERE cmNo = ? and bNo = ?";
	    try (PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setInt(1, cmNo);
	        ps.setInt(2, bNo);
	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                refOrder = rs.getLong(1);
	            }
	        }
	    }

	    return refOrder;
	}
	
	public void saveReply(int bNo, String uid, String uNickName, String cmContent, int cmParentNo) {
	    Connection con = null;
	    PreparedStatement iPs = null;
	    PreparedStatement ps = null;

	    try {
	        con = dataSource.getConnection();
	        CommentDto parentComment = getCommentByCmNo(con, cmParentNo);
	        // 대댓글 저장 로직 구현
	        int cmStep = 0; // 댓글은 step 0

	        // ref의 최댓값 찾아서 ref에 +1 저장
	        int maxRef = getMaxCmRef(con, bNo);

	        // 대댓글의 부모댓글 찾기
	        int cmRef = parentComment.getCmRef(); // 수정: 부모댓글의 cmRef 값을 할당받습니다.

	        if (parentComment != null) {
	          cmRef = parentComment.getCmRef();

	          // 부모댓글의 step에 +1
	          cmStep = parentComment.getCmStep() + 1;

	          // 부모댓글의 자식 숫자 구하기
	          int answerCount = getAnswerCount(bNo, cmParentNo);

	          // 부모댓글의 그룹내 step 컬럼 최댓값 구하기
	          int maxStep = getMaxStep(cmRef, bNo);

	          // 대댓글의 step이 댓글의 그룹내에서 최대 step보다 작은 경우
	          // 대댓글인 경우
	          if (cmStep < maxStep) {
	            // refOrder는 answerNumSum + 1
	            long cmRefOrder = answerCount + 1L;
	            // 대댓글 저장
	            saveComment(bNo, uid, uNickName, cmRef, cmStep, cmRefOrder, cmParentNo, cmContent);
	            // 부모댓글의 그룹내 순서보다 큰 refOrder는 모두 +1 업데이트
	            updateRefOrderGreaterThan(cmRef, cmRefOrder, bNo);
	          }
	          // 대대댓글이 존재하는 상태에서 대대댓글인 경우
	          // 대댓글의 step이 댓글의 그룹내에서 최대 step과 같은 경우
	          else if (cmStep == maxStep) {
	        	answerCount = getAnswerCount(bNo, cmParentNo);
	        	// cmRefOrder
	            long cmRefOrder = getRefOrder(con, cmParentNo, bNo) + answerCount + 1L;
	            System.out.println("cmRefOrder = " + cmRefOrder);
	            System.out.println("answerCount = " + answerCount);
	            // 부모댓글의 그룹내 순서와 자식댓글을 더한 값보다 큰 refOrder는 모두 +1 업데이트
	            updateRefOrderGreaterThan(cmRef, cmRefOrder, bNo);
	            // 대댓글 저장
	            saveComment(bNo, uid, uNickName, cmRef, cmStep, cmRefOrder, cmParentNo, cmContent);
	          }
	          // 새로운 대대댓글인 경우
	          // 대댓글의 step이 댓글의 그룹내에서 최대 step보다 큰 경우
	          else {
	            // refOrder는 refOrder + 1
	            long refOrder = getRefOrder(con, cmParentNo, bNo) + 1L;
	            // 부모댓글의 그룹내 순서보다 큰 refOrder는 모두 +1 업데이트
	            updateRefOrderGreaterThan(cmRef, refOrder, bNo);
	            // 대댓글 저장
	            saveComment(bNo, uid, uNickName, cmRef, cmStep, refOrder, cmParentNo, cmContent);
	          }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}

	
	public int deleteComment(int bNo, int cmNo) {
		Connection con = null;
	    PreparedStatement ps = null;
	    int result = 0;
	    
	    try {
	    	con = dataSource.getConnection();
	        String sql = "update comment set cmDeleted = 1, cmDeleteDate = now() where bNo = ? and cmNo = ?";
	        
	        ps = con.prepareStatement(sql);
	        ps.setInt(1, bNo);
	        ps.setInt(2, cmNo);
	        result = ps.executeUpdate();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	        	if(con != null) con.close();
				if(ps != null) ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
	    }
		return result;
	}
	
	public int modifyComment(int bNo, int cmNo, String cmContent) {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			con = dataSource.getConnection();
			String sql = "update comment set cmContent = ? where bNo = ? and cmNo = ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, cmContent);
			ps.setInt(2, bNo);
			ps.setInt(3, cmNo);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(con != null) con.close();
				if(ps != null) ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return result;
	}









}	// End Class
