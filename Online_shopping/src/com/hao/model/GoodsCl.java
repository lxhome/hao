package com.hao.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class GoodsCl {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private int pageSize = 5;//商品列表每页显示条数
	private int c_pageSize=3;//评论每页显示条数

	// 获取所有的商品
	public ArrayList<Goods> getGoods() {
		ArrayList<Goods> al = new ArrayList<Goods>();
		ct = new ConnDB().getConn();
		try {
			ps = ct.prepareStatement("select * from goods");
			rs = ps.executeQuery();
			while (rs.next()) {
				Goods gs = new Goods();
				setG(gs, rs);
				al.add(gs);
				/* System.out.println(rs.getFloat(3)); */
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}

		return al;
	}

	// 获取最新的8个商品
	public ArrayList<Goods> getNewGoods() {
		ArrayList<Goods> al = new ArrayList<Goods>();
		ct = new ConnDB().getConn();
		try {
			ps = ct.prepareStatement("select * from myshopping.goods order by g_adddate desc  limit 0,8");
			rs = ps.executeQuery();
			while (rs.next()) {
				Goods gs = new Goods();
				setG(gs, rs);
				al.add(gs);
				/* System.out.println(rs.getFloat(3)); */
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}

		return al;
	}

	// 获得特定的某个商品
	public Goods get_aGoods(int id) {
		Goods gs = new Goods();
		ct = new ConnDB().getConn();
		try {
			ps = ct.prepareStatement("select * from GOODS where GOODSID=" + id);
			rs = ps.executeQuery();
			while (rs.next()) {
				setG(gs, rs);
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}

		return gs;
	}

	// 获得某种类的所有商品信息
	public ArrayList<Goods> get_TypeGoods(String t) {
		ArrayList<Goods> al = new ArrayList<Goods>();
		String str = this.change(t);
		ct = new ConnDB().getConn();
		String sql = "select * from myshopping.goods where g_type='" + str
				+ "'order by g_adddate desc;";
		// select * from myshopping.goods where g_type="电子产品" order by g_adddate
		// desc;
		try {
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Goods gs = new Goods();
				setG(gs, rs);
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

	// 转换1
	public String change(String t) {
		String str = "";
		if (t.equals("fz"))
			str = "服饰";
		else if (t.equals("xb"))
			str = "鞋包";
		else if (t.equals("zb"))
			str = "珠宝手表";
		else if (t.equals("sm"))
			str = "数码";
		else if (t.equals("dz"))
			str = "电子产品";
		else if (t.equals("ry"))
			str = "日用百货";
		else if (t.equals("wh"))
			str = "文化玩乐";
		else if (t.equals("qc"))
			str = "汽车用品";
		else if (t.equals("pg"))
			str = "苹果/配件";
		return str;
	}

	// 转换2
		public String change2(String t) {
			if (t.equals("服饰"))
				t ="fz" ;
			else if (t.equals("鞋包"))
				t = "xb";
			else if (t.equals("珠宝手表"))
				t ="zb" ;
			else if (t.equals("数码"))
				t ="sm" ;
			else if (t.equals("电子产品"))
				t = "dz";
			else if (t.equals( "日用百货"))
				t ="ry";
			else if (t.equals("文化玩乐"))
				t ="wh" ;
			else if (t.equals("汽车用品"))
				t = "qc";
			else if (t.equals("苹果/配件"))
				t= "pg";
		  return t;
		}
	
	// 返回数据总页数
	public int getPageCount(String t) {
		int rowCount = 0;// 总共有几行记录
		int pageCount = 0;
		String str = change(t);
		try {
			// 得到连接
			ct = new ConnDB().getConn();
			// 查询
			String sql = "select count(*) from myshopping.goods where g_type='"
					+ str + "'";
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				rowCount = rs.getInt(1);
			}

			if (rowCount * pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}

			// 计算pageCount
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			this.close();
		}
/*System.out.println("	rowCount="+rowCount+"//qwepageSize="+pageSize);	
System.out.println("pageCount"+pageCount);*/
		return pageCount;
	}

	// 得到用户想要的显示的用户信息
	public ArrayList<Goods> getGoodsByPage(int pageNow, String t) {

		ArrayList<Goods> al = new ArrayList<Goods>();
		String str = change(t);
		try {
			ct = new ConnDB().getConn();
			// 创建Statement
			String sql = "select * from myshopping.goods  where  g_type='"+str+
					"' and goodsid not in(select t.goodsid from (select * from " +
					"myshopping.goods where g_type='"+str+"' limit 0,"
					+ pageSize * (pageNow - 1)
					+ ")as t)limit 0,"
					+ pageSize
					+ ";";
			// select * from myshopping.goods where g_type="电子产品" and goodsid
			// not in(select t.goodsid from (select * from myshopping.goods
			// where g_type="电子产品" limit 0,1)as t) limit 0,1 ;
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();

			// 开始将rs封装ArrayList
			while (rs.next()) {
				Goods gs = new Goods();
				setG(gs, rs);
				al.add(gs);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			this.close();
		}
		return al;
	}

	
	
	
	public void setG(Goods gs, ResultSet rs) {
		try {
			gs.setGoodsId(rs.getInt(1));
			gs.setG_name(rs.getString(2));
			gs.setG_price(rs.getFloat(3));
			gs.setG_infor(rs.getString(4));
			gs.setG_amount(rs.getInt(5));
			gs.setG_type(rs.getString(6));
			gs.setG_images(rs.getString(7));
			gs.setSpecificClass(rs.getString(8));
			//System.out.println(rs.getInt(1)+' '+rs.getString(2)+""+rs.getFloat(3));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//返回某个商品的数量
	public int getN(int id){
		int n=0;
		try {
			ct=new ConnDB().getConn();
			String sql ="select g_amount from myshopping.goods where goodsid="+id;
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				n=rs.getInt(1);

			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			this.close();
		}
		return n;
	}
	
	//删除某个商品
	public boolean delGoods(int id) {
		boolean b = false;
		ct = new ConnDB().getConn();
		try {
			ps = ct.prepareStatement("delete from GOODS where GOODSID=" + id);
			int a = ps.executeUpdate();
			if (a>0) {
			b=true	;
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}

		return b;
	}
	//增加评论
	public boolean addComment(String name,String str,int id) {
		boolean b = false;
		ct = new ConnDB().getConn();
		try {
			String sql="insert into myshopping.comment(name,comm,goodsid) values" +
					"('"+name+"','"+str+"',"+id+"); ";
			//System.out.println(sql);
			ps = ct.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a>0) 
			b=true	;
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}

		return b;
	}

//评论的数量
	public int CountComment(int id) {
		int b = 0;
		ct = new ConnDB().getConn();
		try {
			String sql="select count(comm) from myshopping.comment where goodsid="+id;
			//System.out.println(sql);
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) 
			b=rs.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}

		return b;
	}
	
//取得用户名和评论	
	public ArrayList<Comments> getComment(int id) {
		ArrayList<Comments> al=new ArrayList<Comments>();
		ct = new ConnDB().getConn();		
		try {
			String sql="select name,comm,time from myshopping.comment  where goodsid="+id +" order by time desc";
			//System.out.println(sql);
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Comments cs=new Comments();
				cs.setName(rs.getString(1));
				cs.setComm(rs.getString(2));
				cs.setTimestamp(rs.getTimestamp(3));
				al.add(cs);
				//System.out.println(rs.getString(1)+" "+rs.getString(2));
			}			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			this.close();
		}
		/*System.out.println("qew"+al.size());*/
		/*for (int i = 0; i < al.size(); i++) {
			System.out.println(al.get(i).getName()+"wer "+al.get(i).getComm());
		}*/
		return al;
	}
	

	
	
	// 返回数据总页数
		/*public int getCommentCount(int id) {
			int rowCount = 0;// 总共有几行记录
			int pageCount = 0;
			try {
				// 得到连接
				ct = new ConnDB().getConn();
				// 查询
				String sql = "select count(*) from myshopping.comment where goodsid="
						+ id ;
				ps = ct.prepareStatement(sql);
				rs = ps.executeQuery();
				if (rs.next()) {
					rowCount = rs.getInt(1);
				}

				if (rowCount * pageSize == 0) {
					pageCount = rowCount / c_pageSize;
				} else {
					pageCount = rowCount / c_pageSize + 1;
				}

				// 计算pageCount
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				this.close();
			}
			return pageCount;
		}

		// 得到用户想要的显示的用户信息
		public ArrayList<Comments> getCommentsByPage(int pageNow, int id) {

			ArrayList<Comments> al = new ArrayList<Comments>();
			try {
				ct = new ConnDB().getConn();
				// 创建Statement
				String sql = "select name,comm from myshopping.comment  where  goodsid="+id+
						" and goodsid not in(select t.goodsid from (select * from " +
						"myshopping.comment where goodsid="+id+" limit 0,"
						+ c_pageSize * (pageNow - 1)
						+ ")as t)limit 0,"
						+ c_pageSize
						+ ";";
				ps = ct.prepareStatement(sql);
				rs = ps.executeQuery();

				// 开始将rs封装ArrayList
				while (rs.next()) {
					Comments cs = new Comments();
					cs.setGoodsid(id);
					cs.setName(rs.getString(1));
					cs.setComm(rs.getString(2));
					al.add(cs);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				this.close();
			}
			return al;
		}
		*/

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
