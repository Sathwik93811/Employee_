<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!String Emp_Update_Query ="update employee set name=?,salary=?,gender=? where id=?";%>
<%
String emp_name=request.getParameter("got_name");
String emp_sal=request.getParameter("got_salary");
double emp_salary=Double.parseDouble(emp_sal);
String emp_gender=request.getParameter("got_gender");
String emp_id=request.getParameter("got_id");
int id=Integer.parseInt(emp_id);
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Employee","Employee");
	PreparedStatement ps=conn.prepareStatement(Emp_Update_Query);
	ps.setString(1,emp_name);
	ps.setDouble(2,emp_salary );
	ps.setString(3, emp_gender);
	ps.setInt(4, id);
	int i=ps.executeUpdate();
	conn.close();
}catch(Exception e){
	e.printStackTrace();
}








%>

</body>
</html>