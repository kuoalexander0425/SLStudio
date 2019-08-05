<%-- 
    Document   : check_out
    Created on : 2018/12/7, 下午 04:03:24
    Author     : Admin
--%>

<%@page import="uuu.sls.entity.ShippingType"%>
<%@page import="uuu.sls.entity.PaymentType"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="uuu.sls.entity.Product"%>
<%@page import="uuu.sls.entity.CartItem"%>
<%@page import="uuu.sls.entity.Customer"%>
<%@page import="uuu.sls.entity.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Check Out</title>
        <jsp:include page="/WEB-INF/subviews/globle.jsp" />
    </head>
    <style>
        body{
            background-color: #f4f4f7;
        }
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
            background-color:whitesmoke;
            box-shadow: 2px 2px 5px gray;
        }
        th{
            background-color:gold;
            padding: 5px;
        }
        tfoot{
            text-align: right;
        }
        legend{
            font-weight: bold;
        }
    </style> 
    <script>
        $(document).ready(init);
        function init() {
            $("#goShopping").click(goShoppingclickHandler);
        }
        function goShoppingclickHandler() {
            location.href = "<%=request.getContextPath()%>/products_list.jsp";
        }
        function copyUser() {
            $("#addresseeName").val("${sessionScope.user.name}");
            $("#addresseePhone").val("${sessionScope.user.phone}");
            $("#addresseeEmail").val("${sessionScope.user.email}");
            if ($("#shippingType").val() === 'HOME') {
                $("#shippingAddress").val("${sessionScope.user.address}");
            }
        }

    </script>

    <body>
        <header>
            <jsp:include page="/WEB-INF/subviews/header.jsp">
                <jsp:param name="header.subtitle" value="結帳"/>
            </jsp:include>
        </header>
        <%
            ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
            if (cart != null && cart.size() > 0) {
                Customer user = (Customer) session.getAttribute("user");
                cart.setUser(user);
        %>
        <form method="POST" action="check_out.do">
            <p>${requestScope.errors}</p>
            <table>

                <thead>
                    <tr>
                        <th style="width: 20px; text-align: center;">編號</th><th>名稱</th><th style="width: 60px;">容量</th><th>價格</th><th>數量</th>
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
                        <td style="text-align:center;"><%=p.getId()%></td> 
                        <td><%=p.getName()%></td>
                        <td  style="text-align:center;"><%=item.getSize()%></td>
<!--                        <td><%--=p instanceof Outlet?((Outlet)p).getListPrice():p.getUnitPrice()--%></td>-->
<!--                        <td><%--=Product.PRICE_FORMAT.format(p instanceof Outlet?((Outlet)p).getDiscountString()):"" --%></td>-->
                        <!--<td>cart.getDiscountString(item).length()</td> -->
                        <td  style="text-align:right;"><%=cart.getPrice(item)%></td>
                        <td  style="text-align:center;"><%=cart.getQuantity(item)%></td> 

                    </tr>  
                    <%}%>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">共<%=cart.size()%>項 <%=cart.getTotalQuantity()%>件</td>
                        <td colspan="2" style="text-align: right"><b>總金額:</b>&nbsp;&nbsp; <span id="amount"><%=cart.getVIPTotalAmount()%> 元</span></td>
                    </tr>

                <script>
                    function changeHandler(pTypeSelect, shippingVal) {
                        console.log($(pTypeSelect).val());
                        var xhr = $.ajax({
                            url: "getShipppingType.jsp?pType=" + $(pTypeSelect).val()
                        }).done(changeDoneHandler);
                        if (shippingVal) {
                            xhr.shippingVal = shippingVal;
                        }
                    }

                    function changeDoneHandler(result, status, xhr) {
                        console.log(result);
                        $("#shippingType").html(result);
                        if (xhr.shippingVal) {
                            $("#shippingType").val(xhr.shippingVal);
                        }
                        getFee();
                    }
                    function getFee() {
                        var amount = parseFloat($("#amount").text());
                        var pTypeValue = $("#paymentType option:selected").text();
                        var pIndex = pTypeValue.indexOf(",");
                        var pFee = 0;
                        if ($("#paymentType").val().length > 0 && pIndex > 0) {
                            pFee = parseFloat(pTypeValue.substring(pIndex + 1, pTypeValue.length - 1));
                        }

                        var shTypeValue = $("#shippingType option:selected").text();
                        var shIndex = shTypeValue.indexOf(",");
                        var shFee = 0;
                        if ($("#shippingType").val().length > 0 && shIndex > 0) {
                            shFee = parseFloat(shTypeValue.substring(shIndex + 1, shTypeValue.length - 1));
                        }
                        console.log(pFee, shFee);
                        $("#amountWithFee").text(amount + pFee + shFee);
                    }
                    <% if (request.getParameter("paymentType") != null) {  %>
                    $(function () {
                        $("#paymentType").val('${param.paymentType}');
                        changeHandler(document, getElementById("paymentType"), '${param.shippingType}');
                        $("#ShippingAddress").val('${param.shippingAddress}');
                    });
                    <%}%>
                    var ezshipBtn = "<input type='button' id='ezship' value='選擇門市' onclick='goEzShip()'>";
                    var paymentTypeFace = "<select required name="shippingType" id="shippingType" onchange="getFee();
                                        changeAddressInput();"><%= ShippingType.SELF.name()%></select>";
                    var paymentTypeAtm = "<select required name="shippingType" id="shippingType" onchange="getFee();
                                        changeAddressInput();"><option><%= ShippingType.HOME.name()%></option>\n\
                                                  <option><%= ShippingType.STORE.name()%></option></select>";
                    var paymentTypeHome = "<select required name="shippingType" id="shippingType" onchange="getFee();
                                        changeAddressInput();"><option><%= ShippingType.HOME.name()%></option>\n\
                                                  <option><%= ShippingType.STORE.name()%></option></select>";
                    var paymentTypeStore = "<select required name="shippingType" id="shippingType" onchange="getFee();
                                        changeAddressInput();"><option><%= ShippingType.HOME.name()%></option>\n\
                                                  <option><%= ShippingType.STORE.name()%></option>\n\
                                                    <option><%= ShippingType.SELF.name()%></option></select>";
                    var paymentTypeCard = "<select required name="shippingType" id="shippingType" onchange="getFee();
                                        changeAddressInput();"><option><%= ShippingType.HOME.name()%></option>\n\
                                                  <option><%= ShippingType.STORE.name()%></option>\n\
                                                    <option><%= ShippingType.SELF.name()%></option></select>";


                    function changeShippingType() {
                        var pTypeValue = $("#paymentType").val();
                        var shTypeValue = $("#shippingType").val();

                        if (pTypeValue = "<%= PaymentType.FACE.name()%>") {
                            shTypeValue = "<%= ShippingType.SELF%>"
                        }
                    }
                    function changeAddressInput() {
                        var pTypeValue = $("#paymentType").val();
                        var shTypeValue = $("#shippingType").val();

                        $("#shippingAddress").attr("readonly", false);
                        $("#shippingAddress").attr("autocomplete", "off");
                        $("#shippingAddress").attr("list", "");
                        $("#ezship").remove();
                        $("#shippingAddress").css("width", parseInt($("#addresseePhone").css("width")));

                        if (shTypeValue == "<%= ShippingType.SELF.name()%>") {
                            $("#shippingAddress").attr("list", "storelist");
                            $("#shippingAddress").attr("placeholder", "請選擇取貨的門市");

                        } else if (shTypeValue == "<%= ShippingType.STORE.name()%>") {
                            $("#shippingAddress").attr("readonly", true);
                            $(ezshipBtn).insertAfter($("#shippingAddress"));
                        } else if (shTypeValue == "<%= ShippingType.HOME.name()%>") {
                            $("#shippingAddress").attr("autocomplete", "on");
                            $("#shippingAddress").attr("placeholder", "請輸入送貨地址");
                        }
                    }
                    function changeShippingType() {
                    
                    var pTypeValue =$("#paymentType").val();
                    
                    
                        switch (pTypeValue) {
                            case <%= PaymentType.FACE.name() %>:
                                $("div#shippingTypeContainer").remove();
                                $("div#shippingTypeContainer").html(paymentTypeFace);
                                break;
                            case <%= PaymentType.ATM.name() %>:
                                $("div#shippingTypeContainer").remove();
                                $("div#shippingTypeContainer").html(paymentTypeAtm);
                                break;
                            case <%= PaymentType.HOME.name() %>:
                                $("div#shippingTypeContainer").remove();
                                $("div#shippingTypeContainer").html(paymentTypeHome);
                                break;
                            case <%= PaymentType.STORE.name() %>:
                                $("div#shippingTypeContainer").remove();
                                $("div#shippingTypeContainer").html(paymentTypeStore);
                                break;
                            case <%= PaymentType.CARD   .name() %>:
                                $("div#shippingTypeContainer").remove();
                                $("div#shippingTypeContainer").html(paymentTypeCard);
                                break;
                                default;                             
                        }
                    }
                    function goEzShip() {
                        $("#addresseeName").val($("#addresseeName").val().trim());
                        $("#addresseeEmail").val($("#addresseeEmail").val().trim());
                        $("#addresseePhone").val($("#addresseePhone").val().trim());
                        $("#shippingAddress").val($("#shippingAddress").val().trim());
                        var protocol = "<%= request.getProtocol().toLowerCase().substring(0, request.getProtocol().indexOf("/"))%>";
                        var ipAddress = "<%= java.net.InetAddress.getLocalHost().getHostAddress()%>";
                        var url = protocol + "://" + ipAddress + ":" + location.port + "<%= request.getContextPath()%>/user/ez_ship_callback.jsp";
                        $("#rtURL").val(url);
                        $("#webPara").val($("#cartForm").serialize());

//                        alert($("#webPara").val());

                        $("#ezForm").submit();

                    }
                </script>
                <form method="post" name="simulation_from" action="http://map.ezship.com.tw/ezship_map_web.jsp" id="ezForm">
                    <input type="hidden" name="suID"  value="test@vgb.com"> <!-- 業主在 ezShip 使用的帳號, 隨便寫 -->
                    <input type="hidden" name="processID" value="VGB201804230000005"> <!-- 購物網站自行產生之訂單編號, 隨便寫 -->
                    <input type="hidden" name="stCate"  value=""> <!-- 取件門市通路代號 -->            
                    <input type="hidden" name="stCode"  value=""> <!-- 取件門市代號 -->            
                    <input type="hidden" name="rtURL" id="rtURL" value=""><!-- 回傳路徑及程式名稱 -->
                    <input type="hidden" id="webPara" name="webPara" value=""><!-- 網站所需額外判別資料。ezShip 將原值回傳，供網站判別用 -->
                </form>          
                <tr>
                    <td colspan="5">
                        <span style="width:47%;float:left;text-align: left;" >
                            <label>付款方式:</label>
                            <select required name="paymentType" id="paymentType" onchange="changeHandler(this);changeShippingType();">
                                <option value="">請選擇</option>
                                <% for (PaymentType pType : PaymentType.values()) {%>
                                <option value="<%= pType.name()%>"><%= pType%></option>
                                <%}%>
                            </select>
                        </span>
                        <span style="width:47%;float:left;text-align: left;">
                            <label>貨運方式:</label>
                            <div id="shippingTypeContainer">
                                <select required name="shippingType" id="shippingType" onchange="getFee();
                                        changeAddressInput();">
                                    <option value="">請選擇</option>
                                    <%
                                        for (ShippingType shType : ShippingType.values()) {
                                            
                                    %>
                                    <option value="<%= shType.name()%>"><%= shType%></option>
                                    <%}%>
                                </select>
                            </div>
                        </span>
                        <span style="float:right;">含手續費:共<span id="amountWithFee"><%=cart.getVIPTotalAmount()%></span></span>
                    </td>                    
                </tr>
                <tr>
                    <td colspan="5">
                        <fieldset style="float:left;width:auto" id="userFieldSet">
                            <legend>訂貨人</legend>
                            <label>姓名:</label>
                            <input value="${sessionScope.user.name}" readonly><br>
                            <label>電話:</label>
                            <input value="${sessionScope.user.phone}" readonly><br>
                            <label>地址:</label>
                            <input value="${sessionScope.user.address}" readonly><br>
                            <label>Email:</label>
                            <input value="${sessionScope.user.email}" readonly><br>
                        </fieldset>
                        <fieldset id="addresseeFieldSet" style="float:right;width:auto">
                            <legend>收件人<input type="checkbox" onclick="copyUser()">同訂貨人</legend>
                            <label>姓名:</label>
                            <input value="${param.addresseeName}" required id="addresseeName" name="addresseeName"><br>
                            <label>電話:</label>
                            <input value="${param.addresseePhone}"required id="addresseePhone" name="addresseePhone"><br>
                            <label>Email:</label>
                            <input value="${param.addresseeEmail}" required id="addresseeEmail" name="addresseeEmail"><br>
                            <label>地址:</label>
                            <input value="${param.shippingAddress}" required id="shippingAddress" name="shippingAddress"><br>
                            <datalist id="storelist">
                                <option value="台北市松山區虎林街68號">永春門市</option>
                                <option value="台中市北區館前路1號">科博門市</option>
                                <option value="台南市北區北門路二段60號">府城門市</option>
                                <option value="高雄市皇宮路99號1樓">宮廷門市</option>                                
                            </datalist>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="button" value="繼續購物" id="goShopping"></td>
                    <td colspan="3"><input type="submit" value="確定結帳" onclick="checkOut()"></td>

                </tr>
                </tfoot>
            </table>
        </form>
        <%} else {%>
        <p>購物車是空的,請回到<a href="<%=request.getContextPath()%>/products_list.jsp">產品區</a>繼續瀏覽選購.</p>
        <%}%>
    </body>
</html>
