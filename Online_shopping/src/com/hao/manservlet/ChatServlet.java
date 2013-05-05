package com.hao.manservlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import com.hao.man.Chat;
import com.hao.man.ChatManCl;
import com.hao.man.OrderManCl;
import com.hao.model.Users;
import com.hao.model.UsersCl;

public class ChatServlet extends HttpServlet {

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
        String flag=(String)request.getParameter("flag");
        Users users=(Users)request.getSession().getAttribute("admin");
       // System.out.println(users!=null);
        if(flag.equals("chat")&&users!=null){  
        	String name=users.getName();
        	String comm=(String )request.getParameter("comm");
        	System.out.println(comm);
        	String ptr="1";
        	ChatManCl cml=new ChatManCl();
        	
        	if(comm!=null)
        	if (cml.setChat(name, comm, ptr)) {
				
			}
        }else if(flag.equals("chat2")&&users!=null){  
        	String name=request.getParameter("name");
        	String comm=(String )request.getParameter("comm");
        	//System.out.println(comm!=null);
        	String ptr="2";
        	ChatManCl cml=new ChatManCl();      	
        	if(comm!=null)
        	if (cml.setChat(name, comm, ptr)) {
				
			}
        }
        else if(flag.equals("getMes")&&users!=null){  
        	String name=users.getName();
        	//System.out.println(comm);
        	ChatManCl cmc=new ChatManCl();
        	ArrayList<Chat> al=(ArrayList<Chat>)cmc.getChat(name);
        	//System.out.println(al.size());
        	JSONArray json = JSONArray.fromObject(al);
        	String jsonStr = json.toString();
        	response.getWriter().print(jsonStr);
        }else if(flag.equals("getMes2")&&users!=null){  
        	String name=(String)request.getParameter("name");
        	//System.out.println(name);
        	ChatManCl cmc=new ChatManCl();
        	ArrayList<Chat> al=(ArrayList<Chat>)cmc.getChat(name);
        	JSONArray json = JSONArray.fromObject(al);
        	String jsonStr = json.toString();
        	response.getWriter().print(jsonStr);
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
