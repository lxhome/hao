package com.hao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hao.model.Comments;
import com.hao.model.Goods;
import com.hao.model.GoodsCl;
import com.hao.model.OrdersCl;
import com.hao.model.Users;

public class GoodsServlet extends HttpServlet {
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

		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String idstr = (String) request.getParameter("id");
		// System.out.println(idstr);
		int id = 0;
		if (idstr != null)
			id = Integer.parseInt(idstr);

		String type = request.getParameter("type");
		String flag = request.getParameter("flag");
		GoodsCl gc = new GoodsCl();
		Users user = (Users) request.getSession().getAttribute("admin");
		// String name=(String)user.getName();
		// System.out.println(12);
		// 显示某个商品的具体信息
		if (flag.equals("showinfo")) {
			Goods gs = gc.get_aGoods(id);
			request.setAttribute("goodsinfo", gs);
			ArrayList<Comments> al = gc.getComment(id);
			// System.out.println(al.size());
			request.setAttribute("result", al);
			//System.out.println(al.size());
			request.getRequestDispatcher("goodsinfo.jsp").forward(request,
					response);
		}
		// 显示某种类的所有商品
		else if (flag.equals("showlist")) {
			// pageNow type
			// GoodsServlet?flag=showlist&type=dz&pageNow=1
			int pageNow = Integer.parseInt(request.getParameter("pageNow"));
			// System.out.println(11);
			// System.out.println(pageNow+"page");
			// 调用UserBean
			int pageCount = gc.getPageCount(type);
			// System.out.println(pageCount+"=pageCount");
			if (pageNow == 0) {
				String str = "暂无此类商品";
				request.setAttribute("jingao", str);
			}
			// System.out.println("浩"+pageNow+"qwe"+type);
			ArrayList<Goods> al = gc.getGoodsByPage(pageNow, type);
			// int []b = {pageCount,pageNow};
			request.setAttribute("pageCount", pageCount + "");// 总页数
			request.setAttribute("pageNow", pageNow + "");//
			request.setAttribute("result", al);
			request.getRequestDispatcher("goodslist.jsp").forward(request,
					response);

		} else if (flag.equals("delete")) {
			if (gc.delGoods(id)) {
				out.print("<script language = javascript>window.confirm('已删除');window.location.href='admin/goodsManager.jsp'</script> ");
			} else {
				out.print("<script language = javascript>window.confirm('删除失败');window.location.href='admin/goodsManager.jsp'</script> ");
			}
		} else if (flag.equals("comment")) {
			String remessage = (String) request.getParameter("remessage");
			if (user != null && remessage != null) {// 把评论插入数据库中
				String username = (String) user.getName();
				if (gc.addComment(username, remessage, id))
					;

				Goods gs = gc.get_aGoods(id);
				request.setAttribute("goodsinfo", gs);
				ArrayList<Comments> al = gc.getComment(id);
				request.setAttribute("result", al);
				
				request.getRequestDispatcher("goodsinfo.jsp").forward(request,
						response);
			} else if (remessage == null) {
				ArrayList<Comments> al = gc.getComment(id);
				request.setAttribute("result", al);
				
				Goods gs = gc.get_aGoods(id);
				request.setAttribute("goodsinfo", gs);
				request.getRequestDispatcher("goodsinfo.jsp").forward(request,
						response);
			} else {
				if (idstr != null)
					request.setAttribute("checkid", idstr);// 记录所在商品id
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

		this.doGet(request, response);
	}

}
