package com.hao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hao.model.Comments;
import com.hao.model.Goods;
import com.hao.model.GoodsCl;
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

		String flag = (String) request.getParameter("flag");
		String u = request.getParameter("username");
		String p = request.getParameter("pwd");
		GoodsCl gc=new GoodsCl();
		UsersCl uc = new UsersCl();
		// 注册
		// System.out.println(flag);
		if (flag.equals("zhuce")) {
			String tt1 = (String) request.getParameter("tt1");// 判断用户名和密码是否合法
			String tt2 = (String) request.getParameter("tt2");// 判断邮箱格式是否正确
			String tt3 = (String) request.getParameter("tt3");// 判断验证码是否输入正确
			//System.out.println(tt1 + "" + tt2 + "'" + tt3);
			String p2 = request.getParameter("pwd1");
			String email = request.getParameter("email");
			String sex = (String) request.getParameter("sex");
			// System.out.println(sex);
			if (sex.equals("male")) {
				sex = "男";
			} else if (sex.equals("female")) {
				sex = "女";
			}
			// System.out.println(sex);
			// System.out.println((tt1.equals(""))+" "+(tt2.equals(""))+" "+(tt3.equals(""))+" ");
			if (tt1.equals("") && tt2.equals("") && tt3.equals("")) {
				if (uc.checkUser(u)) {
					if (p.equals(p2) && !email.equals("")) {
						if (uc.addUser(u, p, email, sex)) {
							String str = "您已成功注册";
							request.setAttribute("temp", str);
							request.getRequestDispatcher("success.jsp")
									.forward(request, response);
						} else {
							String str = "注册失败，请重新输入";
							request.setAttribute("temp", str);
							request.getRequestDispatcher("Register.jsp")
									.forward(request, response);

						}
					} else {
						String str = "注册失败，请重新输入";
						request.setAttribute("temp", str);
						request.getRequestDispatcher("Register.jsp").forward(
								request, response);

					}
				} else {
					String str = "用户名已存在";
					request.setAttribute("temp", str);
					request.getRequestDispatcher("Register.jsp").forward(
							request, response);
				}/* 检验用户名是否存在end */
			} else {// 用户验证失败			
				if (tt1.equals("tt1")){
					String str = "用户名或者密码不合法";
					request.setAttribute("tt1", str);
				}
				if (tt2.equals("tt2")){
					String str = "邮箱格式错误";
					request.setAttribute("tt2", str);
				}
				if (tt3.equals("tt3")){
					String str = "验证码错误";
					request.setAttribute("tt3", str);
				}
				request.getRequestDispatcher("Register.jsp").forward(request,
						response);
			}

		} else if (flag.equals("denglu")) {
			String checkid = request.getParameter("checkid");
			int id = 0;
			if (checkid != null)
				id = Integer.parseInt(checkid);

			if (uc.checkLogin(u, p)) {
				Users us = uc.getUsers(u);
				if (id != 0) {
					//System.out.println(id);
					request.getSession().setAttribute("admin", us);
					ArrayList<Comments> al = gc.getComment(id);
					request.setAttribute("result", al);
					Goods gs=gc.get_aGoods(id);
					request.setAttribute("goodsinfo",gs);
					request.getRequestDispatcher("goodsinfo.jsp").forward(request, response);
				} else if (us.getPower()==1) {						
						String str = "您已登录成功";
						request.setAttribute("temp", str);
						request.getSession().setAttribute("admin", us);
						request.getRequestDispatcher("success.jsp").forward(
								request, response);
					}else 
						request.getRequestDispatcher("Login.jsp").forward(request,
								response);			
			} else 
				request.getRequestDispatcher("Login.jsp").forward(request,
						response);
			

		} else if (flag.equals("zhuxiao")) {
			request.getSession().setAttribute("admin", null);
			request.getRequestDispatcher("index.jsp")
					.forward(request, response);
		} else if (flag.equals("manage")) {
			request.getRequestDispatcher("Manage.jsp").forward(request,
					response);
		} else if (flag.equals("updateCode")) {
			String p2 = request.getParameter("pwd2");
			String p3 = request.getParameter("pwd3");
			Users users = (Users) request.getSession().getAttribute("admin");
			String username = (String) users.getName();
			if (uc.checkLogin(username, p)) {
				if (p2.equals(p3)) {
					if (uc.updateCode(username, p3)) {
						String str = "密码修改成功";
						// System.out.println(str);
						request.setAttribute("temp", str);
						request.getRequestDispatcher("Manage.jsp").forward(
								request, response);
					}
				}
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
