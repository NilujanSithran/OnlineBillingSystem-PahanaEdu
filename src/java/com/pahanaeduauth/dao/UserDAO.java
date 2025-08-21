/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pahanaeduauth.dao;

import com.pahanaeduauth.model.User;
import java.util.HashMap;
import java.util.Map;

public class UserDAO {

    // In-memory user storage (replace with database in production)
    private static final Map<String, User> users = new HashMap<>();

    static {
        // Initialize with some sample users
        users.put("admin", new User("admin", "admin123", "admin", "admin@example.com"));
        users.put("user1", new User("user1", "user123", "user", "user1@example.com"));
        users.put("customer1", new User("customer1", "customer123", "customer", "customer1@example.com"));
    }

    public User getUserByUsername(String username) {
        return users.get(username);
    }

    public boolean validateUser(String username, String password) {
        User user = getUserByUsername(username);
        return user != null && user.getPassword().equals(password);
    }
}
