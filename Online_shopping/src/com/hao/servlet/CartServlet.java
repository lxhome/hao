package com.hao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hao.model.Flash;
import com.hao.model.Goods;
import com.hao.model.GoodsCl;
import com.hao.model.OrdersCl;
import com.hao.model.Records;
import com.hao.model.Users;

public class CartServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;Charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String idstr = (String) request.getParameter("id");// 商品id

		int id = 0;
		if (idstr != null)
			id = Integer.parseInt(idstr);
		String flag = request.getParameter("flag");
		Users users = (Users) request.getSession().getAttribute("admin");
		String ttt = (String) request.getParameter("ttt");
		// System.out.println(ttt);
		String username = users.getName();// 登陆的用户

		String name = (String) request.getParameter("username");
		String address = (String) request.getParameter("address");
		String phone = (String) request.getParameter("phone");
		String phone2 = (String) request.getParameter("phone2");
		OrdersCl oc = new OrdersCl();
		if (flag.equals("del")) {
			// String str = users.getName();
			if (oc.delOr(id, username))
				;

			ArrayList<Flash> al = new ArrayList<Flash>();
			al = oc.getFlash(username);
			request.setAttribute("flash", al);
			request.getRequestDispatcher("Cart.jsp").forward(request, response);

		} else if (flag.equals("upd")) {
			// System.out.println(ttt+"id="+id);
			if (ttt != null) {
				int n = Integer.parseInt(ttt);
				if (oc.updOr(id, username, n)) {
					ArrayList<Flash> al = new ArrayList<Flash>();
					al = oc.getFlash(username);
					request.setAttribute("flash", al);
					request.getRequestDispatcher("Cart.jsp").forward(request,
							response);
				}
			}

		} else if (flag.equals("pay")) {
			ArrayList<Flash> al = new ArrayList<Flash>();
			al = oc.getFlash(users.getName());
			request.setAttribute("order", al);
			request.getRequestDispatcher("Cart_2.jsp").forward(request,
					response);
		} else if (flag.equals("tableins")) {
			String checkNn = (String) request.getParameter("checkNn");
			String mon = (String) request.getParameter("mon");
			/* System.out.println((name.length())+" q"+(address)+" w"+(phone)); */
			// System.out.println(flag+" e"+(name.equals(""))+" q"+(address.equals(null))+" w"+(phone==null));
			// \
			// System.out.println(phone2.equals(""));

			if (!name.equals("") && !address.equals("") && !phone.equals("")
					&& phone2.equals("") && checkNn.equals("")&&mon!=null) {
				// System.out.println("1235");
				
					HashMap<Integer, Integer> hMap = (HashMap<Integer, Integer>) oc
							.getMap(username);
					if (hMap.size() > 0) {// 从flash表中获取数据
						if (mon.equals("1")){ //货到付款
						if (oc.setOrders(name, address, phone, username)) {// 数据存入orders表中

							int temp = oc.getid();// 获取最近存入数据库的订单o_id
							// System.out.println(temp+"temp");
							// System.out.println(hMap.size()+"temp");
							if (oc.setShop(temp, hMap))
								if (oc.updateG(temp))
									if (oc.delFlash(username)) {
										String str = "你的订单已提交，我们将立即发货";
										request.setAttribute("temp", str);
										request.getRequestDispatcher(
												"success.jsp").forward(request,
												response);
									}
						}
						} else if (mon.equals("2")) {//网上支付
							request.getSession().setAttribute("name",name);
							request.getSession().setAttribute("address", address);
							request.getSession().setAttribute("phone", phone);
		                       request.getRequestDispatcher("Bank.jsp").forward(
										request, response);
						}
					} else {
						request.setAttribute("dingdan", "您没有订购什么商品");
						ArrayList<Flash> al = new ArrayList<Flash>();
						al = oc.getFlash(users.getName());
						request.setAttribute("order", al);
						request.getRequestDispatcher("Cart_2.jsp").forward(
								request, response);
					}
				
			}

			// if(name.length()!=0&&address.length()!=0&&phone.length()!=0){
			/* System.out.println("1235");} */
			else {
				if(mon==null||mon.equals(""))
					request.setAttribute("dingdan", "您没有选择支付方式");
				if (phone2.equals("p2")) {
					request.setAttribute("phone2", "手机号码错误");
				}
				if (checkNn.equals("c2")) {
					request.setAttribute("checkNn", "姓名格式错误");
				}
				if (address.equals("")) {
					request.setAttribute("address", "输入不能为空");
				}
				/* System.out.println("123"); */
				ArrayList<Flash> al = new ArrayList<Flash>();
				al = oc.getFlash(users.getName());
				request.setAttribute("order", al);
				request.getRequestDispatcher("Cart_2.jsp").forward(request,
						response);
			}

		}/* 货到付款 */

		else if (flag.equals("getMes")) {
			ArrayList<Records> al = new ArrayList<Records>();
			al = oc.setRecord(username);
			// System.out.println("username="+username);
			request.setAttribute("result", al);
			// System.out.println("al.size=" + al.size());
			String str = "jilu";
			request.setAttribute("all", str);
			request.getRequestDispatcher("Manage.jsp").forward(request,
					response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
