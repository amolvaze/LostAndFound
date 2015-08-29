package com.utd.oasis.dao;


import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author VijayShankar
 */
public class DbConnection {

    /**
     * @return
     */
    public Connection getConnection() {
        Connection conn = null;
        //getProperties();
        try {
        	String url = "jdbc:mysql://localhost:3306/mydb";
            conn = (Connection) DriverManager.getConnection(url, "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    
   /* public static void main(String args[]){
    	DbConnection con = new DbConnection();
    	System.out.println(con.getConnection());
    }
    */
    
}
