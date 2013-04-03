package com.hao.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GoodsCl {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	//获取所有的商品
    public ArrayList<Goods> getGoods(){
    ArrayList<Goods> al	=new ArrayList<Goods>();
    ct = new ConnDB().getConn();
	try {
		ps = ct.prepareStatement("select * from goods");
	    rs=ps.executeQuery();
	    while(rs.next()){
	    	Goods gs=new Goods();
	    	gs.setGoodsId(rs.getInt(1));
	    	gs.setG_name(rs.getString(2));
	    	gs.setG_price(rs.getFloat(3));
	    	gs.setG_infor(rs.getString(4));
	    	gs.setG_amount(rs.getInt(5));
	    	gs.setG_type(rs.getString(6));
	    	gs.setG_images(rs.getString(7));
	    	gs.setSpecificClass(rs.getString(8));
	    	al.add(gs);
	    /*	System.out.println(rs.getFloat(3));*/
	    }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		this.close();
	}

    return al;
    }
    
	
	
	public void close(){
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
