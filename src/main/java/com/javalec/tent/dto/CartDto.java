package com.javalec.tent.dto;

public class CartDto {
	int cNo;
	int cQty;
	String uid;
	int pCode;
	String pName;
	String pPrice;	
	String pfName;
	String pBrandName;
	String pColor;
	public CartDto() {
		// TODO Auto-generated constructor stub
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
	public String getpPrice() {
		return pPrice;
	}
	public void setpPrice(String pPrice) {
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
	public CartDto(int cNo, int cQty, String uid, int pCode, String pName, String pPrice, String pfName,
			String pBrandName, String pColor) {
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
	//
	
}
