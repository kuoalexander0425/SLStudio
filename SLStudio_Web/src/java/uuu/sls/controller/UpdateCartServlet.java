/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.sls.entity.CartItem;
import uuu.sls.entity.Product;
import uuu.sls.entity.ShoppingCart;

/**
 *
 * @author Admin
 */
public class UpdateCartServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        if (cart != null && cart.size() > 0) {
            //1.取得request中的form data
            Set<CartItem> trashSet = new HashSet<>();
            for (CartItem item:cart.getCartItemSet()) {
                Product p = item.getProduct();
                String quantity = request.getParameter("quantity_" + p.getId());
                String delete = request.getParameter("delete_" + p.getId());
                if (delete == null) {
                    if (quantity != null && quantity.matches("\\d+")) {
                        cart.updateCart(item, Integer.parseInt(quantity));
                    }
                }else{
                    //cart.removeCart(item); //可能在執行時期發生java.util.ConcurrentModificationException
                    trashSet.add(item);
                }               
            }
           //實際執行刪除
           if(trashSet.size()>0){
               for(CartItem key:trashSet){
                   cart.removeCart(key);
               }
           }
        }
        String ok = request.getParameter("ok");
       if("結帳".equals(ok)){
           response.sendRedirect("check_out.jsp");
       }else{
        response.sendRedirect("cart.jsp");
    }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
