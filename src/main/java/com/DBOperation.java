package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBOperation {
	//retrieve all account
	ResultSet tset=null;
	Connection connect=null;
	Statement stmt=null;
	public ResultSet getblocks() {
		 try {
			connect=DriverManager.getConnection("jdbc:mysql://localhost/blockchain?" +
			         "user=root&password=root");
			stmt=connect.createStatement();
			tset=stmt.executeQuery("select id,hash,time,size,reward from exa"); 
		 } catch (SQLException e) {
			e.printStackTrace();
		 }
		 return tset;
	}
	//retrieve by account id
	public ResultSet queryById(String id) {
		try {
			//step1 getconnection
			connect=DriverManager.getConnection("jdbc:mysql://localhost/myclassdb?" +
			         "user=root&password=root");
			//step2 create Statement
			stmt=connect.createStatement();
			//step3 execute SQL
			tset=stmt.executeQuery("select * from account where id like '%"+id+"%'");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return tset;
		
	}
	public void insert(String input) {
		
	}
	public void update(){
		
	}
	public void closeAll() {
		if(tset!=null)
			try {
				tset.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(stmt!=null)
			try {
				stmt.close();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		if(connect!=null)
			try {
				connect.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

}
