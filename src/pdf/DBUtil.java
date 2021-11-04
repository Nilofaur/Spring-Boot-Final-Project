package pdf;

import com.tryme.*;

import SQL.SQL;
import SQL.SQLinitialisation;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtil {
	
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";

    private static final String CONN_STR = "jdbc:mysql://localhost:3306/";

    private static Connection conn = null;
    public static Statement statement = null;
    
    static PreparedStatement pst;

    private static void connect() throws SQLException, ClassNotFoundException {
		
      
        try {
			Class.forName(JDBC_DRIVER);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			conn = DriverManager.getConnection(CONN_STR + "userdb", "root", "secret");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			statement = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("connected");
		}

    }


	/*
	 * private static void disconnect() throws SQLException { if (conn != null &&
	 * !conn.isClosed()) { conn.close(); }
	 */
    //}


    public static ResultSet dbExecuteQuery(String queryStmt) throws SQLException, ClassNotFoundException {
        Statement stmt = null;
        ResultSet resultSet = null;
        CachedRowSet crs = null;
        try {
            connect();
            System.out.println("Select statement: " + queryStmt + "\n");

            stmt = conn.createStatement();
            resultSet = stmt.executeQuery(queryStmt);

            // using cached row set because it can operate without being
            // connected to the data source
            crs = RowSetProvider.newFactory().createCachedRowSet();
            crs.populate(resultSet);

        } catch (SQLException e) {
            System.out.println("Problem occurred at executeQuery operation : " + e);
            throw e;
        } finally {
            if (resultSet != null) {
                resultSet.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            //disconnect();
        }
        return crs;
    }


    private static List<about> getDataFromResultSet(ResultSet rs)
            throws SQLException {

        List<about> aboutMeList = new ArrayList<>();

        while (rs.next()) {
        	about data = new about();

            data.setUserid(rs.getInt("userid"));
            data.setWeight(rs.getInt("weight"));
            data.setHeight(rs.getInt("height"));
            data.setAge(rs.getInt("age"));
            data.setGoal(rs.getInt("goalweight"));
            data.setEthnicity(rs.getString("ethnicity"));
            data.setActivity(rs.getString("activity"));
            data.setCuisine(rs.getString("cuisine"));
            aboutMeList.add(data);
        }
        return aboutMeList;
    }


    public static List<about> getAboutMeData(String query) throws SQLException, ClassNotFoundException {
    	
        return getDataFromResultSet(dbExecuteQuery(query));
    }

    
    
    
    

    /**
     * A method to get a list of Manual Update Objects
     *
     * @param query
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    
//    public static List<ManualUpdate> getManualUpdateData (String query) throws SQLException, ClassNotFoundException {
//        return getDataFromManualUpdateRS(dbExecuteQuery(query));
//    }


    /**
     * A method that iterates through the result set to generate a list
     * of Manual Update Objects
     *
     * @param rs
     * @return
     * @throws SQLException
     */
    private static List<ManualUpdate> getDataFromManualUpdateRS (ResultSet rs) throws SQLException {
        List<ManualUpdate> manualUpdateList = new ArrayList<>();

        while (rs.next()) {
            ManualUpdate data = new ManualUpdate();

            data.setUserid(rs.getInt("userid"));
            data.setAge(rs.getInt("age"));
            data.setBf_cal(rs.getInt("bf_cal"));
            data.setLun_cal(rs.getInt("lun_cal"));
            data.setDin_cal(rs.getInt("din_cal"));
            data.setActivity(rs.getString("activity"));
            data.setMinutes(rs.getInt("minutes"));
            data.setWeight(rs.getInt("weight"));
            data.setHeight(rs.getInt("Height"));
            data.setTod(rs.getString("tod"));
            data.setConsumed_cal(rs.getInt("consumed_cal"));
            data.setBurnt_cal(rs.getInt("burnt_cal"));
            data.setSpent_cal(rs.getInt("spent_cal"));
            data.setBalance_cal(rs.getInt("balance_cal"));
            manualUpdateList.add(data);

        }
        return manualUpdateList;
    }
    
    
    
    public static List<ManualUpdate> getManualUpdate(String query)  {

    	try {
  		SQL.database();
  		
  		 List<ManualUpdate> manualUpdateList = new ArrayList<>();
  		
  			pst = SQL.connection.prepareStatement(query);
  			ResultSet rs = pst.executeQuery();
  			
  			
  			
  			while (rs.next()) {
  	            ManualUpdate data = new ManualUpdate();

  	          System.out.println("UserId: "+ rs.getInt("userid"));
  	          
  	       	    data.setUserid(rs.getInt("userid"));
  	            data.setAge(rs.getInt("age"));
  	            data.setBf_cal(rs.getInt("bf_cal"));
  	            data.setLun_cal(rs.getInt("lun_cal"));
  	            data.setDin_cal(rs.getInt("din_cal"));
  	            data.setActivity(rs.getString("activity"));
  	            data.setMinutes(rs.getInt("minutes"));
  	            data.setWeight(rs.getInt("weight"));
  	            data.setHeight(rs.getInt("height"));
  	            data.setTod(rs.getString("tod"));
  	            data.setConsumed_cal(rs.getInt("consumed_cal"));
  	            data.setBurnt_cal(rs.getInt("burnt_cal"));
  	            data.setSpent_cal(rs.getInt("spent_cal"));
  	            data.setBalance_cal(rs.getInt("balance_cal"));
  	            manualUpdateList.add(data);

  	        }
  			
  	        return manualUpdateList;
  	        
    	} catch (SQLException e) {
    		return null;
    	}
  	}
      

}
