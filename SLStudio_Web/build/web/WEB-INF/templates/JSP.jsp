<%-- 
    Document   : ${name}
    Created on : ${date}, ${time}
    Author     : ${user}
--%>

<%@page contentType="text/html" pageEncoding="${encoding}"%>
${doctype}
<html>
    <head>
        <meta charset="${encoding}">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
          <jsp:include page="/WEB-INF/subviews/globle.jsp" />
    </head>
    <body>
        <header>
            <jsp:include page="/WEB-INF/subviews/header.jsp">
                <jsp:param name="header.subtitle" value="結帳"/>
            </jsp:include>
        </header>
      
        <footer> 
        <%@include file="/WEB-INF/subviews/footer.jsp" %>
    </footer>
    </body>
</html>
