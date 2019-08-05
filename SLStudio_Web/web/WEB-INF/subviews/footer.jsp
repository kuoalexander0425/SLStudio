<%@page import="java.time.LocalDate"%>
<!-- 
    Document   : footer
    Created on : 2018/12/7, 下午 02:16:33
    Author     : Admin
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    footer{
    text-align: center;
    position: fixed;
    z-index: 1000;
    padding:10px;
    left: 0;
    right: 0;
    bottom: 0;
    color: dimgray;
    background-color: white;
    opacity: 0.9;
}
footer:hover{
    display: none;
}
</style>
<footer>

    版權所有&COPY; SL髮型 2018/9 ~ <%= LocalDate.now().getYear() +"/"+ LocalDate.now().getMonthValue()%><br>
    拜訪人次：<%= application.getAttribute("app.visitors.counter") %>, 您是第<%= session.getAttribute("app.visitors.counter") %>位訪客.
</footer>