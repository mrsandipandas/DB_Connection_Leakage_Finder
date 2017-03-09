package com.pwc.in.aapl.app.connection.util;

import java.sql.Connection;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import ro.kifs.diagnostic.*;

public class MySqlDataSourceUtil {
	
	///private static Logger logger =Logger.getLogger(MySqlDataSourceUtil.class);

    private static DataSource dataSource;
    
    public void setDataSource(DataSource dataSource) {
       MySqlDataSourceUtil.dataSource = dataSource;
    }

    
     /**
      * 
      * @throws java.sql.SQLException
      * @throws javax.naming.NamingException
      * @return SQL connection object
      */
     public static Connection getConnection() throws SQLException {
         Connection con = null;
         ro.kifs.diagnostic.Connection wrappedDiagnosticConnection=null;
         try {
             con = dataSource.getConnection();
             if(con==null)
            {
            	 //logger.error("Connection returned null");            	 
            	 throw new Exception("Connection returned null");           
            }
            wrappedDiagnosticConnection=new ro.kifs.diagnostic.Connection(con);
         }
         catch (Exception e) {
             throw new RuntimeException(e);  
         }
         //logger.debug("returning connection"); 
         return wrappedDiagnosticConnection;
     }
}
