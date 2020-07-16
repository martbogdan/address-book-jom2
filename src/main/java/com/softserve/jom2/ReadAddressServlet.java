package com.softserve.jom2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/records/read")
public class ReadAddressServlet extends HttpServlet {

    private AddressBook addressBook;

    @Override
    public void init() throws ServletException {
        addressBook = AddressBook.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String address = addressBook.read(request.getParameter("firstName"), request.getParameter("lastName"));
        if (address == null) {
            response.sendError(404);
        } else {
            request.setAttribute("address", address);
            request.getRequestDispatcher("/WEB-INF/read-record.jsp").forward(request, response);
        }
    }
}
