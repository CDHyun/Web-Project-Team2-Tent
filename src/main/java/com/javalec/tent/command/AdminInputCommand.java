package com.javalec.tent.command;

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
		String pfName = request.getParameter("file");
		String pfRealName = request.getParameter("file");
				
		String pName = request.getParameter("pName");
		String pBrandName = request.getParameter("pBrandName");
		String pPrice = request.getParameter("pPrice");
		String cgNo =request.getParameter("cgNo");
		String pCode = request.getParameter("pCode");
		String pColor = request.getParameter("pColor");
		String pStock = request.getParameter("pStock");
		String pfNo = request.getParameter("pfNo");
		 
		    
   		AdminDao dao =new AdminDao();
   		dao.insert(pName, pBrandName, pPrice, cgNo, pfName, pfRealName, pCode, pStock, pColor, pfNo);
   		
    	
    	
    	// insert액션한 후에 
   		FileDao dao1 = new FileDao();
   		ServletContext application = request.getServletContext();
	        String directory = application.getRealPath("images/product");
	        System.out.println(directory);
	        		
	        int maxSize = 1024 * 1024 * 10;
	        String encoding = "UTF-8";
   		try {
   			
   		    MultipartRequest multipartRequest = new MultipartRequest(
   		        request, directory, maxSize, encoding, new DefaultFileRenamePolicy()
   		    );

   		    
   		  
   		    
   		} catch (IOException e) {
   		    // IOException 처리
   		}
        
        dao1.upload(pfName, pfRealName, pCode);
       
	}

}
