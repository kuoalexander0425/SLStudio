<%-- 
    Document   : order
    Created on : 2018/12/21, 下午 04:15:20
    Author     : Admin
--%>

<%@page import="uuu.sls.entity.OrderItem"%>
<%@page import="java.util.Set"%>
<%@page import="uuu.sls.model.OrderService"%>
<%@page import="uuu.sls.entity.Customer"%>
<%@page import="uuu.sls.entity.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>首頁</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="/WEB-INF/subviews/globle.jsp" />
    </head> 
    <body>  
    <header>       
        <jsp:include page="/WEB-INF/subviews/header.jsp">
            <jsp:param name="header.subtitle" value="訂單明細"/>
        </jsp:include>
    </header>
     <%
      String orderId = request.getParameter("orderId");
      Order order = null;
      Customer user = (Customer)session.getAttribute("user");
      if(orderId!=null && orderId.matches("\\d+")){
          OrderService orderService = new OrderService();
          order = orderService.getOrder(user,Integer.parseInt(orderId));
      }
     %>
        <div class="article">
            <%if(order!=null){%>
            <div>
                訂單編號:<%=order.getId()%>, 處理狀態:<%=order.getStatus()%><br>
                訂購時間:<%=order.getOrderDate()%><%=order.getOrderTime()%><br>
                付款方式:<%=order.getPaymentType().getDescription()%>${requestScope.order.paymentFee>0?requestScope.order.paymentFee:""}<br>
                貨運方式:<%=order.getShippingType().getDescription()%>${requestScope.order.shippingFee>0?requestScope.order.shippingFee:""}<br>
                總金額:<%=order.getTotalAmount()%><br>
            </div>
            <div>
                收件人:<%=order.getAddresseeName()%><br>
                電子信箱:<%=order.getAddresseeEmail()%><br>
                連絡電話:<%=order.getAddresseePhone()%><br>
                收件地址:<%=order.getShippingAddress()%><br>                
            </div>
            <%
                Set<OrderItem> set = order.getOrderItemSet();
                if(set!=null && set.size()>0){
            %>
            <table>
                    <caption>訂購明細</caption>
                    <thead>
                        <tr><th>產品</th><th>容量</th><th>價格</th><th>數量</th></tr>
                    </thead>
                    <tbody>
                        <% for(OrderItem item:set){%>
                        <tr>
                            <td><img src='<%=  item.getProduct().getPhotoURL()%>' style="width: 60px;vertical-align: middle"><%=  item.getProduct().getName() %></td>
                            <td><%=  item.getSize() %></td>
                            <td><%=  item.getPrice() %></td>
                            <td><%=  item.getQuantity() %></td>
                        </tr>
                        <%}%>
                    </tbody>                    
                </table>
                    <%}%>
            <%}else{%>
            <p>查無此訂單</p>
            <%}%>
        </div>
        
    </body>
    <footer> 
        <%@include file="/WEB-INF/subviews/footer.jsp" %>
    </footer>
</html>
