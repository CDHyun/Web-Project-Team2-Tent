package com.javalec.tent.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalec.tent.dto.UserDto;

public class UserDao {

	/* Field */
	/* User */
	String uid;							// 유저 아이디
	String uPassword;					// 유저 비밀번호
	String uName;						// 유저 이름
	String uNickName;					// 유저 닉네임
	String uPhone;						// 유저 전화번호
	String uBirthday;					// 유저 생일
	String uEmail;						// 유저 이메일
	int uGender;						// 유저 성별 1:남자, 2:여자
	String uInsertDate;					// 유저 회원가입 날짜
	String uUpdateDate;					// 유저 정보 수정 날짜
	String uDeleteDate;					// 유저 탈퇴 날짜
	boolean uSecessionStatus;			// 유저 탈퇴 여부 (default : 0. false(탈퇴하지 않음)
	
	/* UserAddress */
	int uaNo; 							// 유저 주소 번호(1~3까지 둘 생각)
	String uaZipcode;					// 유저 우편 번호
	String uaAddress;					// 유저 주소(API가 주는 값)
	String uaDetailAddress;				// 유저 상세 주소(직접 입력)

	DataSource dataSource;

	public UserDao() {
		// TODO Auto-generated constructor stub
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/tent");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int signUp(String uid, String uPassword, String uName, String uNickName, String uPhone, String uEmail, int uGender, String uBirthday, String uAddress, String uDetailAddress, String uZipcode) {
	    int userCount = 0;
	    int userAddressCount = 0;
	    int result = 0;

	    Connection con = null;
	    PreparedStatement userPs = null;
	    PreparedStatement addressPs = null;

	    try {
	        con = dataSource.getConnection();

	        String sql1 = "insert into user(uid, uPassword, uName, uNickName, uPhone, uEmail, uGender, uBirthday, uInsertDate) values(?, ?, ?, ?, ?, ?, ?, ?, now())";
	        userPs = con.prepareStatement(sql1);
	        userPs.setString(1, uid);
	        userPs.setString(2, uPassword);
	        userPs.setString(3, uName);
	        userPs.setString(4, uNickName);
	        userPs.setString(5, uPhone);
	        userPs.setString(6, uEmail);
	        userPs.setInt(7, uGender);
	        userPs.setString(8, uBirthday);
	        userCount = userPs.executeUpdate();

	        String sql2 = "insert into userAddress(uaNo, uid, uaAddress, uaDetailAddress, uaZipcode) values(1, ?, ?, ?, ?)";
	        addressPs = con.prepareStatement(sql2);
	        addressPs.setString(1, uid);
	        addressPs.setString(2, uAddress);
	        addressPs.setString(3, uDetailAddress);
	        addressPs.setString(4, uZipcode);
	        userAddressCount = addressPs.executeUpdate();

	        if (userCount > 0 && userAddressCount > 0) {
	            /* 회원가입 성공 */
	            result = 1;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (con != null) con.close();
	            if (userPs != null) userPs.close();
	            if (addressPs != null) addressPs.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return result;
	}


	public int checkDuplicateId(String uid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int rowCount = 0;

		try {
			con = dataSource.getConnection();

			String query = "select count(*) from user where uid = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			if (rs.next()) {
				rowCount = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR");
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return rowCount;
	} // checkDuplicateId

	public int login(String uid, String uPassword) {
		Connection con = null;
		PreparedStatement statusCheckPs = null;
		PreparedStatement accordCheckPs = null;
		PreparedStatement existCheckPs = null;
		ResultSet statusRs = null;
		ResultSet accordRs = null;
		ResultSet existRs = null;
		int existUserCount = 0;
		boolean statusCheck = false;
		int accordCount = 0;
		int result = 0;

		try {
			con = dataSource.getConnection();
			String query2 = "select uSecessionStatus from user where uid = ?";
			statusCheckPs = con.prepareStatement(query2);
			statusCheckPs.setString(1, uid);
			statusRs = statusCheckPs.executeQuery();
			if (statusRs.next()) {
				statusCheck = statusRs.getBoolean(1);
			}
			if(statusCheck) {
				result = -1;	// 탈퇴함
			} else {
				String query1 = "select count(*) from user where uid = ?";
				existCheckPs = con.prepareStatement(query1);
				existCheckPs.setString(1, uid);
				existRs = existCheckPs.executeQuery();
				if(existRs.next()) {
					existUserCount = existRs.getInt(1);
				}
				
				if(existUserCount == 0) {
					result = -2;	//존재하지 않음
				} else {
					String query3 = "select count(*) from user where uid = ? and uPassword = ?";
					accordCheckPs = con.prepareStatement(query3);
					accordCheckPs.setString(1, uid);
					accordCheckPs.setString(2, uPassword);
					accordRs = accordCheckPs.executeQuery();
					if (accordRs.next()) {
					    accordCount = accordRs.getInt(1);
					}
					if(accordCount == 0) {
						result = 0;	// 틀림
					}
					if(accordCount > 0) {
						result = 1;	// 맞음
					}
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) con.close();
				if (statusCheckPs != null) statusCheckPs.close();
				if (accordCheckPs != null) accordCheckPs.close();
				if (existCheckPs != null) existCheckPs.close();
				if (statusRs != null) statusRs.close();
				if (accordRs != null) accordRs.close();
				if (existRs != null) existRs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}	// login
	
	public ArrayList<UserDto> userinfo(String uid) {
		ArrayList<UserDto> beanList = new ArrayList<UserDto>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			con = dataSource.getConnection();

			String query = "select u.uid, u.uPassword, u.uName, u.uNickName, u.uPhone, u.uEmail, u.uGender,"
					+ " u.uBirthday, u.uInsertDate, ua.uaNo, ua.uaAddress, ua.uaDetailAddress, ua.uaZipcode"
					+ " from user u, userAddress ua where u.uid = ua.uid and u.uid = ? and ua.uaNo = 1";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			while (rs.next()) {
				String wkid = rs.getString(1);
				String wkPassword = rs.getString(2);
				String wkName = rs.getString(3);
				String wkNickName = rs.getString(4);
				String wkPhone = rs.getString(5);
				String wkEmail = rs.getString(6);
				int wkGender = rs.getInt(7);
				String wkBirthday = rs.getString(8);
				String wkInsertDate = rs.getString(9);
				int wkuaNo = rs.getInt(10);
				String wkuaAddress = rs.getString(11);
				String wkuaDetailAddress = rs.getString(12);
				String wkuaZipCode = rs.getString(13);
				UserDto userDto = new UserDto(wkid, wkPassword, wkName, wkNickName, wkPhone, wkBirthday, wkGender, wkEmail, wkInsertDate, wkuaNo, wkuaZipCode, wkuaAddress, wkuaDetailAddress);
				beanList.add(userDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ERROR");
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return beanList;
	}
	
	public int userinfoModify(String uid, String uPassword, String uName, String uPhone, String uAddress, String uEmail) {
		int count = 0;
		int result = 0;

		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = dataSource.getConnection();

			String query = "update user set uPassword = ?, uName = ?, uPhone = ?, uAddress = ?, uEmail = ?, uUpdateDate = now() where uid = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, uPassword);
			ps.setString(2, uName);
			ps.setString(3, uPhone);
			ps.setString(4, uAddress);
			ps.setString(5, uEmail);
			ps.setString(6, uid);

			count = ps.executeUpdate();

			if (count > 0) {
				/* 변경 성공 */
				result = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public int userSecede(String uid) {
		int count = 0;
		int result = 0;
		Connection con = null;
		PreparedStatement ps = null;
		try {
			con = dataSource.getConnection();

			String query = "update user set uDeleteDate = now(), uSecessionStatus = 1 where uid = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			count = ps.executeUpdate();
			if (count > 0) {
				result = 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	public String userNickName(String uid) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String uNickname = "";
		try {
			con = dataSource.getConnection();

			String query = "select uNickName from user where uid = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			if(rs.next()) {
				uNickname = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return uNickname;
	}
	
	public int userPasswordConfirm(String uid, String uPassword) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String dbPassword = "";
		int result = 0;
		try {
			con = dataSource.getConnection();

			String query = "select uPassword from user where uid = ?";
			ps = con.prepareStatement(query);
			ps.setString(1, uid);
			rs = ps.executeQuery();
			if(rs.next()) {
				dbPassword = rs.getString(1);
			}
			
			if(dbPassword.equals(uPassword)) {
				result = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
} // End Class
