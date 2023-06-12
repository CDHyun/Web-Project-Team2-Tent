package com.javalec.tent.dto;

public class NoticeDto {

	//nNo, aid, nCgNo, nTitle, nContent, nInsertDate, nUpdateDate, nDeleteDate, nDeleted
	
	int nNo;
	String aid;
	int nCgNo;
	String nTitle;
	String nContent;
	String nInsertDate;
	String nUpdateDate;
	String nDeleteDate;
	int nViewCount;
	boolean nDeleted;
	
	public NoticeDto() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeDto(int nNo, String aid, int nCgNo, String nTitle, String nContent, String nInsertDate,
			String nUpdateDate, String nDeleteDate, boolean nDeleted, int nViewCount) {
		super();
		this.nNo = nNo;
		this.aid = aid;
		this.nCgNo = nCgNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nInsertDate = nInsertDate;
		this.nUpdateDate = nUpdateDate;
		this.nDeleteDate = nDeleteDate;
		this.nDeleted = nDeleted;
		this.nViewCount = nViewCount;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
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

	public String getnInsertDate() {
		return nInsertDate;
	}

	public void setnInsertDate(String nInsertDate) {
		this.nInsertDate = nInsertDate;
	}

	public String getnUpdateDate() {
		return nUpdateDate;
	}

	public void setnUpdateDate(String nUpdateDate) {
		this.nUpdateDate = nUpdateDate;
	}

	public String getnDeleteDate() {
		return nDeleteDate;
	}

	public void setnDeleteDate(String nDeleteDate) {
		this.nDeleteDate = nDeleteDate;
	}

	public boolean isnDeleted() {
		return nDeleted;
	}

	public void setnDeleted(boolean nDeleted) {
		this.nDeleted = nDeleted;
	}

	public int getnViewCount() {
		return nViewCount;
	}

	public void setnViewCount(int nViewCount) {
		this.nViewCount = nViewCount;
	}
	
	
	
}
