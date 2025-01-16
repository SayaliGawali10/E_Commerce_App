package com.cjc.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjc.main.model.Order;
import com.cjc.main.model.Product;
import com.cjc.main.serviceI.ProductServiceI;

@Controller
public class ProductController {

    @Autowired
    ProductServiceI psi;

    @RequestMapping("/dashboard")
    public String onDashboard() {
        return "adminView";
    }

    
    @RequestMapping("/addProduct")
    public String addProduct(@ModelAttribute Product p, @RequestParam("imageUrl") String imageUrl,Model m) {
        p.setImageUrl(imageUrl); 
        psi.saveProductDetails(p);

        List<Product> products = psi.getAllProducts();
        m.addAttribute("products", products);

        return "products";
    }

   
    @RequestMapping("/searchProduct")
    public String getProductsDetails(@RequestParam(required = false) String categories, Model m) {
        List<Product> result;

        if (categories != null && !categories.isEmpty()) {
            if (categories.equals("All")) {
                result = psi.getAllProducts();
            } else {
                result = psi.searchProductsByCategories(categories);
            }
        } else {
            result = psi.getAllProducts();
        }

        if (result != null && !result.isEmpty()) {
            m.addAttribute("products", result);
        } else {
            m.addAttribute("message", "No products found!");
        }

        return "products";
    }

    
    @RequestMapping("/deleteProduct")
    public String removeProduct(@RequestParam("id") Long id, Model m) {
        psi.remove(id);

        List<Product> list = psi.getAllProducts();
        m.addAttribute("products", list);

        return "products";
    }
    
    
}
