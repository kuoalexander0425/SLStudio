<%@page import="uuu.sls.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="../../css/vgb.css" rel="stylesheet" type="text/css"/>
<link href="../../css/header.css" rel="stylesheet" type="text/css"/>
<link href="style/animate.css" rel="stylesheet" type="text/css"/>
<link href="https://fonts.googleapis.com/css?family=B612+Mono|Dancing+Script|Lobster|Marck+Script|Merienda|Permanent+Marker|Unlock|Major+Mono+Display" rel="stylesheet"> 

</head>
<style>
   
    *{
        text-decoration: none;   
        font-family: "Microsoft YaHei";
    }

    .nav a{
        padding-right: 15px;
        padding-left: 25px;
        color:black;        
    }
    .nav a:hover{
        transition:0.8s;
        opacity: 0.6;     
        color:#385098;    
    }
    .nav{
        padding-top: 5px;
        background: linear-gradient(to right,white 1%,#C2E3DC 20%,white 70%);
        opacity: 0.8;
    }
</style>

    <%
        Customer user = (Customer) session.getAttribute("user");
    %>
    <div class="logo" style="padding:20px;">
        <a href="<%=request.getContextPath() %>/index.jsp"><span style="padding-left:15px;font:35px 'B612 Mono';color:black;">S.L.</span><br><span style="font:30px 'B612 Mono';color:black;">Studio</span></a>
    </div>
    <span style="position:absolute;top:0;right:0;font-weight:bold;float: right;font-size: 20px;">${sessionScope.user.name}  您好!!</span>
    <div style="position:relative;float:right;">
        <form action="<%= request.getContextPath()%>/products_list.jsp" method="GET">
            <input name="search" type="search" placeholder="請輸入部分產品名稱...">
            <button>搜尋</button>
        </form>            
    </div>

    <div style="clear:both" class="nav">

        <% if (user == null) {%>
        <a style=" padding-left: 55px;"href="<%= request.getContextPath()%>/register.jsp">會員註冊</a> 
        <a href="<%= request.getContextPath()%>/login.jsp">會員登入</a> 
        <%} else {%>
        <a href="<%= request.getContextPath()%>/user/update.jsp">會員修改</a> 
        <a href="<%= request.getContextPath()%>/user/orders_history.jsp">查詢歷史訂單</a> 
        <a href="<%= request.getContextPath()%>/logout.do">會員登出</a>                       
        <%}%>
        <a href="<%= request.getContextPath()%>/products_list.jsp">產品清單</a> 
        <a href="<%= request.getContextPath()%>/user/cart.jsp">購物車<span id="cartSize">-${sessionScope.cart.totalQuantity}-</span></a> 
        <hr>
    </div>