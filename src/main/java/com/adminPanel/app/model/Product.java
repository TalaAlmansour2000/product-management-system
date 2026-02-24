package com.adminPanel.app.model;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;


import javax.persistence.*;
@Getter
@Setter
@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotBlank
    @Column(name = "name", nullable = false)
    private String name;
    @OneToOne(mappedBy = "product", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private ProductDetails productDetails;
    public Product() {
        this.productDetails = new ProductDetails();
    }
    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", productDetails=" + productDetails +
                '}';
    }
}
