<%-- 
    Document   : expression_language
    Created on : 2018/12/10, 下午 05:01:32
    Author     : Admin
--%>

<%@page import="uuu.sls.entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EL Demo</title>
    </head>
    <body>
        <div>
            EL Operator: +, -,*,/,%
            <p>1+2= <%=1 + 2%> (JSP expression)</p>
            <p>1+2= ${ 1+2 } (EL expression)</p>
            <p>'1'+'2'= <%='1' + '2'%>(JSP expression)</p>
            <p>'1'+'2'=${ '1' + '2' } (EL expression)</p>
            <p>"1.5"+ 2= <%="1.5" + 2 %>(JSP expression)</p>
            <p>"1.5"+ 2 =${ "1.5" + 2 } (EL expression)</p>
            <p>'a'+'b'=${'a'}${'b'} (EL expression)</p>
             <p>'a'+'b'=\${'a'+'b'} (EL expression)
                 因為el沒有提供字串+運算子,執行時會出現NumberFormatException,利用反斜線則可不執行但會輸出</p>
             <hr>
             EL implicit variable
             <h3>sessionScope(session.getAttribute())</h3>
             <p>如果已經登入</p>
             <p>user(JSP Expression): 
                 <%=session.getAttribute("user") instanceof Customer?((Customer)session.getAttribute("user")).getName():"" %> </p>
             <p>user(EL expression):
                 ${sessionScope.user.name} EL會自動檢查null 有的話會加上空字串 </p>
             <p>session id(EL): ${pageContext.getSession().getId()} </p>
             用.等於轉型完 檢查null之後輸出
        </div>
    </body>
</html>
