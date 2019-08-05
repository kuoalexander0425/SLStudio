<%-- 
    Document   : getShippingType.jsp
    Created on : 2019/1/2, 下午 04:41:55
    Author     : alexanderkuo
--%>

<%@page import="uuu.sls.entity.ShippingType"%>
<%@page import="uuu.sls.entity.PaymentType"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<option value="">請選擇...</option>
<%
    String pType = request.getParameter("pType");
    String shType = request.getParameter("shType");
    if (pType != null) {
        try {
            PaymentType paymentType = PaymentType.valueOf(pType);
//            for (ShippingType shType : paymentType.getShippingTypesArray()) {
           
                if(paymentType == PaymentType.HOME){
                    shType = ShippingType.SELF.name();
                }
               
%>
<option value="<%= shType%>"><%= shType%></option>
<%

        } catch (Exception ex) {
            this.log("結帳時付款方式資料不正確");
        }
    }
%>