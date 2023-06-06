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
	
	
	
	//공지사항에 필요한 변수
	String aid;
	int nCgNo;
	String nTitle;
	String nContent;
	Date nInsertdate;
	int nNo;
	
	
	//차트에 필요한 변수
	String dayName;
	int daySum;
	int colorSum;
	
	
	// 날짜별매출에 필요한 변수
	int sum;
	int total;
	
	
	
	
	public AdminDto() {
		// TODO Auto-generated constructor stub
	}
	
	
	public AdminDto(int pCode) {
		// TODO Auto-generated constructor stub
		this.pCode = pCode;
	}
	
	
	
	
	
	
	


	public AdminDto(Date pcInsertdate, String pBrandName ,String pName, int pPrice, int sum, int total ) {
		super();
		this.pName = pName;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
		this.sum = sum;
		this.total = total;
		this.pcInsertdate = pcInsertdate;
	}


	public AdminDto(String dayName, int daySum) { //요일별합계
		super();
		this.dayName = dayName;
		this.daySum = daySum;
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



	
	//insertNotice
	public AdminDto(String aid, int nCgNo, String nTitle, String nContent, Date nInsertdate) {
		super();
		this.aid = aid;
		this.nCgNo = nCgNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nInsertdate = nInsertdate;
	}


	
	
	
	
	public AdminDto(int nNo, String aid, String nTitle, Date nInsertdate) {
		super();
		this.aid = aid;
		this.nTitle = nTitle;
		this.nInsertdate = nInsertdate;
		this.nNo = nNo;
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


	public String getAid() {
		return aid;
	}


	public void setAid(String aid) {
		this.aid = aid;
	}


	public int getnCgNo() {
		return nCgNo;
	}


	public void setnCgNo(int nCgNo) {
		this.nCgNo = nCgNo;
	}


	public String getnTitle() {
		return nTitle;
	}


	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}


	public String getnContent() {
		return nContent;
	}


	public void setnContent(String nContent) {
		this.nContent = nContent;
	}


	public Date getnInsertdate() {
		return nInsertdate;
	}


	public void setnInsertdate(Date nInsertdate) {
		this.nInsertdate = nInsertdate;
	}


	public int getnNo() {
		return nNo;
	}


	public void setnNo(int nNo) {
		this.nNo = nNo;
	}


	public String getDayName() {
		return dayName;
	}


	public void setDayName(String dayName) {
		this.dayName = dayName;
	}


	public int getDaySum() {
		return daySum;
	}


	public void setDaySum(int daySum) {
		this.daySum = daySum;
	}


	


	public int getColorSum() {
		return colorSum;
	}


	public void setColorSum(int colorSum) {
		this.colorSum = colorSum;
	}


	public int getSum() {
		return sum;
	}


	public void setSum(int sum) {
		this.sum = sum;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}

	
	
	
	
	
	
	
	
}
