<%-- 
    Document   : controller
    Created on : 2018/12/7, 下午 12:04:34
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Controller</title>
    </head>
    <body>
        <h1>Hello Controller!</h1>
        <%--
        RequestDispatcher dispatcher= request.getRequestDispatcher("view.jsp");
        dispatcher.forward(request, response); 
        --%>
        <jsp:forward page="view.jsp"/>
    </body>
</html>
