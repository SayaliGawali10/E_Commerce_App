package com.cjc.main.serviceI;

import java.util.List;

import com.cjc.main.model.Order;
import com.cjc.main.model.Product;
import com.cjc.main.model.User;

public interface ProductServiceI {

	public void saveProductDetails(Product p);

	public List<Product> getAllProducts();
	
	public List<Product> searchProductsByCategories(String categories);	

	public void remove(Long id);

	



	
		

	
	

	
	
	
}
