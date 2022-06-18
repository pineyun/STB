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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestService requestService = new RequestService();
		String manage = request.getParameter("manage");
		int requestid = Integer.parseInt(request.getParameter("requestid"));
		int productid = Integer.parseInt(request.getParameter("productid"));
		int currentNumber = Integer.parseInt(request.getParameter("currentNumber"));
		int joinNumber = Integer.parseInt(request.getParameter("joinNumber"));
		String productStatus = request.getParameter("productStatus");
		if (manage.equals("cancel")) {
			if (productStatus != "모집중") {
				System.out.println(productStatus);
				requestService.cancelRequest(requestid, productid);
				requestService.decreaseCurrentNumber(productid);
				requestService.openJoin(productid);
				
			} else {
				
				if (currentNumber >= 2) {
					
					requestService.cancelRequest(requestid, productid);
					requestService.decreaseCurrentNumber(productid);
					
				} else if (currentNumber <= 1) {

					requestService.cancelRequest(requestid, productid);
					
				}
				
			}

		} else if (manage.equals("accept")) {
			
			if (currentNumber < joinNumber) {
				
				requestService.acceptRequest(requestid, productid);

			} else if (currentNumber == joinNumber) {
				
				requestService.acceptRequest(requestid, productid);
				requestService.closeJoin(productid);
				
			}
		}

		response.sendRedirect("requestList.do");
	}

}
