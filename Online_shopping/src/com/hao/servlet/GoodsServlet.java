package com.hao.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hao.model.Goods;
import com.hao.model.GoodsCl;

public class GoodsServlet extends HttpServlet {
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

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
	
		String idstr = (String)request.getParameter("id");
		System.out.println(idstr);
		int id = 0;
		if(idstr!=null) id = Integer.parseInt(idstr);
		
		String type=request.getParameter("type");
		
		if(type.equals("showinfo")){
			GoodsCl gc=new GoodsCl();
			Goods gs=gc.get_aGoods(id);
			request.setAttribute("goodsinfo",gs);
			request.getRequestDispatcher("goodsinfo.jsp").forward(request, response);
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
