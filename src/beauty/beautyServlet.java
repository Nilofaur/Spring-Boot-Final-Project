package beauty;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class beautyServlet
 */
@WebServlet("/beauty")
public class beautyServlet extends HttpServlet {
	public static String shape1="";
	
	static PrintWriter out;
	static String driver = "com.mysql.jdbc.Driver";
	static String connectionUrl = "jdbc:mysql://localhost:3306/";
	static String database = "userdb";
	static String db = "root";
	static String password = "secret";
	static String query = "";
	static PreparedStatement pst;
	public static Connection connection = null;
	public static Statement statement = null;
	public static ResultSet resultSet = null;

// beauty table ini
	public static String look_for;
	public static String dress;
	public static String hint;
	public static String avoid;
	public static String shape_tab;
	public static String image1;
	
	//METHOD 1
	public static void database() {

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			connection = DriverManager.getConnection(connectionUrl + database, db, password);
			System.out.println("database method");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			statement = connection.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("connected");
		}

	}

//METHOD 2
	
			public static List<beautyInit> beauty_tab(String x) {

		        beautyServlet.database();
				List<beautyInit> a = new ArrayList<>();

				try {
					System.out.println("shape as X: "+x);
					query="SELECT  look_for, dress, hint,avoid,shape,image1  FROM userdb.beauty where shape  = '" + x + "'";
			

					pst = beautyServlet.connection.prepareStatement(query);

					ResultSet rs = pst.executeQuery();

					for (int i = 0; i <= 9; i++) {
						while (rs.next()) {

							look_for = rs.getString(1);
							dress= rs.getString(2);
							hint = rs.getString(3);
							avoid = rs.getString(4);
							shape_tab = rs.getString(5);
							image1=rs.getString(6);
							
                        
							beautyInit row = new beautyInit();
							
							  row.setLook_for(look_for);
							  row.setDress(dress);
							  row.setHint(hint);
							  row.setAvoid(avoid);
							  row.setShape(shape_tab);
							a.add(row);
							
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("e.get message " + e.getMessage());
				}

				return a;
			}
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	shape1=request.getParameter("shape");
	beauty_tab(shape1);
	request.setAttribute("look_for", look_for);
	request.setAttribute("dress", dress);
	request.setAttribute("hint",hint);
	request.setAttribute("avoid", avoid);
	request.setAttribute("shape1", shape1);
	request.setAttribute("shape_tab", shape_tab);
	System.out.println("image1"+image1);
	request.setAttribute("image1", image1);
	RequestDispatcher disp = request.getRequestDispatcher("/Btab.jsp");
	beauty_tab(shape1);
	disp.forward(request, response);
	
		
		
	}

}
