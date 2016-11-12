/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.filter;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author tuong
 */
public class SessionCounterListener implements HttpSessionListener {

    private static int totalActiveSessions = 0;

    public static int getTotalActiveSession() {
        return totalActiveSessions;
    }

    @Override
    public void sessionCreated(HttpSessionEvent event) {
        totalActiveSessions++;
        System.out.println("sessionCreated - add one session into counter " + getTotalActiveSession());
        event.getSession().getServletContext().setAttribute("userActive", getTotalActiveSession());

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
        totalActiveSessions--;
        System.out.println("sessionDestroyed - deduct one session from counter " + getTotalActiveSession());
        event.getSession().getServletContext().setAttribute("userActive", getTotalActiveSession());
    }

}
