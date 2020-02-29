package com.shetkari_bazzar.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.fileupload.FileItem;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.log.UserDataHelper;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shetkari_bazzar.dto.productsDTO;
import com.shetkari_bazzar.helper.SuperAdminHelper;
import com.shetkari_bazzar.services.TestService;
import com.shetkari_bazzar.services.TestServiceImpl;
import com.sun.org.apache.xml.internal.security.utils.HelperNodeList;

/**
 * Servlet implementation class AddPortalProducts
 */
@WebServlet("/AddPortalProducts")
public class AddPortalProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;

	public void init() {
		// filePath = getServletContext().getInitParameter("file-upload");

	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		isMultipart = ServletFileUpload.isMultipartContent(request);
		//response.setContentType("text/html");
		// home page image getter setter class declation for get the method
		productsDTO PDTO = new productsDTO();

		/* required object */

		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");

		PrintWriter out = response.getWriter();
		ServletContext context = getServletContext();
		// process only if its multipart content

		isMultipart = ServletFileUpload.isMultipartContent(request);
		//response.setContentType("text/html");

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

		/*
		 * String root = getServletContext().getRealPath("/");
		 * System.out.println("root"+root);
		 */
		String root = getServletContext().getInitParameter("file-upload");
		File path = new File(root + "/ProductsUpload");
		System.out.println("path" + path);
		if (!path.exists()) {
			boolean status = path.mkdirs();
			System.out.println("status" + status);
		}
		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();

				if (fi.isFormField()) {

					String formFieldName = fi.getFieldName();

					switch (formFieldName) {
					case "sessionUser":
						System.out.println("session user" + fi.getString());
						PDTO.setCreatedBy(fi.getString());
						// System.out.println(PDTO.getCreatedBy());
						break;
					case "productName":
						System.out.println("productname " + fi.getString());
						// PDTO.setProductName(fi.getString());
						PDTO.setProductName(fi.getString());
						System.out.println(PDTO.getProductName());
						break;
					case "productDescription":
						PDTO.setProductDescription(fi.getString());
						
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
						file = new File(path + "\\" + fileName.substring(fileName.lastIndexOf("\\")));

					} else {
						file = new File(path + "\\" + fileName.substring(fileName.lastIndexOf("\\") + 1));

					}
					fi.write(file);
					
					String proPic = file.getAbsolutePath();
					PDTO.setImageName(proPic);

					

					
				}
			}

		} catch (Exception ex) {
			System.out.println(ex);
		}

		SuperAdminHelper SAH = new SuperAdminHelper();
		PDTO = SAH.insertProducts(PDTO);

		 List<String> li=new ArrayList<String>();
		  ObjectMapper mapper = new ObjectMapper();
		  
		
		  JSONArray array = new JSONArray();
		  
		  
	JSONObject obj=new JSONObject();
		
		if (PDTO.getReturnIntStatus()==1) {
			array.add("Products has been successfully added to poratal ! ");
			response.setContentType("application/json");
			System.out.println(array.toJSONString());
			response.getWriter().print(array.toJSONString());
			
//request.setAttribute("addProductsStatus", "Products has been successfully added to poratal ! ");
			
			
		} else {
			array.add("Failed ! Error occured while adding Products to poratal ! ");
			response.setContentType("application/json");
			System.out.println(array.toJSONString());
			response.getWriter().write(array.toJSONString());
			//request.setAttribute("addProductsStatus", "Failed ! Error occured while adding Products to poratal ! ");
			
			
		}
		
//		request.getRequestDispatcher(SuperAdminPanel + "/addProducts.jsp").forward(request, response);

	}

}
