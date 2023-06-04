package com.javalec.tent.dto;

import java.sql.Date;

public class AdminDto {
	int pCode;
	String pName;
	String pBrandName;
	int pPrice;
	Date pInsertdate;
	Date pupdatedate;
	Date pdeletedate;
	String pfName;
	String pfRealName;
	int cgNo;
	String cgName;
	String pColor;
	int pStock;
	
	// 주문처리에 필요한 변수
	int pcNo;
	String uid;
	int pcQty;
	int pcStatus;
	Date pcInsertdate;
	
	
	public AdminDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public AdminDto(int pCode) {
		// TODO Auto-generated constructor stub
		this.pCode = pCode;
	}
	
	
	
	


	public AdminDto(int pcNo, String uid, int pCode, String pColor, int pcQty, int pcStatus, Date pcInsertdate) {
		super();
		this.pCode = pCode;
		this.pColor = pColor;
		this.pcNo = pcNo;
		this.uid = uid;
		this.pcQty = pcQty;
		this.pcStatus = pcStatus;
		this.pcInsertdate = pcInsertdate;
	}


	public int getPcNo() {
		return pcNo;
	}


	public void setPcNo(int pcNo) {
		this.pcNo = pcNo;
	}


	public String getUid() {
		return uid;
	}


	public void setUid(String uid) {
		this.uid = uid;
	}


	public int getPcQty() {
		return pcQty;
	}


	public void setPcQty(int pcQty) {
		this.pcQty = pcQty;
	}


	public int getPcStatus() {
		return pcStatus;
	}


	public void setPcStatus(int pcStatus) {
		this.pcStatus = pcStatus;
	}


	public Date getPcInsertdate() {
		return pcInsertdate;
	}


	public void setPcInsertdate(Date pcInsertdate) {
		this.pcInsertdate = pcInsertdate;
	}


	public AdminDto(int pCode, String pBrandName,  String pName,String pColor,int pPrice,int pStock, Date pInsertdate, String pfName, String pfRealName) {
		super();
		this.pCode = pCode;
		this.pName = pName;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
		this.pInsertdate = pInsertdate;
		this.pfName = pfName;
		this.pfRealName = pfRealName;
		this.pColor = pColor;
		this.pStock = pStock;
	}



	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String getCgName() {
		return cgName;
	}






	public void setCgName(String cgName) {
		this.cgName = cgName;
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


	public String getpBrandName() {
		return pBrandName;
	}


	public void setpBrandName(String pBrandName) {
		this.pBrandName = pBrandName;
	}


	public int getpPrice() {
		return pPrice;
	}


	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}


	public Date getpInsertdate() {
		return pInsertdate;
	}


	public void setpInsertdate(Date pInsertdate) {
		this.pInsertdate = pInsertdate;
	}


	public Date getPupdatedate() {
		return pupdatedate;
	}


	public void setPupdatedate(Date pupdatedate) {
		this.pupdatedate = pupdatedate;
	}


	public Date getPdeletedate() {
		return pdeletedate;
	}


	public void setPdeletedate(Date pdeletedate) {
		this.pdeletedate = pdeletedate;
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


	public int getCgNo() {
		return cgNo;
	}


	public void setCgNo(int cgNo) {
		this.cgNo = cgNo;
	}


	public String getcgName() {
		return cgName;
	}


	public void setcgName(String cgName) {
		this.cgName = cgName;
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
