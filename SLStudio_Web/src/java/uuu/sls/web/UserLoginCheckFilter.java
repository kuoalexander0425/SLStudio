/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.web;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import uuu.sls.entity.Customer;

/**
 *
 * @author Admin
 */
@WebFilter(filterName = "UserLoginCheckFilter", urlPatterns = {"/user/*"})
public class UserLoginCheckFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //前置處理
        HttpSession session = ((HttpServletRequest)request).getSession(false);//舊有的
        Customer user = null;
        if(session!=null){
            user = (Customer)session.getAttribute("user");
        }
        if(user!=null){
        chain.doFilter(request, response); 
        //後續處理
        }else{
        //尚未登入 強制導向(redirect)到/login.jsp
        ((HttpServletResponse)response).sendRedirect(
                ((HttpServletRequest)request).getContextPath()+"/login.jsp"); 
        }
    }
    @Override
    public void destroy() {
        
    }    
}
