package com.admin;


	import java.io.IOException;
	import java.io.PrintWriter;

	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	public class Login  extends HttpServlet {
		public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException
		{
		
			try{
				res.setContentType("text/html");
				PrintWriter out=res.getWriter();
				String Name=req.getParameter("userName");
				String Pass=req.getParameter("password");
				out.println("Welcome "+Name);
				
				
				out.close();
			
				
			}	
			
			catch (Exception e)
			{
				System.out.println(e);
			}
		}
	}


