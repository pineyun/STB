package com.kosta.project.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kosta.project.member.model.service.MemberService;
import com.kosta.project.member.vo.Member;


/**
 * Servlet implementation class UpdatePasswordServlet
 */
@WebServlet("/member/updatePassword")
public class UpdatePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request
			.getRequestDispatcher("/jsp/updatePassword.jsp")
			.forward(request, response);
	}

	/**
	 * ��й�ȣ ����ó��
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String location = request.getContextPath();
		String msg = null;
		int result = 0;
		
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		// �Է� ��й�ȣ ��ġ����
		if(oldPassword.equals(loginMember.getUserPassword())) {
			
			// ������й�ȣ�� ��ġ�� ��츸 �űԺ�й�ȣ�� ������Ʈ
			loginMember.setUserPassword(newPassword);
			result = service.updatePassword(loginMember);
			msg = (result > 0) ? 
					"��й�ȣ�� ���������� �����߽��ϴ�." : "��й�ȣ�� ���濡 �����߽��ϴ�.";
			location += "/jsp/mypage.jsp";
		}
		else {
			msg = "��й�ȣ�� ��ġ���� �ʽ��ϴ�.";				
			location += "/jsp/updatePassword";
		}
		// ����� ���â
		session.setAttribute("msg", msg);
		response.sendRedirect(location);
	}

}

