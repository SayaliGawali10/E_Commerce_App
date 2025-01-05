package com.cjc.main.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjc.main.model.User;
import com.cjc.main.repository.OrderRepository;
import com.cjc.main.repository.ProductRepository;
import com.cjc.main.serviceI.OrderServiceI;
import com.cjc.main.serviceI.ProductServiceI;

@Service
public class OrderServiceImpl implements OrderServiceI {

	@Autowired
	OrderRepository or;
	

	
	

}
