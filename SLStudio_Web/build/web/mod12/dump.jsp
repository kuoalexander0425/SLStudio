
<%@page import="java.util.Enumeration"%>
<%-- 
    Document   : dump
    Created on : 2018/12/3, 下午 02:02:13
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>request dump</title>
    </head>
    <body>
        <h1>request dump</h1>
        <p>Method: <%=request.getMethod()%></p>
        <p>Method: <%=request.getRequestURI()%></p>
        <p>Method: <%=request.getRequestURL()%></p>
        <p>Method: <%=request.getProtocol()%></p>
        <p>Method: <%=request.getLocalPort()%></p>
        <p>Method: <%=request.getLocalName()%></p>
        <p>Method: <%=request.getLocalAddr()%></p>
        <p>Method: <%=request.getRemoteHost()%></p>
        <p>Method: <%=request.getRemoteAddr()%></p>
        <p>Method: <%=request.getRemotePort()%></p>
        <p>Method: <%=request.getContextPath()%></p>

        <h2>request headers</h2>
        <%
            Enumeration<String> headerNames = request.getHeaderNames();
            while (headerNames.hasMoreElements()) {
                String name = headerNames.nextElement();
                String value = request.getHeader(name);
        %>
        <p><%=name%>:<%=value%></p>
        <%
            }
        %>
        <hr>
        <h2>request parameter</h2>
        <%
            Enumeration<String> paramNames = request.getParameterNames();
            while (paramNames.hasMoreElements()) {
                String name = paramNames.nextElement();
                String value = request.getParameter(name);
        %>
        <p><%=name%>:<%=value%></p>        
        <%}%>
            
    </body>
</html>
