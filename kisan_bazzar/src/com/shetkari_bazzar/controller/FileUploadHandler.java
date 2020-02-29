package com.shetkari_bazzar.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



/**
 * Servlet implementation class FileUploadHandler
 */
@WebServlet("/FileUploadHandler")
public class FileUploadHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:/uploads";
	  
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUploadHandler() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 //process only if its multipart content
		
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                        String name = new File(item.getName()).getName();
                        System.out.println("name" +name);
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                        String ssd=new File(UPLOAD_DIRECTORY + File.separator + name).getAbsolutePath();
                        System.out.println("sddf"+ssd);
                        System.out.println("pathaa"+ new File(UPLOAD_DIRECTORY + File.separator + name));
                        
                    }
                }
           
               //File uploaded successfully
               request.setAttribute("message", "File Uploaded Successfully");
               System.out.println("File Uploaded Successfully");
            } catch (Exception ex) {
               request.setAttribute("message", "File Upload Failed due to " + ex);
               System.out.println("File Upload Failed");
            }          
         
        }else{
            request.setAttribute("message",
                                 "Sorry this Servlet only handles file upload request");
        }
    
       // request.getRequestDispatcher("/result.jsp").forward(request, response);
     
    
	}

}
