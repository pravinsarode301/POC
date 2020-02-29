package com.hotel.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.Service.ReportsGetterSetter;
import com.hotel.Test.AuthTest;
import com.hotel.Test.AuthTestInterface;

/**
 * Servlet implementation class ReportServlet
 */
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String perDayReportFormDetails = request.getParameter("perDayReportFormDetails");
		String monthlyReportFormDetails = request.getParameter("monthlyReportFormDetails");

		ReportsGetterSetter rgs = new ReportsGetterSetter();
		AuthTestInterface at = new AuthTest();
		ResultSet rt = null;

		if ("perDayReportFormDetails".equals(perDayReportFormDetails) && perDayReportFormDetails != null) {

			String per_day_report_date = request.getParameter("per_day_report_date");
			rgs.setDaily_report_date(per_day_report_date);
			try {
				rt = at.getDailyReport(rgs);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				ArrayList ary = new ArrayList();
				/*
				 * int rowCount=0;
				 * 
				 * if(rt.last()){ rowCount = rt.getRow(); rt.beforeFirst(); }
				 * 
				 * //System.out.println(rowCount);
				 */

				while (rt.next()) {
					// System.out.println(rt.getString("customer_name"));
					ary.add(rt.getString(1));
					ary.add(rt.getString(2));
					ary.add(rt.getString(3));
					ary.add(rt.getString(4));
					ary.add(rt.getString(5));
					ary.add(rt.getString(6));
					// ary.add(rt.getString(7));
					ary.add(rt.getString(8));
					ary.add(rt.getString(9));
					ary.add(rt.getString(10));
				}
				request.setAttribute("ary", ary);
				RequestDispatcher rd;
				rd = request.getRequestDispatcher("Perday.jsp");
				rd.include(request, response);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if ("monthlyReportFormDetails".equals(monthlyReportFormDetails) && monthlyReportFormDetails != null) {

			String from_month_report_date = request.getParameter("from_month_report_date");
			String to_month_report_date = request.getParameter("to_month_report_date");

			rgs.setFrom_month_report_date(from_month_report_date);
			rgs.setTo_month_report_date(to_month_report_date);

			try {
				rt = at.getMonthlyReport(rgs);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				ArrayList ary = new ArrayList();
				
				while (rt.next()) {
					// System.out.println(rt.getString("customer_name"));
					ary.add(rt.getString(1));
					ary.add(rt.getString(2));
					ary.add(rt.getString(3));
					ary.add(rt.getString(4));
					ary.add(rt.getString(5));
					ary.add(rt.getString(6));
					// ary.add(rt.getString(7));
					ary.add(rt.getString(8));
					ary.add(rt.getString(9));
					ary.add(rt.getString(10));
				}
				request.setAttribute("ary", ary);
				RequestDispatcher rd;
				rd = request.getRequestDispatcher("Monwise.jsp");
				rd.include(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
