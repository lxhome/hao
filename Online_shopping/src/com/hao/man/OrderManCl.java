package com.hao.man;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.tagext.TryCatchFinally;

import com.hao.model.ConnDB;
import com.hao.model.Flash;
import com.hao.model.Goods;
import com.hao.model.Users;

public class OrderManCl {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	// 获得某个用户所有的订单信息
	public ArrayList<OrderMan> getmes(String name) {
		ArrayList<OrderMan> al = new ArrayList<OrderMan>();
		try {
			ct = new ConnDB().getConn();
			String sql = "select O.time,O.cus_name,phone,O.o_name,G.g_name,S.s_no,G.g_price "
					+ "from myshopping.goods G, myshopping.orders O,myshopping.shop S where "
					+ "O.o_id=S.o_id and S.goodsid=G.goodsid and O.o_name='"
					+ name + "';";
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				OrderMan rc = new OrderMan();
				rc.setTime(rs.getTimestamp(1));
				rc.setCus_name(rs.getString(2));
				rc.setPhone(rs.getString(3));
				rc.setO_name(rs.getString(4));
				rc.setName(rs.getString(5));
				rc.setAmount(rs.getInt(6));
				rc.setPrice(rs.getFloat(7));
				al.add(rc);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return al;
	}

	// 获取所有的flash的值
	public ArrayList<Flash> getflashmes() {
		ArrayList<Flash> al = new ArrayList<Flash>();
		try {
			ct = new ConnDB().getConn();
			String sql = "select * from myshopping.flash ";
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Flash rc = new Flash();
				rc.setId(rs.getInt(1));
				rc.setName(rs.getString(2));
				rc.setPrice(rs.getInt(3));
				rc.setAmount(rs.getInt(4));
				rc.setUserName(rs.getString(5));
				al.add(rc);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return al;
	}

	// 获取特定name的flash的值
	public ArrayList<Flash> getflashmes(String name) {
		ArrayList<Flash> al = new ArrayList<Flash>();
		try {
			ct = new ConnDB().getConn();
			String sql = "select * from myshopping.flash where userName='"
					+ name + "';";
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Flash rc = new Flash();
				rc.setId(rs.getInt(1));
				rc.setName(rs.getString(2));
				rc.setPrice(rs.getInt(3));
				rc.setAmount(rs.getInt(4));
				rc.setUserName(rs.getString(5));
				al.add(rc);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return al;
	}

	public ArrayList<Users> getUsers(String u) {
		ArrayList<Users> al = new ArrayList<Users>();
		try {
			ct = new ConnDB().getConn();
			String sql = "select * from myshopping.users where name='" + u
					+ "';";
			// select password from myshopping.users where name="root" ;
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Users users = new Users();
				users.setName(rs.getString(1));
				users.setPassword(rs.getString(2));
				users.setEmail(rs.getString(3));
				users.setSex(rs.getString(4));
				users.setPower(rs.getInt(5));
				al.add(users);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return al;
	}

	public ArrayList<String> getType() {
		ArrayList<String> al = new ArrayList<String>();
		try {
			ct = new ConnDB().getConn();
			String sql = "select distinct g_type from myshopping.goods;";
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				al.add(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return al;
	}

	// 获得某种类的所有商品信息
	public ArrayList<Goods> get_TypeGoods(String t) {
		ArrayList<Goods> al = new ArrayList<Goods>();
		ct = new ConnDB().getConn();
		String sql = "select * from myshopping.goods where g_type='" + t
				+ "'order by g_adddate desc;";
		// select * from myshopping.goods where g_type="电子产品" order by g_adddate
		// desc;
		try {
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Goods gs = new Goods();
				gs.setGoodsId(rs.getInt(1));
				gs.setG_name(rs.getString(2));
				gs.setG_price(rs.getFloat(3));
				gs.setG_infor(rs.getString(4));
				gs.setG_amount(rs.getInt(5));
				gs.setG_type(rs.getString(6));
				gs.setG_images(rs.getString(7));
				gs.setSpecificClass(rs.getString(8));
				gs.setTimestamp(rs.getTimestamp(9));
				al.add(gs);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			this.close();
		}
		return al;
	}

	// 获得某种类的所有商品信息
	public ArrayList<Goods> get_TypeGoods() {
		ArrayList<Goods> al = new ArrayList<Goods>();
		ct = new ConnDB().getConn();
		String sql = "select * from myshopping.goods order by g_adddate desc;";
		// select * from myshopping.goods where g_type="电子产品" order by g_adddate
		// desc;
		try {
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Goods gs = new Goods();
				gs.setGoodsId(rs.getInt(1));
				gs.setG_name(rs.getString(2));
				gs.setG_price(rs.getFloat(3));
				gs.setG_infor(rs.getString(4));
				gs.setG_amount(rs.getInt(5));
				gs.setG_type(rs.getString(6));
				gs.setG_images(rs.getString(7));
				gs.setSpecificClass(rs.getString(8));
				gs.setTimestamp(rs.getTimestamp(9));
				al.add(gs);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			this.close();
		}
		return al;
	}

	public boolean setGoods(String name,float price,String infor,int amount,String type,String image,String specific){
			boolean b=false;
			try {
				ct=new ConnDB().getConn();
				String sql="insert into myshopping.goods(g_name,g_price,g_infor,g_amount,g_type,g_images,g_specific_class) values" +
						"('"+name+"',"
						+price+",'"+infor+"',"+amount+",'"+type+"','"+image+"','"
						+specific+"');";
				ps=ct.prepareStatement(sql);
				int a=ps.executeUpdate();
				if(a==1){
					b=true;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				this.close();
			}
			return b;
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
