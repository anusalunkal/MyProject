<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit</title>
</head>
<body>
<form method="post" action="update.jsp">
<table border="1">
<tr>
<th>Employee Id</th>
<th>Employee Name</th>
<th>Designation</th>
<th>Department</th>
<th>Basic Salary</th>
</tr>
<%
String id=request.getParameter("id");
int no=Integer.parseInt(id);
int sumcount=0;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","root","root");
	String query="select * from employee where id='"+no+"'";
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(query);
	while(rs.next())
	{
	%>
	<tr>
	<td><input type="hidden" name="id" value="<%=rs.getString(1) %>"></td>
	<td><input type="text" name="name" value="<%=rs.getString("name") %>"></td>
	<td><input type="text" name="designation" value="<%=rs.getString("desgnation") %>"></td>
	<td><input type="text" name="department" value="<%=rs.getString("department") %>"></td>
	<td><input type="text" name="salary" value="<%=rs.getInt("salary") %>"></td>
	</tr>
	<tr>
	<td>
	<td><input type="submit" name="submit" value="update" style="background-color:#49743D;font-weight:bold;color:#ffffff;"></td>
	</tr>
	<%
	}
}
catch(Exception e)
{
}
%>

</table>
</form>
</body>
</html>