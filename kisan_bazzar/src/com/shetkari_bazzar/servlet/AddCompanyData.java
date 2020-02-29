package com.shetkari_bazzar.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.shetkari_bazzar.dao.EmailUtility;
import com.shetkari_bazzar.dto.CompanyDTO;
import com.shetkari_bazzar.dto.EmailDTO;
import com.shetkari_bazzar.helper.CompanyHelper;
import com.shetkari_bazzar.helper.CompanyHelperImpl;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;

/**
 * Servlet implementation class AddCompanyData
 */

@WebServlet("/AddCompanyData")

public class AddCompanyData extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:/uploads";

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;
	private String host;
	private String port;
	private String user;
	private String pass;

	public void init() {
		// Get the file location where it would be stored.
		filePath = getServletContext().getInitParameter("file-upload");
		/*
		for email processing
			// reads SMTP server setting from web.xml file
			ServletContext context = getServletContext();
			host = context.getInitParameter("host");
			port = context.getInitParameter("port");
			user = context.getInitParameter("user");
			pass = context.getInitParameter("pass");*/
	


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		// TODO Auto-generated method stub
		
	

		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");

		PrintWriter out = response.getWriter();
		ServletContext context = getServletContext();
		CompanyHelper help = new CompanyHelperImpl();
		TestService test = new TestServiceImpl();
		CompanyDTO CDTO = new CompanyDTO();
	 EmailUtility Email=new EmailUtility();
	 EmailDTO EDTO=new EmailDTO();
	 EDTO.setHostName(context.getInitParameter("host"));
	 EDTO.setPortNumber(context.getInitParameter("port"));
	 EDTO.setUserName(context.getInitParameter("user"));
	 EDTO.setPassword(context.getInitParameter("pass"));
	 EDTO.setSubject(" !! Welcome to Shetkari Bazzar Portal !! ");
	
	 
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

		String root = getServletContext().getInitParameter("file-upload");
		 //System.out.println("root"+root);
          File path = new File(root + "/SubSuperAdminUploads");
          System.out.println("path"+path);
          if (!path.exists()) {
              boolean status = path.mkdirs();
              System.out.println("status"+status);
          }
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
				/*	System.out.println("formFieldName" + formFieldName);
					System.out.println("formString" + fi.getString());*/

					switch (formFieldName) {
					case "companyName":
						CDTO.setCompanyName(fi.getString());
						CDTO.setCompanyPassword(fi.getString());
						
						break;
					case "companyRegId":
						CDTO.setCompanyRegId(fi.getString());
						break;
					case "authorisedPersonName":
						CDTO.setAuthorisedPersonName(fi.getString());
						break;
					case "authorisedPersonMobileNumber":
						CDTO.setAuthorisedPersonMobileNumber(Long.parseLong(fi.getString()));
						System.out.println(CDTO.getAuthorisedPersonMobileNumber());
						break;
					case "authorisedPersonEmail":
						CDTO.setAuthorisedPersonEmail(fi.getString());
						break;
					case "companyWebsite":
						CDTO.setCompanyWebsite(fi.getString());
						break;
					case "companyEmail":
						CDTO.setCompanyUserName(fi.getString());
						CDTO.setCompanyEmail(fi.getString());
						EDTO.setRecipient(fi.getString());
						break;
					case "companyFaxNumber":
						CDTO.setCompanyFaxNumber(Long.parseLong(fi.getString()));
						break;
					case "companyContactNumber":
						CDTO.setCompanyContactNumber(Long.parseLong(fi.getString()));
						break;
					case "companyRegisterAddress":
						CDTO.setCompanyRegisterAddress(fi.getString());
						break;

					case "companyCurrentAddress":
						CDTO.setCompanyCurrentAddress(fi.getString());
						break;
					case "companyCountry":
						CDTO.setCompanyCountry(fi.getString());
						break;
					case "companyState":
						CDTO.setCompanyState(fi.getString());
						break;
					case "companyCity":
						CDTO.setCompanyCity(fi.getString());
						break;
					case "companyLandmark":
						CDTO.setCompanyLandmark(fi.getString());
						break;
					case "companyRegistrationDate":
						CDTO.setCompanyRegistrationDate(fi.getString());
						break;

					case "sessionUser":
						System.out.println("sessionUser :" + fi.getString());
						CDTO.setCreatedBy(fi.getString());
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
						file = new File(path + "\\" +fileName.substring(fileName.lastIndexOf("\\")));

					} else {
						file = new File(path +"\\"+ fileName.substring(fileName.lastIndexOf("\\") + 1));

					}
					
					fi.write(file);
					String proPic = file.getAbsolutePath();
					CDTO.setProfilePic(proPic);
					System.out.println("propic "+CDTO.getProfilePic());

				}
			}

		} catch (Exception ex) {
			System.out.println("am here");
			System.out.println(ex);
		}

		// CDTO.setCreatedBy(request.getParameter("sessionUser"));
		System.out.println("propic " + CDTO.getProfilePic());
		
		 EDTO.setContent("cout.println("
				 +"<h1>Hello & Warm Welcome to Shetkari Bazzar Portal ! This is autogenerated mail</h1>"
		 		+ "</br>"
		 		+ "<h4>Your Company registration has been Successfull registred with Shetkari Bazzar Portal</h4>"
		 		+ "<h3>Company details is as follows</h3>"
		 		+ "<h4>"
		 		+ "Company Name"+CDTO.getCompanyName()
		 		+ "<br>"
		 		+"Company Registration Id :"+CDTO.getCompanyRegId()
		 		+ "<br>"
		 		+"Authorised Person Name :"+CDTO.getAuthorisedPersonName()
		 		+ "<br>"
		 		+"Authorised Person Mobile Number :"+CDTO.getAuthorisedPersonMobileNumber()
		 		+ "<br>"
		 		+"Authorised Person Email :"+CDTO.getAuthorisedPersonEmail()
		 		+ "<br>"
		 		+"Company Website :"+CDTO.getCompanyWebsite()
		 		+ "<br>"
		 		+"Company Email :"+CDTO.getCompanyEmail()
		 		+ "<br>"
		 		+"Company Contact Number :"+CDTO.getCompanyContactNumber()
		 		+ "<br>"
		 		+"Company Fax Number :"+CDTO.getCompanyFaxNumber()
		 		+ "<br>"
		 		+"Company Landmark :"+CDTO.getCompanyLandmark()
		 		+ "<br>"
		 		+"Company City :"+CDTO.getCompanyCity()
		 		+ "<br>"
		 		+"Company State :"+CDTO.getCompanyState()
		 		+ "<br>"
		 		+"Company Country :"+CDTO.getCompanyCountry()
		 		+ "<br>"
		 		+"Company Registration Date :"+CDTO.getCompanyRegistrationDate()
		 		+ "<br>"
		 		+"Company Registrater Address :"+CDTO.getCompanyRegisterAddress()
		 		+ "<br>"
		 		+"Company Cureent Address :"+CDTO.getCompanyCurrentAddress()
		 		+ "<br>"
		 		+ "</h4>"
		 		+ "<h3>Thanks & Regard</h3>"
		 		+ "<br>"
		 		+ "<h4>Shetkari Bazzar Admin Panel"
		 		+"</h4>"
		 		+"");
		
		
		int addNewCompanyStatus = help.registerNewCompany(CDTO);
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
		if (addNewCompanyStatus == 1 && mailStatus==true) {
			
			request.setAttribute("addNewCompanyStatus", "Company has been registered successfully & registration mail has been sent !");

		} else {
			request.setAttribute("addNewCompanyStatus", "Sorry try Again!");

		}
		request.getRequestDispatcher(SuperAdminPanel + "/addCompanies.jsp").forward(request, response);

	}

}
