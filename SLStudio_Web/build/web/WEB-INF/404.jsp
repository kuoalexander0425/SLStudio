<%-- 
    Document   : error
    Created on : 2018/12/4, 下午 12:25:28
    Author     : Admin
--%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Errors</title>
        <style>
            .article{
                padding: 100px;
                background-color: black;
            }
            img{
                width: 100%;
            }
            
        </style>
    </head>
    <body>
        <header>
            <jsp:include page="/WEB-INF/subviews/header.jsp">
                <jsp:param name="header.subtitle" value="404系統錯誤"/>
            </jsp:include>
        </header>
       
        <div class="article">
            <h3 style="color:red;">系統發生錯誤(url:<%=request.getAttribute("javax.servlet.error.request_uri")%>) is <%=exception%>!</h3>
            <img src="<%=request.getContextPath()%>/images/404.png"/>
            
        </div>
    </body>
    <footer> 
        <%@include file="/WEB-INF/subviews/footer.jsp" %>
    </footer>
</html>
