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
 
String Insert="insert into employee values(Employee_sequence.nextval,?,?,?)";

String name=request.getParameter("ename");
String Esalary=request.getParameter("salary");
double Salary=Double.parseDouble(Esalary);
String gender=request.getParameter("gender");

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Employee","Employee");
	PreparedStatement ps=conn.prepareStatement(Insert);
	
	ps.setString(1, name);
	ps.setDouble(2, Salary);
	ps.setString(3, gender);
	int i=ps.executeUpdate();
  if(i>0){%>
  <!-- <center><h1><font color=green>Successfully Inserted</font></h1></center>
  <center><a href="home.html">click here</a>for go to home</center> -->
  
  <%response.sendRedirect("./Add_Emp.jsp?message=Employee Added successfully"); %> 
 
 <% }else{%>
  <center><h1><font color=red>Failed TryAgain!</font></h1></center>
  <center><a href="home.html">click here</a>for go to home</center>
	<% conn.close();}
}catch(Exception e){
	e.printStackTrace();%>
	 <center><h1><font color=red>Failed TryAgain!</font></h1></center>
  <center><a href="home.html">click here</a>for go to home</center>
<% }%>

</body>
</html>