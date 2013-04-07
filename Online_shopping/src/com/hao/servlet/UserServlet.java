package com.hao.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hao.model.Users;
import com.hao.model.UsersCl;

public class UserServlet extends HttpServlet {

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
		String u = request.getParameter("username");
		String p = request.getParameter("pwd");
		

		//注册
		if (flag.equals("zhuce")) {
			UsersCl uc = new UsersCl();			
			String p2 = request.getParameter("pwd1");
			String email = request.getParameter("email");
			String sex = (String)request.getParameter("sex");
			//System.out.println(sex);
			if(sex.equals("male")){
				sex="男";
			}
			else if (sex.equals("female")) {
				sex="女";
			}
			//System.out.println(sex);
			if (uc.checkUser(u)) {			
				if (p.equals(p2) && !email.equals("")) {				
						if(uc.addUser(u, p, email, sex)){
							String str = "您已成功注册";
							request.setAttribute("temp", str);
							request.getRequestDispatcher("success.jsp").forward(request,
									response);	
						}
						else {
							String str = "注册失败，请重新输入";
							request.setAttribute("temp", str);
							request.getRequestDispatcher("Register.jsp")
									.forward(request, response);

						}
				}
				else {
					String str = "注册失败，请重新输入";
					request.setAttribute("temp", str);
					request.getRequestDispatcher("Register.jsp")
							.forward(request, response);

				}
			} else {
				String str = "用户名已存在";
				request.setAttribute("temp", str);
				request.getRequestDispatcher("Register.jsp").forward(request,
						response);
			}

		}		
		else if(flag.equals("denglu")){
			String checkid = request.getParameter("checkid");
			int id=0;
			if(checkid!=null)
			id=Integer.parseInt(checkid);
			
			
			UsersCl uc =new UsersCl();
			if(uc.checkLogin(u, p)){
				Users us=uc.getUsers(u);
				 if(id!=0){
				request.getSession().setAttribute("admin", us);
				request.getRequestDispatcher("index.jsp").forward(request, response);				
				}else{
				String str="您已登录成功";
				request.setAttribute("temp", str);
				request.getSession().setAttribute("admin", us);
     			request.getRequestDispatcher("success.jsp").forward(request, response);
				}			
				}else {
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
				
		}
		else if(flag.equals("zhuxiao")){
			request.getSession().setAttribute("admin", null);
			request.getRequestDispatcher("index.jsp").forward(request, response);
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
