/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.sls.entity.Customer;
import uuu.sls.entity.SLSException;
import uuu.sls.model.CustomerService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login.do"})
public class LoginServlet extends HttpServlet {

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
        List<String> errors = new ArrayList<>();
        //1. 讀取請求中form data 並檢查
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String captcha = request.getParameter("captcha");

        if (id == null || id.length() == 0) {
            errors.add("必須輸入帳號");
        }
        if (pwd == null || pwd.length() < 6 || pwd.length() > 20) {
            errors.add("必須輸入長度6~20個字的密碼");
        }

        HttpSession session = request.getSession();
        if (captcha == null || captcha.length() == 0) {
            errors.add("必須輸入驗證碼");
        } else {
            String sessionCaptcha = (String) session.getAttribute("captcha");
            if (!captcha.equalsIgnoreCase(sessionCaptcha)) {
                errors.add("驗證碼不正確");
            }
        }
        session.removeAttribute("captcha");
        if (errors.isEmpty()) {
            //2.呼叫商業邏輯
            CustomerService service = new CustomerService();
            try {
                Customer c = service.login(id, pwd);
                /*改用外部轉交(redirect轉址)
                //3.1forward回應給login_ok.jsp
                //找到快遞人員
                RequestDispatcher dispatcher = request.getRequestDispatcher("/login_ok.jsp");
                request.setAttribute("customer", c);
                //轉交
                dispatcher.forward(request, response);
                 */

                //3.1 success:redirect給home page,request contextPath()
                //加上cookie管理
                String auto = request.getParameter("auto");
                Cookie idCookie = new Cookie("userId", id);
                Cookie autoCookie = new Cookie("auto", "checked");

                if (auto != null) {
                    idCookie.setMaxAge(30 * 24 * 60 * 60);
                    autoCookie.setMaxAge(30 * 24 * 60 * 60);
                } else {
                    idCookie.setMaxAge(0);
                    autoCookie.setMaxAge(0);
                }

                response.addCookie(idCookie);
                response.addCookie(autoCookie);

                session.setAttribute("user", c);
                response.sendRedirect(request.getContextPath());//相對路徑

                return;
            } catch (SLSException ex) {
                //this.log("客戶登入發生錯誤", ex);
                errors.add(ex.getMessage());
            } catch (Exception ex) {
                this.log("客戶登入發生非預期錯誤", ex);
                errors.add("發生非預期錯誤: " + ex);
            }
        }
        //3.2 失敗則forward到login.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        request.setAttribute("errors", errors);
        dispatcher.forward(request, response);

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
