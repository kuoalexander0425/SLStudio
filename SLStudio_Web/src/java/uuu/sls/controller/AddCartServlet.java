/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.sls.entity.Product;
import uuu.sls.entity.ShoppingCart;
import uuu.sls.entity.SLSException;
import uuu.sls.model.ProductService;

/**
 *
 * @author Admin
 */
public class AddCartServlet extends HttpServlet {

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
        List<String> errors = new ArrayList<>();
        //讀取請求中的Form Data並檢查
        String productId = request.getParameter("productId");
        String quantity = request.getParameter("quantity");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        if (productId == null || !(productId=productId.trim()).matches("\\d+")) {
            errors.add("加入購物車產品代號不正確");
        }
        if (quantity == null || !(quantity=quantity.trim()).matches("\\d+")) {
            errors.add("加入購物車產品數量不正確");
        }
        if (size == null) {
            errors.add("加入購物車容量不正確");
        }
        if (errors.isEmpty()) {
            //2.呼叫商業邏輯
            ProductService service = new ProductService();
            try {
                Product p = service.getProductById(productId);
                if (p != null) {
                    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                    if(cart==null){
                        cart = new ShoppingCart();
                        session.setAttribute("cart",cart);
                    }
                    //加入購物車
                    cart.addCart(p , Integer.parseInt(quantity), Integer.parseInt(size));
                }
            } catch (SLSException ex) {
                this.log("加入購物車發生錯誤", ex);
                errors.add(ex.getMessage());
            } catch (Exception ex) {
                this.log("加入購物車發生錯誤", ex);
                errors.add("加入購物車發生錯誤" + ex);
            }
        }        
        System.out.println("errors = " + errors);     
        //3.(作法1) 當加入購物車為同步的POST請求,則redirect to /user/cart.jsp
        //response.sendRedirect(request.getContextPath() + "/user/cart.jsp");
        //3.(作法2) 當加入購物車為非同步的POST請求,則redirect to /small_cart.jsp
        request.getRequestDispatcher("/WEB-INF/small_cart.jsp").forward(request, response);
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
