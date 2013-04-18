package com.hao.man;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import com.hao.model.ConnDB;

public class BankCl {
    private Connection ct=null;
    private PreparedStatement ps=null;
    private ResultSet rs=null;
    
    public String checkU(String u){
    	String b="";
    	try {
			ct=new ConnDB().getConn();
			String sql="select password from myshopping.bank where account='"+u+"';";
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				b=rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}    	
    	return b;
    }
    
    public double getM(String u){
    	double b=0;
    	try {
			ct=new ConnDB().getConn();
			String sql="select money from myshopping.bank where account='"+u+"';";
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				b=rs.getDouble(1);
			//System.out.println(b);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}    	
    	return b;
    }
    
    public String getT(String u){
    	String t="";
    	try {
			ct=new ConnDB().getConn();
			String sql="select time from myshopping.bank where account='"+u+"';";
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				t=rs.getTimestamp(1)+"";
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}    	
    	return t;
    }
    
    public boolean updateMoney(String u,double ptr){
    	boolean b=false;
    	try {
			ct=new ConnDB().getConn();
			String sql="update  myshopping.bank set money="+ptr+" where account='"+u+"';";
			ps=ct.prepareStatement(sql);
			int a=ps.executeUpdate();
			if(a>0)b=true;
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}    	
    	return b;
    }
    
    public void close(){
    	try {
    		if(ct!=null){
    			ct.close();
    			ct=null;
    		}if (ps!=null) {
				ps.close();
				ps=null;
			}if(rs!=null){
				rs.close();
				rs=null;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
    	
    		
    }
}
