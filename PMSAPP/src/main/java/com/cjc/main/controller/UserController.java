package com.cjc.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cjc.main.model.User;
import com.cjc.main.serviceI.UserServiceI;

@Controller
public class UserController {

    @Autowired
    UserServiceI usi;

   
    @RequestMapping("/")
    public String preLogin() {
        return "login";
    }

    
    @RequestMapping("/register")
    public String preReg() {
        return "register";
    }

    
    @RequestMapping("/reg")
    public String regData(@ModelAttribute User u) {
        usi.saveData(u);  
        return "login";  
    }

    
    @RequestMapping("/login")
    public String loginCheck(@RequestParam("uname") String uname, @RequestParam("password") String password, Model model) {

        User user = usi.loginCheck(uname, password);
        if (user != null) {
            Iterable<User> users = usi.displayAllData();
            model.addAttribute("data", users);
            return "adminView";  
        } else {
            
            model.addAttribute("error", "Invalid username or password");
            return "login";  
        }
    }
    
   
}
