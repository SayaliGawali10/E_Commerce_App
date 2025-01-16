package com.cjc.main.serviceI;

import java.util.List;
import java.util.Map;

import com.cjc.main.model.Customer;
import com.cjc.main.model.Order;
import com.cjc.main.model.Product;
import com.cjc.main.model.User;

public interface OrderServiceI {

	void saveOrderDetails(Order o);

	List<Order> getOrdersByCustomerId(int customerId);

	List<Order> getAllOrders();

	void remove(Long id);

	Order editData(int id);

	Iterable<Order> displayAllData();

	

	

	

	



	

	
	
	




}
