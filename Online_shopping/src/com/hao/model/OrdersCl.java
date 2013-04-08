package com.hao.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import sun.security.timestamp.TSRequest;

public class OrdersCl {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	GoodsCl gc = new GoodsCl();

	// 获得某个id的商品
	public Goods getGoods(int a) {
		Goods gs = new Goods();
		try {
			ct = new ConnDB().getConn();
			String sql = "select * from myshopping.goods where GOODSID=" + a;
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				gc.setG(gs, rs);
			}

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return gs;
	}

	// 保存入flash中
	public boolean setFlash(Goods gs, String name) {
		boolean b = false;
		try {
			ct = new ConnDB().getConn();
			String sql = "insert into myshopping.flash(id,name,price,userName) values("
					+ gs.getGoodsId()
					+ ",'"
					+ gs.getG_name()
					+ "',"
					+ gs.getG_price() + ",'" + name + "')";
			// insert into myshopping.flash(id,name,price) values(1,'qwe',1);
			ps = ct.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a == 1) {
				b = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return b;
	}

	public ArrayList<Flash> getFlash(String name) {
		ArrayList<Flash> al = new ArrayList<Flash>();
		try {
			ct = new ConnDB().getConn();
			String sql = "select * from myshopping.flash where userName='"
					+ name + "'";
			// insert into myshopping.flash(id,name,price) values(1,'qwe',1);
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Flash fa = new Flash();
				fa.setId(rs.getInt(1));
				fa.setName(rs.getString(2));
				fa.setPrice(rs.getInt(3));
				fa.setAmount(rs.getInt(4));
				al.add(fa);
			}
			// System.out.println("al++"+al.size());

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return al;
	}

	// 获得商品的总价格
	public float getPrice(String name) {
		float sum = 0;
		try {
			ct = new ConnDB().getConn();
			String sql = "select * from myshopping.flash where userName='"
					+ name + "'";
			// insert into myshopping.flash(id,name,price) values(1,'qwe',1);
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				sum = sum + rs.getInt(3) * rs.getInt(4);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return sum;
	}

	public boolean delOr(int id, String name) {
		//System.out.println("123");
		boolean b = false;
		try {
			ct = new ConnDB().getConn();
			String sql = "delete from myshopping.flash where id=" + id
					+ " and userName='" + name + "'";
			// insert into myshopping.flash(id,name,price) values(1,'qwe',1);

			ps = ct.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				b = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return b;
	}

	public boolean updOr(int id, String name, int d) {
		// System.out.println("123");
		boolean b = false;
		try {
			ct = new ConnDB().getConn();
			String sql = "update myshopping.flash  set amount =" + d + " "
					+ "where id=" + id + " and username='" + name + "';";
			// insert into myshopping.flash(id,name,price) values(1,'qwe',1);

			ps = ct.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				b = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return b;
	}

	public boolean setOrders(String name, String address, String phone,
			String name2) {
		boolean b = false;

		try {
			ct = new ConnDB().getConn();
			String sql = "insert into myshopping.orders(cus_name,address,phone,o_name) values('"
					+ name
					+ "','"
					+ address
					+ "','"
					+ phone
					+ "','"
					+ name2
					+ "');";
			ps = ct.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				b = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}

		return b;
	}

	public int getid() {
		int b = 0;
		try {
			ct = new ConnDB().getConn();
			String sql = "select o_id from myshopping.orders order by time desc  limit 0,1";
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				b = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return b;
	}

	public HashMap<Integer, Integer> getMap(String name) {
		HashMap<Integer, Integer> hm = new HashMap<Integer, Integer>();
		boolean b = false;
		try {
			ct = new ConnDB().getConn();
			String sql = "select id,amount from myshopping.flash  where username='"
					+ name + "';";
			// insert into myshopping.flash(id,name,price) values(1,'qwe',1);
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				hm.put(rs.getInt(1), rs.getInt(2));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		// System.out.println(hm.size()+"temp1");
		return hm;
	}

	public boolean setShop(int id, HashMap<Integer, Integer> hMap) {
		boolean b = false;
		// insert into myshopping.shop(o_id,goodsid,s_no) values(2,46,2);
		try {
			ct = new ConnDB().getConn();
			for (Integer key : hMap.keySet()) {
				int a = 0;
				// System.out.println("key= " + key + "  and  value= " +
				// hMap.get(key));
				ps = ct.prepareStatement(getSql(id, key, hMap.get(key)));
				a = ps.executeUpdate();
				if (a > 0) {
					b = true;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}

		return b;
	}

	public String getSql(int a, int b, int c) {
		String sql = "insert into myshopping.shop(o_id,goodsid,s_no) values("
				+ a + "," + b + "," + c + ");";
		// System.out.println("sql="+sql);
		return sql;
	}

	public boolean delFlash(String name) {
		// System.out.println("123");
		boolean b = false;
		try {
			ct = new ConnDB().getConn();
			String sql = "delete from myshopping.flash  where username='"
					+ name + "';";
			// insert into myshopping.flash(id,name,price) values(1,'qwe',1);
			ps = ct.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				b = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		return b;
	}
	
	public boolean checkId(int id){
		boolean b=true;
		ct=new ConnDB().getConn();
		try {
			String sql="select id from myshopping.flash;";
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				int a=rs.getInt(1);
				if (a==id) {
					b=false;
				} 
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}
		return b;
	}

	/*
	 * public HashMap<Integer, Timestamp> getOrderId(String u){
	 * HashMap<Integer,Timestamp> hm =new HashMap<Integer, Timestamp>(); try {
	 * ct=new ConnDB().getConn(); String
	 * sql="select o_id,time from myshopping.orders where o_name='"+u+"'";
	 * ps=ct.prepareStatement(sql); rs=ps.executeQuery(); while (rs.next()) {
	 * hm.put(rs.getInt(1),rs.getTimestamp(2)); } } catch (Exception e) { //
	 * TODO: handle exception }finally{ this.close(); } return hm; }
	 */

	public ArrayList<Records> setRecord(String u) {
		ArrayList<Records> al = new ArrayList<Records>();
		try {
			ct = new ConnDB().getConn();
			String sql = "Select O.time,g_name,s_no,g_price from myshopping.shop S,myshopping.goods G," +
					"myshopping.orders O where O.o_name='"+u+"' and O.o_id=S.o_id and S.goodsid=G.goodsid;";
			// Select s_no,g_price,g_name,O.time from myshopping.shop
			// S,myshopping.goods G,myshopping.orders O where O.o_name='1' and
			// O.o_id=S.o_id and S.goodsid=G.goodsid;
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Records rc = new Records();
				rc.setTime(rs.getTimestamp(1));
				rc.setO_name(rs.getString(2));
				rc.setAmount(rs.getInt(3));
				rc.setPrice(rs.getFloat(4));			
				al.add(rc);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
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
