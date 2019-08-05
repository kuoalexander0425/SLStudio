<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="uuu.sls.entity.BloodType"%>
<%@page import="uuu.sls.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
//Customer user = (Customer)session.getAttribute("user");
//String uri = request.getRequestURI();
//if(uri.indexOf("/user")>=0 && user==null){
//    response.sendRedirect(request.getContextPath()+"/login.jsp");
//    return;
//}
%>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>會員修改</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <jsp:include page="/WEB-INF/subviews/globle.jsp" />
    </head> 
    <header>       
        <jsp:include page="/WEB-INF/subviews/header.jsp">
            <jsp:param name="header.subtitle" value="會員修改"/>
        </jsp:include>
        <%
            Customer user = (Customer) session.getAttribute("user");//讀出客戶資料
        %>
    </header>
    <style>
        #group1 input, #group2 input{
            border:none;
            border-bottom: 1px solid gray;

        }
        #group1,#group2{
            float:left;
        }
    </style>
    <body>
        <% if (user != null) {
                List<String> errors = (List<String>) request.getAttribute("errors");
        %>
        <form style="margin: auto; width: 60%; min-width: 20em" action="update.do" method="POST"><!--/user/update.do-->
            <div id="group1">
                <p>
                    <label>帳號:</label> <input name="id" type="text"
                                              placeholder="請輸入身分證號" pattern="[A-Z][12]\d{8}" required
                                              readonly value="${sessionScope.user.id}">
                </p>
                <p>
                    <label>密碼:</label> <input name="pwd1" type="password"
                                              placeholder="請輸入密碼" maxlength="20" >
                </p>
                <p>
                    <label>確認密碼:</label> <input name="pwd2" type="password"
                                                placeholder="請再輸入確認密碼" maxlength="20" >
                </p>
                <p>
                    <label>姓名:</label> <input name="name" type="text"
                                              placeholder="請輸入姓名" required
                                              value="<%=request.getParameter("name") == null ? user.getName() : request.getParameter("name")%>">
                </p>
                <p>
                    <label>性別:</label> <input id="male" name="gender" type="radio"
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
                    <label>Email:</label> <input name="email" type="email"
                                                 placeholder="請輸入信箱" required
                                                 value="<%=request.getParameter("email") == null ? user.getEmail() : request.getParameter("email")%>">
                </p>
                <p>
                    <label>地址:</label> <input name="address" type="text"
                                              placeholder="請輸入地址"
                                              value="<%=request.getParameter("address") == null ? user.getAddress() : request.getParameter("address")%>">

                </p>
                <p>
                    <label>電話:</label> <input name="phone" type="tel"
                                              placeholder="請輸入電話"
                                              value="<%=request.getParameter("phone") == null ? user.getPhone() : request.getParameter("phone")%>">									
                </p>
                <p>
                    <label>生日:</label> <input name="birthday" type="date" required
                                              value="<%=request.getParameter("birthday") == null ? user.getBirthday() : request.getParameter("birthday")%>">
                </p>

                <p>
                    <label>驗證碼:</label> <input type="text" name="captcha"
                                               placeholder="請依下圖輸入密碼" required><br> <img
                                               src="/sls/images/register_captcha.jpg" id="captchaImage"> <a
                                               href="javascript:refreshImage()">更新驗證碼</a>
                   </div> <script>
                        function refreshImage() {
                            var date = Date.now();
                            var captchaImage = document
                                    .getElementById("captchaImage");
                            captchaImage.src = "/sls/images/captcha.jpg?refresh="
                                    + date;
                        }
                    </script>
                    
                </p>
                <p style="float:left">
                <input type="submit" value="會員修改" style="font-size: 13px">
                </p>
                </form>
                <%} else {%>    
                <p>請登入後才可以修改會員</p>
                <%}%>

            </div>
    </body>
     
        <%@include file="/WEB-INF/subviews/footer.jsp" %>
   
</html>
