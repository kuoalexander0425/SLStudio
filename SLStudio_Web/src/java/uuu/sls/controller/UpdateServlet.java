/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;
import uuu.sls.entity.VIP;

/**
 *
 * @author Admin
 */
public class UpdateServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer user = (Customer) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "login.jsp");
            return;
        }
        List<String> errors = new ArrayList<>();
        //1.取得form data 並檢查
        request.setCharacterEncoding("UFT-8");
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String changePwd = request.getParameter("changePwd");
        String pwd1 = request.getParameter("pwd1");
        String pwd2 = request.getParameter("pwd2");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        if (id == null || (id.equals(user.getId()))) {
            errors.add("會員帳號不正確");
        }
        if (pwd == null || (!pwd.equals(user.getPassword()))) {
            errors.add("會員密碼不正確");
        }
        if (changePwd == null) {
            if (pwd1 == null || pwd1.length() < 6 || pwd1.length() > 20) {
                errors.add("必須輸入6~20字元密碼");
            } else if (!pwd1.equals(pwd2)) {
                errors.add("必須輸入6~20字源且一致的確認密碼");

            }
        }
        if (name == null || (name = name.trim()).length() == 0) {
            errors.add("必須輸入姓名");
        }
        if (birthday == null || birthday.length() == 0) {
            errors.add("必須輸入生日");
        }
        if (email == null || (email = email.trim()).length() == 0) {
            errors.add("必須輸入email");
        }
        if (gender == null
                || (gender.charAt(0) != Customer.MALE && gender.charAt(0) != Customer.FEMALE)) {
            errors.add("必須輸入性別");
        }
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String captcha = request.getParameter("captcha");
        if (captcha == null || (captcha = captcha.trim()).length() == 0) {
            errors.add("必須需入驗證碼");
        } else {
            String sessionCaptcha = (String) session.getAttribute("captcha");
            if (!captcha.equalsIgnoreCase(sessionCaptcha)) {
                errors.add("驗證碼不正確");
            }
        }
        session.removeAttribute("captcha");

        //2.若檢查無誤則呼叫商業邏輯
        if (errors.isEmpty()) {
            try{
            Customer c = user.getClass().newInstance();
            c.setId(user.getId());
            c.setPassword(changePwd != null ? pwd1 : user.getPassword());
            c.setName(name);
            c.setEmail(email);
            c.setGender(gender.charAt(0));
            c.setBirthday(birthday);
            c.setPhone(phone);
            c.setAddress(address);

            if (c instanceof VIP) {
                ((VIP) c).setDiscount(((VIP) user).getDiscount());
            }
        }catch(SLSException ex){
            this.log("會員修改發生錯誤",ex);
            errors.add(ex.getMessage());
        }catch(Exception ex){
            this.log("會員修改發生非預期錯誤");
        }
    }
        //3.2 檢查若有誤或商業邏輯執行失敗 forward to /register.jsp
        request.setAttribute("errors", errors);
        request.getRequestDispatcher("update.jsp").forward(request, response);
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
