/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uuu.sls.web;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author Admin
 */
public class VisitorCounterListener implements ServletContextListener, HttpSessionListener {

    @Override
    public void contextInitialized(ServletContextEvent event) { 
        ServletContext context = event.getServletContext();
        System.out.println("網站應用程式啟動");
      
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        ServletContext context = event.getServletContext();          
           context.log("網站應用程式關閉");
    }

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        HttpSession session = event.getSession();
        session.getServletContext().log("session created" + session.getId());
        
         Integer counter = (Integer) session.getServletContext().getAttribute("app.visitors.counter");
        if (counter == null) {
            counter = 961;         
        } else {
            counter++;
            
        }
        session.getServletContext().setAttribute("app.visitors.counter", counter);
        session.setAttribute("app.visitors.counter", counter);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
         HttpSession session = event.getSession();
         session.getServletContext().log("session destroyed" + session.getId());
    }
}
