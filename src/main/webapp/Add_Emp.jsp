<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String msg=request.getParameter("message")==null?"":request.getParameter("message"); %>
<center>
<h1>Add Employee</h1>
<tr><td><%=msg %></td></tr>
<form action="./Add_Emp_Control.jsp">
<table>


<tr>
<td><label>Enter Employee Name:</label></td>
<td><input type="text" name="ename"></td>
</tr>

<tr>
<td><label>Enter Employee Salary:</label></td>
<td><input type="number" name="salary">
</tr>

<tr>
<td><label>Select your gender:</label></td>
<td><input type="radio" name="gender" value="male">male</td>
<td><input type="radio" name="gender" value="female">female</td>
</tr>

<tr>
<td><input type="submit" value="save"></td>
</tr>
<tr>
<td><input type="reset" value="clear"></td>
</tr>

</table>
</form>
</center>
</body>
</html>