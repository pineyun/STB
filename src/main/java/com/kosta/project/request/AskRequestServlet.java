package com.kosta.project.request;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AskRequestServlet
 */
@WebServlet("/askRequest.do")
public class AskRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("user_id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		RequestVO askRequest = new RequestVO();
		RequestService service = new RequestService();
		
		//askRequest.setUser_id(user_id);
		//askRequest.setProduct_id(product_id);
		
	}

}
