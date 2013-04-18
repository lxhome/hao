package com.hao.manservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hao.man.OrderMan;
import com.hao.man.OrderManCl;
import com.hao.model.Flash;
import com.hao.model.OrdersCl;
import com.hao.model.Users;
import com.hao.model.UsersCl;

public class ManUserServlet extends HttpServlet {

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

		response.setContentType("text/html;Charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String flag=request.getParameter("flag");
		String u=request.getParameter("username");
		String p=request.getParameter("pwd");
		Users users=(Users)request.getSession().getAttribute("manadmin");
		if(flag.equals("denglu")){
			UsersCl uc =new UsersCl();
			if (uc.checkLogin(u, p)) {
				Users us = uc.getUsers(u);
				if(us.getPower()==0){
					request.getSession().setAttribute("manadmin", us);
					request.getSession().setAttribute("man","0");
					request.getRequestDispatcher("admin/MyOrder.jsp").forward(request, response);
				}else if(us.getPower()==2){
					request.getSession().setAttribute("manadmin", us);
					request.getSession().setAttribute("man","2");
					request.getRequestDispatcher("admin/MyGood.jsp").forward(request, response);			
				}else if(us.getPower()==3){
					request.getSession().setAttribute("manadmin", us);
					request.getSession().setAttribute("man","3");
					request.getRequestDispatcher("admin/MyUser.jsp").forward(request, response);				
				}else{
					request.getRequestDispatcher("admin/Login.jsp").forward(request, response);	
				}
			} else {
				request.getRequestDispatcher("admin/Login.jsp").forward(request, response);					
			}
		}else if(flag.equals("zhuxiao")){
			request.getSession().setAttribute("manadmin", null);
			request.getSession().setAttribute("man",null);
			request.getRequestDispatcher("admin/Login.jsp").forward(request, response);		
		}else if (flag.equals("find")) {
			String name=(String)request.getParameter("findname");
			String name2=(String)request.getParameter("findname2");
			OrdersCl oc=new OrdersCl();
			OrderManCl omc=new OrderManCl();
			ArrayList<OrderMan> al=new ArrayList<OrderMan>();
			if(users!=null){//用户存在时			
			if(!name.equals("")){//当第一个输入框不为0时
				al=omc.getmes(name);
				request.setAttribute("Mes", al);
			}else if(!name2.equals("")){//当第二个输入框不为0时
				if(name2.equals("所有用户")){
					al=oc.getRecord();
					request.setAttribute("Mes", al);
				}else{
				al=omc.getmes(name2);
				request.setAttribute("Mes", al);
				}
			}
			//System.out.println(al.size());
			request.getRequestDispatcher("admin/MyOrder2.jsp").forward(request, response);
			}else{
			request.getRequestDispatcher("admin/Login.jsp").forward(request, response);					
			}
			}
		
		else if (flag.equals("findflash")) {
				String name=(String)request.getParameter("findname");
				String name2=(String)request.getParameter("findname2");
				OrderManCl omc=new OrderManCl();
				ArrayList<Flash> al=new ArrayList<Flash>();
				if(users!=null){//用户存在时			
				if(!name.equals("")){//当第一个输入框不为0时
					al=omc.getflashmes(name);
					request.setAttribute("Mes", al);
				}else if(!name2.equals("")){//当第二个输入框不为0时
					if(name2.equals("所有用户")){
						al=omc.getflashmes();
						request.setAttribute("Mes", al);
					}else{
					al=omc.getflashmes(name2);
					request.setAttribute("Mes", al);
					}
				}
				/*System.out.println(al.size());*/
				request.getRequestDispatcher("admin/MyOrder3.jsp").forward(request, response);
				}else{
				request.getRequestDispatcher("admin/Login.jsp").forward(request, response);					
				}
			}else if(flag.equals("findUser")){
				String name=(String)request.getParameter("findname");
				String name2=(String)request.getParameter("findname2");
				UsersCl uCl=new UsersCl();
				OrderManCl omc=new OrderManCl();
				ArrayList<Users> al=new ArrayList<Users>();
				if(users!=null){//用户存在时			
				if(!name.equals("")){//当第一个输入框不为0时
					al=omc.getUsers(name);
					request.setAttribute("Mes", al);
				}else if(!name2.equals("")){//当第二个输入框不为0时
					if(name2.equals("所有用户")){
						al=uCl.getUsers();
						request.setAttribute("Mes", al);
					}else{
					al=omc.getUsers(name2);
					request.setAttribute("Mes", al);
					}
				}
				/*System.out.println(al.size());*/
				request.getRequestDispatcher("admin/MyUser2.jsp").forward(request, response);
				}else{
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
