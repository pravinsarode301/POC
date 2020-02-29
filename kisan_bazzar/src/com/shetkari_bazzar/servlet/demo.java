package com.shetkari_bazzar.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shetkari_bazzar.dto.LoginDTO;

/**
 * Servlet implementation class demo
 */
@WebServlet("/demo")
public class demo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isMultipart;
	private int maxMemSize = 4 * 1024;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public demo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginDTO LDTO = new LoginDTO();
ObjectMapper obk=new ObjectMapper();
		LDTO.setUsername(request.getParameter("userName"));
		LDTO.setPassword(request.getParameter("password"));

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

					case "userName":
						LDTO.setUsername(fi.getString());
						
						break;
					case "password":
						LDTO.setPassword(fi.getString());
						break;
					default:
						break;
					}
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		List<String> li = new ArrayList<String>();

		if ("username".equals(LDTO.getUsername()) && "password".equals(LDTO.getPassword())) {

			ObjectMapper mapper = new ObjectMapper();

			li.add(request.getParameter("userName"));
			li.add(request.getParameter("password"));
			JSONArray array = new JSONArray();

			Iterator<String> it = li.iterator();
			while (it.hasNext()) {

				array.add(it.next());
			}

			JSONObject obj = new JSONObject();

			// String
			// str=mapper.writerWithDefaultPrettyPrinter().writeValueAsString(Arrlist);
			System.out.println(array.toJSONString());
			System.out.println(request.getParameter("EmailId"));

			response.setContentType("application/json");
			System.out.println("array.toJSONString()" + array.toJSONString());
			response.getWriter().print(array.toJSONString());

		} else {
			ObjectMapper mapper = new ObjectMapper();
			JSONObject obj = new JSONObject();
			String str = "sry";
			li.add(str);
			String jsonInString = mapper.writeValueAsString(li);
			/* mapper.write */
			jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(li);
			response.setContentType("application/json");
			response.getWriter().print(li.toString());

		}

	}

}
