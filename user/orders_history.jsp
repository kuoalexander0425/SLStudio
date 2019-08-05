<%-- 
    Document   : orders_history
    Created on : 2018/12/21, 下午 12:26:41
    Author     : Admin
--%>

<%@page import="uuu.sls.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="uuu.sls.entity.Customer"%>
<%@page import="uuu.sls.model.OrderService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <jsp:param name="header.subtitle" value="歷史訂單"/>
            </jsp:include>
        </header>
        <%
            Customer user = (Customer) session.getAttribute("user");
            OrderService service = new OrderService();
            List<Order> list = service.getOrdersHistory(user);
        %>              
        <div class="article">       
            <% if (list != null && list.size() > 0) {%>
            <table style="width:85%;margin: auto">                    
                <thead>
                    <tr>
                        <th>編號</th><th>訂單日期</th><th>付款方式</th><th>貨運方式</th><th>總金額</th>
                    </tr> 
                </thead>
                <tbody>
                    <% for (Order order:list){%>
                    <tr>
                        <th><a href='order.jsp?orderId=<%= order.getId() %>' title='點選即可檢視明細'><%= order.getId() %></a></th>
                        <td><%= order.getOrderDate() %></td>
                        <td>
                            <%= order.getPaymentType().getDescription() %>
                            <% if(order.getPaymentFee()>0){%>
                            , <%= order.getPaymentFee()%>元
                            <%}%>
                        </td>
                        <td>
                            <%= order.getShippingType().getDescription() %>
                            <% if(order.getShippingFee()>0){%>
                            , <%= order.getShippingFee() %>元
                            <%}%>
                        </td>
                        <td><%= order.getTotalAmount() %></td>
                    </tr>
                    <%}%>
                </tbody>                    
            </table>
            <%} else {%>
            <p>查無歷史訂單</p>
            <%}%>
        </div>
        <footer> 
            <%@include file="/WEB-INF/subviews/footer.jsp" %>
        </footer>
    </body>
</html>