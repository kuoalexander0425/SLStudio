/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.management.RuntimeErrorException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.sls.entity.Order;
import uuu.sls.entity.PaymentType;
import uuu.sls.entity.ShippingType;
import uuu.sls.entity.ShoppingCart;
import uuu.sls.entity.SLSException;
import uuu.sls.model.OrderService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "CheckOutServlet", urlPatterns = {"/user/check_out.do"})
public class CheckOutServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart == null || cart.size() == 0) {
            response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
            return;
        }

        List<String> errors = new ArrayList<>();
        //1.讀取REQUEST中的FORM DATA
        String paymentType = request.getParameter("paymentType");
        String shippingType = request.getParameter("shippingType");
        String addresseeName = request.getParameter("addresseeName");
        String addresseePhone = request.getParameter("addresseePhone");
        String shippingAddress = request.getParameter("shippingAddress");
        String addresseeEmail = request.getParameter("addresseeEmail");

        PaymentType pType = null;
        try {
            pType = PaymentType.valueOf(paymentType);
        } catch (RuntimeException ex) {
            errors.add("請選擇正確的付款方式");
        }
        ShippingType shType = null;
        try {
            shType = ShippingType.valueOf(shippingType);
        } catch (RuntimeException ex) {
            errors.add("請選擇正確的貨運方式");
        }
        if (addresseeName == null || addresseeName.length() == 0) {
            errors.add("請輸入收件人姓名");
        }
        if (addresseePhone == null || addresseePhone.length() == 0) {
            errors.add("請輸入收件人電話");
        }
        if (shippingAddress == null || shippingAddress.length() == 0) {
            errors.add("請輸入收件地址");
        }
        if (addresseeEmail == null || addresseeEmail.length() == 0) {
            errors.add("請輸入收件人電子信箱");
        }

        //2.若無誤 則呼叫商業邏輯
        if (errors.isEmpty()) {
            Order order = new Order();
            order.setUser(cart.getUser());
            order.setPaymentType(pType);
            order.setPaymentFee(pType.getFee());
            order.setShippingType(shType);
            order.setShippingFee(shType.getFee());
            order.setAddresseeEmail(addresseeEmail);
            order.setAddresseeName(addresseeName);
            order.setAddresseePhone(addresseePhone);
            order.setShippingAddress(shippingAddress);
            order.addCart(cart);
            try {
                OrderService service = new OrderService();
                service.insert(order);
                //3.1 forward to check_out_ok.do
                session.removeAttribute("cart");
                request.setAttribute("order", order);
                request.getRequestDispatcher("check_out_ok.jsp").forward(request, response);
                return;

            } catch (SLSException ex) {
                errors.add(ex.getMessage());
            } catch (Exception ex) {
                this.log("建立訂單發生無法預期的錯誤", ex);
                errors.add("發生無法預期的錯誤:" + ex);
            }
        }
        //3.2 forward to check_out.jsp
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("check_out.jsp").forward(request, response);

    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs //
     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
