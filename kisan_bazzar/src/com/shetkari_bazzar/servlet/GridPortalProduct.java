package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializationConfig;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.shetkari_bazzar.dao.ImageLoaderUtility;
import com.shetkari_bazzar.helper.SuperAdminHelper;





/**
 * Servlet implementation class GridPortalProduct
 */
@WebServlet("/GridPortalProduct")
public class GridPortalProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GridPortalProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ResultSet rt = null;
		SuperAdminHelper SAH = new SuperAdminHelper();
		rt = SAH.viewPortalProducts();
		//request.setAttribute("productGrid", rt);
		
		List Arrlist=new ArrayList();
		Map map=new Hashtable<>();
		try {
			
			while(rt.next()){
				
				
				Arrlist.add(rt.getString("product_id"));
				Arrlist.add(rt.getString("product_image"));
				Arrlist.add(rt.getString("product_name"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
	
		
		
		JSONArray array = new JSONArray();
		
		Iterator<String> it=Arrlist.iterator();
		while(it.hasNext()){
		
			array.add(it.next());
			
		}
		
		
		String jsonString=null;
		/*String jsonInString = mapper.writeValueAsString(Arrlist);*/
		mapper.enable(SerializationConfig.Feature.INDENT_OUTPUT);
	
		String jsonInString = mapper.writeValueAsString(array);
		/*mapper.write*/
		//jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(Arrlist);
		System.out.println(jsonInString);
		
		
		//final OutputStream out = new ByteArrayOutputStream();
		
		//mapper.writeValueAsString(Arrlist);
		response.setContentType("application/json");
		response.getWriter().write(jsonInString);
		//response.getWriter().print(array.toString());
		//System.out.println(array.toJSONString().toString());
		
		//
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
