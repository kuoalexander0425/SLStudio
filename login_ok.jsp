 <%@page import="uuu.sls.entity.Customer"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Customer c = (Customer)request.getAttribute("customer");
	//Object obj = request.getAttribute("customer");
	//Customer c = null;
	//if(obj instanceof Customer){
	//	c= (Customer)obj;
	//}
%>
<html>
<head>
<title>登入成功</title>
</head>
<body>
	<h1>登入成功,<%= c!=null?c.getName():"" %></h1>
</body>
</html>