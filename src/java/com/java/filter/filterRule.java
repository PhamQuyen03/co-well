/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.filter;

import com.java.model.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tuong
 */
public class filterRule implements Filter {

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest rq = (HttpServletRequest) request;
        String path = (rq.getRequestURI());
        if (path.startsWith("/resources") || path.startsWith("/co-well/resources") ||path.startsWith("/co-well/index") || 
                path.startsWith("/co-well/news") || path.startsWith("/co-well/partners") || path.startsWith("/co-well/recruitment")|| 
                path.startsWith("//outsourcing")|| path.startsWith("/co-well/system-integration")|| path.startsWith("/co-well/consulting")
                || path.startsWith("/co-well/contact")|| path.startsWith("/co-well/ErrorPage")) {
            chain.doFilter(request, response);
            return;
        }
        else if(path.equals("/co-well") || path.equals("/co-well/")) {
             chain.doFilter(request, response);
            return;
        }
        Object obj = rq.getSession().getAttribute("userSession");
        if(obj == null) {
            if (path.startsWith("/co-well/login")) {
                chain.doFilter(request, response);

            } else {
                HttpServletResponse resp = (HttpServletResponse) response;
                resp.sendRedirect("http://localhost:8084/co-well/login");
//                RequestDispatcher patch = request.getRequestDispatcher("/WEB-INF/views/admin/login_Admin.jsp");
//                patch.forward(request, response);
            }
        }
        else {
            User user = (User) obj;
            HttpServletResponse resp = (HttpServletResponse) response;
//            if(user.getRole() == 1 && path.startsWith("/co-well/support")){
//                resp.sendRedirect("http://localhost:8084/co-well/admin");
            if(user.getRole() == 2 && path.startsWith("/co-well/admin")){
                resp.sendRedirect("http://localhost:8084/co-well/support");
            }else if (path.startsWith("/co-well/login")) {
                switch (user.getRole()) {
                    case 1:
                        resp.sendRedirect("http://localhost:8084/co-well/admin");
                        break;
                    case 2:
                        resp.sendRedirect("http://localhost:8084/co-well/support");
                        break;
                    default:
                        resp.sendRedirect("http://localhost:8084/co-well/support");
                        break;
                }
            } else {
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

}
