package com.javalec.tent.dto;

public class UserDto {
	
	/* User */
	String uid;							// 유저 아이디
	String uPassword;					// 유저 비밀번호
	String uName;						// 유저 이름
	String uNickName;					// 유저 닉네임
	String uPhone;						// 유저 전화번호
	String uBirthday;					// 유저 생일
	String uEmail;						// 유저 이메일
	String uInsertDate;					// 유저 회원가입 날짜
	String uUpdateDate;					// 유저 정보 수정 날짜
	String uDeleteDate;					// 유저 탈퇴 날짜
	boolean uSecessionStatus;			// 유저 탈퇴 여부 (default : 0. false(탈퇴하지 않음)
	
	/* UserAddress */
	int uaNo; 							// 유저 주소 번호(1~3까지 둘 생각)
	String uaZipcode;					// 유저 우편 번호
	String uaAddress;					// 유저 주소(API가 주는 값)
	String uaDetailAddress;				// 유저 상세 주소(직접 입력)

	
	/* Constructor */
	public UserDto() {
		// TODO Auto-generated constructor stub
	}

	
//	u.uid, u.uPassword, u.uName, u.uNickName, u.uPhone, u.uEmail, u.uGender, u.uBirthday, u.uInsertDate, ua.uaNo, ua.uaAddress, ua.uaDetailAddress, ua.uaZipCode from user u, userAddress
	/* 사용자 정보 조회 */
	public UserDto(String uid, String uPassword, String uName, String uNickName, String uPhone, String uBirthday,
			String uEmail, String uInsertDate, int uaNo, String uaZipcode, String uaAddress, String uaDetailAddress) {
		super();
		this.uid = uid;
		this.uPassword = uPassword;
		this.uName = uName;
		this.uNickName = uNickName;
		this.uPhone = uPhone;
		this.uBirthday = uBirthday;
		this.uEmail = uEmail;
		this.uInsertDate = uInsertDate;
		this.uaNo = uaNo;
		this.uaZipcode = uaZipcode;
		this.uaAddress = uaAddress;
		this.uaDetailAddress = uaDetailAddress;
	}
	
	
	
	
	
	
	
	
	
	
	
	/* getter & setter */
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}


	public String getuPassword() {
		return uPassword;
	}


	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}


	public String getuName() {
		return uName;
	}


	public void setuName(String uName) {
		this.uName = uName;
	}


	public String getuNickName() {
		return uNickName;
	}


	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}


	public String getuPhone() {
		return uPhone;
	}


	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}


	public String getuBirthday() {
		return uBirthday;
	}


	public void setuBirthday(String uBirthday) {
		this.uBirthday = uBirthday;
	}


	public String getuEmail() {
		return uEmail;
	}


	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}


	public String getuInsertDate() {
		return uInsertDate;
	}


	public void setuInsertDate(String uInsertDate) {
		this.uInsertDate = uInsertDate;
	}


	public String getuUpdateDate() {
		return uUpdateDate;
	}


	public void setuUpdateDate(String uUpdateDate) {
		this.uUpdateDate = uUpdateDate;
	}


	public String getuDeleteDate() {
		return uDeleteDate;
	}


	public void setuDeleteDate(String uDeleteDate) {
		this.uDeleteDate = uDeleteDate;
	}


	public boolean isuSecessionStatus() {
		return uSecessionStatus;
	}


	public void setuSecessionStatus(boolean uSecessionStatus) {
		this.uSecessionStatus = uSecessionStatus;
	}


	public int getUaNo() {
		return uaNo;
	}


	public void setUaNo(int uaNo) {
		this.uaNo = uaNo;
	}


	public String getUaZipcode() {
		return uaZipcode;
	}


	public void setUaZipcode(String uaZipcode) {
		this.uaZipcode = uaZipcode;
	}


	public String getUaAddress() {
		return uaAddress;
	}


	public void setUaAddress(String uaAddress) {
		this.uaAddress = uaAddress;
	}


	public String getUaDetailAddress() {
		return uaDetailAddress;
	}


	public void setUaDetailAddress(String uaDetailAddress) {
		this.uaDetailAddress = uaDetailAddress;
	}
	
	
	
	
	
}	// End Class