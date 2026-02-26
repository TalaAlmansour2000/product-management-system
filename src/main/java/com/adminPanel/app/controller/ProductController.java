package com.adminPanel.app.controller;

import com.adminPanel.app.model.Product;
import com.adminPanel.app.model.ProductDetails;
import com.adminPanel.app.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.adminPanel.app.enums.Manufacturer;
import org.springframework.web.bind.annotation.*;
@Controller
@RequestMapping("/products")
public class ProductController {
    @Autowired
    private ProductService productService;
    @GetMapping({"", "/"})
    public String viewHomePage(Model model){

        model.addAttribute("productsList", productService.getAllProducts());
        return "homePage";
    }
    @GetMapping("/add")
    public String addProduct(Model model) {

        Product product = new Product();
        product.setProductDetails(new ProductDetails());
//make sure it will be saved with lazy load
        model.addAttribute("productModel", product);
        model.addAttribute("manufacturers", com.adminPanel.app.enums.Manufacturer.values());
        return "addProductForm";
    }

    @PostMapping("/update")
    public String updateProduct(@ModelAttribute Product product) {
        if (product.getProductDetails() != null) {
            product.getProductDetails().setProduct(product);
        }
        productService.update(product);

        return "redirect:/products/";
    }




    @PostMapping("/save")
    public String saveTheProduct(@ModelAttribute("productModel") Product product) {

        product.getProductDetails().setProduct(product);

        productService.addProduct(product);
        return "redirect:/products/";
    }

    @GetMapping("/edit")
    public String showEditForm(@RequestParam("productId") int id, Model model) {
        model.addAttribute("productModel", productService.findById(id));
        model.addAttribute("manufacturers", Manufacturer.values());
        return "addProductForm";
    }

    @PostMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("productId") int id) {
        productService.deleteById(id);
        return "redirect:/products/";
    }




    @GetMapping("/{id}")
    public String viewDetails(@PathVariable int id, Model model) {
        model.addAttribute("product", productService.findById(id));
        return "viewMorePage";
    }

}