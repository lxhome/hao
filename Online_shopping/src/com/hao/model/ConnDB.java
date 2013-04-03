package com.hao.model;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnDB {
  public Connection  ct=null;
  public Connection getConn(){
	  try {
		  Class.forName("com.mysql.jdbc.Driver");
			ct=DriverManager.getConnection("jdbc:mysql://localhost:3306/myshopping","root","520");
		
	} catch (Exception e) {
		// TODO: handle exception
	}
	  return ct;
  }
}
