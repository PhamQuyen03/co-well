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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tuong
 */
public class filterContent implements Filter {

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest rq = (HttpServletRequest) request;
        String path = (rq.getRequestURI());
        if (path.startsWith("/resources") || path.startsWith("/baitap/resources") ||path.startsWith("/baitap/index") || 
                path.startsWith("/baitap/news") || path.startsWith("/baitap/partners") || path.startsWith("/baitap/recruitment")|| 
                path.startsWith("/baitap/outsourcing")|| path.startsWith("/baitap/system-integration")|| path.startsWith("/baitap/consulting")) {
            chain.doFilter(request, response);
            return;
        }
        else if(path.equals("/baitap") || path.equals("/baitap/")) {
             chain.doFilter(request, response);
            return;
        }
        Object obj = rq.getSession().getAttribute("userSession");
        if(obj == null) {
            if (path.startsWith("/baitap/login")) {
                chain.doFilter(request, response);

            } else {
                RequestDispatcher patch = request.getRequestDispatcher("/WEB-INF/views/admin/login_Admin.jsp");
                patch.forward(request, response);
            }
        }
        else {
            User user = (User) obj;
            if (path.startsWith("/baitap/login")) {
                HttpServletResponse resp = (HttpServletResponse) response;
                switch (user.getRole()) {
                    case 1:
                        resp.sendRedirect("admin");
                        break;
                    case 2:
                        resp.sendRedirect("support");
                        break;
                    default:
                        resp.sendRedirect("support");
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
