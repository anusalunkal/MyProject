<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page impot="java.sql.*" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update</title>
</head>
<body>
<%
String ide=request.getParameter("id");
int num=Integer.parseInt(ide);
String name=request.getParameter("name");
String department=request.getParameter("department");
String designation=request.getParameter("designation");
int salary=Integer.parseInt(request.getParameter("salary"));
try{
	Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","root","root");
	Statement st=conn.createStatement();
	st.executeUpdate("update employee set name='"+name+"',department='"+department+"',designation='"+designation+"',salary='"+salary+"' where id='"+num+"'");
	response.sendRedirect("/examples/jsp/application.jsp");
	
}
catch (Exception e)
{
	System.out.println(e);
	
}
%>
</body>
</html>