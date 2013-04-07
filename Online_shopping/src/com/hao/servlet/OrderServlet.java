package com.hao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hao.model.Flash;
import com.hao.model.Goods;
import com.hao.model.GoodsCl;
import com.hao.model.OrdersCl;
import com.hao.model.Users;

public class OrderServlet extends HttpServlet {

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

		response.setContentType("text/html");
	
		response.setCharacterEncoding("utf-8");
		String flag = request.getParameter("flag");
		String idstr = (String) request.getParameter("id");
		// System.out.println(idstr);
		int id = 0;
		if (idstr != null)
			id = Integer.parseInt(idstr);
		//System.out.println(id+"==id1");
		Users user=(Users)request.getSession().getAttribute("admin");
		if (flag.equals("orderflash")) {
			if(user!=null){
			OrdersCl oc = new OrdersCl();
			GoodsCl gc = new GoodsCl();
			ArrayList<Flash> al = new ArrayList<Flash>();
			if (id != 0) {
				Goods gs = gc.get_aGoods(id);
				if (oc.setFlash(gs,user.getName())) {
					//System.out.println(id+"==id2");										
				}
			}
			//System.out.println("qwe2"+user.getName()+"al"+al.size());
			//System.out.println("qwe"+oc.getFlash(user.getName()).size());
			al =oc.getFlash(user.getName());
			//System.out.println(al.size()+"==id3");	
			request.setAttribute("flash", al);
			request.getRequestDispatcher("Cart.jsp").forward(request,
					response);
		}else{//用户未登录
			if (idstr != null)
	        request.setAttribute("checkid",idstr);
	        request.getRequestDispatcher("Login.jsp").forward(request,
					response);
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

		this.doPost(request, response);
	}

}
