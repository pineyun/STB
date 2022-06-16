package com.kosta.project.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosta.project.member.model.service.MemberService;
import com.kosta.project.member.vo.Member;

/**
 * Servlet implementation class MemberJoinController
 */
@WebServlet("/member/memberEnroll")
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�����ϱ�
		request.setCharacterEncoding("utf-8");
		Member member = makeEmp(request);
		MemberService service = new MemberService();
		int result = service.insertMember(member);
		String path = request.getContextPath();
//		String msg = result>0 ? "������ ȯ���մϴ�.!": "���Կ� �����ϼ̽��ϴ�.";
//		request.setAttribute("message", msg);

		response.sendRedirect(path+"/jsp/login.jsp");
        
	}
	
	private Member makeEmp(HttpServletRequest request) {
		Member emp = new Member();
		String uId= request.getParameter("userId");
		String emailId = request.getParameter("emailId");
		String userId = uId.concat(emailId);
		System.out.println(emailId);
		String userName = request.getParameter("userName");
		System.out.println(userName);
		String userPassword = request.getParameter("userPassword");
		System.out.println(userPassword);
		String nickName = request.getParameter("nickName");
		System.out.println(nickName);
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone1");
		String phone3 = request.getParameter("phone1");
		String phone4 = phone1.concat(phone2);
		String phone = phone4.concat(phone3);
		
		
		System.out.println(phone);
		
		emp.setUserId(userId);
		emp.setUserName(userName);
		emp.setUserPassword(userPassword);
		emp.setNickName(nickName);
		emp.setPhone(phone);
		return emp;
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
			request
				.getRequestDispatcher("/jsp/memberEnroll.jsp")
				.forward(request, response);
	
	
	}
	
	}
