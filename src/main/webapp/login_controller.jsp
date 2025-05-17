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
String name=request.getParameter("username");
String pass=request.getParameter("pass");

if(name.equals("admin")&&pass.equals("admin")){
	response.sendRedirect("home.html");
}else{
	out.print("Try Again!");
}





%>

</body>
</html>