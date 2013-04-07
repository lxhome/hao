package com.hao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
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
		String idstr = (String) request.getParameter("id");

		int id = 0;
		if (idstr != null)
			id = Integer.parseInt(idstr);
		String flag = request.getParameter("flag");
		Users users = (Users) request.getSession().getAttribute("admin");
		String ttt = (String) request.getParameter("ttt");
		// System.out.println(ttt);
		String username = users.getName();

		String name = (String) request.getParameter("username");
		String address = (String) request.getParameter("address");
		String phone = (String) request.getParameter("phone");

		if (flag.equals("del")) {
			OrdersCl oc = new OrdersCl();
			// String str = users.getName();
			if (oc.delOr(id, username))
				;
			request.getRequestDispatcher("Cart.jsp").forward(request, response);
		} else if (flag.equals("upd")) {
			// System.out.println(ttt+"id="+id);
			if (ttt != null) {
				int n = Integer.parseInt(ttt);
				OrdersCl oc = new OrdersCl();
				if (oc.updOr(id, username, n))
					request.getRequestDispatcher("Cart.jsp").forward(request,
							response);
			}

		} else if (flag.equals("pay")) {
			OrdersCl oc = new OrdersCl();
			ArrayList<Flash> al = new ArrayList<Flash>();
			al = oc.getFlash(users.getName());
			request.setAttribute("order", al);
			request.getRequestDispatcher("Cart_2.jsp").forward(request,
					response);
		} else if (flag.equals("tableins")) {
			/* System.out.println((name.length())+" q"+(address)+" w"+(phone)); */
			// System.out.println(flag+" e"+(name.equals(""))+" q"+(address.equals(null))+" w"+(phone==null));
			if (!name.equals("") && !address.equals("") && !phone.equals("")) {
				/* System.out.println("1235"); */
				OrdersCl oc = new OrdersCl();
				int temp = 0;
				HashMap<Integer,Integer> hMap=oc.getMap(username);
				
				if (oc.setOrders(name, address, phone, username)){
					temp = oc.getid();
					
					oc.delFlash(username);
				}

			}
			// if(name.length()!=0&&address.length()!=0&&phone.length()!=0){
			/* System.out.println("1235");} */
			else {
				/* System.out.println("123"); */
				OrdersCl oc = new OrdersCl();
				ArrayList<Flash> al = new ArrayList<Flash>();
				al = oc.getFlash(users.getName());
				request.setAttribute("order", al);
				// request.getRequestDispatcher("Cart_2.jsp").forward(request,response);
			}

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
