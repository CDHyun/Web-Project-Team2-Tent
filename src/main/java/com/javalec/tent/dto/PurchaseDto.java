package com.javalec.tent.dto;


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
	String pColor;						//상품 색
	String pName;						// 상품명
	String pBrandName;                  //상품 브랜드 이름
	String pcInsertDate;             //상품 주문 날짜
	String pcDeleteDate;		        //상품 주문 취소 날짜
	String pcStatus;                    //상품 주문 상태 
	String pcDM;
	
	
	/* ProductFile */
	String pfName;			// 올린 상품 이미지 이름
	String pfRealName;		// 프로젝트에 저장된 실제 파일 이름
	String pfHoverName;		// 올린 호버 이미지 이름
	String pfHoverRealName;	// 프로젝트에 저장되는 실제 호버 이미지 이름
	
	
	
	//constructor
	public PurchaseDto() {
		// TODO Auto-generated constructor stub
	}
	

	public PurchaseDto(String uid, String pcStatus) {
		super();
		this.uid = uid;
		this.pcStatus = pcStatus;
	}



	public PurchaseDto(String uid, String uName, String uPhone, String uEmail, String uaZipcode, String uaAddress, String uaDetailAddress) {
		super();
		this.uid = uid;
		this.uName = uName;
		this.uPhone = uPhone;
		this.uEmail = uEmail;
		this.uaZipcode = uaZipcode;
		this.uaAddress = uaAddress;
		this.uaDetailAddress = uaDetailAddress;
	}



	

	public PurchaseDto(String uid, int pCode, int pcQty, String pColor, String pcInsertDate, String pcDM) {
		super();
		this.uid = uid;
		this.pCode = pCode;
		this.pcQty = pcQty;
		this.pColor = pColor;
		this.pcInsertDate = pcInsertDate;
		this.pcDM = pcDM;
	}



	public PurchaseDto(String uid, int pCode, int pPrice, String pName, String pcStatus, String pfRealName,
			String pfHoverRealName, String pcInsertDate) {
		super();
		this.uid = uid;
		this.pCode = pCode;
		this.pPrice = pPrice;
		this.pName = pName;
		this.pcStatus = pcStatus;
		this.pfRealName = pfRealName;
		this.pfHoverRealName = pfHoverRealName;
		this.pcInsertDate = pcInsertDate;
	}

	public PurchaseDto(String uid, int pCode, int pPrice, String pName, String pcStatus, String pfRealName,
			String pfHoverRealName) {
		super();
		this.uid = uid;
		this.pCode = pCode;
		this.pPrice = pPrice;
		this.pName = pName;
		this.pcStatus = pcStatus;
		this.pfRealName = pfRealName;
		this.pfHoverRealName = pfHoverRealName;
	}
	
	

	public PurchaseDto(String uid, int pcNo, int pCode, int pPrice, int pcQty, String pColor, String pName,
			String pcInsertDate, String pfRealName, String pfHoverRealName) {
		super();
		this.uid = uid;
		this.pcNo = pcNo;
		this.pCode = pCode;
		this.pPrice = pPrice;
		this.pcQty = pcQty;
		this.pColor = pColor;
		this.pName = pName;
		this.pcInsertDate = pcInsertDate;
		this.pfRealName = pfRealName;
		this.pfHoverRealName = pfHoverRealName;
	}

	
	
	public PurchaseDto(String uid, String uName, String uPhone, String uaAddress, int pcNo, int pCode, int pPrice,
			int pcQty, String pColor, String pName, String pcInsertDate, String pfRealName, String pfHoverRealName, String pcStatus) {
		super();
		this.uid = uid;
		this.uName = uName;
		this.uPhone = uPhone;
		this.uaAddress = uaAddress;
		this.pcNo = pcNo;
		this.pCode = pCode;
		this.pPrice = pPrice;
		this.pcQty = pcQty;
		this.pColor = pColor;
		this.pName = pName;
		this.pcInsertDate = pcInsertDate;
		this.pfRealName = pfRealName;
		this.pfHoverRealName = pfHoverRealName;
		this.pcStatus = pcStatus;
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


	public String getpColor() {
		return pColor;
	}


	public void setpColor(String pColor) {
		this.pColor = pColor;
	}


	public String getpName() {
		return pName;
	}


	public void setpName(String pName) {
		this.pName = pName;
	}


	public String getpBrandName() {
		return pBrandName;
	}


	public void setpBrandName(String pBrandName) {
		this.pBrandName = pBrandName;
	}


	public String getPcInsertDate() {
		return pcInsertDate;
	}


	public void setPcInsertDate(String pcInsertDate) {
		this.pcInsertDate = pcInsertDate;
	}


	public String getPcDeleteDate() {
		return pcDeleteDate;
	}


	public void setPcDeleteDate(String pcDeleteDate) {
		this.pcDeleteDate = pcDeleteDate;
	}


	public String getPcStatus() {
		return pcStatus;
	}


	public void setPcStatus(String pcStatus) {
		this.pcStatus = pcStatus;
	}


	public String getPcDM() {
		return pcDM;
	}


	public void setPcDM(String pcDM) {
		this.pcDM = pcDM;
	}


	public String getPfName() {
		return pfName;
	}


	public void setPfName(String pfName) {
		this.pfName = pfName;
	}


	public String getPfRealName() {
		return pfRealName;
	}


	public void setPfRealName(String pfRealName) {
		this.pfRealName = pfRealName;
	}


	public String getPfHoverName() {
		return pfHoverName;
	}


	public void setPfHoverName(String pfHoverName) {
		this.pfHoverName = pfHoverName;
	}


	public String getPfHoverRealName() {
		return pfHoverRealName;
	}


	public void setPfHoverRealName(String pfHoverRealName) {
		this.pfHoverRealName = pfHoverRealName;
	}



	
	
	
}





