<%-- 
    Document   : cart
    Created on : 2018/12/13, 下午 04:25:22
    Author     : Admin
--%>

<%@page import="uuu.sls.entity.Customer"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="uuu.sls.entity.Outlet"%>
<%@page import="uuu.sls.entity.Product"%>
<%@page import="uuu.sls.entity.CartItem"%>
<%@page import="uuu.sls.entity.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <%@include file="../WEB-INF/subviews/globle.jsp"%></a>

    <title>購物車</title>
    <style>
        table{
            margin-left: auto;
            margin-right: auto;
        }
        td{
            padding: 5px 20px;
        }
        table,td,th,tfoor{
            border: 1px solid silver;
            border-collapse: collapse;
            box-shadow: 2px 1px 2px gray;

        }
        table{
            background-color: #f4e9dc;
            box-shadow: 2px 2px 5px gray;
        }
        th{
            background-color:gold;
            padding: 5px;
        }
        tfoot{
            text-align: right;
        }
        caption{
            font-size: 25px;
            padding:5px;
        }
        legend{
            font-weight: bold;
        }
    </style> 
    <script>
        $(document).ready(init);
        function init(){
            $("#goShopping").click(goShoppingclickHandler);
        }
        function goShoppingclickHandler(){
           location.href="<%=request.getContextPath()%>/products_list.jsp";
        }
        
        function checkOut(){
            location.href="<%=request.getContextPath()%>/user/check_out.jsp";
        }
    </script>

</head>

<body>
    <jsp:include page="/WEB-INF/subviews/header.jsp">
        <jsp:param name="header.subtitle" value="購物車"/>
    </jsp:include>
    <div class="article">

        <%
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart != null && cart.size() > 0) {
                Customer user = (Customer)session.getAttribute("user");
                cart.setUser(user);
        %>
        <form method="POST" action="update_cart.do"><!--/user/update_cart.do-->
            <table>
               
                <thead>
                    <tr>
                        <th style="width: 20px; text-align: center;">id</th><th>名稱</th><th>容量</th><th>價格</th><th>數量</th><th>刪除</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (CartItem item : cart.getCartItemSet()) {
                            Product p = item.getProduct();
                            NumberFormat priceFormat = NumberFormat.getNumberInstance();
                            priceFormat.setMinimumFractionDigits(0);
                            priceFormat.setMaximumFractionDigits(2);
                    %>
                    <tr>
                        <td><%=p.getId()%></td> 
                        <td><%=p.getName()%></td>
                        <td><%=item.getSize() %></td>
<!--                        <td><%--=p instanceof Outlet?((Outlet)p).getListPrice():p.getUnitPrice()--%></td>-->
<!--                        <td><%--=Product.PRICE_FORMAT.format(p instanceof Outlet?((Outlet)p).getDiscountString()):"" --%></td>-->
                        <!--<td>cart.getDiscountString(item).length()</td> -->
                        <td><%=cart.getPrice(item)%></td>
                        <td><input style="width:50px" type="number" value="<%=cart.getQuantity(item)%>" 
                                   name="quantity_<%=p.getId()%>"</td>
                        <td><input type="checkbox" name="delete_<%=p.getId()%>"></td>
                    </tr>  
                    <%}%>
                </tbody>
                <tfoot>
                    <tr>
                <td colspan="4">共<%=cart.size() %>項 <%=cart.getTotalQuantity() %></td>
                <td colspan="2" style="text-align: right">總金額:&nbsp;&nbsp; <%=cart.getTotalAmount() %> 元</span></td>
                    </tr>
                    <tr>
                        <td colspan="3"><input type="button" value="繼續購物" id="goShopping"></td>
                        <td colspan="3"><input type="submit" value="修改購物車" name="ok">
                        <input type="submit" value="結帳" onclick="checkOut()" name="ok"></td>
                   
                    </tr>
                </tfoot>
            </table>
               
                
               
        </form>
        <%} else {%>
        <p>購物車是空的,請回到<a href="<%=request.getContextPath()%>/products_list.jsp">產品區</a>繼續瀏覽選購.</p>
        <%}%>
    </div>
    <%@include file="/WEB-INF/subviews/footer.jsp" %>
</body>
</html>
