package com.cjc.main.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjc.main.model.Customer;
import com.cjc.main.repository.CustomerRepository;
import com.cjc.main.serviceI.CustomerServiceI;

@Service
public class CustomerServiceImpl implements CustomerServiceI {

	@Autowired
	CustomerRepository cr;
	
	@Override
	public void saveCustomerDetails(Customer c) {
		cr.save(c);
		
	}

	@Override
	public List<Customer> getAllCustomers() {
		return (List<Customer>)cr.findAll();
	}

	@Override
	public List<Customer> searchCustomerById(int id) {
		List<Customer> customers=cr.findAllById(id);
		return customers;
	}

	@Transactional
	@Override
	public void remove(int id) {
		cr.deleteById(id);
		
	}

	@Override
	public Customer editData(int id) {
		return cr.findById(id).orElse(null); 
	}

	@Override
	public Iterable<Customer> displayAllData() {
		 return cr.findAll(); 
	}

	

	
}
