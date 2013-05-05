package com.hao.man;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import com.hao.model.ConnDB;

public class ChatManCl {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public boolean setChat(String name,String comm,String ptr){
		boolean b=false;
		try {
			ct=new ConnDB().getConn();
			String sql="insert into myshopping.chat(name,content,ptr) values('"+name+"','"+comm+"','"+ptr+"');";
			//System.out.println(sql);
			ps=ct.prepareStatement(sql);
			int a=ps.executeUpdate();
			if(a>0)
			 b=true; 					
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}
		return b;
	}
	
	public ArrayList<Chat> getChat(String name){
		ArrayList<Chat> al=new ArrayList<Chat>();
		try {
			ct=new ConnDB().getConn();
			String sql="select * from myshopping.chat where name='"+name+"';";
			//System.out.println(sql);
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
			Chat chStr=new Chat();
			chStr.setName(rs.getString(1));
			chStr.setContent(rs.getString(2));
			chStr.setPtr(rs.getString(3));
			al.add(chStr);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}
		return al;
	}
	
	public void close() {
		try {
		if (ct != null) {
			ct.close();
			ct = null;
		}
		if (ps != null) {
			ps.close();
			ps = null;
		}
		if (rs != null) {
			rs.close();
			rs = null;
		}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
