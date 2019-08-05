<%-- 
   Document   : product
   Created on : 2018/12/6, 下午 05:59:19
   Author     : Admin
--%>

<%@page import="uuu.sls.model.ProductService"%>
<%@page import="uuu.sls.entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>產品介紹</title>
        <script>
            function addCart() {
                //同步請求submite
                //            $("#cartForm").submit();
                //            alert($("#cartForm").attr("action"));
                //            alert($("#cartForm").attr("method"));
                //非同步請求
                if (validateCartForm()) {
                    $.ajax({
                        url: $("#cartForm").attr("action"),
                        method: $("#cartForm").attr("method"),
                        data: $("#cartForm").serialize()
                    }).done(addCartDoneHandler);

                }
            }

            function validateCartForm() {
                //數量檢查
                //alert($("#cartForm>input[name='quantity']").attr("min");
                var min = window.parseInt($("#cartForm>input[name='quantity']").attr("min"));
                var max = window.parseInt($("#cartForm>input[name='quantity']").attr("max"));
                var quantity = parseInt($("#cartForm>input[name='quantity']").val());
                console.log(typeof min, typeof max, typeof quantity);
                if (quantity < min) {
                    alert("數量不得小於" + min);
                    return false;
                } else if (quantity > max) {
                    alert("數量不得大於" + max);
                    return false;
                }
                //規格檢查
                console.log($("#size"), document.getElementById("size"));
                if ($("#size").val.length === 0) {
                    alert("請選擇規格!");
                    return false;
                }
                //顏色檢查
//                if(color){
//                    alert($(#cartForm select[name='color']).val());
//                    if($(#cartForm select[name='color']).val()){
//                        return false;
//                    }
//                }
                return true;
                //可以一起檢查後再警示
            }

            function addCartDoneHandler(result) {
                console.log(result);
                $("#cartSize").html(result);
                $.fancybox.close();
            }
            function selectSize(sizeDiv) {
                $(".sizeDiv").removeClass("selected");
                $(sizeDiv).addClass("selected");
                $("#size").val($(sizeDiv).text());
                var text = $("#size option[value='" + $(sizeDiv).text() + "']").text();
                $("#price").text(text);
            }
        </script>
        <style>
            .selected{
                background-color: black;
                color: white;
                transition: 0.5s;
            }
        </style>
    </head>  
    <body>   
        <%
            String ajax = request.getParameter("ajax");
            if (!("true".equals(ajax))) {
        %>
        <jsp:include page="/WEB-INF/subviews/header.jsp"/>    
        <%}%>
        <div class="article">
            <%
                String productId = request.getParameter("productId");
                Product p = null;
                if (productId != null && productId.matches("\\d+")) {
                    ProductService service = new ProductService();
                    p = service.getProductById(productId);
                }
                if (p != null) {
            %>

            <div style="width:100%;min-width: 450px">
                <img src="<%=p.getPhotoURL()%>" 
                     style="float: left;width: 45%;max-width: 350px">
                <div style="float: left;width: 50%;min-width: 450px">
                    <h3><%= p.getName()%></h3>
                    <div>                                                        

                        <p><span style="font-size: 1.1em;color: gray;">產品介紹:</span><br><%=p.getDescription()%></p>
                        <form method="POST" action="add_cart.do" id="cartForm">
                            <input type="hidden" name="productId" value="<%=p.getId()%>"/>
                            <label>數量:</label><input type="number" name="quantity" min="1" max="<%=p.getStock()%>" value="1" style="text-align: center;width:60px">
                            <p>庫存: <%= p.getStock()%> 個</p>
                            <div id="price" ></div>
                            <p>廠牌: <%=p.getBrandName()%></p>
                            <label>容量:</label>           
                            <%
                                for (int size : p.getSizeSet()) {
                            %>
                            <div class="sizeDiv" style="display:inline-block;border:2px solid gray;padding: 3px;
                                 cursor: pointer; width: 55px;height: 28px;text-align: center" onclick="selectSize(this)" required><%=size%></div>
                            <%}%>

                            <select required name="size" id="size" style="display:none">
                                <option>請選擇容量</option>
                                <% if (p.mapSize() > 0) {
                                        for (int size : p.getSizeSet()) {
                                %>                                                                
                                <option value="<%= size%>">
                                    $<%= p.getPrice(size)%></option>
                                    <%}
                                        }%>
                            </select>
                            
                            <a onclick="myFunction()" href="javascript:addCart()">
                                <img title="加入購物車" style="width:50px;height: 50px;" src="<%=request.getContextPath()%>/images/icon_shopping_cart.png"></a><br>
                        
                        </form>
                    </div>
                </div>                
                <div style="clear: both;width:85%;margin: auto">                     

                </div>
            </div>
            <%} else {%>
            <p>查無此產品</p>
            <%}%>
        </div>
    </body>
</html>
