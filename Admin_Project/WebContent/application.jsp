<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin_Home</title>

<script language="javascript">
function editRecord(username)
{
var f=document.form;
f.method="post";
f.action='edit.jsp?username='+id;
f.submit();
}
</script>

<style>
body{
background-image:url("index.png");
background-repeat:no-repeat;
background-size:100%;
}
.m1{
color:blue;
font-weight:bold;
font-size:30px;
}
.m2{

color:green;
font-weight:bold;
font-size:20px;
}
nav{
text-align:right;
width:100%;
background-color:white;
height:25px}
</style>
<marquee class="m1" >Virtusa &nbsp &nbsp Consultancy &nbsp &nbsp Services</marquee>
<nav>
<marquee class="m2" direction="right"> PASSION  &nbsp &nbsp  &nbsp &nbsp  INNOVATE  &nbsp&nbsp&nbsp   &nbsp     RESPECT  &nbsp &nbsp &nbsp&nbsp        LEADERSHIP </marquee>
</nav>
</style>
</head>
<body >


<h1 style="color:red;text-align:center;">Welcome Admin</h1>
<br>
<br>
<form method="post" name="form">
<table border="1">
<tr>
<th>Employee Id</th>
<th>Employee Name</th>
<th>Designation</th>
<th>Department</th>
<th>Basic Salary</th></tr>

<%
Connection con=null;
String url="jdbc:oracle:@localhost:1521:xe";
String db="test";
String driver="com.oracle.jdbc.Driver";
String username="root";
String password="root";



int sumcount=0;
Statement st;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();

con = DriverManager.getConnection(url+db,username,password);
String query="select * from employee";
st=con.createStatement();
ResultSet rs=st.executeQuery(query);
%>
<%
while(rs.next())
{
%>
<tr><td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td><input type="butoon" name="edit" value="Edit" style="background-color:green;font-weight:bold;color:white" onclick="editRecord(<%=rs.getString(1)%>);"></td>
</tr>
<%
}
%>

<%
}
catch(Exception e)
{
e.printStackTrace();
}
%>


</table>
</form>

</body>
</html>