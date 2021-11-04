package pdf;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tryme.DaoClass;

import SQL.*;
/**
 * Servlet implementation class pdfServlet
 */
@WebServlet("/pdfServlet")
public class pdfServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
public static String name;
public static int id ;

public static String pdf_name(String name) {

	pdfServlet.name = name;

	return name;

}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	try {
		//SQL.get_all();
		
		id=SQL.getUserid(name);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		System.out.println("pdf serv name"+name);
		System.out.println("pdf serv id"+id);
		System.out.println("pdf serv sql id"+SQL.id);

		
		PDFGenerator.generateReport(DBUtil.getManualUpdate("SELECT * FROM userdb.manual_update where userid="+id+""));
		
		 // request.getRequestDispatcher("/report.jsp").forward(request, response);
		 
		

	}

}
