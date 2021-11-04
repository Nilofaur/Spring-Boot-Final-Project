package Listener;

import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;

import javax.servlet.ServletContextEvent;

import javax.servlet.ServletContextListener;

import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;
import java.util.logging.Level; 
import java.util.logging.Logger; 
import java.util.logging.*; 

@WebListener
public class Listener implements ServletContextListener {

	  @Override
	    public void contextInitialized(ServletContextEvent sce) {
	        // On Application Startup, please…

	        // Usually I'll make a singleton in here, set up my pool, etc.
	    }

	    @Override
	    public void contextDestroyed(ServletContextEvent sce) {
	        // On Application Shutdown, please…

	        // 1. Go fetch that DataSource
	        InitialContext initContext = null;
			try {
				initContext = new InitialContext();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        Context envContext = null;
			try {
				envContext = (Context)initContext.lookup("java:/comp/env");
			} catch (NamingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	        DataSource datasource;
			try {
				datasource = (DataSource)envContext.lookup("jdbc/database");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	        // 2. Deregister Driver
	        try {
	            java.sql.Driver mySqlDriver = DriverManager.getDriver("jdbc:mysql://localhost:3306/");
	            DriverManager.deregisterDriver(mySqlDriver);
	        } catch (SQLException ex) {
	          Logger logger = null;
	          logger.info("Could not deregister driver:".concat(ex.getMessage()));
	        } 

	        // 3. For added safety, remove the reference to dataSource for GC to enjoy.
	        datasource = null;
	    }

	}