package com.javalec.tent.command;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.FileDao;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AdminUpdateCommand implements TentCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pCode =request.getParameter("pCode");
		String pBrandName =request.getParameter("pBrandName");
		String pName =request.getParameter("pName");
		String pPrice = request.getParameter("pPrice");
		String pColor =request.getParameter("pColor");
		String pStock =request.getParameter("pStock");
		String fileName =request.getParameter("file");
		String lastfile = request.getParameter("lastfile");
		
		
		AdminDao dao  = new AdminDao();
		dao.updateAction(pCode, pBrandName, pName, pPrice, pColor, pStock, lastfile);
		
		
	
	
	
	
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
	            
	            dao1.uploading(pfName, pfRealName, pCode);
	        }catch (Exception e) {
				// TODO: handle exception
			}
	
	
	
	
	}

}
