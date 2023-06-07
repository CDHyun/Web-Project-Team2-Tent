package com.javalec.tent.dto;

public class QuestionDto {

	/* Field */
	int qNo; 						// QNA 작성 번호
	String uid; 					// 작성한 유저
	String uNickName; 				// 작성한 유저의 닉네임
	int qCgNo; 						// QNA 카테고리 번호. 1: , 2:
	String qTitle; 					// QNA 제목
	String qContent;				// QNA 내용
	String qInsertDate; 			// QNA 작성 일자
	String qUpdateDate; 			// QNA 수정 일자
	String qDeleteDate; 			// QNA 삭제 일자
	boolean qDeleted; 				// QNA 삭제 여부 ( 0 : false 삭제되지 않음, 1 : true 삭제됨. )
	int qViewCount;					// QNA 조회수

	/* Constructor */
	public QuestionDto() {
		// TODO Auto-generated constructor stub
	}

	//qNo, uid, uNickName, qCgNo, qTitle, qContent, qInsertDate
	public QuestionDto(int qNo, String uid, String uNickName, int qCgNo, String qTitle, String qContent,
			String qInsertDate, int qViewCount) {
		super();
		this.qNo = qNo;
		this.uid = uid;
		this.uNickName = uNickName;
		this.qCgNo = qCgNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qInsertDate = qInsertDate;
		this.qViewCount = qViewCount;
	}
	
	/* getter & setter */
	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public int getqCgNo() {
		return qCgNo;
	}

	public void setqCgNo(int qCgNo) {
		this.qCgNo = qCgNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqInsertDate() {
		return qInsertDate;
	}

	public void setqInsertDate(String qInsertDate) {
		this.qInsertDate = qInsertDate;
	}

	public String getqUpdateDate() {
		return qUpdateDate;
	}

	public void setqUpdateDate(String qUpdateDate) {
		this.qUpdateDate = qUpdateDate;
	}

	public String getqDeleteDate() {
		return qDeleteDate;
	}

	public void setqDeleteDate(String qDeleteDate) {
		this.qDeleteDate = qDeleteDate;
	}

	public boolean isqDeleted() {
		return qDeleted;
	}

	public void setqDeleted(boolean qDeleted) {
		this.qDeleted = qDeleted;
	}

	public String getuNickName() {
		return uNickName;
	}

	public void setuNickName(String uNickName) {
		this.uNickName = uNickName;
	}

	public int getqViewCount() {
		return qViewCount;
	}

	public void setqViewCount(int qViewCount) {
		this.qViewCount = qViewCount;
	}
	
	

}
