package com.javalec.tent.command;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.FileDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminInputCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
	
		 FileDao dao1 = new FileDao();
	        ServletContext application = request.getServletContext();
	        String directory = application.getRealPath("/images/product");


	        int maxSize = 1024 * 1024 * 10;
	        String encoding = "UTF-8";
	        try {
	            MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
	                    new DefaultFileRenamePolicy());

	            String pfName = multipartRequest.getOriginalFileName("file");
	            String pfRealName = multipartRequest.getFilesystemName("file");

	            String pName = multipartRequest.getParameter("pName");
	            String pBrandName = multipartRequest.getParameter("pBrandName");
	            String pPrice = multipartRequest.getParameter("pPrice");
	            String cgNo = multipartRequest.getParameter("cgNo");
	            String pCode = multipartRequest.getParameter("pCode");
	            String pColor = multipartRequest.getParameter("pColor");
	            String pStock = multipartRequest.getParameter("pStock");
	            String pfNo = multipartRequest.getParameter("pfNo");


	            AdminDao dao = new AdminDao();
	            dao.insert(pName, pBrandName, pPrice, cgNo, pCode, pStock, pColor, pfNo);

	            dao1.upload(pfName, pfRealName, pCode);

	            // 추가 폴더에도 저장 이 주소를 자신의 컴퓨터의 프로젝트폴더경로로 바꿔줘야함
	            String additionalDirectory = "C:/Users/ahyun/git/Web-Project-Team2-Tent/src/main/webapp/images/product";
	            //String additionalDirectory = ".../src/main/webapp/images/product/";

	            
	            File additionalDirectoryFile = new File(additionalDirectory);
	            if (!additionalDirectoryFile.exists()) {
	                additionalDirectoryFile.mkdirs();
	            }

	            File sourceFile = new File(directory, pfRealName);
	            File destinationFile = new File(additionalDirectory, pfRealName);

	            FileInputStream inputStream = new FileInputStream(sourceFile);
	            FileOutputStream outputStream = new FileOutputStream(destinationFile);

	            byte[] buffer = new byte[1024];
	            int length;
	            while ((length = inputStream.read(buffer)) > 0) {
	                outputStream.write(buffer, 0, length);
	            }

	            inputStream.close();
	            outputStream.close();

	        } catch (IOException e) {
	            // IOException 처리
	        }
	    }
	}