package com.pahanaeduauth.dao;

import com.pahanaeduauth.model.Book;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    private Connection connection;

    public BookDAO(Connection connection) {
        this.connection = connection;
    }

    // Add a new book
    public boolean addBook(Book book) throws SQLException {
        String sql = "INSERT INTO books (title, author, category, price, stock, description, cover_image) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setString(3, book.getCategory());
            statement.setBigDecimal(4, book.getPrice());
            statement.setInt(5, book.getStock());
            statement.setString(6, book.getDescription());

            if (book.getCoverImage() != null) {
                statement.setBytes(7, book.getCoverImage());
            } else {
                statement.setNull(7, Types.BLOB);
            }

            return statement.executeUpdate() > 0;
        }
    }

    // Get all books
    public List<Book> getAllBooks() throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT id, title, author, category, price, stock, description FROM books ORDER BY title";

        try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Book book = new Book();
                book.setId(resultSet.getInt("id"));
                book.setTitle(resultSet.getString("title"));
                book.setAuthor(resultSet.getString("author"));
                book.setCategory(resultSet.getString("category"));
                book.setPrice(resultSet.getBigDecimal("price"));
                book.setStock(resultSet.getInt("stock"));
                book.setDescription(resultSet.getString("description"));

                books.add(book);
            }
        }

        return books;
    }

    // Get book by ID
    public Book getBookById(int id) throws SQLException {
        String sql = "SELECT id, title, author, category, price, stock, description, cover_image FROM books WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Book book = new Book();
                    book.setId(resultSet.getInt("id"));
                    book.setTitle(resultSet.getString("title"));
                    book.setAuthor(resultSet.getString("author"));
                    book.setCategory(resultSet.getString("category"));
                    book.setPrice(resultSet.getBigDecimal("price"));
                    book.setStock(resultSet.getInt("stock"));
                    book.setDescription(resultSet.getString("description"));
                    book.setCoverImage(resultSet.getBytes("cover_image"));

                    return book;
                }
            }
        }

        return null;
    }

    // Update a book
    public boolean updateBook(Book book) throws SQLException {
        String sql = "UPDATE books SET title = ?, author = ?, category = ?, price = ?, stock = ?, description = ? WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, book.getTitle());
            statement.setString(2, book.getAuthor());
            statement.setString(3, book.getCategory());
            statement.setBigDecimal(4, book.getPrice());
            statement.setInt(5, book.getStock());
            statement.setString(6, book.getDescription());
            statement.setInt(7, book.getId());

            return statement.executeUpdate() > 0;
        }
    }

    // Delete a book
    public boolean deleteBook(int id) throws SQLException {
        String sql = "DELETE FROM books WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        }
    }

    // Search books
    public List<Book> searchBooks(String keyword) throws SQLException {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT id, title, author, category, price, stock, description FROM books "
                + "WHERE title LIKE ? OR author LIKE ? OR category LIKE ? ORDER BY title";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            String searchPattern = "%" + keyword + "%";
            statement.setString(1, searchPattern);
            statement.setString(2, searchPattern);
            statement.setString(3, searchPattern);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Book book = new Book();
                    book.setId(resultSet.getInt("id"));
                    book.setTitle(resultSet.getString("title"));
                    book.setAuthor(resultSet.getString("author"));
                    book.setCategory(resultSet.getString("category"));
                    book.setPrice(resultSet.getBigDecimal("price"));
                    book.setStock(resultSet.getInt("stock"));
                    book.setDescription(resultSet.getString("description"));

                    books.add(book);
                }
            }
        }

        return books;
    }
}
