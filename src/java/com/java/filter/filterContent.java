/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.filter;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 *
 * @author tuong
 */
public class filterContent implements Filter {

    private FilterConfig filterConfig = null;

    @Override
    public void destroy() {
        System.out.println("UpperCaseFilter destroyed");
        this.filterConfig = null;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        System.out.println("doUpperCaseFilter");
        Enumeration elements = request.getAttributeNames();
        while (elements.hasMoreElements()) {
            String attributeName = (String) elements.nextElement();
            String attributeValue = (String) request.getAttribute(attributeName);
            request.setAttribute(attributeName, attributeValue.toUpperCase());
        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("UpperCaseFilter initialized");
        this.filterConfig = filterConfig;
    }

}
