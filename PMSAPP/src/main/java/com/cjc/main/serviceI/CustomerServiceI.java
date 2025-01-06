package com.cjc.main.serviceI;

import java.util.List;

import com.cjc.main.model.Customer;

public interface CustomerServiceI {

	void saveCustomerDetails(Customer c);

	List<Customer> getAllCustomers();

	List<Customer> searchCustomerById(int id);

	void remove(int id);

	Customer editData(int id);

	Iterable<Customer> displayAllData();

	

	

	

}
