<%@page import="uuu.sls.entity.Customer"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta name="view port" content="width=device-width,initial-scale=1.0">
        <meta charset="UTF-8">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"
                integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
        crossorigin="anonymous"></script>
        <script type="text/javascript" src="../jquery.js"></script>
        <link href="css/header.css" type="text/css" rel="stylesheet">
        <link href="css/footer.css" type="text/css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=B612+Mono|Dancing+Script|Lobster|Marck+Script|Merienda|Permanent+Marker|Unlock|Major+Mono+Display" rel="stylesheet"> 
        <title>S.L.Studio</title>

        <script>
            var geo;
            $(document).ready(init);

            function init() {
                $("#small_icon").click(clickHandler);
                $("#menuPriceTable").hover(priceBarHandler);
                $(".cut").hover(cutPriceHandler);
                $("#perm").hover(permPriceHandler);
                $("#color").hover(colorPriceHandler);
                $("#tattoo").hover(tattooPriceHandler);
                $("#wash").hover(stylePriceHandler);
                $("#treatment").hover(treatmentPriceHandler);

            }



            function clickHandler() {
                $("#sidebar").fadeToggle(300);
                $(".bottom").toggleClass('rotatedup');
                $(".top").toggleClass('rotateddown');
                $(".mid").fadeToggle("slow");
                $("#sidebar_background").toggleClass("backgroundcolorchange");
                $("footer").fadeToggle("slow");
            }



            function priceBarHandler() {
                $("#priceBar").fadeToggle("slow");
            }
            function cutPriceHandler() {
                $("#cutPrice").fadeToggle("slow");
            }
            function permPriceHandler() {
                $("#permPrice").fadeToggle("slow");
            }

            function colorPriceHandler() {
                $("#colorPrice").fadeToggle("slow");
            }
            function tattooPriceHandler() {
                $("#tattooPrice").fadeToggle("slow");
            }
            function stylePricseHandler() {
                $("#stylePrice").fadeToggle("slow");
            }
            function treatmentPriceHandler() {
                $("#treatmentPrice").fadeToggle("slow");
            }

        </script>
        <style>
            body {
                margin: 0;
            }


        </style>
    </head>
    <body>
        <div id="sidebar_background"></div>
        <header>
            <div class="logo">
                <a class="hov" id="topLogo" href="index.jsp"><span style="font-size: 1.4em">S.L.</span><br><span style="padding-left:10px">Studio</span></a>
            </div>   
            <span style="padding:50px 40px;position: absolute;">客戶 <b>${sessionScope.user.name}</b> 您好!!</span> 
            <div id="small_icon">
                <div class="top"></div>
                <div class="mid"></div>
                <div class="bottom"></div>
            </div>  
            <nav id="sidebar">
                <div>
                    <p><a id="aboutUs" href="#sec02"><span>About Us</span><br><span id="about">關於我們</span></br></a></p>
                    <p><a id="news" href="#newsSec"><span>News</span><br>最新消息</a></p>
                    <p><a id="product" href="products_list.jsp"><span>Products</span><br>產品</a></p>
                    <p><a id="appointment" href=""><span>Appointments</span><br>線上預約</a></p>

                    <p><a id="portfolio" href=""><span>Portfolio</span><br>作品集</a></p>
                    <p><a id="services" href="#sec03"><span>Services</span><br>服務項目</a></p>
                    <p><a id="contacts" href="#sec04"><span>Contacts</span><br>聯絡方式</a></p>
                   
                </div>
            </nav>
        </header>
        <style>
            #slider_container div{
                -webkit-animation: round 30s linear infinite;
                animation: round 30s linear infinite;              
            }
            #slider_container img{
                animation: scalemove 30s linear infinite;

            }
            #slider_hairImages div{
                -webkit-animation: moveToRight 30s linear infinite;
                animation: moveToRight 30s linear infinite;              
            }
            #slider_hairImages img{
                animation: fadeOut 30s linear infinite;            
            }
            #locationLogo{
                animation: blurIn 3s linear 1;
            }
            #movingTitle .title1{                                         
                animation: fadeIn1 9.5s linear 1; 

            }
            #movingTitle .title2{                                      
                animation: fadeIn 12s linear 1;     

            }
            #movingTitleLast{                                      
                animation: fadeInLast 10s linear 1;     

            }
            @-webkit-keyframes fadeIn1 {
                0%,30% {
                    opacity: 0;                     
                    animation-delay: 3s;      
                }
                100%{
                    opacity: 1;                  
                    visibility: visible;                                       
                }
            }
            @-webkit-keyframes fadeInLast {
                0%,60% {
                    opacity: 0;                     

                }

                100%{
                    opacity: 1;

                }

            }
            @-webkit-keyframes fadeIn {
                0%,30% {
                    opacity: 0;
                    top: 150px;
                    left: 300px;
                }
                80%{
                    opacity: 1;
                    top: 150px;
                    left: 300px;
                }
                81%,99%{
                    visibility: hidden;
                }
                100%{
                    opacity: 1;                   
                    visibility: visible;
                }
            }

            @-webkit-keyframes blurIn {
                0% {
                    opacity: 0;
                    filter:blur(5px);
                }
                100% {
                    opacity: 1;
                    filter:blur(0px);
                }
            }

            @-webkit-keyframes scalemove {
                0% {
                    transform: scale(1);
                    -webkit-transform: scale(1); 

                }
                100% {
                    transform: scale(1.3);
                    -webkit-transform: scale(1.3);

                }
            }


            @-webkit-keyframes round {
                4% {
                    opacity: 1;
                    filter: alpha(opacity=100);

                }
                24% {
                    opacity: 0.5;
                    filter: alpha(opacity=50);

                }
                30% {
                    opacity: 0;
                    filter: alpha(opacity=0);

                }
            }
            @keyframes round {
                4% {
                    opacity: 1;
                    filter: alpha(opacity=100);
                    /* 0 - 1秒 淡入*/
                }
                20% {
                    opacity: 0.5;
                    filter: alpha(opacity=50);
                    /* 1- 5秒靜止*/
                }
                24% {
                    opacity: 0;
                    filter: alpha(opacity=0);
                    /* 5-6秒淡出*/

                }
            }

            @-webkit-keyframes moveToRight {
                6% {
                    opacity: 1;
                    filter: alpha(opacity=100);
                }

                30% {
                    opacity: 0;
                    filter: alpha(opacity=0);

                }
            }
        </style>
        <main>
            <div>
                <section id="sec01">                    
                    <div style="position: absolute;top:100px;left:40px;">
                        <% 
                            Customer user = (Customer)session.getAttribute("user");
                            if (user == null) {%>
                            
                            <a href="<%= request.getContextPath()%>/register.jsp">會員註冊<br>Sign Up</a><br><br>
                            
                            <a href="<%= request.getContextPath()%>/login.jsp">會員登入<br>Login</a><br><br>
                        <%} else {%>
                            <a href="<%= request.getContextPath()%>/user/update.jsp">會員修改<br>Update</a><br><br>
                            <a href="<%= request.getContextPath()%>/user/orders_history.jsp">查詢歷史訂單<br>History</a><br><br>
                            <a href="<%= request.getContextPath()%>/logout.do">會員登出<br>Log Out</a><br><br>            
                        <%}%>
                            <a href="<%= request.getContextPath()%>/products_list.jsp">產品清單<br>Products</a><br><br>
                            <a href="<%= request.getContextPath()%>/user/cart.jsp">購物車<br>Shopping Cart<span id="cartSize">-${sessionScope.cart.totalQuantity}-</span></a> 
                    </div>
                    <div id="movingTitle">
                        <span class="title1">S.</span>
                        <span class="title2">L.</span>
                        <!--<span class="title3">Studio</span>-->
                    </div>
                    <div id="movingTitleLast">
                        <span class="titleLast1">S.</span>
                        <span class="titleLast2">L.</span>
                        <!--<span class="title3">Studio</span>-->
                    </div>
                    <div id="locationLogo">
                        <span>Ximen</span>
                        <p style="text-align: center;">/</p>
                        <p style="clear:right;">Hair Salon</p>
                        <p >Innovation-</p>
                        <p>-Attitude</p>                     
                    </div>
                    <div id="slider_container">
                        <div><img src="css/image/image2.jpg"/></div>
                        <div><img src="css/image/image4.jpg"/></div>
                        <div><img src="css/image/image5.jpg"/></div>
                        <div><img src="css/image/image6.jpg"/></div>
                        <div><img src="css/image/image8.jpg"/></div>
                    </div>

                    <style>
                        #menuPrice{
                            z-index: 3;
                            font-family: 'Lobster', cursive;
                            font-size:40px;
                            position: relative;
                            top:25%;
                            left:50%;
                        }
                        #menuPriceTable{
                            position: relative;
                            top:25%;
                            left:40%;
                        }
                        table{
                            z-index: 3;
                            font-family: Microsoft YaHei;
                            font-size: 20px;                           
                            padding: 10px;
                            border-spacing: 10px;                        
                        }
                        th{
                            text-align: left;
                            padding:10px 20px;
                            letter-spacing: 1px;
                        }
                        th span{
                            padding-right: 20px;
                        }
                        th:hover{

                        }
                        #menuPriceTableSmall{
                            position: relative;
                            opacity: 0;
                            left:60%;                
                            font: 20px Microsoft YaHei;
                            font-weight: bold;                           
                            padding: 10px;
                            border-spacing: 10px;
                            z-index: 5;
                        }
                        @media only screen and (max-width: 700px){                        
                            #menuPriceTableSmall{
                                position: relative;
                                opacity: 1;
                                left:60%;                
                                font: 20px Microsoft YaHei;
                                font-weight: bold;                           
                                padding: 10px;
                                border-spacing: 10px;
                                z-index: 5;
                            }
                            #menuPriceTable{
                                -webkit-transition: 0.5s;
                                transition: 0.5s;
                                opacity: 0;
                            }
                            footer,#intro,#contactInfo{
                                opacity: 0;
                                transition: 0.5s;
                            }


                        }
                        #menuBg img{
                            width:600px;
                            height: 400px;
                            position: absolute;
                            opacity: 0.5;  
                            z-index: 2;
                        }
                        #square{
                            border-radius: 10px;
                            width: 430px;
                            height: 500px;
                            opacity: 0.3; 
                            background-color: black;
                            position: absolute;
                            left: 300px;
                            top:-30px;
                            padding:30px;
                        }

                        #menuPriceTable:hover{
                            cursor: pointer;
                            /*opacity: 0.5;*/
                            -webkit-transition: 0.6s;
                            transition: 0.6s;
                        }
                    </style>
                    <!--<div id="movinglogo">S.L.</div>-->
                    <!--<canvas id="myCanvas" width="400" height="500" style="position:absolute;top:260px;left:100px;color:black; z-index: 5000; border: 1px solid black;"></canvas>-->
                </section>
                <section id="sec02">
                    <div id="aboutUsSection">
                        <img src="css/image/aboutusbackg.jpg"/>
                        <img id="stylist01" src="css/image/sammi.jpg">
                        <div id="intro">
                            <span style="top:-50px">Stylist: </span>
                            <p style="font:24px Merienda">Sammi</p>
                            <p style="position:absolute;width: 800px">&nbsp;&nbsp;&nbsp; 資歷超過20年的美髮設計師,精通各種精湛的美髮技巧.<br>
                                <br>在已經扎實的技術之外仍不斷的進修.就是要追求設計出更完美的髮型.<br>
                                除了自身軟體持續的進步,在工作室的硬體也十分計較.<br>
                                只為了客人覺得在賓至如歸之中仍感到像回到家中般的親切與舒適.
                            </p>
                        </div>
                    </div>                   
            </div>
            <div id="newsSec">
                <div>
                    <p>
                    <h1>夏日大作戰 Summer Time!!!</h1>
                    <p>在這個炎炎的夏日，你(妳)的頭皮是否因換季而油脂堵塞毛囊呢?<br>
                        你(妳)的秀髮有沒有受紫外線的荼毒而想‘枯’呢?<br>
                        現在!! 為了拯救這些問題，我們特別推出護理組合～<br>
                        只要選擇<span class="impt">頭皮護理</span>的項目外加購<span class="impt">頭皮系列洗髮精</span><br>或<span class="impt">活髮系列</span>加購<span class="impt">護髮素</span>都會
                        有高達<span style="color:red; opacity: 0.8; font-size: 20px;">八折</span>的折扣哦!! <br>事不宜遲，做下去就對了!!    
                    </p>
                    </p>
                </div>
                <!--<img src="css/image/newsbg.png">-->
            </div>
        </section>
        <section id="sec03">
            <div id="menuPrice">Menu & Price</div>
            <div id="menuBg">
                <img src="css/image/menuPriceBg.jpg">
                <div class="square"></div>

            </div>
            <table id="menuPriceTable">

                <tr>
                    <th class="cut">剪&nbsp;&nbsp;<span>HairCut</span></th>
                    <th id="color">染&nbsp;&nbsp;<span>Color</span></th>                                  
                </tr>
                <tr>
                    <th id="perm">燙&nbsp;&nbsp;<span>Perm</span></th>
                    <th id="treatment">護&nbsp;&nbsp;<span>Treatment</span></th>
                </tr>
                <tr>
                    <th id="tattoo">霧&nbsp;&nbsp;<span>Tattoo</span></th>
                    <th id="wash">洗&nbsp;&nbsp;<span>Style</span></th>
                </tr>
            </table>
            <div id="priceBar"></div>
            <div id="priceBarSet">
                <div id="cutPrice">
                    <p>剪髮 1200</p>
                </div>
                <div id="colorPrice">
                    <p>基本染髮 1200</p>
                    <p>挑染 2500</p>
                    <p>褪色 2500</p>
                    <p>手刷染 3000</p>
                    <p>漸層染髮 3000</p>
                </div>
                <div id="permPrice">
                    <p>燙直 5000</p>
                    <p>冷燙 2500</p>
                    <p>溫朔燙 5000</p>
                    <p>局部燙 800</p>
                </div>
                <div id="treatmentPrice">
                    <p>頭皮護理 2000</p>
                    <p>活髮系列 1800</p>
                    <p>亮光護髮 2200</p>
                    <p>髮質還原 4500</p>
                </div>
                <div id="tattooPrice">
                    <p>飄眉 12000</p>
                </div>
                <div id="stylePrice">
                    <p>造型 1000</p>
                </div>
            </div>
            <div id="menuPriceTableSmall">
                <p class="cut">剪&nbsp;&nbsp;<span>HairCut</span></p>
                <p>染&nbsp;&nbsp;<span>Color</span></p>
                <p>燙&nbsp;&nbsp;<span>Perm</span></p>
                <p>護&nbsp;&nbsp;<span>Treatment</span></p>
                <p>霧&nbsp;&nbsp;<span>Tattoo</span></p>
                <p>洗&nbsp;&nbsp;<span>Style</span></p>
            </div>
            <div id="eyebrows">             
                <img src="css/image/EYEBROW.gif" alt=""/>
            </div>
           

        </section>
        <section id="sec04">
            <iframe id="map" width='400' height='400' frameborder='0' scrolling='no' marginheight='0' marginwidth='0' 
                    src='https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=台北市漢中街133號8樓&z=16&output=embed&t='></iframe>
            <div id="contactInfo">
                <p><b>聯絡資訊 Contact Information:</b></p>
                <p>聯絡電話: (02)23880885</p>
                <p>店家地址: 台北市萬華區漢中街133號8樓</p>
                <p>營業時間: 週二到週六 11:00~20:00(有變更會發布在最新消息,FB,IG)</p><br><br><br>
            </div>
            <div>
                <a href="" id="ig"><img src="css/image/ic-ig.png"></a>
            </div>

        </section>
    </div>
</main>
<footer class="content">
    <span><b>版權所有 &COPY; S.L. Hair Studio 艾思爾髮型</b></span><br>
    <span>拜訪人次： <b><%= application.getAttribute("app.visitors.counter")%></b> 您是第 <b><%= session.getAttribute("app.visitors.counter")%></b> 位訪客</span>
</footer>
</body>

</html>