package com.adminPanel.app.model;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import com.adminPanel.app.enums.Manufacturer;

import javax.persistence.*;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor

@Entity
@Table(name="Product_details")
public class ProductDetails {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "expiration_Date")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate expirationDate;

    @Enumerated(EnumType.STRING)
    private Manufacturer manufacturer;
    @DecimalMin(value = "0.0")
    @NotNull
    @Positive
    private Double price;

    private boolean availability;
    private String imageName;
    @OneToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    private Product product;

    @Override
    public String toString() {
        return "ProductDetails{" +
                "id=" + id +
                ", expirationDate=" + expirationDate +
                ", manufacturer='" + manufacturer + '\'' +
                ", price=" + price +
                ", availability=" + availability +
                ", imageName='" + imageName + '\'' +
                '}';
    }
    public boolean isExpired(){
        if (expirationDate == null) return false;
        return expirationDate.isBefore(LocalDate.now());
    }
}
