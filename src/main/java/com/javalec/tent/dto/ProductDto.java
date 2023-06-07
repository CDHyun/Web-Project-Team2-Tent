package com.javalec.tent.dto;

public class ProductDto {
	
	/********* Field ********** /
	
	/* Category */
	int cgNo;				// 카테고리 번호
	String cgName;			// 카테고리 이름
	
	/* Product */
	int pCode;				// 상품 번호
	String pName;			// 상품명
	String pBrandName;		// 브랜드명
	int pPrice;				// 상품 가격
	String pInsertDate;		// 상품 입고 날짜
	String pUpdateDate;		// 상품 정보 수정 날짜
	String pDeleteDate;		// 상품 삭제 처리 날짜
	boolean pDeleted;		// 상품 삭제 여부(Default 0 : false -> 삭제 되지 않음.)
	int productCount;		//
	
	/* ProductFile */
	String pfName;			// 올린 상품 이미지 이름
	String pfRealName;		// 프로젝트에 저장된 실제 파일 이름
	String pfHoverName;		// 올린 호버 이미지 이름
	String pfHoverRealName;	// 프로젝트에 저장되는 실제 호버 이미지 이름
	
	String pColor;			// 상품의 색상
	int pStock;			// 상품의 수량
	
	/* Constructor */
	public ProductDto() {
		// TODO Auto-generated constructor stub
	}
	
	/* Main Page에 상품 리스트 가져올 생성자 */
	public ProductDto(int cgNo, int pCode, String pName, String pBrandName, int pPrice, boolean pDeleted,
			String pfRealName, String pfHoverRealName) {
		super();
		this.cgNo = cgNo;
		this.pCode = pCode;
		this.pName = pName;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
		this.pDeleted = pDeleted;
		this.pfRealName = pfRealName;
		this.pfHoverRealName = pfHoverRealName;
	}
	
	/* 상품 정보 상세보기 */
	public ProductDto(String cgName, int pCode, String pName, String pBrandName, int pPrice, String pfRealName,
			String pfHoverRealName, String pColor) {
		super();
		this.cgName = cgName;
		this.pCode = pCode;
		this.pName = pName;
		this.pBrandName = pBrandName;
		this.pPrice = pPrice;
		this.pfRealName = pfRealName;
		this.pfHoverRealName = pfHoverRealName;
		this.pColor = pColor;
	}
	

	public ProductDto(String pColor) {
		super();
		this.pColor = pColor;
	}

	public ProductDto(int productCount) {
		super();
		this.productCount = productCount;
	}

	/* getter & setter */
	public int getCgNo() {
		return cgNo;
	}

	public void setCgNo(int cgNo) {
		this.cgNo = cgNo;
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

	public String getpInsertDate() {
		return pInsertDate;
	}

	public void setpInsertDate(String pInsertDate) {
		this.pInsertDate = pInsertDate;
	}

	public String getpUpdateDate() {
		return pUpdateDate;
	}

	public void setpUpdateDate(String pUpdateDate) {
		this.pUpdateDate = pUpdateDate;
	}

	public String getpDeleteDate() {
		return pDeleteDate;
	}

	public void setpDeleteDate(String pDeleteDate) {
		this.pDeleteDate = pDeleteDate;
	}

	public boolean ispDeleted() {
		return pDeleted;
	}

	public void setpDeleted(boolean pDeleted) {
		this.pDeleted = pDeleted;
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

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}
	
	
	
	
	
	
	

}	// End Class
