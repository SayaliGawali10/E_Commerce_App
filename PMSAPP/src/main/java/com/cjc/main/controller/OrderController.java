package com.cjc.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cjc.main.serviceI.OrderServiceI;

@Controller
public class OrderController {

	@Autowired
	OrderServiceI osi;
	
}
