package com.tryme;

import java.io.IOException;

import SQL.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateServlet
 */
//@WebServlet(urlPatterns = {"/update/*"})
@WebServlet("/update")
public class UpdateServlet extends HttpServlet {
	
	public static String Todayactivity;
	public static double morning;
	public static double lunch;
	public static double dinner;
	public static int minutes;
	public static double currentweight;
	public static double height;
	public static int age;

	public static String name ;
	public static double everyday_maxcalorie1;
	public static double consumed_calories;
	public static double burnt_byworkout;
	public static double eod_spent;
	public static double totalbalanceleft;
	public static double met1;
	/*
	 * public static double consumed_cal; public static double burnt_cal; public
	 * static double spent_cal; public static double balance_cal;
	 */
	
	 //METHOD- SEND VALUES TO SQL CLASS TO BE USED IN INSERT_MANUAL()	

	
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		
	

		 Todayactivity= req.getParameter("todayactivities");
		 morning= Double.parseDouble(req.getParameter("morning"));	
		 lunch= Double.parseDouble(req.getParameter("lunch"));	
		 dinner= Double.parseDouble(req.getParameter("dinner"));	
		 minutes= Integer.parseInt(req.getParameter("minutes"));	
		 currentweight= Double.parseDouble(req.getParameter("currentweight"));	
		height= Double.parseDouble(req.getParameter("height"));	
		age= Integer.parseInt(req.getParameter("age"));
		 met1 =MethodServlet.MET(Todayactivity); 
		 
		 //PRINT IN CONSOLE
		System.out.println( "Today's max calories youre allowed = " +MethodServlet.everyday_maxcaloriemethod1());
		System.out.println( "consumed calories= " +MethodServlet.consumed_caloriesmethod(morning, lunch, dinner));
		System.out.println( "you burnt by workout = "+ MethodServlet.burnt_byworkoutmethod(minutes, currentweight));
		System.out.println( "You spent eod"+ MethodServlet.eod_spentmethod());
		System.out.println( "you re left only with "+ MethodServlet.totalbalanceleft_method());
		
		
		//STORE VALUES FROM METHOD
		 everyday_maxcalorie1=MethodServlet.everyday_maxcaloriemethod1();
		 consumed_calories=MethodServlet.consumed_caloriesmethod(morning, lunch, dinner);
		 burnt_byworkout=MethodServlet.burnt_byworkoutmethod(minutes, currentweight);
		 eod_spent=MethodServlet.eod_spentmethod();
		 totalbalanceleft= MethodServlet.totalbalanceleft_method();
		 met1=MethodServlet.MET(Todayactivity);
		
		 //sending the above values to SQL class
		 
		 SQL.get_cals(consumed_calories, burnt_byworkout, eod_spent, totalbalanceleft);
		 
		
		 
		 
		//TRY SESSION
		
		HttpSession sess = req.getSession(); //use false to use the existing session
		//sess.getAttribute("weight");//this will return username anytime in the session
		sess.getAttribute("height");//this will return password Any time in the session
		sess.getAttribute("age");
		

		//SET VALUE TO BE FORWARDED TO JSP
		   req.setAttribute("everyday_maxcalorie1",everyday_maxcalorie1);
		   req.setAttribute("consumed_calories",consumed_calories);
	       req.setAttribute("burnt_byworkout",burnt_byworkout);
		   req.setAttribute("eod_spent", eod_spent);
		   req.setAttribute("totalbalanceleft", totalbalanceleft);

		   
		   //FORWARD TO JSP
		
	          RequestDispatcher disp = req.getRequestDispatcher("/dashboard.jsp?name="+name+"");
	         
	          SQL.insert_manual();
	          try {
	        	
				disp.forward(req, res);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch bloc
				e.printStackTrace();
			}
	}

}
