package com.softserve.jom2;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/records/list")
public class ListAddressServlet extends HttpServlet {

    private AddressBook addressBook;

    @Override
    public void init() throws ServletException {
        addressBook = AddressBook.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sortType = request.getParameter("sortType");
        if (sortType != null) {
            switch (sortType) {
                case "ASC" :
                    addressBook.sortedBy(SortOrder.ASC);
                    break;
                case "DESC" :
                    addressBook.sortedBy(SortOrder.DESC);
                    break;
                default : break;
            }
        }
        request.setAttribute("addresses", addressBook);
        request.getRequestDispatcher("/WEB-INF/list-of-records.jsp").forward(request, response);
    }
}
