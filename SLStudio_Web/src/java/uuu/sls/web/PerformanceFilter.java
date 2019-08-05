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
 * Servlet Filter implementation class PerformanceFilter
 */
//@WebFilter(
//		dispatcherTypes = {DispatcherType.REQUEST }
//					, 
//		urlPatterns = { 
//				"/PerformanceFilter", 
//				"*.jsp", 
//				"*.do"
//		}, 
//		initParams = { 
//				@WebInitParam(name = "prefix", value = "效能監控")
//		})
public class PerformanceFilter implements Filter {
	 private FilterConfig filterConfig=null;

    public PerformanceFilter() {
        // TODO Auto-generated constructor stub
    }
 
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//前置處理
		long begin = System.currentTimeMillis();
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
		
		//後續處理
		long end = System.currentTimeMillis();
		String msg = filterConfig.getInitParameter("prefix")
				+((HttpServletRequest)request).getRequestURI() +" "
				+(end-begin)+" ms";
		this.filterConfig.getServletContext().log(msg);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.filterConfig = fConfig;
	}

}
