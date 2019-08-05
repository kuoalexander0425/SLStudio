<%@page import="uuu.sls.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	/*
	Object obj = request.getAttribute("customer");
	Customer c = null;
	if(obj instanceof Customer){
		c = (Customer)obj;
	}
	*/
	Customer c = (Customer) request.getAttribute("customer");
%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>註冊成功</title>
</head>
	<body>
		<h1>
		註冊成功,
		<%=c != null ? c.getName() : ""%>
		</h1>
	</body>
</html>