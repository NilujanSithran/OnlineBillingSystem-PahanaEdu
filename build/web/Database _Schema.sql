CREATE DATABASE pahanaedu;
USE pahanaedu;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'user',
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert some default users
INSERT INTO users (username, password, role, email) VALUES 
('admin', '$2a$10$rOzJNs8YlV.6U/l7X8wZ.OGJ5NfjLpY7W5cL1WUfJ5J5J5J5J5J5J', 'admin', 'admin@pahana.com'),
('john_doe', '$2a$10$rOzJNs8YlV.6U/l7X8wZ.OGJ5NfjLpY7W5cL1WUfJ5J5J5J5J5J', 'user', 'john.doe@example.com');

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    description TEXT,
    cover_image LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    color_code VARCHAR(7) DEFAULT '#6B7280'
);

-- Insert some default categories
INSERT INTO categories (name, color_code) VALUES 
('Fiction', '#3B82F6'),
('History', '#10B981'),
('Science Fiction', '#8B5CF6'),
('Biography', '#F59E0B'),
('Self-Help', '#EF4444'),
('Non-Fiction', '#6B7280'),
('Children', '#EC4899');