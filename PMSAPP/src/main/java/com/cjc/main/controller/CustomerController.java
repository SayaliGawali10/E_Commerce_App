package com.cjc.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjc.main.model.Customer;
import com.cjc.main.model.Order;
import com.cjc.main.serviceI.CustomerServiceI;

@Controller
public class CustomerController {

	
	@Autowired
	CustomerServiceI csi;
	
	@RequestMapping("/AddCustomer")
	public String addCustomer(@ModelAttribute Customer c, Model m) {
		csi.saveCustomerDetails(c);
        List<Customer> customers = csi.getAllCustomers(); 
        m.addAttribute("customers", customers);  
		return "customers";
	}
	
	@RequestMapping("/SearchCustomer")
	public String getCustomerDetails(@RequestParam int id, Model m) {
	    List<Customer> result = csi.searchCustomerById(id);
	    if (result.size() > 0) {
	        m.addAttribute("customers", result);
	    } else {
	        List<Customer> customers = csi.getAllCustomers();
	        m.addAttribute("customers", customers);
	        m.addAttribute("message", "Customer ID not found. Showing all customers.");
	    }
	    return "customers";
	}

    
	@RequestMapping("/DeleteCustomer")
	public String removeCustomers(@RequestParam ("id") int id, Model m) {
		csi.remove(id);
		List<Customer> list=csi.getAllCustomers();
		m.addAttribute("customers", list);
		return "customers";
		
	}
	
	@RequestMapping("/EditCustomer")
	public String editData(@RequestParam("id") int id, Model m) {
	    Customer c = csi.editData(id); 
	    
	    if (c != null) {
	        m.addAttribute("customer", c);
	    }
	    else {
	        m.addAttribute("errorMessage", "Customer not found");
	    }
	    
	    return "edit"; 
	}

	@RequestMapping("/UpdateCustomer")
	public String updateData(@ModelAttribute Customer c,Model m)
	{
		csi.saveCustomerDetails(c);
		Iterable<Customer> ls=csi.displayAllData();
		m.addAttribute("customers", ls);
		return "customers";
	}
	
	
	@RequestMapping("/cancel")
	public String customers( Model m) {
		List<Customer> list = csi.getAllCustomers();
		 m.addAttribute("customers", list);
		return "customers";
	}
	
}
