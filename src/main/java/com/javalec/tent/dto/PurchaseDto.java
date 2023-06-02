package com.javalec.tent.dto;

import java.sql.Timestamp;

public class PurchaseDto {

	
	/* User */
	String uid;							// 유저 아이디
	String uPassword;					// 유저 비밀번호
	String uName;						// 유저 이름
	String uPhone;						// 유저 전화번호
	String uEmail;						// 유저 이메일
	
	
	/* UserAddress */
	int uaNo; 							// 유저 주소 번호(1~3까지 둘 생각)
	String uaZipcode;					// 유저 우편 번호
	String uaAddress;					// 유저 주소(API가 주는 값)
	String uaDetailAddress;				// 유저 상세 주소(직접 입력)

	
	/* Product */
	int pcNo;                           //상품 주문 번호
	int pCode;                          //상품 코드
	int pPrice;                         //상품 가격
	int pcQty;                          //상품 수량
	int pStock;                         //상품 재고
	int cgNo;				            //카테고리 번호
	String pImage;                      //상품 이미지
	String pBrandName;                  //상품 브랜드 이름
	Timestamp pcInsertDate;             //상품 주문 날짜
	Timestamp pcDeleteDate;		        //상품 주문 취소 날짜
	String pcStatus;                    //상품 주문 상태 
	
	//constructor
	public PurchaseDto() {
		// TODO Auto-generated constructor stub
	}
	
	



	public PurchaseDto(String uid, String uName, String uPhone, String uEmail, String uaZipcode, String uaAddress) {
		super();
		this.uid = uid;
		this.uName = uName;
		this.uPhone = uPhone;
		this.uEmail = uEmail;
		this.uaZipcode = uaZipcode;
		this.uaAddress = uaAddress;
	}





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

	public String getuPhone() {
		return uPhone;
	}

	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
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

	public int getPcNo() {
		return pcNo;
	}

	public void setPcNo(int pcNo) {
		this.pcNo = pcNo;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getPcQty() {
		return pcQty;
	}

	public void setPcQty(int pcQty) {
		this.pcQty = pcQty;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	public int getCgNo() {
		return cgNo;
	}

	public void setCgNo(int cgNo) {
		this.cgNo = cgNo;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public String getpBrandName() {
		return pBrandName;
	}

	public void setpBrandName(String pBrandName) {
		this.pBrandName = pBrandName;
	}

	public Timestamp getPcInsertDate() {
		return pcInsertDate;
	}

	public void setPcInsertDate(Timestamp pcInsertDate) {
		this.pcInsertDate = pcInsertDate;
	}

	public Timestamp getPcDeleteDate() {
		return pcDeleteDate;
	}

	public void setPcDeleteDate(Timestamp pcDeleteDate) {
		this.pcDeleteDate = pcDeleteDate;
	}

	public String getPcStatus() {
		return pcStatus;
	}

	public void setPcStatus(String pcStatus) {
		this.pcStatus = pcStatus;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}





