package com.shetkari_bazzar.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.shetkari_bazzar.dto.SubCategoryProductDTO;
import com.shetkari_bazzar.helper.SuperAdminHelper;

/**
 * Servlet implementation class GridSubCategoryProductsB
 */
@WebServlet("/GridSubCategoryProductsB")
public class GridSubCategoryProductsB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GridSubCategoryProductsB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println(Integer.parseInt(request.getParameter("searchFor")));
		
		
		String string = request.getParameter("searchFor");
		String[] parts = string.split("/");
		String part1 = parts[0]; // 004
		String part2 = parts[1]; // 034556
		//System.out.println(part1);
		/*PRDTO.setProductName(part1);
		PRDTO.setProductId(Integer.parseInt(part2));
		*/
		
	//	System.out.println(part1);
	//	System.out.println(part2);
		
		HttpSession session=request.getSession(false);
		
		SuperAdminHelper SAH=new SuperAdminHelper();
		SubCategoryProductDTO SCPDTO=new SubCategoryProductDTO();
		
		SCPDTO.setMainCategoryProductId(Integer.parseInt(part2));
		
		ResultSet rt = SAH.viewSubCategoryPortalProducts(SCPDTO);
		
		request.setAttribute("gridSubCategory", rt);
		
/*json code*/
	
			Map map = new HashMap<Integer,String>();
			try {
				int i=1;
				if(rt!=null){
				while(rt.next()){
					
					map.put(rt.getString("subProductName")+"/"+rt.getString("subProductId"), rt.getString("subProductName"));
					
				}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		JSONObject obj=new JSONObject(map);
		response.setContentType("application/json");
		response.getWriter().write(obj.toJSONString());
		//System.out.println(obj.toString());
		
		/*String UserPanel = getServletContext().getInitParameter("UsersJsp");
		
		request.getRequestDispatcher(UserPanel + "/searchForSubCategoryBeforeSession.jsp").forward(request, response);*/
	}

}
