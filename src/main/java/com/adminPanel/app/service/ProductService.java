package com.adminPanel.app.service;

import com.adminPanel.app.model.Product;

import java.util.List;

public interface ProductService {
    Product update(Product product);
    Product addProduct(Product product);
    List<Product> getAllProducts();
    Product findById(int id);
    void deleteById(int id);

}
