package com.hao.manservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

import com.hao.man.BankCl;
import com.hao.model.Flash;
import com.hao.model.OrdersCl;
import com.hao.model.Users;

public class BankServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//PrintWriter out = response.getWriter();
		String flag=request.getParameter("flag");
		
		//System.out.println(1);
		if (flag.equals("denglu")) {
			String u=(String)request.getParameter("name");
			String p=(String)request.getParameter("pwd");
			//System.out.println(u+"---"+p);
			//System.out.println(!u.equals(""));
			HashMap<String,String> hm=new HashMap<String, String>();
			/*hm.put("a", "e");
			hm.put("b", "f");
			hm.put("c", "g");
			System.out.println(request.getParameter("firstName"));
			//JSONObject json=JSONObject.fromObject(hm); 
			*/
			if (!u.equals("")&&!p.equals("")) {
				BankCl bc=new BankCl();
				String pString=bc.checkU(u);
				if(p.equals(pString))
					hm.put("a","1");
				else {
					hm.put("a","2");
				}
			}else{
				hm.put("a","2");
			}
			JSON json=JSONObject.fromObject(hm); 
			response.getWriter().print(json);
	        /*response.getWriter().flush();
	        response.getWriter().close();*/
		}else if(flag.equals("getMes")){
			String u=(String)request.getParameter("name");
			BankCl bc=new BankCl();
			String tm=bc.getT(u);
			double money=bc.getM(u);
			DecimalFormat df=new DecimalFormat("#");
			HashMap<String,String> hm=new HashMap<String, String>();
			hm.put("u", u);
			hm.put("m", df.format(money)+"");
			hm.put("t", tm+"");
			JSON json=JSONObject.fromObject(hm); 
			response.getWriter().print(json);
		}else if (flag.equals("online")) {//网上支付
			String name=(String)request.getSession().getAttribute("name");
			String address=(String)request.getSession().getAttribute("address");
			String phone=(String)request.getSession().getAttribute("phone");
			String price=(String)request.getSession().getAttribute("price");
			Users users=(Users)request.getSession().getAttribute("admin");
			String u=(String)request.getParameter("u");
			String m=(String)request.getParameter("m");
			//System.out.println(u+"---"+m+"--"+name+address+phone+price);
			double bankmoney=Double.parseDouble(m);
			double needmoney=Double.parseDouble(price);
			double ptr=bankmoney-needmoney;
			String username=users.getName();
			OrdersCl oc = new OrdersCl();
			if (ptr>0) {	//银行存款是否大于购物所需金额 
			if (oc.setOrders(name, address, phone, username)) {// 数据存入orders表中
				HashMap<Integer, Integer> hMap = (HashMap<Integer, Integer>) oc
						.getMap(username);
				int temp = oc.getid();// 获取最近存入数据库的订单o_id
				// System.out.println(temp+"temp");
				// System.out.println(hMap.size()+"temp");
				BankCl bc=new BankCl();
				if(bc.updateMoney(u,ptr))//修改银行账户余额
				if (oc.setShop(temp, hMap))
					if (oc.updateG(temp))
						if (oc.delFlash(username)) {							
							String str = "你的订单已提交，我们将立即发货";
							request.getSession().setAttribute("name", null);
							request.getSession().setAttribute("address", null);
							request.getSession().setAttribute("phone", null);
							request.getSession().setAttribute("price", null);
							request.setAttribute("temp", str);							
							request.getRequestDispatcher(
									"success.jsp").forward(request,
									response);
							
						}
			}
			}else{//网银不够支付
				request.setAttribute("dingdan", "您的网银余额不足");
				ArrayList<Flash> al = new ArrayList<Flash>();
				al = oc.getFlash(users.getName());
				request.setAttribute("order", al);
				request.getRequestDispatcher("Cart_2.jsp").forward(
						request, response);
			}
			
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
