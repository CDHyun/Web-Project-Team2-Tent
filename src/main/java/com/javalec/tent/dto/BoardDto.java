package com.javalec.tent.dto;

public class BoardDto {

	/* Field */
	int bNo; // 게시글 번호
	String uid; // 작성자 ID
	String uNickName; // 작성자 닉네임
	int bCgNo; // 작성글 카테고리 번호 1:잡담
	String bTitle; // 작성글 제목
	String bContent; // 작성글 내용
	String bInsertDate; // 작성 일자
	String bUpdateDate; // 수정 일자
	String bDeleteDate; // 삭제 일자
	boolean bDeleted; // 삭제 여부 false : 삭제 되지 않음. true : 삭제 됨.
	int bViewCount; // 작성글 조회수

	/* Constructor */
	public BoardDto() {
		// TODO Auto-generated constructor stub
	}

	public BoardDto(int bNo, String uid, String uNickName, int bCgNo, String bTitle, String bContent,
			String bInsertDate, int bViewCount) {
		super();
		this.bNo = bNo;
		this.uid = uid;
		this.uNickName = uNickName;
		this.bCgNo = bCgNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bInsertDate = bInsertDate;
		this.bViewCount = bViewCount;
	}

	/* getter&setter */
	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getuNickName() {
		return uNickName;
	}

	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}

	public int getbCgNo() {
		return bCgNo;
	}

	public void setbCgNo(int bCgNo) {
		this.bCgNo = bCgNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbInsertDate() {
		return bInsertDate;
	}

	public void setbInsertDate(String bInsertDate) {
		this.bInsertDate = bInsertDate;
	}

	public String getbUpdateDate() {
		return bUpdateDate;
	}

	public void setbUpdateDate(String bUpdateDate) {
		this.bUpdateDate = bUpdateDate;
	}

	public String getbDeleteDate() {
		return bDeleteDate;
	}

	public void setbDeleteDate(String bDeleteDate) {
		this.bDeleteDate = bDeleteDate;
	}

	public boolean isbDeleted() {
		return bDeleted;
	}

	public void setbDeleted(boolean bDeleted) {
		this.bDeleted = bDeleted;
	}

	public int getbViewCount() {
		return bViewCount;
	}

	public void setbViewCount(int bViewCount) {
		this.bViewCount = bViewCount;
	}

} // End Class
