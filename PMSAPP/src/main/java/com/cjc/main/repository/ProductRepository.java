package com.cjc.main.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cjc.main.model.Product;
import com.cjc.main.model.User;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {

	public List<Product> findByCategories(String categories);


	
}
