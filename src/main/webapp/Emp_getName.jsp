<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!String query="select * from employee where name=?"; %>
<%
String name=request.getParameter("Emp_name");
int id=0;
double salary=0.0;
String gender="";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Employee","Employee");
	PreparedStatement ps=conn.prepareStatement(query);
	ps.setString(1, name);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){
		id=rs.getInt(1);
		name=rs.getString(2);
		salary=rs.getDouble(3);
		gender=rs.getString(4);
	}
	conn.close();
	System.out.print(id+name+salary+gender);
	
}catch(Exception e){
	e.printStackTrace();
}
%>
<center>
<h1>Employee Details</h1>
  <hr>
<form>
<table>
<tr>
<td><label>Employee id:</label></td>
<td><input type="text" disabled="disabled" value=<%=id %>></td>

</tr>

<tr>
<td><label>Employee name:</label></td>
<td><input type="text" disabled="disabled" value=<%=name %>></td>

</tr>

<tr>
<td><label>Employee salary:</label></td>
<td><input type="text" disabled="disabled" value=<%=salary %>></td>

</tr>

<tr>
<td><label>Employee gender:</label></td>
<td><input type="text" disabled="disabled" value=<%=gender%>></td>

</tr>
</table>


</form>


</center>
</body>
</html>