package com.softserve.jom2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/records/update")
public class UpdateAddressServlet extends HttpServlet {
    private AddressBook addressBook;
    private String firstName;
    private String lastName;

    @Override
    public void init() throws ServletException {
        addressBook = AddressBook.getInstance();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean status = addressBook.update(firstName, lastName, request.getParameter("addressIn"));
        if (status) {
            response.sendRedirect("/records/list");
        } else {
            response.sendRedirect("/records/update");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        firstName = request.getParameter("firstName");
        lastName = request.getParameter("lastName");
        String address = addressBook.read(firstName, lastName);
        if (address == null) {
            throw new RuntimeException("Person with name '" + request.getParameter("firstName") + request.getParameter("lastName") + "' not found in Address Book!");
        } else {
            request.setAttribute("address", address);
            request.getRequestDispatcher("/WEB-INF/update-record.jsp").forward(request, response);
        }
    }
}
