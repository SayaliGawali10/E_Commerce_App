package com.cjc.main.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cjc.main.model.Order;
import com.cjc.main.model.Product;
import com.cjc.main.model.User;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {

	

}
