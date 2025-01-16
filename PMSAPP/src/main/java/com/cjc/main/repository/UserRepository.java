package com.cjc.main.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cjc.main.model.Product;
import com.cjc.main.model.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	
	public User findByUnameAndPassword(String uname, String password);

	

	

	
	

	
	

}
