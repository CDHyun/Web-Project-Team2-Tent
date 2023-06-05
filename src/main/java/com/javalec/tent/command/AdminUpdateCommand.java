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
		
			FileDao dao1 = new FileDao();
				ServletContext application = request.getServletContext();
				String directory = application.getRealPath("/images/product");

				int maxSize = 1024 * 1024 * 10;
				String encoding = "UTF-8";
		

		
		
	        try {
	        	
	        	MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding,
	                    new DefaultFileRenamePolicy());

	            
	            String pCode =multipartRequest.getParameter("pCode");
	    		String pBrandName =multipartRequest.getParameter("pBrandName");
	    		String pName =multipartRequest.getParameter("pName");
	    		String pPrice = multipartRequest.getParameter("pPrice");
	    		String pColor =multipartRequest.getParameter("pColor");
	    		String pStock =multipartRequest.getParameter("pStock");
	    		String lastfile = multipartRequest.getParameter("lastfile");
	    		
	    		String pfName = multipartRequest.getOriginalFileName("file");
	    		String pfRealName = multipartRequest.getFilesystemName("file");
	    		
	    		
	    		AdminDao dao  = new AdminDao();
	    		dao.updateAction(pCode, pBrandName, pName, pPrice, pColor, pStock, lastfile);
	    		
	    		if(!pfRealName.equals("")) {
	            
	    		        dao1.uploading(pfName, pfRealName, pCode);
	    		
	    		}
	        
	        
	        
	        }catch (Exception e) {
				// TODO: handle exception
			}
	
		
	
	
	}

}
