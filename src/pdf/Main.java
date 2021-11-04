package pdf;

import com.tryme.*;
import java.sql.SQLException;
import java.util.List;
public class Main {

	 public static void main(String[] args) throws ClassNotFoundException {


	            //List<about> data = DBUtil.getAboutMeData("select * from aboutme");

//	            for (about element : data) {
//	                System.out.println(element.toString());
//	            }

	            // For Nilo ------------------------------------------------------------------------------------------------------
	            PDFGenerator.generateReport(DBUtil.getManualUpdate("SELECT * FROM userdb.manual_update where userid=1"));


	       
	        
	    }
	}

