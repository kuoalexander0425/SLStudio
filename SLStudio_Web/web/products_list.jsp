<%-- 
    Document   : products_list
    Created on : 2018/12/3, 下午 05:10:29
    Author     : Admin
--%>

<%@page import="uuu.sls.entity.Customer"%>
<%@page import="uuu.sls.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="uuu.sls.model.ProductService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>產品清單</title>
        <%@include file="/WEB-INF/subviews/globle.jsp" %>
        <style>

            li{display:inline-block; width: 250px;background:white; box-shadow:2px 1px 2px gray; padding: 5px 3px}
            li:hover{transition: 0.8s;  transform: scale(1.2);box-shadow:  gray 2px 1px 7px,gray 2px 2px 2px,gray 1px 1px 1px;}
            img{width: 250px; height: 250px; }
            #backtotop{
                font-family: Arial;
                position: fixed;
                right:0px;
                top:30%;
                background:linear-gradient(to bottom,#C2E3DC,white) ;
                padding:3px;
                text-align: center;   
                border-radius: 8px 0px 0px 8px;
                color:black;
            }
            #backtotop:hover{color: white;transition:0.2s;  }
            #snackbar {
                visibility: hidden; 
                min-width: 250px;
                background-color: black;
                color: #fff;
                text-align: center;
                border-radius: 4px;
                padding: 16px;
                position: fixed;
                left:40%;
                z-index: 100;
                top:150px;
            }
            #snackbar.show {
                visibility: visible;
                -webkit-animation: fadein 1s, fadeout 1s 2.5s;
                animation: fadein 1s, fadeout 1s 2.5s;
            }
            /* Animations to fade the snackbar in and out */
            @-webkit-keyframes fadein {
                from {top: 0; opacity: 0;} 
                to {top: 150px; opacity: 1;}
            }
            @keyframes fadein {
                from {top: 0; opacity: 0;}
                to {top: 150px; opacity: 1;}
            }
            @-webkit-keyframes fadeout {
                from {top: 150px; opacity: 1;} 
                to {top: 0; opacity: 0;}
            }
            @keyframes fadeout {
                from {top: 150px; opacity: 1;}
                to {top: 0; opacity: 0;}
            }
        </style>
        <script>
            function getProduct(pid) {
                //同步請求
                // alert();
                //             location.href="product.jsp?productId="+pid;
                //非同步請求
                $.ajax({
                    url: "product.jsp?productId=" + pid
                }).done(getProductCallBackHandler);
            }
            function getProductCallBackHandler(result) {
                $("#productDetail").html(result);
                $.fancybox.open({
                    src: "#productDetail"
                })
            }
            function myFunction() {
                // Get the snackbar DIV
                var x = document.getElementById("snackbar");
                // Add the "show" class to DIV
                x.className = "show";
                // After 3 seconds, remove the show class from DIV
                setTimeout(function () {
                    x.className = x.className.replace("show", "");
                }, 3000);
            }
            $("#backtotop").click(function () {
                $("div").scrollTop(0);
            });
        </script>        
    </head>
    <%
        String ajax = request.getParameter("ajax");
        if (!("true".equals(ajax))) {
    %>
    <header>       
        <jsp:include page="/WEB-INF/subviews/header.jsp"/>
    </header>    
    <%}%>
    <body>   
        <a href=""><div id="backtotop">
                <p>B</p>
                <p>a</p>
                <p>c</p>
                <p>k</p>
                <p>&nbsp;</p>
                <p>T</p>
                <p>o</p>
                <p>&nbsp;</p>
                <p>T</p>
                <p>o</p>
                <p>p</p>
                <p>!</p>
            </div></a>   
        <div class="article" style="clear:both">

            <%                //request.setCharacterEncoding("UTF-8");
                String search = request.getParameter("search");
                ProductService service = new ProductService();
                List<Product> list;
                if (search == null || search.length() == 0) {
                    list = service.getAllProducts();
                } else {
                    list = service.getProductsByName(search);
                }
            %>
            <ul>
                <%
                    if (list != null && list.size() > 0) {
//                        for (int i = 0; i < list.size(); i++) {
//                            Product p = list.get(i);

                        for (Product p : list) {

                %>
                <li class="productItem">
                    <a href="javascript:getProduct(<%= p.getId()%>)">
                        <img src="<%=p.getPhotoURL()%>" title="產品介紹:<%=p.getDescription()%>"></a>
                    <h3 style="text-align: center"><%=p.getName()%></h3>  
                </li>               
                <% } %>
                <%} else {%>
                <p>查無產品</p>
                <%}%>
            </ul>
        </div>
        <div id="productDetail">
        </div>
            
        <div id="snackbar">成功加入購物車</div>
        
    </body>
</html>
