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
String id=request.getParameter("delete");
int Id=Integer.parseInt(id);
String query="delete from employee where id=?";
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Employee","Employee");
	PreparedStatement ps=conn.prepareStatement(query);
	ps.setInt(1, Id);
	int i=ps.executeUpdate();
	if(i>0){%>
	 <center><h1><font color=green>Successfully deleted</font></h1></center>
	 <center><a href="home.html">click here</a>to go to home</center>
	

		
	<% }else{%>
	
		<center><h1><font color=red>Failed TryAgain!</font></h1></center>
	 <center><a href="home.html">click here</a>to go to home</center>
	
	<% }
	conn.close();
}catch(Exception e){
	e.printStackTrace();
	%>
	<center><h1><font color=red>Failed TryAgain!</font></h1></center>
	 <center><a href="home.html">click here</a>to go to home</center>
<% }%>












</body>
</html>