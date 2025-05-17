<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
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
<%! String select_Emp_Query="select * from employee where id=?"; %>


<%
String ID=request.getParameter("search");
int emp_Id=Integer.parseInt(ID);
String name_="";
double salary_=0.0;
String gender_="";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","Employee","Employee");
	PreparedStatement ps=conn.prepareStatement(select_Emp_Query);
	ps.setInt(1, emp_Id);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		name_=rs.getString(2);
		salary_=rs.getDouble(3);
		gender_=rs.getString(4);
		
	}
	conn.close();
	
}catch(Exception e){
	e.printStackTrace();
}

%>
<center>
<form action="./Employee_update_control.jsp">
<table>

<tr>
<td><label>Employee id:</label></td>
<td><input type="text"  disabled="disabled" value=<%=emp_Id %>></td>
<td><input type="hidden"  name="got_id" value=<%=emp_Id %>></td>

</tr>

<tr>
<td><label>Employee name:</label></td>
<td><input type="text" name="got_name" value=<%=name_ %>></td>
</tr>

<tr>
<td><label>Employee salary:</label></td>
<td><input type="text" name="got_salary" value=<%=salary_ %>></td>
</tr>

<tr>
<td><label>Employee gender:</label></td>
<td><input type="text" name="got_gender" value=<%=gender_ %>></td>
</tr>

<tr>
<td><input type="submit" value="save"></td>
<td><input type="reset" value="clear"></td>
</tr>

</table>

</form>
</center>
</body>
</html>