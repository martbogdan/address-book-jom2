package com.softserve.jom2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = {"/", "/home"})
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestUri = request.getRequestURI();
        if ("/".equals(requestUri) || "/home".equals(requestUri) ) {
            request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
        } else {
            throw new RuntimeException("Url '" + requestUri + "' not found!");
        }

    }
}
