package com.tryme;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginSuccessServlet
 */
@WebServlet("/LoginSuccessServlet")

public class LoginSuccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String firsttime = request.getParameter("firsttime");
		System.out.println("firsttime"+firsttime);
		String no = request.getParameter("no");
		System.out.println("no?"+no);
		
		request.getRequestDispatcher("/ab.jsp").forward(request, response);
		
	}

}
