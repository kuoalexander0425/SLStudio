<%-- 
    Document   : check_out_ok
    Created on : 2018/12/20, 下午 06:11:10
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>結帳成功</title>
         <jsp:include page="/WEB-INF/subviews/globle.jsp" />
    </head>
    <body>
         <header>       
        <jsp:include page="/WEB-INF/subviews/header.jsp">
            <jsp:param name="header.subtitle" value="結帳成功"/>
        </jsp:include>
    </header>
        <div class="article">
            ${requestScope.order}
            ${requestScope.order.totalAmount}
            ${requestScope.order.orderItemSet}                        
        </div>
         <footer> 
        <%@include file="/WEB-INF/subviews/footer.jsp" %>
    </footer>
    </body>
</html>
