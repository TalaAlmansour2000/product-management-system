package com.adminPanel.app.service;

import com.adminPanel.app.dao.ProductDAO;
import com.adminPanel.app.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Collections;
import java.util.List;

@Service

public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    @Transactional
    public Product addProduct(Product product) {
        return productDAO.addProduct(product);
    }

    @Override
    @Transactional
    public List<Product> getAllProducts() {
        return productDAO.getAllProducts();
    }

    @Override
    @Transactional
    public void deleteById(int id) {
        productDAO.deleteById(id);
    }

    @Override
    @Transactional
    public Product update(Product product) {
        return productDAO.update(product);
    }



    @Override
    @Transactional
    public Product findById(int id) {
        return productDAO.findById(id);
    }



}
