package com.javalec.tent.dto;

public class CartDto {
	int cNo;
	int cQty;
	String uid;
	int pCode;
	String pName;
	int pPrice;	
	String pfName;
	String pBrandName;
	String pColor;
	int pStock;
	int cgNo;
	String pfRealName;
	String pfHoverRealName;
	
	
	public CartDto() {
		// TODO Auto-generated constructor stub
	}
		public CartDto(int cNo, int cQty, String uid, int pCode, String pName, int pPrice, String pfName, String pBrandName,
				String pColor) {
			super();
			this.cNo = cNo;
			this.cQty = cQty;
			this.uid = uid;
			this.pCode = pCode;
			this.pName = pName;
			this.pPrice = pPrice;
			this.pfName = pfName;
			this.pBrandName = pBrandName;
			this.pColor = pColor;
	}
		
	public CartDto(int cNo, int cQty, String uid, int pCode) {
			super();
			this.cNo = cNo;
			this.cQty = cQty;
			this.uid = uid;
			this.pCode = pCode;
		}
	
	
	
	
	public CartDto(int cQty, int pStock, int cNo, int pCode, String uid) {
			super();
			this.cQty = cQty;
			this.pStock = pStock;
			this.cNo = cNo;
			this.pCode = pCode;
			this.uid = uid;
		}
	
	// 장바구니에서 재고 많은 상품 보여주기//
	public CartDto(int pCode, String pName, int pPrice, String pBrandName, String pColor, String pfRealName,
			String pfHoverRealName) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pBrandName = pBrandName;
		this.pColor = pColor;
		this.pfRealName = pfRealName;
		this.pfHoverRealName = pfHoverRealName;
	}
	
	
	// totalPrice
	public CartDto(int cQty, int pPrice) {
		super();
		this.cQty = cQty;
		this.pPrice = pPrice;
	}
	public CartDto(String uid, int pCode) {
		super();
		this.uid = uid;
		this.pCode = pCode;
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public int getcQty() {
		return cQty;
	}
	public void setcQty(int cQty) {
		this.cQty = cQty;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public int getpCode() {
		return pCode;
	}
	public void setpCode(int pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getPfName() {
		return pfName;
	}
	public void setPfName(String pfName) {
		this.pfName = pfName;
	}
	public String getpBrandName() {
		return pBrandName;
	}
	public void setpBrandName(String pBrandName) {
		this.pBrandName = pBrandName;
	}
	public String getpColor() {
		return pColor;
	}
	public void setpColor(String pColor) {
		this.pColor = pColor;
	}
	public int getpStock() {
		return pStock;
	}
	public void setpStock(int pStock) {
			this.pStock = pStock;
	}
	}

	
	
	