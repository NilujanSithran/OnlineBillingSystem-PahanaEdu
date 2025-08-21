package com.pahanaeduauth.servlet;

import com.pahanaeduauth.dao.BookDAO;
import com.pahanaeduauth.model.Book;
import com.pahanaeduauth.util.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

import java.sql.SQLException;

@WebServlet("/image")
public class ImageServlet extends HttpServlet {

    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DatabaseConnection.getConnection();
            bookDAO = new BookDAO(connection);
        } catch (SQLException e) {
            throw new ServletException("Database connection failed", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                Book book = bookDAO.getBookById(id);

                if (book != null && book.getCoverImage() != null) {
                    response.setContentType("image/jpeg");
                    response.setContentLength(book.getCoverImage().length);
                    response.getOutputStream().write(book.getCoverImage());
                } else {
                    // Return a default image or 404
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            } catch (NumberFormatException | SQLException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
