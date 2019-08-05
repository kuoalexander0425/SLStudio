<%-- 
    Document   : test
    Created on : 2018/11/30, 下午 06:08:28
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        table,td{
            border: 1px solid black;
        }
        table{
            border-collapse:collapse;
           box-shadow:3px 10px 2px black;
        }
        tr :nth-child(odd){
            background-color: lightgray;
        }
        tr :nth-child(odd):hover{
            background-color: pink;
            cursor:pointer;
        }
        tr :nth-child(even){
            background-color: gray;
        }
        tr :nth-child(even):hover{
            background-color: yellow;
            cursor:pointer;
        }
    </style>
    <body>        
        <table>
            <caption>99乘法表</caption>
            <%for (int i = 1; i < 10; i++){%>
            <tr>
                <%for(int j=1;j<10;j++){%>          
                <td><%out.println("&ensp;"+i);%> x <%out.println(j);%> = <%out.println(i*j); %>&ensp;</td>
                <%}%>  
             </tr>
            <%}%>           
        </table>  
        
        <br>
        <br>
        <br>
        
        <table>
            <caption>九九乘法表</caption>
            <%for(int i=1;i<10;i++){%>
            <tr>
                <%for(int j=1;j<10;j++){%>
                <%--<td><%=i + "*" + j + "=" + i*j%></td>--%>
                <td><%=i%>*<%=j%>=<%=i*j%></td>
                 <%}%>
            </tr>
            <%}%>
   
    </body>
</html>
