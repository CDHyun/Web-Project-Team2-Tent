package com.javalec.tent.dto;

public class FileDto {
	String fileName;
	String fileRealName;
	String pCode;
	
	public FileDto() {
		// TODO Auto-generated constructor stub
	}

	public FileDto(String fileName, String fileRealName, String pCode) {
		super();
		this.fileName = fileName;
		this.fileRealName = fileRealName;
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
	
	

}
