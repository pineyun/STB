package com.kosta.project.request;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductInsertController
 */
@WebServlet("/manageRequest.do")
public class ManageRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		RequestService requestService = new RequestService();
		String manage = request.getParameter("manage");
		int requestid = Integer.parseInt(request.getParameter("requestid"));
		if (manage.equals("cancel")) {
			int productid = Integer.parseInt(request.getParameter("productid"));
			System.out.println(productid);
			requestService.cancelRequest(requestid,productid);
		} else if(manage.equals("accept")) {
			requestService.acceptRequest(requestid);
		}
		

		response.sendRedirect("requestList.do");
	}
	
	
	

}
