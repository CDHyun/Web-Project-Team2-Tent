package com.javalec.tent.dto;

public class FileDto {
	String fileName;
	String fileRealName;
	String pCode;
	String pfHoverName;
	String pfHoverRealName;
	
	public FileDto() {
		// TODO Auto-generated constructor stub
	}

	public FileDto(String fileName, String fileRealName, String pCode, String pfHoverName, String pfHoverRealName) {
		super();
		this.fileName = fileName;
		this.fileRealName = fileRealName;
		this.pfHoverName = pfHoverName;
		this.pfHoverRealName = pfHoverRealName;
		this.pCode = pCode;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
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
	
	

}
