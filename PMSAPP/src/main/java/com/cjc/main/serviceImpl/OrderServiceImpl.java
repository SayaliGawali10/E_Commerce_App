package com.cjc.main.serviceImpl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjc.main.model.Customer;
import com.cjc.main.model.Order;
import com.cjc.main.model.Product;
import com.cjc.main.model.User;
import com.cjc.main.repository.CustomerRepository;
import com.cjc.main.repository.OrderRepository;
import com.cjc.main.repository.ProductRepository;
import com.cjc.main.repository.UserRepository;
import com.cjc.main.serviceI.OrderServiceI;

@Service
public class OrderServiceImpl implements OrderServiceI {

	@Autowired
	OrderRepository or;

	
	 @Override
	    public void saveOrderDetails(Order order) {
	        or.save(order); 
	    }

	 public List<Order> getOrdersByCustomerId(int customerId) {
	        
		 return or.findByCustomerId(customerId);
	    }

	@Override
	public List<Order> getAllOrders() {
		 return (List<Order>) or.findAll();
	}

	@Override
	public void remove(Long id) {
		or.deleteById(id); 
	}

	@Override
	public Order editData(int id) {
		 return or.findById((long) id).orElse(null);
	}

	@Override
	public Iterable<Order> displayAllData() {
		 return or.findAll(); 
			}
	
	

	
	
	
	}