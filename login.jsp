<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>會員登入 Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./style/vgb.css" type="text/css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=B612+Mono|Dancing+Script|Lobster|Marck+Script|Merienda|Permanent+Marker|Unlock|Major+Mono+Display" rel="stylesheet"> 


    </head>
    <body style="position: relative;">
        <header>
            <div class="logo">
                <a href="index.jsp"><span style="font-size: 1.4em;padding-left:10px">S.L.</span><br><span>Studio</span></a>
            </div>
        </header>
        <style>
            .logo{
                padding: 20px;
            }
            .logo a{
                color:white;              
                font:30px 'B612 Mono' ;
                text-decoration: none;
            }
            body{
                height: 80vh;
                background: linear-gradient(to bottom,#C2E3DC,white,#C2E3DC) no-repeat;
                margin-bottom:100px;
            }
            a{
                color:black;                   
            }
            a:hover{
                color:gray;
            }
            .article{
                position:absolute;
                right:35%;
                width:35%;
                height:350px;
                background:white;
                opacity: 0.5;
                border-radius: 10px;
                padding: 30px 0px;
            }
            #submit{
                font-size: 15px;
                position: absolute;
                bottom: 50px;
                left:40%;            
                text-align: center;

            }
            p input{
                border:none;
                border-bottom: 1px solid black;
            }
        </style>
        <%
            //讀取cookie
            Cookie[] allCookies = request.getCookies();
            String userIdString = "";
            String autoString = "";
            if (allCookies != null && allCookies.length > 0) {
                for (Cookie cookie : allCookies) {
                    if (cookie != null && cookie.getName().equals("userId")) {
                        userIdString = cookie.getValue();
                    }
                    if (cookie != null && cookie.getName().equals("auto")) {
                        autoString = cookie.getValue();
                    }
                }
            }

            List<String> errors = (List<String>) request.getAttribute("errors");
        %>
        <div class="article">
            <div style="text-align:center">
                <h3>會員登入 Login</h3>
            </div>     
            <form style="margin:auto; width:50%; min-width: 20em; padding-left:100px;" action="<%=request.getContextPath()%>/login.do" method="POST">
                <%= errors != null && errors.size() > 0 ? errors : ""%>
                <p>
                    <label>帳號 ID:</label><br>
                    <input name="id" type="text" placeholder="請輸入身分證號或Email" required 
                           value="${not empty param.id?param.id:cookie.userId.value}"><br>
                    <input type="checkbox" name="auto" value='ON' ${cookie.auto.value}><label><span style="font-size:13px;">記住我的帳號 Remember Me</span></label>
                </p>
                <p>
                    <label>密碼 Password:</label><br>
                    <input name="pwd" type="password" placeholder="請輸入密碼" maxlength="20" required>
                </p>
                <p>
                    <label>驗證碼 Verification Code:</label><br><input type="text" name="captcha" placeholder="請依下圖輸入密碼" required>
                </p>
                <p style="padding-left:35px">

                    <img style="padding:5px;" src="<%= request.getContextPath()%>/images/captcha.jpg" id="captchaImage">
                    <a href="javascript:refreshImage()"><span style="padding-left:10px">更新驗證碼</span></a>
                    <script>
                        function refreshImage() {
                            var date = Date.now();
                            var captchaImage = document.getElementById("captchaImage");
                            captchaImage.src = "<%= request.getContextPath()%>/images/captcha.jpg?refresh=" + date;
                        }
                    </script>
                </p>
                <input id="submit" type="submit" value="登入">
            </form>
        </div>
    </body>
        <%@include file="/WEB-INF/subviews/footer.jsp" %>   
</html>
