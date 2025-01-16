package com.cjc.main.controller;


import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjc.main.model.Customer;
import com.cjc.main.model.Order;
import com.cjc.main.model.Product;
import com.cjc.main.model.User;
import com.cjc.main.repository.OrderRepository;
import com.cjc.main.serviceI.OrderServiceI;
import com.cjc.main.serviceI.ProductServiceI;
import com.cjc.main.serviceI.UserServiceI;

@Controller

public class OrderController {

	    @Autowired
	    private OrderServiceI os;
	    
	    

	    @RequestMapping("/CreateOrder")
	    public String createOrder(@ModelAttribute Order o, Model m) {
	    	os.saveOrderDetails(o);
	    	return "viewOrders";
	    }
	   
	    
	    @RequestMapping("/SearchOrders")
	    public String searchOrdersByCustomerId(@RequestParam(value = "customerId", required = false) String customerId, Model model) {
	        List<Order> orders;

	        if (customerId != null && !customerId.isEmpty()) {
	            if ("all".equals(customerId)) {
	                // Fetch orders for all customers
	                orders = os.getAllOrders();
	            } else {
	                try {
	                    int id = Integer.parseInt(customerId);
	                    // Fetch orders based on the specific customer ID
	                    orders = os.getOrdersByCustomerId(id);
	                } catch (NumberFormatException e) {
	                    model.addAttribute("error", "Invalid Customer ID format.");
	                    return "viewOrders";
	                }
	            }
	        } else {
	            // No customerId provided, so fetch all orders
	            orders = os.getAllOrders();
	        }

	        // Add the list of orders to the model
	        model.addAttribute("orders", orders);

	        // Return the view
	        return "viewOrders";
	    }

	    @RequestMapping("/deleteOrder")
	    public String removeOrder(@RequestParam("orderId") Long orderId, Model m) {
	        // Call the service method to delete the order by ID
	        os.remove(orderId); // Assuming `os.remove(orderId)` deletes the order by ID

	        // After deletion, get the updated list of orders
	        List<Order> list = os.getAllOrders();

	        // Add the updated list of orders to the model
	        m.addAttribute("orders", list);

	        // Redirect to the same page (viewOrders) to show the updated list
	        return "viewOrders"; // This should match the JSP or Thymeleaf template for your orders view
	    }
	    @RequestMapping("/editOrder")
	    public String editOrder(@RequestParam("id") int id, Model model) {
	    	Order o = os.editData(id); 
		    
		    if (o != null) {
		        model.addAttribute("orders", o);
		    }
		    else {
		        model.addAttribute("errorMessage", "Customer not found");
		    }
		    
		    return "editOrder"; 
	    }

	    @RequestMapping("/UpdateOrder")
		public String updateData(@ModelAttribute Order o,Model m)
		{
			os.saveOrderDetails(o);
			Iterable<Order> ls=os.displayAllData();
			m.addAttribute("orders", ls);
			return "viewOrders";
		}
		
		@RequestMapping("/orders")
		public String orders( Model m) {
			List<Order> list = os.getAllOrders();
			 m.addAttribute("orders", list);
			return "viewOrders";
		}
		
	    }