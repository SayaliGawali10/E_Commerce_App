package com.cjc.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjc.main.model.Product;
import com.cjc.main.model.User;
import com.cjc.main.repository.ProductRepository;
import com.cjc.main.serviceI.ProductServiceI;

@Service
public class ProductServiceImpl implements ProductServiceI {

	@Autowired
	ProductRepository pr;


	@Override
	public void saveProductDetails(Product p) {
		pr.save(p);
		
	}

	@Override
	public List<Product> getAllProducts() {
		return (List<Product>)pr.findAll();
	}

    @Override
	public List<Product> searchProductsByCategories(String categories) {
		return pr.findByCategories(categories); 
	}

	
	@Override
	public void remove(Long id) {
		pr.deleteById(id);
		
	}

	
	
	
	

	
	
	
	

}
