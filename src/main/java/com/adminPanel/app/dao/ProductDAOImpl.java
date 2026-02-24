package com.adminPanel.app.dao;

import com.adminPanel.app.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Repository
public class ProductDAOImpl  implements ProductDAO{
    @Autowired
    private SessionFactory sessionFactory;
    @Override

    public Product addProduct(Product product) {
        Session session= sessionFactory.getCurrentSession();

        session.save(product);
        return product;
    }

    @Override
    public List<Product> getAllProducts() {
        Session session= sessionFactory.getCurrentSession();
        List<Product> products = session.createQuery("select p from Product p left join fetch p.productDetails", Product.class).list();
        return products;
         }

    @Override
    public void deleteById(int id) {
        Session session= sessionFactory.getCurrentSession();
        Product product= (Product) session.get(Product.class ,id);
        if (product != null)
            session.delete(product );

        else
            System.out.println(String.format("Product with id %d not found", id));

    }


    @Override

    public Product update(Product product) {
        Session session = sessionFactory.getCurrentSession();

        session.merge(product);
        return product;
    }
    @Override
    public Product findById(int id) {
        Session session=sessionFactory.getCurrentSession();
        Product product= (Product) session.get(Product.class,id);
        return product;
    }
}
