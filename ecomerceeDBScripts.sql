CREATE DATABASE IF NOT EXISTS ecommerce_db;

USE ecommerce_db;


CREATE TABLE products(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) );

CREATE TABLE  Product_details(
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT UNIQUE,
    expiration_Date DATE,
    manufacturer VARCHAR(50),

    price DOUBLE NOT NULL,
    availability TINYINT(1),

    imageName VARCHAR(255),

    CONSTRAINT fk_product_link FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON DELETE CASCADE



);
