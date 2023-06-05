package com.javalec.tent.dto;

public class WishlistDto {
String uid;
int pCode;
String pName;
int pPrice;	
String pfName;
String pBrandName;
String pColor;

public WishlistDto() {
	// TODO Auto-generated constructor stub
}

public WishlistDto(String uid, int pCode, String pName, int pPrice, String pfName, String pBrandName, String pColor) {
	super();
	this.uid = uid;
	this.pCode = pCode;
	this.pName = pName;
	this.pPrice = pPrice;
	this.pfName = pfName;
	this.pBrandName = pBrandName;
	this.pColor = pColor;
}

public WishlistDto(String uid, int pCode) {
	super();
	this.uid = uid;
	this.pCode = pCode;
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

}