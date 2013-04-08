package com.hao.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsersCl {
     private Connection ct=null;
     private PreparedStatement ps=null;
     private ResultSet rs=null;
     
     //注册用户
     public boolean addUser(String name,String password,String email,String sex){
    	 boolean b=false;
    	 ct=new ConnDB().getConn();
    	 String sql="insert into myshopping.users(name,password,email,sex)values('"+name+
    			 "','"+password+"','"+email+"','"+sex+"')";
    	 //insert into myshopping.users(name,password,email,sex) values("","","","");
    	 System.out.println(sql);
    	 try {
			ps=ct.prepareStatement(sql);
			int a=ps.executeUpdate();
			if(a==1){
			b=true;	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
    	 return b;
     }
     
     //检查用户名是否存在
     public boolean checkUser(String u){
    		boolean b = true;
    		try {
    			// 创建Statement
    			ct = new ConnDB().getConn();
    			String sql="select password from myshopping.users where username='"+ u + "'";
    			ps=ct.prepareStatement(sql);
                rs=ps.executeQuery();
    			// 根据结果做判断
    			if (rs.next()) {
    				// 进入,则说明用户名存在   				
    					b = false;   				
    			}

    		} catch (Exception e) {
    			// TODO: handle exception
    		} finally {
    			// 关闭打开的各种资源
    			this.close();
    		}
    		return b;
     }
    
     //登陆
     public boolean checkLogin(String u,String p){
    	boolean b=false;
    	try {
			ct=new ConnDB().getConn();
			String sql="select password from myshopping.users where name='"+u+"'";
			//select password from myshopping.users where name="root" ;
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				if(rs.getString(1).equals(p))b=true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}
    	return b;
     }
     
     //记录某用户的所有信息
     public Users getUsers(String u){
    	 Users users=new Users();
    	 try {
 			ct=new ConnDB().getConn();
 			String sql="select * from myshopping.users where name='"+u+"'";
 			//select password from myshopping.users where name="root" ;
 			ps=ct.prepareStatement(sql);
 			rs=ps.executeQuery();
 			while(rs.next()){
 				users.setName(rs.getString(1));
 				users.setPassword(rs.getString(2));
 				users.setEmail(rs.getString(3));
 				users.setSex(rs.getString(4));
 				users.setPower(rs.getInt(5));
 			}
 			
 		} catch (Exception e) {
 			// TODO: handle exception
 		}finally{
 			this.close();
 		}
    	 return users;
     }
     
     //修改密码
     public boolean updateCode(String u,String p){
    		boolean b=false;
    		try {
    			ct=new ConnDB().getConn();
    			String sql="update myshopping.users set password ='"+p+"' where name='"+u+"';";
    			//insert into myshopping.flash(id,name,price) values(1,'qwe',1);  			
    			ps=ct.prepareStatement(sql);
    			int a=ps.executeUpdate();
    			System.out.println("a="+a);
    			if(a>0){
    				b=true;
    			}
    		} catch (Exception e) {
    			// TODO: handle exception
    		}finally{
    			this.close();
    		}
    		System.out.println("b="+b);
    		return b;
     }
     
     public void close(){
    	 try {
    	 if(ct!=null){   		 
				ct.close();
				 ct=null;
    	 }
    	 if(ps!=null){
    		 ps.close();
    		 ps=null;
    	 }
    	 if(rs!=null){
    		 rs.close();
    		 rs=null;
    	 }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		
    	 
    	 
     }
}
