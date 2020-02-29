package com.shetkari_bazzar.servlet;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shetkari_bazzar.dto.FarmerDTO;
import com.shetkari_bazzar.helper.FarmerHelper;
import com.shetkari_bazzar.helper.FarmerHelperImpl;

/**
 * Servlet implementation class updatefarmerDetails
 */
@WebServlet("/UpdateFarmerData")
public class UpdateFarmerData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final String UPLOAD_DIRECTORY = "C:/uploads";

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;

	ResultSet rt = null;
	FarmerDTO FDTO = new FarmerDTO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateFarmerData() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*Enumeration<String> v=request.getParameterNames();
		while(v.hasMoreElements()){
			
			response.getWriter().println(v.nextElement()+"<br>");
		}
		*/
		

		isMultipart = ServletFileUpload.isMultipartContent(request);
		response.setContentType("text/html");

		if (!isMultipart) {

			return;
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);

		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

/*			String root = getServletContext().getRealPath("/");*/
			String root = getServletContext().getInitParameter("file-upload");
			 System.out.println("root "+root);
               File path = new File(root + "/FarmerUploads");
               System.out.println("path "+path);
               if (!path.exists()) {
                   boolean status = path.mkdirs();
                   System.out.println("status"+status);
               }
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				

				if (fi.isFormField()) {
					/*System.out.println(fi.getFieldName());*/
					String formFieldName = fi.getFieldName();
					/*System.out.println(formFieldName);
					System.out.println("formString" + fi.getString());*/
					switch (formFieldName) {
					case "farmerId":
						FDTO.setFarmerId(Integer.parseInt(fi.getString()));
						break;
					case "status":
						FDTO.setStatus(fi.getString());
						break;
					case "farmerFirstName":
						FDTO.setFarmerFirstName(fi.getString());
						break;
					case "farmerLastName":
						FDTO.setFarmerLastName(fi.getString());
					break;
					case "farmerEmailid":
						FDTO.setFarmerEmailid(fi.getString());
					break;
					case "farmerContactNumber":
					FDTO.setFarmerContactNumber(Long.parseLong(fi.getString()));
					
					break;
					case "farmerDateOfBirth":
						
						FDTO.setFarmerDateOfBirth(fi.getString());
						break;
						
					case "farmnerGender":
						FDTO.setFarmerGender(fi.getString());
						break;
					case "farmerAddress":
						FDTO.setFarmerAddress(fi.getString());
						break;
					case "farmerCountry":
						FDTO.setFarmerCountry(fi.getString());
						break;
					case "farmerState":
						FDTO.setFarmerState(fi.getString());
						break;
					case "farmerDistrict":
						FDTO.setFarmerDistrict(fi.getString());
					break;
					case "farmerCity":
						FDTO.setFarmerCity(fi.getString());
						break;
					case "farmerPincode":
						FDTO.setFarmerPincode(Integer.parseInt(fi.getString()));
						break;
						
					case "farmerLandmark":
						FDTO.setFarmerLandmark(fi.getString());
						break;
					default:
						break;
					
					
				}
				}
				
				if (!fi.isFormField()) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					String contentType = fi.getContentType();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					 
                        
					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						file = new File(path +"\\"+ fileName.substring(fileName.lastIndexOf("\\")));

					} else {
						file = new File(path +"\\"+ fileName.substring(fileName.lastIndexOf("\\") + 1));

					}
					fi.write(file);
					// out.println("filepath"+file.getAbsolutePath());
					String proPic = file.getAbsolutePath();
					FDTO.setProfilePicPath(proPic);
				 System.out.println("Uploaded Filename: " + fileName + "<br>");
				 System.out.println(filePath + file.getAbsolutePath());
				}
			
			}
			
		}catch (Exception ex) {
			System.out.println(ex);
		}


				
				
				
			
		
		
		
		
		
		
		
		
		
		FarmerHelper FHELP= new FarmerHelperImpl();
		
		FDTO=FHELP.updateFarmerData(FDTO);
		
		
		//FDTO.setFarmerId(Integer.parseInt(request.getParameter("farmerId")));
		rt=FHELP.GridFarmer(FDTO);
		try {
			if(rt!=null){
			while(rt.next()){
				
				System.out.println("dfvdfhvhd"+rt.getString(2));
			}}else{
				System.out.println("sgl khali ahe re ba");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("rt", rt);
		
		
		
	
	
		request.setAttribute("status", FDTO.getStatus());
		if(FDTO.getReturnStatus()==1){
			/*FDTO.setStatus(request.getParameter("status"));
			FDTO.setFarmerId(Integer.parseInt(request.getParameter("farmerId")));*/
			rt=FHELP.GridFarmer(FDTO);
			
			request.setAttribute("rt", rt);
			request.setAttribute("statusUpdated", "Success ! Details updated successfully");
			
		}else{
			
			FDTO.setStatus(request.getParameter("status"));
			FDTO.setFarmerId(Integer.parseInt(request.getParameter("farmerId")));
			rt=FHELP.GridFarmer(FDTO);
			request.setAttribute("rt", rt);
			request.setAttribute("statusUpdated", "Sry ! try again!");
		}
		/*String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");*/
		String UserPanel = getServletContext().getInitParameter("UsersJsp");
		request.getRequestDispatcher(UserPanel + "/editFarmerProfile.jsp").forward(request, response);
		//RequestDispatcher rd=request.getRequestDispatcher(SuperAdminPanel + "/editFarmer.jsp");
		//request.getRequestDispatcher(SuperAdminPanel + "/editFarmer.jsp").forward(request, response);
		
		//rd.forward(request, response);
		

		
		
		
	}

}

