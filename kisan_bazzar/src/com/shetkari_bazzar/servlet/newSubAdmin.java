package com.shetkari_bazzar.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shetkari_bazzar.dao.EmailUtility;
import com.shetkari_bazzar.dto.EmailDTO;
import com.shetkari_bazzar.dto.subAdminDTO;
import com.shetkari_bazzar.helper.SuperAdminHelper;
import com.shetkari_bazzar.helper.subAdminHelper;

/**
 * Servlet implementation class newSubAdmin
 */
@WebServlet("/newSubAdmin")
public class newSubAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final String UPLOAD_DIRECTORY = "C:/uploads";

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public newSubAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*for email*/
		ServletContext context = getServletContext();
		 EmailUtility Email=new EmailUtility();
		 EmailDTO EDTO=new EmailDTO();
		 EDTO.setHostName(context.getInitParameter("host"));
		 EDTO.setPortNumber(context.getInitParameter("port"));
		 EDTO.setUserName(context.getInitParameter("user"));
		 EDTO.setPassword(context.getInitParameter("pass"));
		 EDTO.setSubject(" !! Welcome to Shetkari Bazzar Portal !! ");
		 subAdminDTO SADTO = new subAdminDTO();
		SADTO.setSubAdminRole(context.getInitParameter("subSuperAdminRole"));
		// process only if its multipart content

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

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				if (fi.isFormField()) {
					// System.out.println(fi.getFieldName());
					String formFieldName = fi.getFieldName();
					System.out.println("formFieldName" + formFieldName);
					System.out.println("formString" + fi.getString());

					switch (formFieldName) {
					case "subAdminFirstName":
						SADTO.setSubAdminFirstName(fi.getString());
					case "subAdminMiddleName":
						SADTO.setSubAdminMiddleName(fi.getString());
					case "subAdminLastName":
						SADTO.setSubAdminLastName(fi.getString());
						break;
					case "subAdminContactNumber":
						SADTO.setSubAdminContactNumber(Long.parseLong(fi.getString()));
						
						break;
					case "subAdminUserName":
						SADTO.setSubAdminUserName(fi.getString());
						SADTO.setSubAdminPassword(fi.getString());
						break;
					case "subAdminEmailId":
						SADTO.setSubAdminEmailId(fi.getString());
						EDTO.setRecipient(fi.getString());
						break;
					case "subAdminLandmark":
						SADTO.setSubAdminLandmark(fi.getString());
						break;
					case "subAdminCity":
						SADTO.setSubAdminCity(fi.getString());
						break;
					case "subAdminDivision":
						SADTO.setSubAdminDivision(fi.getString());
						break;
					case "subAdminState":
						SADTO.setSubAdminState(fi.getString());
						break;
					case "subAdminCountry":
						SADTO.setSubAdminCountry(fi.getString());
						
						break;
					/*case "subAdminRole":
						SADTO.setSubAdminRole(fi.getString());
						
						break;
*/
					case "subAdminGender":
						SADTO.setSubAdminGender(fi.getString());
						break;
					case "subAdminAddress":
						SADTO.setSubAdminAddress(fi.getString());
						break;
					case "sessionUser":
						SADTO.setSubAdminCreatedBy(fi.getString());
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
						file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));

					} else {
						file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));

					}
					fi.write(file);
					// out.println("filepath"+file.getAbsolutePath());
					String proPic = file.getAbsolutePath();
					SADTO.setSubAdminProfilePic(proPic);
					
					// out.println("Uploaded Filename: " + fileName + "<br>");
					// out.println(filePath);
				}
			}

		} catch(java.lang.NumberFormatException r){
			System.out.println(r);
		}catch (Exception ex) {
			System.out.println(ex);
		}

		
		
		
		
		
		
		
	/*	System.out.println("pohchalo re ba");
		subAdminDTO SADTO = new subAdminDTO();

		SADTO.setSubAdminFirstName(request.getParameter("subAdminFirstName"));
		SADTO.setSubAdminMiddleName(request.getParameter("subAdminMiddleName"));
		SADTO.setSubAdminLastName(request.getParameter("subAdminLastName"));
		SADTO.setSubAdminContactNumber(Long.parseLong(request.getParameter("subAdminContactNumber")));
		SADTO.setSubAdminUserName(request.getParameter("subAdminUserName"));
		SADTO.setSubAdminEmailId(request.getParameter("subAdminEmailId"));
		SADTO.setSubAdminLandmark(request.getParameter("subAdminLandmark"));
		SADTO.setSubAdminCity(request.getParameter("subAdminCity"));
		SADTO.setSubAdminDivision(request.getParameter("subAdminDivision"));
		SADTO.setSubAdminState(request.getParameter("subAdminState"));
		SADTO.setSubAdminCountry(request.getParameter("subAdminCountry"));
		SADTO.setSubAdminProfilePic(request.getParameter("subAdminProfilePic"));
		
		 * SADTO.setSubAdminPrivillages(Integer.parseInt(request.getParameter(
		 * "subAdminPrivillages")));
		 
		SADTO.setSubAdminRole(request.getParameter("subAdminRole"));
		SADTO.setSubAdminGender(request.getParameter("subAdminGender"));
		SADTO.setSubAdminAddress(request.getParameter("subAdminAddress"));
		SADTO.setSubAdminCreatedBy(request.getParameter("sessionUser"));
*/		// SADTO.setSubAdminPassword("pravin");
		
		 EDTO.setContent(
				 "<h1>Hello & Warm Welcome to Shetkari Bazzar Portal ! This is autogenerated mail</h1>"
		 		+ "</br>"
		 		+ "<h4>Your registration has been Successfull registred with Shetkari Bazzar Portal</h4>"
		 		+ "<h3>Sub Admin details is as follows</h3>"
		 		+ "<h4>"
		 		+ "First Name"+SADTO.getSubAdminFirstName()
		 		+ "<br>"
		 		+"Middle Name :"+SADTO.getSubAdminMiddleName()
		 		+ "<br>"
		 		+"Last Name :"+SADTO.getSubAdminLastName()
		 		+ "<br>"
		 		+"Role :"+SADTO.getSubAdminRole()
		 		+ "<br>"
		 		+"User Name:"+SADTO.getSubAdminUserName()
		 		+ "<br>"
		 		+"Password:"+SADTO.getSubAdminPassword()
		 		+ "<br>"
		 		+"Mobile Number :"+SADTO.getSubAdminContactNumber()
		 		+ "<br>"
		 		+"Email-Id :"+SADTO.getSubAdminEmailId()
		 		+ "<br>"
		 		+" Landmark :"+SADTO.getSubAdminLandmark()
		 		+ "<br>"
		 		+" City :"+SADTO.getSubAdminCity()
		 		+ "<br>"
		 		+" State :"+SADTO.getSubAdminState()
		 		+ "<br>"
		 		+" Country :"+SADTO.getSubAdminCountry()
		 		+ "<br>"
		 		+ "</h4>"
		 		+ "<h3>Thanks & Regard</h3>"
		 		+ "<h4>Shetkari Bazzar Admin Panel</h4>"
		 		+"");
		
		
		

		subAdminHelper SAH = new subAdminHelper();
		String adminAddStatus="";
		int i = SAH.registerUser(SADTO);
		EmailUtility EUL=new EmailUtility();
		boolean mailStatus=false;
		try {
			EUL.sendEmail(EDTO);
			mailStatus=true;
		} catch (AddressException e) {
			System.out.println("mail nahi can't be send");
			// TODO Auto-generated catch block
			e.printStackTrace();
			mailStatus=false;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			System.out.println("message can't be send");
			mailStatus=false;
			e.printStackTrace();
		}
		
		if(i==1 && mailStatus==true){
			adminAddStatus="Sub Admin has been successfully added & registration details has been sent !";
			
		}else{
			adminAddStatus="Sorry,Please try again !";
			
			
		}

		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");
		request.setAttribute("adminAddStatus", adminAddStatus);
		request.getRequestDispatcher(SuperAdminPanel+"/subAdmin.jsp").forward(request, response);
		
		/*
		 * PrintWriter out=response.getWriter();
		 * out.println("subAdminFirstName"+request.getParameter(
		 * "subAdminFirstName")); out.println("</BR>");
		 * out.println("subAdminMiddleName"+request.getParameter(
		 * "subAdminMiddleName")); out.println("</BR>");
		 * out.println("subAdminLastName"+request.getParameter(
		 * "subAdminLastName")); out.println("</BR>");
		 * //out.println("subAdminMobileNumber"+request.getParameter(
		 * "subAdminMobileNumber")); out.println("</BR>");
		 * out.println("subAdminUserName"+request.getParameter(
		 * "subAdminUserName")); out.println("</BR>");
		 * out.println("subAdminEmailId"+request.getParameter("subAdminEmailId")
		 * ); out.println("</BR>");
		 * out.println("subAdminLandmark"+request.getParameter(
		 * "subAdminLandmark")); out.println("</BR>");
		 * out.println("subAdminCity"+request.getParameter("subAdminCity"));
		 * out.println("</BR>");
		 * out.println("subAdminContactNumber"+request.getParameter(
		 * "subAdminContactNumber")); out.println("</BR>");
		 * out.println("subAdminDivision"+request.getParameter(
		 * "subAdminDivision")); out.println("</BR>");
		 * out.println("subAdminState"+request.getParameter("subAdminState"));
		 * out.println("</BR>");
		 * out.println("subAdminCountry"+request.getParameter("subAdminCountry")
		 * ); out.println("</BR>");
		 * out.println("subAdminProfilePic"+request.getParameter(
		 * "subAdminProfilePic")); out.println("</BR>");
		 * out.println("subAdminPrivillages"+request.getParameter(
		 * "subAdminPrivillages")); out.println("</BR>");
		 * out.println("subAdminRole"+request.getParameter("subAdminRole"));
		 * 
		 */
	}

}
