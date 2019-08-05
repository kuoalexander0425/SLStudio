<%-- 
    JSP註解
    Document   : hello
    Created on : 2018/11/30, 下午 05:27:46
    Author     : Admin
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true" autoFlush="true" info="Implicit Variables Examples與@page之屬性示範" %>
<!DOCTYPE html>
<html>
    <head>
        <title><%= this.getServletInfo()%></title>
        <style>
            h3,a{
                font-size: 20px;
                color:#9999ff;
                padding:0px 3px;                
            }
            h3,a:hover{

                color: #cc99ff;
            }
            h4{
                color: gray;
            }
            .catagory{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1 id="returnTop">你好. This is
            <%
                //Java註解

                /*
                 Java區塊註解
                 */
                out.println(this.getServletName());

            %>
            @
            <% out.println(request.getContextPath());%>
            <hr>
        </h1>
        <!--<p>這是註解</p>-->  
        <h3 class='catagory'>
            <a href="#request">request</a> | <a href="#response">response</a> | <a href="#session">session</a> | 
            <a href="#out">out</a> | <a href="#application">application</a> | <a href="#config">config</a> | 
            <a href="#pageContext">pageContext</a> | <a href="#page">page</a> | <a href="#exception">exception</a> | 
            <h4>click title to return top!</h4>
        </h3>
        <h2>Implicit Variables</h2>
        <h3 id="request"><a href="#returnTop">Request</a></h3>
        <p>Method: <%=request.getMethod()%></p>
        <p>Method: <%=request.getRequestURI()%></p>
        <p>Method: <%=request.getRequestURL()%></p>
        <p>Method: <%=request.getProtocol()%></p>
        <p>Method: <%=request.getLocalPort()%></p>
        <p>Method: <%=request.getLocalName()%></p>
        <p>Method: <%=request.getLocalAddr()%></p>
        <p>Method: <%=request.getRemoteHost()%></p>
        <p>Method: <%=request.getRemoteAddr()%></p>
        <p>Method: <%=request.getRemotePort()%></p>
        <p>Method: <%=request.getContextPath()%></p>
        <hr>
        <p>Parameter name : <%=request.getParameter("name")%></p>
        <p>Parameter name : <%=request.getHeader("user-agent")%></p>
        <hr>
        <h3 id="response"><a href="#returnTop">Response</a></h3>
        <p>response content-type:<%=response.getContentType()%> </p>
        <p>response buffer-size:<%=response.getBufferSize()%> </p>
        <hr>
        <h3 id="out"><a href="#returnTop">Out</a></h3>
        <p>out buffer-size:<%=out.getBufferSize()%> </p>
        <hr>
        <h3 id="session"><a href="#returnTop">Session</a></h3>
        <p>session id: <%= session.getId()%></p>
        <p>session timeout: <%= session.getMaxInactiveInterval()%></p>
        <p>session timeout: <%= session.getCreationTime()%></p>
        <p>session timeout: <%= session.getLastAccessedTime()%></p>
        <p>session timeout: <%= new Date(session.getCreationTime())%></p>
        <p>session timeout: <%= new Date(session.getLastAccessedTime())%></p>
        <hr>
        <h3 id="application"><a href="#returnTop">Application</a></h3>
        <p>application context path: <%= application.getContextPath()%></p>
        <p>application real path: <%= application.getRealPath("/")%></p>
        <hr>
        <h3 id="config"><a href="#returnTop">Config</a></h3>
        <%--        <p>Servlet Name:<%=config.getServletName()%></p>--%>
        可用this代替
        <p>Servlet Name:<%=this.getServletName()%></p>
        <hr>
        <h3 id="pageContext"><a href="#returnTop">PageContext</a></h3>
        <p>out buffer-size: <%= pageContext.getOut().getBufferSize()%></p>
        <hr>
        <h3 id="page"><a href="#returnTop">Page</a></h3>
        都用this代替
        <p>
            <%
                ((HttpServlet) page).log("test data");
                System.out.println("test data");
            %>
        </p>
        <hr>
        <h3 id="exception"><a href="#returnTop">Exception</a></h3>
        只能在isErrorPage=true的網頁中使用
        <%= exception != null ? exception.getMessage() : ""%>
    </body>
</html>
