package com.softserve.jom2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/records/delete")
public class DeleteAddressServlet extends HttpServlet {
    private AddressBook addressBook;

    @Override
    public void init() throws ServletException {
        addressBook = AddressBook.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean status = addressBook.delete(request.getParameter("firstName"), request.getParameter("lastName"));
        if (!status) {
            throw new RuntimeException("Person with name '" + request.getParameter("firstName") + " " + request.getParameter("lastName") + "' not found in Address Book!");
        } else {
            response.sendRedirect("/records/list");
        }
    }
}
