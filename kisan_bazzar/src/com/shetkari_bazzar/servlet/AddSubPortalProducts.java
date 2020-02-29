
package com.shetkari_bazzar.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;

import com.shetkari_bazzar.dto.SubCategoryProductDTO;
import com.shetkari_bazzar.dto.productsDTO;
import com.shetkari_bazzar.helper.SuperAdminHelper;

/**
 * Servlet implementation class AddSubPortalProducts
 */
@WebServlet("/AddSubPortalProducts")
public class AddSubPortalProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private boolean isMultipart;
	private String filePath;
	private int maxFileSize = 50 * 1024 * 50;
	private int maxMemSize = 4 * 1024;
	private File file;

	public void init() {
		// filePath = getServletContext().getInitParameter("file-upload");

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		
		// home page image getter setter class declaration for get the method
		productsDTO PDTO = new productsDTO();
		SubCategoryProductDTO SCPDTO=new SubCategoryProductDTO();
		/* required object */

		String SuperAdminPanel = getServletContext().getInitParameter("SuperAdminJsp");

		PrintWriter out = response.getWriter();
		ServletContext context = getServletContext();
		// process only if its multipart content

		isMultipart = ServletFileUpload.isMultipartContent(request);
		

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
		File path = new File(root + "/SubCategoryOfProductsUpload");
		
		
		
		
		if (!path.exists()) {
			boolean status = path.mkdirs();
			
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
					
					case "mainProductId":
						System.out.println("productname " + fi.getString());
						SCPDTO.setMainCategoryProductId(Integer.parseInt(fi.getString()));
						break;
					case "subProductName":
						SCPDTO.setSubCategoryProductName(fi.getString());
						break;
						
					case "subProductDescription":
						SCPDTO.setSubProductDescription(fi.getString());
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
					SCPDTO.setSubCategoryProductImagePath(proPic);

					

					
				}
			}

		} catch (Exception ex) {
			System.out.println(ex);
		}

		SuperAdminHelper SAH = new SuperAdminHelper();
		HttpSession session=request.getSession(false);
		SCPDTO.setCreated_by((String)session.getAttribute("userName"));
		SCPDTO = SAH.insertSubCategoryProducts(SCPDTO);
		String str;
		List<String> li = new ArrayList<String>();
		if (SCPDTO.getReturnIntStatus()==1) {
					//request.setAttribute("addSubProductsStatus", "Sub products has been successfully added to poratal ! ");
			str="Sub products has been successfully added to poratal ! ";
			
			/*response.setContentType("application/json");	
			response.getWriter().print("Sub products has been successfully added to poratal ! ");*/
		} else {
			//request.setAttribute("addSubProductsStatus", "Failed ! Error occured while adding sub products to poratal ! ");
			str="Failed ! Error occured while adding sub products to poratal ! ";
			
			
		}
		li.add(str);
		ObjectMapper mapper = new ObjectMapper();
		JSONObject obj = new JSONObject();
		String	jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(li);
		
		response.setContentType("application/json");
		response.getWriter().write(jsonInString);
		
		
		//request.getRequestDispatcher(SuperAdminPanel + "/addProducts.jsp").forward(request, response);

	}

}

