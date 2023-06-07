package com.javalec.tent.dto;

public class CommentDto {
	
	//cmNo, bNo, uid, uNickName, cmRef, cmStep, cmRefOrder, cmAnswerCount, cmParentNo, cmContent, cmInsertDate
	//cmUpdateDate, cmDeleteDate, cmDeleted, cmRec, cmUnrec
	
	/* Field */
	int cmNo;							// 댓글 번호
	int bNo;							// 게시글 번호
	String uid;							// 작성자 ID
	String uNickName;					// 작성자 닉네임
	int cmRef;							// 댓글의 그룹
	int cmStep;							// 댓글의 계층
	int cmRefOrder;						// 댓글 그룹의 순서
	int cmAnswerCount;					// 댓글에 달린 대댓글의 카운트
	int cmParentNo;						// 댓글의 부모글 번호
	String cmContent;					// 댓글의 내용
	String cmInsertDate;				// 댓글의 작성 시간
	String cmUpdateDate;				// 댓글의 수정 시간
	String cmDeleteDate;				// 댓글의 삭제 시간
	boolean cmDeleted;					// 댓글의 삭제 여부
	int cmRec;							// 댓글의 추천수
	int cmUnrec;						// 댓글의 비추천수
	
	/* Constructor */
	public CommentDto() {
		// TODO Auto-generated constructor stub
	}
	
	public CommentDto(int cmNo, int bNo, String uid, String uNickName, int cmRef, int cmStep, int cmRefOrder,
			int cmAnswerCount, int cmParentNo, String cmContent, String cmInsertDate, String cmUpdateDate,
			String cmDeleteDate, boolean cmDeleted, int cmRec, int cmUnrec) {
		super();
		this.cmNo = cmNo;
		this.bNo = bNo;
		this.uid = uid;
		this.uNickName = uNickName;
		this.cmRef = cmRef;
		this.cmStep = cmStep;
		this.cmRefOrder = cmRefOrder;
		this.cmAnswerCount = cmAnswerCount;
		this.cmParentNo = cmParentNo;
		this.cmContent = cmContent;
		this.cmInsertDate = cmInsertDate;
		this.cmUpdateDate = cmUpdateDate;
		this.cmDeleteDate = cmDeleteDate;
		this.cmDeleted = cmDeleted;
		this.cmRec = cmRec;
		this.cmUnrec = cmUnrec;
	}



	/* getter & setter */
	public int getCmNo() {
		return cmNo;
	}

	public void setCmNo(int cmNo) {
		this.cmNo = cmNo;
	}

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

	public int getCmRef() {
		return cmRef;
	}

	public void setCmRef(int cmRef) {
		this.cmRef = cmRef;
	}

	public int getCmStep() {
		return cmStep;
	}

	public void setCmStep(int cmStep) {
		this.cmStep = cmStep;
	}

	public int getCmRefOrder() {
		return cmRefOrder;
	}

	public void setCmRefOrder(int cmRefOrder) {
		this.cmRefOrder = cmRefOrder;
	}

	public int getCmAnswerCount() {
		return cmAnswerCount;
	}

	public void setCmAnswerCount(int cmAnswerCount) {
		this.cmAnswerCount = cmAnswerCount;
	}

	public int getCmParentNo() {
		return cmParentNo;
	}

	public void setCmParentNo(int cmParentNo) {
		this.cmParentNo = cmParentNo;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	public String getCmInsertDate() {
		return cmInsertDate;
	}

	public void setCmInsertDate(String cmInsertDate) {
		this.cmInsertDate = cmInsertDate;
	}

	public String getCmUpdateDate() {
		return cmUpdateDate;
	}

	public void setCmUpdateDate(String cmUpdateDate) {
		this.cmUpdateDate = cmUpdateDate;
	}

	public String getCmDeleteDate() {
		return cmDeleteDate;
	}

	public void setCmDeleteDate(String cmDeleteDate) {
		this.cmDeleteDate = cmDeleteDate;
	}

	public boolean isCmDeleted() {
		return cmDeleted;
	}

	public void setCmDeleted(boolean cmDeleted) {
		this.cmDeleted = cmDeleted;
	}

	public int getCmRec() {
		return cmRec;
	}

	public void setCmRec(int cmRec) {
		this.cmRec = cmRec;
	}

	public int getCmUnrec() {
		return cmUnrec;
	}

	public void setCmUnrec(int cmUnrec) {
		this.cmUnrec = cmUnrec;
	}
	
	

}	// End Class
