package SQL;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tryme.AboutmeServlet;
import com.tryme.DaoClass;
import com.tryme.LoginServlet;
import com.tryme.UpdateServlet;


import na.ecomm.model.Product;

public class SQL extends HttpServlet {

	static PrintWriter out;
	static String driver = "com.mysql.jdbc.Driver";
	static String connectionUrl = "jdbc:mysql://localhost:3306/";
	static String database = "userdb";
	static String db = "root";
	static String password = "secret";
	static String query = "";
	static String query1 = "";
	static PreparedStatement pst;
	public static Connection connection = null;
	public static Statement statement = null;
	public static ResultSet resultSet = null;

	// Testing
	public static int sum = 35;

	// food tables from mysql
	public static String day;
	public static String bf;
	public static String lun;
	public static String eve;
	public static String din;

	public static int id;
	public static Double ht;
	public static int ag;
	static ResultSet rs = null;
	static ResultSetMetaData rsmd = null;
	static int columnsNumber = 0;
	// initialisation

	public static String days;
	static String breakfast;
	static String lunch;
	static String evening_snack;
	public static String dinner;
	public static String t;
	public static String table;
	public static String name;
	static List<SQLinitialisation> food = new ArrayList<SQLinitialisation>();
	public static String tod = "";
	public static int day1 = 0;
	public static int month = 0;
	public static int year = 0;

	// plan.jsp
	public static String name1 = "login again please";
	public static String login_name = "";
	public static int user_id = 0;
	public static double weight = 0;
	public static String cuisine = "";
	public static double everyday_maxcalorie = 0;
	public static String plan = "";
	public static double maxcal = 0;
	
	//UpdateServlet 
	// consumed_cal, burnt_cal, spent_cal, balance_cal
	public static double everyday_maxcalorie1=UpdateServlet.everyday_maxcalorie1;
	public static double consumed_cal=UpdateServlet.consumed_calories;
	public static double burnt_cal=UpdateServlet.burnt_byworkout;
	public static double spent_cal=UpdateServlet.eod_spent;
	public static double balance_cal=UpdateServlet.totalbalanceleft;

	// username METHOD
	public static String un(String name) {

		SQL.name = name;

		return name;

	}
	
	//send user_id to pdfserv class
	
	
	//getcals from Update servlet class

	public static void get_cals(double cc, double bc, double sc, double bal) {

		consumed_cal=cc;
		burnt_cal=bc;
		spent_cal=sc;
		balance_cal=bal;

		
	}

	
	// METHOD 2 FOR DATE

	public static String tod_date() {
		// Instantiate a Date object

		java.util.Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		day1 = cal.get(Calendar.DAY_OF_MONTH);
		month = cal.get(Calendar.MONTH);
		year = cal.get(Calendar.YEAR);
		tod = "" + day1 + "/" + (month + 1) + "/" + year;
		System.out.println("tod_date method : " + tod);
		

		return tod;

	}

	// METHOD 3 DB CONNECTION

