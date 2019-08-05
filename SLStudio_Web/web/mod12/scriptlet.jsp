<%-- 
    Document   : scriptlet
    Created on : 2018/11/30, 下午 05:49:00
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>程式片段Scriptlet</title>
    </head>
    <body>
        <h1>程式片段Scriptlet</h1>
        <% int i = 0;
            if (i > 10) {%>
        It is a big number.
        <% } else {%>
        It is a small number.
        <%}%>

    </body>
</html>
