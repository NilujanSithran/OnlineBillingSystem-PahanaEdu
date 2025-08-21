/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahanaeduauth.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login");
            return;
        }

        String role = (String) session.getAttribute("role");
        String dashboardPage;

        switch (role) {
            case "admin":
                dashboardPage = "/WEB-INF/views/admin-dashboard.jsp";
                break;
            case "user":
                dashboardPage = "/WEB-INF/views/user-dashboard.jsp";
                break;
            case "customer":
                dashboardPage = "/WEB-INF/views/customer-dashboard.jsp";
                break;
            default:
                dashboardPage = "/WEB-INF/views/login.jsp";
                break;
        }

        request.getRequestDispatcher(dashboardPage).forward(request, response);
    }
}