	public static void database() {

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			connection = DriverManager.getConnection(connectionUrl + database, db, password);
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

	// TRY LIST - RETURN METHOD 4 - used this method

	public static List<SQLinitialisation> getfood(String d, String table) {

		SQL.database();
		List<SQLinitialisation> a = new ArrayList<>();

		try {
			System.out.println("d (getfoodmethod) " + d);
			query = "Select * from userdb." + table + " where days = '" + d + "'";

			pst = SQL.connection.prepareStatement(query);

			ResultSet rs = pst.executeQuery();

			for (int i = 0; i <= 3; i++) {
				while (rs.next()) {

					day = rs.getString(2);
					bf = rs.getString(3);
					lun = rs.getString(4);
					eve = rs.getString(5);
					din = rs.getString(6);

					SQLinitialisation row = new SQLinitialisation();

					row.setDays(day);
					row.setBreakfast(bf);
					row.setLunch(lun);
					row.setEvening_snack(eve);
					row.setDinner(din);

					a.add(row);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("e.get message " + e.getMessage());
		}

		return a;
	}

	// METHOD 5 - METHOD TO JUST CALL getfood METHOD WITH PARAMETERS

	public static List<SQLinitialisation> food_table(String days, String table) {
		List<SQLinitialisation> food = SQL.getfood(days, table);

		return food;
	}

	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		t = request.getParameter("days");

	}

	// METHOD 6 to get the user id

	public static int getUserid(String name) throws SQLException {

		SQL.database();

		query = "select userid from registeruser where name = '" + name + "'";
		System.out.println("login name" + name);

		pst = SQL.connection.prepareStatement(query);

		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			System.out.println("id = " + " " + rs.getInt(1));
			id = rs.getInt(1);
		}

		return id;
	}

	// METHOD 7: Get weight and height from about me table to be used for manual
	
// WORKING BUT GOING TO CHANGE THIS so will user insert_manual();
	
	  public static boolean insert_manual1() { SQL.database();
	  
	  boolean result = false; try { int userid = SQL.getUserid(name);
	  
	  double bf_cal = UpdateServlet.morning; double lun_cal = UpdateServlet.lunch;
	  double din_cal = UpdateServlet.dinner; String activity =
	  UpdateServlet.Todayactivity; double minutes = UpdateServlet.minutes; double
	  currentweight = UpdateServlet.currentweight;
	  
	  query = " INSERT INTO userdb.manual_update (userid, height,age)" +
	  "SELECT userid, height, age FROM userdb.aboutme where userid=" + userid +
	  ";"; System.out.println("tod?" + tod); query1 =
	  "UPDATE userdb.manual_update SET  `bf_cal` = " + bf_cal + ", `lun_cal` = " +
	  lun_cal + ", `din_cal` = " + din_cal + "," + "`activity` = '" + activity +
	  "', `minutes` = " + minutes + ", `weight` = " + currentweight + ",`tod` = '"
	  + tod + "' WHERE (`userid` = '" + userid + "')";
	  
	  pst = SQL.connection.prepareStatement(query); pst.executeUpdate();
	  
	  pst = SQL.connection.prepareStatement(query1); pst.executeUpdate();
	  
	  result = true; } catch (SQLException e) { System.out.println(e.getMessage());
	  } return result; }
	 

	// METHOD 8 get height and age from aboutme table and store it in a variable to
	// be displayed on manualupdate.jsp

	public static void get_htage() {
		
		int userid = 0;
		try {
			SQL.database();
			userid = SQL.getUserid(name);

			query = "Select height,age from userdb.aboutme where userid = " + userid + ";";
			pst = SQL.connection.prepareStatement(query);
			pst.executeQuery();

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				System.out.println("height = " + " " + rs.getInt(1));
				System.out.println("age = " + " " + rs.getInt(2));
				ht = rs.getDouble(1);
				ag = rs.getInt(2);

			}

			return;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			return;

		}
	}

	//METHOD 8.1
	
	  // TRYING  /* 1. Get userid, height and weight from aboutme table- get_htage()
			//* 2. Store it in variables in java
			 //* 3. Pass these variables onto the Insert query. 
	//USED THID FINAL 
	
	public static boolean insert_manual() {

		boolean result = false;
		int userid = 0;
		double bf_cal = UpdateServlet.morning; double lun_cal = UpdateServlet.lunch;
		  double din_cal = UpdateServlet.dinner; String activity =
		  UpdateServlet.Todayactivity; double minutes = UpdateServlet.minutes; double
		  currentweight = UpdateServlet.currentweight;
		try {
			
			SQL.database();
			
		    userid = SQL.getUserid(name);
			get_htage();
		
			System.out.println("big_insert()" + userid);
query="INSERT manual_update (userid,bf_cal, lun_cal, din_cal, activity, minutes, height,age, tod, weight,consumed_cal, burnt_cal, spent_cal, balance_cal)"
		+ "           values ("+userid+"," + bf_cal + ","+lun_cal+","+din_cal+", '"+activity+"', "+minutes+","+ht+","+ag+",'"+tod+"',"+currentweight+", "+consumed_cal+", "+burnt_cal+", "+spent_cal+", "+balance_cal+");";
			

			pst = SQL.connection.prepareStatement(query);

			pst.executeUpdate();
			result = true;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;

	}

	// METHOD 9
//query for plan.jsp

	public static List<SQLinitialisation> get_all() {
		SQL.database();
		List<SQLinitialisation> a = new ArrayList<>();

		try {
			System.out.println("loginservlet.un?? sql.java " + LoginServlet.un);
			query = "SELECT registeruser.name, aboutme.* FROM registeruser INNER JOIN aboutme ON registeruser.userid=aboutme.userid where name='"
					+ LoginServlet.un + "'";

			pst = SQL.connection.prepareStatement(query);

			ResultSet rs = pst.executeQuery();

			for (int i = 0; i <= 9; i++) {
				while (rs.next()) {

					everyday_maxcalorie = rs.getInt(11);
					name1 = rs.getString(1);
					user_id = rs.getInt(2);
					plan = rs.getString(10);

					System.out.println("get_all()" + everyday_maxcalorie);
					SQLinitialisation row = new SQLinitialisation();

					a.add(row);
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("e.get message " + e.getMessage());
		}

		return a;

	}



	// test method to display only everyday_maxcalorie

	public static void main(String[] args) {


/*
 * tod_date(); get_htage(); System.out.println("calling maxcal() " + maxcal);
 * System.out.println("get_all()" + everyday_maxcalorie);
 */


	}
}