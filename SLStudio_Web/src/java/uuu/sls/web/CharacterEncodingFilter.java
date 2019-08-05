/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.web;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Admin
 */
@WebFilter(filterName = "CharacterEncodingFilter", urlPatterns = {"*.do", "*.view", "*.jsp"}, initParams = {
    @WebInitParam(name = "charset", value = "UTF-8")},
        dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.ERROR})
public class CharacterEncodingFilter implements Filter {

    private FilterConfig filterConfig = null;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //前置處理
        if (((HttpServletRequest) request).getRequestURI().lastIndexOf("products_list") > 0) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
        }

        String charset = this.filterConfig.getInitParameter("charset");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        chain.doFilter(request, response);
        //後續處理
    }

    @Override
    public void destroy() {

    }

}
