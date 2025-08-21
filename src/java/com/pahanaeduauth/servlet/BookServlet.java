package com.pahanaeduauth.servlet;

import com.pahanaeduauth.dao.BookDAO;
import com.pahanaeduauth.model.Book;
import com.pahanaeduauth.util.DatabaseConnection;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/books")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024, // 5MB max file size
        maxRequestSize = 10 * 1024 * 1024 // 10MB max request size
)
public class BookServlet extends HttpServlet {

    private BookDAO bookDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        try {
            Connection connection = DatabaseConnection.getConnection();
            bookDAO = new BookDAO(connection);
            gson = new Gson();
        } catch (SQLException e) {
            log("Database connection failed", e);
            // Don't throw ServletException, just set bookDAO to null
            bookDAO = null;
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");
        Map<String, Object> result = new HashMap<>();

        try {
            if (action == null) {
                // Get all books
                List<Book> books = bookDAO.getAllBooks();
                result.put("success", true);
                result.put("books", books);
            } else if ("search".equals(action)) {
                // Search books
                String keyword = request.getParameter("keyword");
                if (keyword != null && !keyword.trim().isEmpty()) {
                    List<Book> books = bookDAO.searchBooks(keyword);
                    result.put("success", true);
                    result.put("books", books);
                } else {
                    result.put("success", false);
                    result.put("message", "Search keyword is required");
                }
            } else if ("get".equals(action)) {
                // Get single book
                String idParam = request.getParameter("id");
                if (idParam != null) {
                    try {
                        int id = Integer.parseInt(idParam);
                        Book book = bookDAO.getBookById(id);
                        if (book != null) {
                            result.put("success", true);
                            result.put("book", book);
                        } else {
                            result.put("success", false);
                            result.put("message", "Book not found");
                        }
                    } catch (NumberFormatException e) {
                        result.put("success", false);
                        result.put("message", "Invalid book ID");
                    }
                } else {
                    result.put("success", false);
                    result.put("message", "Book ID is required");
                }
            } else {
                result.put("success", false);
                result.put("message", "Invalid action");
            }
        } catch (SQLException e) {
            result.put("success", false);
            result.put("message", "Database error: " + e.getMessage());
        }

        response.getWriter().write(gson.toJson(result));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Map<String, Object> result = new HashMap<>();

        try {
            String title = request.getParameter("title");
            String author = request.getParameter("author");
            String category = request.getParameter("category");
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stock");
            String description = request.getParameter("description");
            Part coverImagePart = request.getPart("coverImage");

            // Validate required fields
            if (title == null || title.trim().isEmpty()
                    || author == null || author.trim().isEmpty()
                    || category == null || category.trim().isEmpty()
                    || priceStr == null || priceStr.trim().isEmpty()
                    || stockStr == null || stockStr.trim().isEmpty()) {

                result.put("success", false);
                result.put("message", "All fields except description and cover image are required");
                response.getWriter().write(gson.toJson(result));
                return;
            }

            // Parse numeric values
            BigDecimal price = new BigDecimal(priceStr);
            int stock = Integer.parseInt(stockStr);

            // Create book object
            Book book = new Book(title, author, category, price, stock);
            book.setDescription(description);

            // Handle cover image upload
            if (coverImagePart != null && coverImagePart.getSize() > 0) {
                byte[] coverImage = coverImagePart.getInputStream().readAllBytes();
                book.setCoverImage(coverImage);
            }

            // Add book to database
            boolean success = bookDAO.addBook(book);

            if (success) {
                result.put("success", true);
                result.put("message", "Book added successfully");
            } else {
                result.put("success", false);
                result.put("message", "Failed to add book");
            }
        } catch (NumberFormatException e) {
            result.put("success", false);
            result.put("message", "Invalid numeric value for price or stock");
        } catch (SQLException e) {
            result.put("success", false);
            result.put("message", "Database error: " + e.getMessage());
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "Unexpected error: " + e.getMessage());
        }

        response.getWriter().write(gson.toJson(result));
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implementation for updating books
        // Similar to doPost but with update logic
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implementation for deleting books
    }
}
