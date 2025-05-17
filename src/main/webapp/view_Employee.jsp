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
<%
String display="select*from employee";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Employee","Employee");
	PreparedStatement ps=conn.prepareStatement(display);
	ResultSet rs=ps.executeQuery();
	%>
	<center>
	<table border="1px" border collapse:"collapse">
	<tr>
	<th>EmployeeId</th>
	<th>EmployeeName</th>
	<th>EmployeeSalary</th>
	<th>EmployeeGender</th>
	</tr>
	<%while(rs.next()){ %>
	<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getDouble(3) %></td>
	<td><%=rs.getString(4) %></td>
	</tr>
	
	
<%}%>
	</table>
	</center>
	<% conn.close();%>
	 <center><a href="home.html">click here</a>to go to home</center>
	
<% }catch(Exception e){
	e.printStackTrace();
}
%>

</body>
</html>