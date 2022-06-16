package com.kosta.project.reply;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.project.product.Product;
import com.kosta.project.product.ProductService;

@WebServlet("/reply")

public class ReplyController extends HttpServlet{
	private static final long serialVersionUID = 1L;

		ProductService productService;
		Product product;
		Reply reply;
		ReplyService replyService;

		public void init() throws ServletException {
			productService = new ProductService();
			replyService = new ReplyService();
		}

		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doHandle(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			doHandle(request, response);
		}

		private void doHandle(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			String nextPage = "";
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			String action = request.getServletPath();
			System.out.println("action:" + action);

			List<Product> productList = new ArrayList<Product>();
			if (action == null) {
				String userId = request.getParameter("userId");
				int productId = Integer.parseInt(request.getParameter("boardId"));
				String content = request.getParameter("content");

				System.out.println(content);
				reply = new Reply(productId, userId, content);
				replyService.create(reply);

				PrintWriter out = response.getWriter();
				out.print("OK");
				return;
			} 

			RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
			dispatch.forward(request, response);
		}

	}

