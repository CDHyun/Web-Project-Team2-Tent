package com.javalec.tent.command;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.javalec.tent.dao.AdminDao;
import com.javalec.tent.dao.FileDao;
import com.javalec.tent.dto.FileDto;
import com.oreilly.servlet.MultipartRequest;

public class AdminInsertCommand {
    
    public void execute(HttpServletRequest request, HttpServletResponse response, ServletContext application) throws IOException {
       
    	String pName =request.getParameter("pName");
   		String pBrandName = request.getParameter("pBrandName");
   		String pPrice = request.getParameter("pPrice");
   		String cgNo = request.getParameter("cgNo");
   		
   		AdminDao dao =new AdminDao();
   		dao.insert(pName, pBrandName, pPrice, cgNo);
    	
    	
    	// insert액션한 후에 
    	
    	FileDao dao1 = new FileDao();
        String directory = application.getRealPath("/images/product");
        int maxSize = 1024 * 1024 * 100;
        String encoding = "UTF-8";
        
        try {
            MultipartRequest multipartRequest = new MultipartRequest(
                request, directory, maxSize, encoding, new DefaultFileRenamePolicy()
            );
            
            String pCode = request.getParameter("pCode");
            String fileName = multipartRequest.getOriginalFileName("file");
            String fileRealName = multipartRequest.getFilesystemName("file");
            
            new FileDao().upload(fileName, fileRealName,pCode);
        } catch (IOException e) {
            // IOException 처리
            throw e;
        }
        
        
        
     
    }
}
