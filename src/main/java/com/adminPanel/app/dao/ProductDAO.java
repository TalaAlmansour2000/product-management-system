package com.adminPanel.app.dao;

import com.adminPanel.app.model.Product;

import java.util.List;

public interface ProductDAO {
    Product addProduct(Product product);
    List<Product> getAllProducts();
    void deleteById(int id);
    Product update(Product product);
    Product findById(int id);


}
