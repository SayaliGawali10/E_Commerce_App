package com.cjc.main.serviceImpl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cjc.main.model.User;
import com.cjc.main.repository.ProductRepository;
import com.cjc.main.repository.UserRepository;
import com.cjc.main.serviceI.ProductServiceI;
import com.cjc.main.serviceI.UserServiceI;

@Service
public class UserServiceImpl implements UserServiceI {

	@Autowired
	UserRepository ur;

	@Override
	public void saveData(User u) {
		ur.save(u);
		
	}

	@Override
	public User loginCheck(String uname, String password) {
		return ur.findByUnameAndPassword(uname, password);
	}

	@Override
	public Iterable<User> displayAllData() {
		return ur.findAll();
	}

	


	

	

}
