<%@page import="java.util.List"%>
<%@page import="uuu.sls.entity.BloodType"%>
<%@page import="uuu.sls.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>會員註冊</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./style/vgb.css" type="text/css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=B612+Mono|Dancing+Script|Lobster|Marck+Script|Merienda|Permanent+Marker|Unlock|Major+Mono+Display" rel="stylesheet"> 

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
                height: 100vh;
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
                width:750px;
                height:400px;
                background:white;
                opacity: 0.5;
                border-radius: 10px;
                padding: 30px 0px;
                left:20%;
               
            }
            #submit{
                position: absolute;
                font-size: 15px;
                bottom:-350px;
                                   
            }
            p input{
                border:none;
                border-bottom: 1px solid black;
            }
            #group1{position: relative;
                float:left;
            }
             #group2{
                 position: absolute;
                 left:300px;
                 width: 200px;
            
            }
        </style>
    </head>
    <body>

        <header>
            <div class="logo">
                <a href="index.jsp"><span  style="font-size: 1.4em;padding-left:10px">S.L.</span><br><span>Studio</span></a>
            </div>
        </header>
    </div>
    <div class="article">
        <%
            //List<String> errors = (List<String>)request.getAttribute("errors");
%>
        <div style="text-align:center">
            <h3>會員註冊 Sign Up</h3>
        </div>     
        <form style="margin:10px 100px; width:50%; min-width:20em; position:relative" action="register.do" method="POST" >
            ${requestScope.errors}
            <div id="group1">
                <p>
                    <label>帳號 ID:</label> <br><input name="id" type="text"
                                              placeholder="請輸入身分證號" pattern="[A-Z][12]\d{8}" required
                                              value="${param.id}">
                </p>
                <p>
                    <label>密碼 Password:</label><br> <input name="pwd1" type="password"
                                              placeholder="請輸入密碼" maxlength="20" required>
                </p>
                <p>
                    <label>確認密碼 Comfirm Password:</label><br> <input name="pwd2" type="password"
                                                placeholder="請再輸入確認密碼" maxlength="20" required>
                </p>
                <p>
                    <label>姓名 Name:</label><br> <input name="name" type="text"
                                              placeholder="請輸入姓名" required
                                              value="<%=request.getParameter("name") == null ? "" : request.getParameter("name")%>">
                </p>
                <p>
                    <label>性別 Gender:</label> <br><input id="male" name="gender" type="radio"
                                              required
                                              value="<%= Customer.MALE%>" <%=request.getParameter("gender") != null
                                                  && request.getParameter("gender").charAt(0) == Customer.MALE ? "checked" : ""%>><label
                                              for="male">男</label> <input id="female" name="gender" type="radio"
                                              required 
                                              value="<%= Customer.FEMALE%>" <%=request.getParameter("gender") != null
                                                  && request.getParameter("gender").charAt(0) == Customer.FEMALE ? "checked" : ""%>><label
                                              for="female">女</label>
                </p>
            </div>
            <div id="group2">
                <p>
                    <label>Email:</label><br> <input name="email" type="email"
                                                 placeholder="請輸入信箱" required
                                                 value="<%=request.getParameter("email") == null ? "" : request.getParameter("email")%>">
                </p>
                <p>
                    <label>地址 Address:</label><br> <input name="address" type="text"
                                              placeholder="請輸入地址"
                                              value="<%=request.getParameter("address") == null ? "" : request.getParameter("address")%>">

                </p>
                <p>
                    <label>電話 Phone Number:</label><br> <input name="phone" type="tel"
                                              placeholder="請輸入電話"
                                              value="<%=request.getParameter("phone") == null ? "" : request.getParameter("phone")%>">									
                </p>
                <p>
                    <label>生日 Birth Date:</label><br> <input name="birthday" type="date" required
                                              value="<%=request.getParameter("birthday") == null ? "" : request.getParameter("birthday")%>">
                </p> 
                <p>
                <label>驗證碼 Verification Code:</label><br> <input type="text" name="captcha"
                                           placeholder="請依下圖輸入密碼" required><br> <img
                                           src="<%=request.getContextPath()%>/images/register_captcha.jpg" id="captchaImage"> <a
                                           href="javascript:refreshImage()">更新驗證碼</a>
            </div>
              <input id="submit" type="submit" value="註冊">
                <script>
                    function refreshImage() {
                        var date = Date.now();
                        var captchaImage = document
                                .getElementById("captchaImage");
                        captchaImage.src = "<%=request.getContextPath()%>/images/register_captcha.jpg?refresh="
                                + date;
                    }
                </script> 
             
            </p>
           
        </form>
    </div>
</body>
</html>
