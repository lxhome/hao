package com.hao.manservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.mail.Flags.Flag;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hao.man.OrderManCl;
import com.hao.model.Goods;
import com.hao.model.GoodsCl;
import com.hao.model.Users;
import com.hao.model.UsersCl;

public class ManGoodsServlet extends HttpServlet {

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
		response.setContentType("text/html;Chatset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String flag=request.getParameter("flag");
		Users users=(Users)request.getSession().getAttribute("manadmin");
		if(flag.equals("findgoods")){
			String name=(String)request.getParameter("findname");
			String name2=(String)request.getParameter("findname2");
			OrderManCl omc=new OrderManCl();
			ArrayList<Goods> al=new ArrayList<Goods>();
			if(users!=null){//用户存在时			
			if(!name.equals("")){//当第一个输入框不为0时
				al=omc.get_TypeGoods(name);
				request.setAttribute("Mes", al);
			}else if(!name2.equals("")){//当第二个输入框不为0时
				if(name2.equals("所有商品")){
					al=omc.get_TypeGoods();
					request.setAttribute("Mes", al);
				}else{
				al=omc.get_TypeGoods(name2);
				request.setAttribute("Mes", al);
				}
			}
			/*System.out.println(al.size());*/
			request.getRequestDispatcher("admin/MyGood2.jsp").forward(request, response);
			}else{
			request.getRequestDispatcher("admin/Login.jsp").forward(request, response);					
			}
		}else if(flag.equals("addgoods")){
			String name=(String)request.getParameter("name");
			String pricestr=(String)request.getParameter("price");
			String infor=(String)request.getParameter("infor");
			String amountstr=(String)request.getParameter("amount");
			String type=(String)request.getParameter("type");
			String images=(String)request.getParameter("images");
			String specific=(String)request.getParameter("specific");
			float price=0;
			int amount=0;			
			/*System.out.println(name+" "+price+" "+infor+" "+amount+" "+type
					+" "+images+" "+specific);*/
			OrderManCl omc=new OrderManCl();
			if(users!=null){//用户存在时	
				/*System.out.println(3);*/
				try {
					if(pricestr!=null)
						price=Float.parseFloat(pricestr);
					if(amountstr!=null)
						amount=Integer.parseInt(amountstr);
				} catch (Exception e) {
					// TODO: handle exception
				}			
				if(omc.setGoods(name, price, infor, amount, type, images, specific)){//当第一个输入框不为0时
                 /*System.out.println(1);*/
					request.setAttribute("check", "插入成功");
				}else {
					/*System.out.println(2);*/
					request.setAttribute("check", "插入失败");
				}
				/*System.out.println(al.size());*/
				request.getRequestDispatcher("admin/MyGood3.jsp").forward(request, response);
				}else{
					/*System.out.println(4);*/
				request.getRequestDispatcher("admin/Login.jsp").forward(request, response);					
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
